import * as express from "express";
import { requireAuth } from "../middlewares/requireAuth";
import { getUserSetting, updateUserSetting } from "../services/userSettings.service";

export const userSettingsRouter = express.Router();


userSettingsRouter.get("/user-settings", requireAuth, async (req: any, res: any) => {
  try {
    const uid = req.user.uid;
    const data = await getUserSetting(uid);

    return res.status(200).json({ data });
  } catch (e: any) {
    const status = e?.status || 500;
    return res.status(status).json({ error: { message: e?.message || "Failed" } });
  }
});

userSettingsRouter.put("/user-settings", requireAuth, async (req: any, res: any) => {
  try {
    const uid = req.user.uid;
    const raw = req.body?.is_marketing;

    if (typeof raw !== "boolean") {
      return res.status(400).json({
        error: { message: "is_marketing must be boolean" },
      });
    }

    await updateUserSetting(uid, { is_marketing: raw });

    return res.status(200).json({ data: { ok: true } });
  } catch (e: any) {
    const status = e?.status || 500;
    return res.status(status).json({ error: { message: e?.message || "Failed" } });
  }
});
