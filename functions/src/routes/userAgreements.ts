import * as express from "express";
import { requireAuth } from "../middlewares/requireAuth";
import { createUserAgreement } from "../services/userAgreements.service";

export const userAgreementsRouter = express.Router();

userAgreementsRouter.post("/user-agreements", requireAuth, async (req: any, res: any) => {
  const uid = req.user.uid;
  const isMarketing = req.body?.is_marketing;

  if (typeof isMarketing !== "boolean") {
    return res.status(400).json({ error: { message: "is_marketing must be boolean" } });
  }

  const policyVersion = typeof req.body?.policy_version === "string"
    ? req.body.policy_version
    : "v1";

    try {
      const data = await createUserAgreement(uid, isMarketing, policyVersion);  
      
      return res.status(200).json({ data });
    } catch (e: any) {
      console.error("[user-agreement error]", e);

      
      const status =
        typeof e?.status === "number" && Number.isInteger(e.status)
          ? e.status
          : 500;
    
      return res.status(status).json({
        error: { message: e?.message ?? "Unknown error" },
      });
    }
});
