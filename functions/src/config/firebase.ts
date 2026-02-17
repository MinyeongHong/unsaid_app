import * as admin from "firebase-admin";
import { getFirestore, FieldValue } from "firebase-admin/firestore";

if (!admin.apps.length) {
  admin.initializeApp();
}

export const db = getFirestore();
export const auth = admin.auth();
export { FieldValue };