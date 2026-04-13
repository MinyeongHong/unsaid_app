import * as express from "express";
import type { Response } from "express";
import { requireAuth } from "../middlewares/requireAuth";
import { generateReadingFromGemini } from "../services/gemini.service";
import { createReading } from "../services/readings.service";
import { getUserZodiac } from "../services/users.service";

export const geminiRouter = express.Router();


function buildPrompt(params: {
  question: string;
  zodiacInfo?: { sunSign: string; shadowTrait: string } | null;
}) {
  const { question, zodiacInfo } = params;

  return [
    "[CONTEXT]",
    "USER_QUESTION:",
    question,
    zodiacInfo ? `SUN_SIGN: ${zodiacInfo.sunSign}` : "",
    zodiacInfo ? `USER_SHADOW: ${zodiacInfo.shadowTrait}` : "",
    "",
    "[TASK]",
    "Analyze why the user is lying to themselves using the USER_SHADOW provided.",
  ]
    .filter(Boolean)
    .join("\n");
}

geminiRouter.post("/gemini", requireAuth, async (req: any, res: Response) => {
    const uid = req.user.uid;
    const rawPrompt = req.body?.prompt;
    const prompt = typeof rawPrompt === "string" ? rawPrompt.trim() : "";
      
    if (!prompt) {
      return res.status(400).json({ error: { message: "prompt is required" } });
    }
  
    try {
      const zodiacInfo = await getUserZodiac(uid);

      const enrichedPrompt = buildPrompt({
        question: prompt,
        zodiacInfo,
      });  

      const r = await generateReadingFromGemini(enrichedPrompt);
  
      const reading = await createReading({
        uid,
        question: prompt,
        interpretation: r.interpretation,
        unsaidLine: r.unsaid_line,
      });

      const { quota, ...readingOnly } = reading;

      return res.status(201).json({
        data: readingOnly,
        quota, 
      });
    } catch (e: any) {
      console.error("[POST /gemini] failed", {
        uid,
        status: e?.status,
        code: e?.code,
        message: e?.message,
      });
    
    return res.status(e?.status || 500).json({
      error: {
        code: e?.code || null,
        message: e?.message || "Failed",
      },
    });

    }
  });