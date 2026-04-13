import { GoogleGenAI } from "@google/genai";
import * as fs from "fs";
import * as path from "path";

export type LLMReadingResult = {
  interpretation: string;
  unsaid_line: string;
};

let ai: GoogleGenAI | null = null;
let cachedSystemPrompt: string | null = null;

function getAI(): GoogleGenAI {
  const key = process.env.GEMINI_API_KEY;

  if (!key) {
    throw Object.assign(new Error("Missing GEMINI_API_KEY"), { status: 500 });
  }

  ai ??= new GoogleGenAI({ apiKey: key });

  return ai;
}

function getModel(): string {
  const model = process.env.GEMINI_MODEL;

  if (!model) {
    throw Object.assign(new Error("Missing GEMINI_MODEL"), { status: 500 });
  }

  return model;
}

function getSystemPrompt(): string {
  if (cachedSystemPrompt) return cachedSystemPrompt;

  const p = path.join(process.cwd(), "prompts", "readings.txt");
  cachedSystemPrompt = fs.readFileSync(p, "utf8");
  return cachedSystemPrompt;
}

function isValidResult(data: any): data is LLMReadingResult {
  return (
    data &&
    typeof data.interpretation === "string" &&
    typeof data.unsaid_line === "string"
  );
}

async function generateOnce(prompt: string) {
  let result;

  try {
  result =  getAI().models.generateContent({
      model: getModel(),
      contents: `[CURRENT CASE]\n${prompt}`,
      config: {
        systemInstruction: getSystemPrompt(),
        responseMimeType: "application/json",
        responseSchema: {
          type: "object",
          properties: {
            interpretation: { type: "string" },
            unsaid_line: { type: "string" }
          },
          required: ["interpretation", "unsaid_line"]
        }
      },
  });
    
  return result;

  }catch (error) {
    console.error("Gemini error:", error);

    throw Object.assign(new Error("Failed to generate first reading"), {
      status: 502,
    });
  }
}

export async function generateReadingFromGemini(
  prompt: string
): Promise<LLMReadingResult> {
  let text = "";

  try {
    let resp = await generateOnce(prompt);
    text = resp.text ?? "";

    let parsed = safeParseJson(text);

    if (!parsed || !isValidResult(parsed)) {
      resp = await getAI().models.generateContent({
        model: getModel(),
        contents: `[CURRENT CASE]\n${prompt}`,
        config: {
          systemInstruction:
            getSystemPrompt() +
            `

Return ONLY a valid JSON object with exactly these keys:
- interpretation
- unsaid_line`,
          responseMimeType: "application/json",
          responseSchema: {
            type: "object",
            properties: {
              interpretation: { type: "string" },
              unsaid_line: { type: "string" }
            },
            required: ["interpretation", "unsaid_line"]
          }
        },
      });

      text = resp.text ?? "";

      parsed = safeParseJson(text);
    }

    if (!parsed || !isValidResult(parsed)) {
      throw new Error("Invalid Gemini response");
    }

    return {
      interpretation: parsed.interpretation.trim(),
      unsaid_line: parsed.unsaid_line.trim(),
    };
  } catch (error) {
    console.error("Gemini error:", error);

    throw Object.assign(new Error("Failed to generate reading"), {
      status: 502,
    });
  }
}


function safeParseJson(text: string) {
  try {
    return JSON.parse(text);
  } catch {
    return null;
  }
}

// function extractJsonObject(text: string): string | null {
//   if (!text) return null;

//   const fenced = text.match(/```(?:json)?\s*([\s\S]*?)\s*```/i);

//   if (fenced?.[1]) return fenced[1].trim();

//   const start = text.indexOf("{");
//   const end = text.lastIndexOf("}");
  
//   if (start >= 0 && end > start) return text.slice(start, end + 1).trim();

//   return null;
// }

// function safeJsonParse(text: string): any | null {
//   if (!text) return null;
  
//   try {
//     const candidate = extractJsonObject(text) ?? text;

//     return JSON.parse(candidate);
//   } catch {
//     return null;
//   }
// }

// async function generateOnce(prompt: string) {
//   const model = process.env.GEMINI_MODEL!;

//   const p = path.join(process.cwd(), "prompts", "readings.txt");
//   const systemPrompt = fs.readFileSync(p, "utf8");

//   const finalContent = `${systemPrompt}\n\n[CURRENT CASE]\n${prompt}`;

//   return getAI().models.generateContent({
//     model,
//     contents: [{ role: "user", parts: [{ text:finalContent }] }] as any,
//   });
// }

// export async function generateReadingFromGemini(
//   prompt: string
// ): Promise<LLMReadingResult> {
//   // 1차 호출
//   let resp = await generateOnce(prompt);
//   let text = (resp as any).text ?? "";
//   let parsed = safeJsonParse(text);

//   // ✅ JSON 아니면 2차 보정 요청 (한 번만)
//   if (!parsed) {
//     resp = await generateOnce(
    
//       `${prompt}\n\nIMPORTANT: Your previous response was not valid JSON. Return ONLY a valid JSON object with exactly the required keys now.`
//     );
//     text = (resp as any).text ?? "";
//     parsed = safeJsonParse(text);
//   }

//   if (
//     !parsed ||
//     typeof parsed.interpretation !== "string" ||
//     typeof parsed.unsaid_line !== "string"
//   ) {
//     // 디버그용 (너무 길면 로그 폭발하니 앞부분만)
//     console.error("Gemini raw (first 700 chars):", text.slice(0, 700));

//     throw Object.assign(
//       new Error("Gemini returned non-JSON or invalid schema"),
//       { status: 502 }
//     );
//   }

//   return {
//     interpretation: parsed.interpretation.trim(),
//     unsaid_line: parsed.unsaid_line.trim(),
//   };
// }
