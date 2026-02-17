import "dotenv/config";
import { onRequest } from "firebase-functions/v2/https";
import { app } from "./app";

export const api = onRequest(
    { region: "asia-northeast3" },
    app
  );