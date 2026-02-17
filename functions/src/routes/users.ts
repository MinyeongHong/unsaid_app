import * as express from "express";
import { requireAuth } from "../middlewares/requireAuth";
import { deleteUser, getUser, updateUser, upsertUserOnLogin } from "../services/users.service";

export const usersRouter = express.Router();

usersRouter.get("/users", requireAuth, async (req: any, res: any) => {
  const uid = req.user.uid;
  const data = await getUser(uid);
  
  return res.status(200).json({ data });
});

usersRouter.post("/users", requireAuth, async (req: any, res: any) => {
  const data = await upsertUserOnLogin(req.user, req.body);

  return res.status(201).json({ data });
});

usersRouter.put("/users", requireAuth, async (req: any, res: any) => {
  const uid = req.user.uid;

  const data = await updateUser(uid, req.body ?? {});

  return res.status(200).json({ data });
});

usersRouter.delete("/users", requireAuth, async (req: any, res: any) => {
  const uid = req.user.uid;

  await deleteUser(uid);

  return res.status(200).json({ data: { ok: true } });
});