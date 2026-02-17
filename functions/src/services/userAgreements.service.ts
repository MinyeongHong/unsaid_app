import { db, FieldValue } from "../config/firebase";

export async function createUserAgreement(
  uid: string,
  isMarketing: boolean,
  policyVersion: string
) {
  const userRef = db.collection("users").doc(uid);
  const agreeRef = db.collection("user_agreements").doc(uid);
  const settingRef = db.collection("user_settings").doc(uid);

  const now = FieldValue.serverTimestamp();

  const allowed = new Set(["v1"]);
  const pv = allowed.has(policyVersion) ? policyVersion : "v1";

  await db.runTransaction(async (tx) => {
    // ✅ 1) READS first
    const [userSnap, agreeSnap, settingSnap] = await Promise.all([
      tx.get(userRef),
      tx.get(agreeRef), 
      tx.get(settingRef),
    ]);

    if (!userSnap.exists) {
      throw Object.assign(
        new Error("User not found. Call POST /users first."),
        { status: 409 }
      );
    }

    tx.set(
      userRef,
      {
        is_agreed: true,
        updated_at: now,
      },
      { merge: true }
    );

    if (!agreeSnap.exists) {
      tx.set(agreeRef, {
        uid,
        created_at: now,
        updated_at: now,
        is_age: true,
        is_privacy: true,
        is_service: true,
        agreed_at: now,
        policy_version: pv,
      });
    } else {
      tx.set(
        agreeRef,
        {
          updated_at: now,
          agreed_at: now,
          policy_version: pv,
        },
        { merge: true }
      );
    }

    if (!settingSnap.exists) {
      tx.set(settingRef, {
        uid,
        is_marketing: isMarketing,
        created_at: now,
        updated_at: now,
      });
    } else {
      tx.set(
        settingRef,
        {
          is_marketing: isMarketing,
          updated_at: now,
        },
        { merge: true }
      );
    }
  });
  
  return { ok: true };
}
