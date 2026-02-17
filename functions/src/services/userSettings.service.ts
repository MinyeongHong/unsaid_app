import { db, FieldValue } from "../config/firebase";

type UserSettingDoc = {
  uid: string;
  is_marketing: boolean;
  created_at: any;
  updated_at: any;
};

function tsToIso(v: any): string | null {
  if (!v) return null;
  if (typeof v.toDate === "function") return v.toDate().toISOString();
  if (v instanceof Date) return v.toISOString();
  return null;
}

export async function getUserSetting(uid: string) {
  const ref = db.collection("user_settings").doc(uid);
  const doc = await ref.get();

  // 없으면 기본값으로 생성해서 반환 (앱 UX 편함)
  if (!doc.exists) {
    const now = FieldValue.serverTimestamp();

    const payload: UserSettingDoc = {
      uid,
      is_marketing: false,
      created_at: now,
      updated_at: now,
    };

    await ref.set(payload);

    const saved = await ref.get();
    const data = saved.data() as any;

    return {
      uid: data.uid,
      is_marketing: !!data.is_marketing,
      created_at: tsToIso(data.created_at),
      updated_at: tsToIso(data.updated_at),
    };
  }

  const data = doc.data() as any;

  return {
    uid: data.uid ?? uid,
    is_marketing: !!data.is_marketing,
    created_at: tsToIso(data.created_at),
    updated_at: tsToIso(data.updated_at),
  };
}

export async function updateUserSetting(uid: string, patch: { is_marketing?: boolean }) {
  const ref = db.collection("user_settings").doc(uid);
  const now = FieldValue.serverTimestamp();

  const update: any = {
    updated_at: now,
  };

  if (typeof patch.is_marketing === "boolean") {
    update.is_marketing = patch.is_marketing;
  }

  await ref.update(update);

  return { ok: true };
}
