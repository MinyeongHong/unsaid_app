import { auth, db, FieldValue} from "../config/firebase";
import { isValidDateYmd } from "../utils/date";
import { serializeUser } from "../utils/serialize";

export async function getUser(uid: string) {
  const userRef = db.collection("users").doc(uid);
  const settingRef = db.collection("user_settings").doc(uid);

  const [userSnap, settingSnap] = await Promise.all([
    userRef.get(),
    settingRef.get(),
  ]);

  if (!userSnap.exists) {
    throw Object.assign(new Error("User not found. Call POST /users first."), {
      status: 404,
    });
  }

  const userData = userSnap.data() || {};
  const settingData = settingSnap.exists ? (settingSnap.data() || {}) : {};

  // users는 기존 serializer 사용
  const user = serializeUser(userData);

  // settings는 필요한 것만
  const settings = {
    marketing_opt_in:
      typeof settingData.marketing_opt_in === "boolean"
        ? settingData.marketing_opt_in
        : false,
  };

  return {
    ...user,
    settings,
  };
}

export async function upsertUserOnLogin(decodedUser: any, body: any = {}) {
  if (!decodedUser?.uid) throw new Error("Invalid auth");

  const uid = decodedUser.uid;
  const provider = body.provider ?? "unknown";
  const email = body.email ??  "";
  const locale = typeof body.locale === "string" ? body.locale : null;
  const platform = typeof body.platform === "string" ? body.platform : null;

  const ref = db.collection("users").doc(uid);
  const now = FieldValue.serverTimestamp();

  await db.runTransaction(async (tx) => {
    const snap = await tx.get(ref);

    if (!snap.exists) {
      const payload = {
        id: uid,
        uid,
        created_at: now,
        updated_at: now,
        latest_at: now,
        state: "active",
        role: "user",
        email,
        provider,
        is_agreed: false,
        is_birth_completed: false,
        locale,
        platform,     
        birth: null,
        sun_sign: null,
        daily_question_count: 0,
        last_question_date: null,
        suspended_at: null,
        blocked_at: null,
        withdrawal_at: null,
      };

      tx.set(ref, payload);
    } else {
      const patch = {
        email,
        provider,
        locale,
        platform,
        latest_at: now,
        updated_at: now,
      };

    
      tx.set(ref, patch, { merge: true });
    }
  });

  const saved = await ref.get();

  if (!saved.exists) throw new Error("User not found");

  const after = saved.data() || {};

  const out = serializeUser(after);

  return out; 
}


export async function updateUser(uid: string, body: any) {
  const ref = db.collection("users").doc(uid);

  // ✅ user 존재 확인 (원하면 생략 가능하지만 지금 흐름에선 409가 더 명확)
  const snap = await ref.get();
  if (!snap.exists) {
    throw Object.assign(new Error("User not found. Call POST /users first."), {
      status: 409,
    });
  }

  // ✅ 이번 엔드포인트는 birth 흐름만 처리한다는 전제
  // (나중에 users PUT을 확장할 거면 patch builder만 확장하면 됨)
  if (body?.is_birth_complete !== true) {
    throw Object.assign(new Error("is_birth_complete must be true"), {
      status: 400,
    });
  }

  // birth: null | "YYYY-MM-DD"
  const rawBirth = body?.birth;

  let birth: string | null;
  if (rawBirth === null) {
    birth = null; // 스킵
  } else if (typeof rawBirth === "string" && isValidDateYmd(rawBirth)) {
    birth = rawBirth; // 입력
  } else {
    throw Object.assign(new Error("birth must be null or YYYY-MM-DD"), {
      status: 400,
    });
  }

  await ref.set(
    {
      birth,
      is_birth_completed: true,
      updated_at: FieldValue.serverTimestamp(),
    },
    { merge: true }
  );

  const saved = await ref.get();
  const after = saved.data() || {};
  return serializeUser(after);
}

export async function deleteUser(uid: string) {
  const userRef = db.collection("users").doc(uid);
  const settingRef = db.collection("user_settings").doc(uid);

  const now = FieldValue.serverTimestamp();

  // 1️⃣ Firestore 트랜잭션
  await db.runTransaction(async (tx) => {
    const [userSnap, settingSnap] = await Promise.all([
      tx.get(userRef),
      tx.get(settingRef),
    ]);

    if (!userSnap.exists) {
      throw Object.assign(new Error("User not found"), { status: 404 });
    }

    const user = userSnap.data() || {};

    if (user.withdrawal_at) {
      // 이미 탈퇴된 계정
      return;
    }

    // users: 소프트 탈퇴
    tx.set(
      userRef,
      {
        state: "withdrawn",
        withdrawal_at: now,
        updated_at: now,
      },
      { merge: true }
    );

    // user_settings: 마케팅 off
    if (settingSnap.exists) {
      tx.set(
        settingRef,
        {
          is_marketing: false,
          updated_at: now,
        },
        { merge: true }
      );
    }
  });

  // 2️⃣ Firebase Auth 계정 삭제 (트랜잭션 밖)
  // - 실패해도 Firestore 탈퇴는 유지
  try {
    await auth.deleteUser(uid);
  } catch (e) {
    // 실무에서는 여기 로그만 남김 (재시도/배치로 정리)
    console.error("Failed to delete auth user:", uid, e);
  }
}

export async function getUserBirth(uid: string): Promise<string | null> {
  const doc = await db.collection("users").doc(uid).get();

  if (!doc.exists) return null;

  const data = doc.data() as any;

  return typeof data.birth === "string" ? data.birth : null;
}