import * as express from "express";
import * as cors from "cors";

import { usersRouter } from "./routes/users";
import { userAgreementsRouter } from "./routes/userAgreements";
import { geminiRouter } from "./routes/gemini";
import { readingsRouter } from "./routes/readings";
import { userSettingsRouter } from "./routes/userSettings";


export const app = express();

app.use(cors({ origin: true }));
app.use(express.json());

app.use(usersRouter);
app.use(userAgreementsRouter);
app.use(geminiRouter);
app.use(readingsRouter);
app.use(userSettingsRouter);
