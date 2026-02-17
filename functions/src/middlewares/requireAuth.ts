import { auth } from "../config/firebase";

export async function requireAuth(req: any, res: any, next: any) {
  console.log("AUTH HEADER:", req.headers.authorization);
  console.log("RAW HEADERS:", req.headers);

  const header = req.header("Authorization") || "";
  const match = header.match(/^Bearer (.+)$/);

  if (!match) {
    return res.status(401).json({ error: { message: "Missing Bearer token" } });
  }

  try {
    const decoded = await auth.verifyIdToken(match[1]);
    req.user = decoded;
    return next();
  } catch (e) {
    console.error("[verifyIdToken failed]", e);
    return res.status(401).json({ error: { message: "Invalid token" } });
  }
}
