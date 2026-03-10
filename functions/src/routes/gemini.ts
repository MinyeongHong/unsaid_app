import * as express from "express";
import { requireAuth } from "../middlewares/requireAuth";
import { generateReadingFromGemini } from "../services/gemini.service";
import { createReading } from "../services/readings.service";
import { getUserBirth } from "../services/users.service";
import { getSunSignFromYmd } from "../utils/zodiac";

export const geminiRouter = express.Router();

geminiRouter.post("/gemini", requireAuth, async (req: any, res: any) => {
    const uid = req.user.uid;
    const prompt = req.body?.prompt;
  
    if (typeof prompt !== "string" || !prompt.trim()) {
      return res.status(400).json({ error: { message: "prompt is required" } });
    }
  
    try {
      const birth = await getUserBirth(uid);
      const sunSign = birth ? getSunSignFromYmd(birth) : null;
  
      const enrichedPrompt = [
        `The speaker says: "${prompt.trim()}"`,
        sunSign
          ? `Optional context (do not mention explicitly unless it naturally fits): Sun sign = ${sunSign}.`
          : null,
      ]
        .filter(Boolean)
        .join("\n");
  
      const r = await generateReadingFromGemini(enrichedPrompt);
  
      const reading = await createReading({
        uid,
        question: prompt.trim(),
        interpretation: r.interpretation,
        unsaidLine: r.unsaid_line,
        limitPerDay: 3,
      });

      const { quota, ...readingOnly } = reading;

      return res.status(201).json({
        data: readingOnly,
        quota, 
      });
    } catch (e: any) {
      const status = e?.status || 500;

      return res.status(status).json({
        error: {
          code: e?.code || null,
          message: e?.message || "Failed",
          meta: e?.meta || null,
        },
      });

    }
  });