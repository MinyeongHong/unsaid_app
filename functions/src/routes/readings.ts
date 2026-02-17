import * as express from "express";
import { requireAuth } from "../middlewares/requireAuth";
import { listReadings, getReadingById, deleteReading } from "../services/readings.service";

export const readingsRouter = express.Router();

readingsRouter.get("/readings", requireAuth, async (req: any, res: any) => {
  const uid = req.user.uid;

  const limitRaw = req.query?.limit;
  const limit = Math.min(Math.max(parseInt(limitRaw ?? "20", 10) || 20, 1), 50);

  const cursor = typeof req.query?.cursor === "string" ? req.query.cursor : null;
  const cursorId = typeof req.query?.cursor_id === "string" ? req.query.cursor_id : null;

  const data = await listReadings(uid, { limit, cursor, cursorId });

  return res.status(200).json({ data });
});

readingsRouter.get("/readings/:id", requireAuth, async (req: any, res: any) => {
  const uid = req.user.uid;
  const id = req.params.id; // string

  const data = await getReadingById(uid, id);

  return res.status(200).json({ data });
});

readingsRouter.delete("/readings/:id", requireAuth, async (req: any, res: any) => {
  const uid = req.user.uid;
  const id = req.params.id;

  await deleteReading(uid, id);

  return res.status(200).json({ data: { ok: true } });
});