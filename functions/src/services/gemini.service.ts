import { GoogleGenAI } from "@google/genai";
import * as fs from "fs";
import * as path from "path";

export type GeminiReadingResult = {
  interpretation: string;
  unsaid_line: string;
};

let ai: GoogleGenAI | null = null;

function getAI(): GoogleGenAI {
  const key = process.env.GEMINI_API_KEY;

  if (!key) {
    throw Object.assign(new Error("Missing GEMINI_API_KEY"), { status: 500 });
  }

  ai ??= new GoogleGenAI({ apiKey: key });

  return ai;
}


// ✅ 모델이 ```json ...``` 또는 앞뒤 잡텍스트를 붙여도 파싱되게
function extractJsonObject(text: string): string | null {
  if (!text) return null;

  // 1) ```json ... ``` 코드펜스 추출
  const fenced = text.match(/```(?:json)?\s*([\s\S]*?)\s*```/i);

  if (fenced?.[1]) return fenced[1].trim();

  // 2) 텍스트 중 첫 { ... 마지막 } 구간 추출

  const start = text.indexOf("{");
  const end = text.lastIndexOf("}");
  
  if (start >= 0 && end > start) return text.slice(start, end + 1).trim();

  return null;
}

function safeJsonParse(text: string): any | null {
  try {
    const candidate = extractJsonObject(text) ?? text;
    return JSON.parse(candidate);
  } catch {
    return null;
  }
}

async function generateOnce(model: string, prompt: string) {
  const p = path.join(process.cwd(), "prompts", "reading.txt");
  const systemPrompt =  fs.readFileSync(p, "utf8");
  const userPrompt = `The speaker says: ${prompt}`;

  return getAI().models.generateContent({
    model,
    contents: [{ role: "user", parts: [{ text: systemPrompt + "\n\n" + userPrompt }] }] as any,
  });
}

export async function generateReadingFromGemini(
  prompt: string
): Promise<GeminiReadingResult> {
  const model = process.env.GEMINI_MODEL!;

  // 1차 호출
  let resp = await generateOnce(model, prompt);
  let text = (resp as any).text ?? "";
  let parsed = safeJsonParse(text);

  // ✅ JSON 아니면 2차 보정 요청 (한 번만)
  if (!parsed) {
    resp = await generateOnce(
      model,
      `${prompt}\n\nIMPORTANT: Your previous response was not valid JSON. Return ONLY a valid JSON object with exactly the required keys now.`
    );
    text = (resp as any).text ?? "";
    parsed = safeJsonParse(text);
  }

  if (
    !parsed ||
    typeof parsed.interpretation !== "string" ||
    typeof parsed.unsaid_line !== "string"
  ) {
    // 디버그용 (너무 길면 로그 폭발하니 앞부분만)
    console.error("Gemini raw (first 700 chars):", text.slice(0, 700));

    throw Object.assign(
      new Error("Gemini returned non-JSON or invalid schema"),
      { status: 502 }
    );
  }

  return {
    interpretation: parsed.interpretation.trim(),
    unsaid_line: parsed.unsaid_line.trim(),
  };
}
