import { db, FieldValue } from "../config/firebase";

function utcYmd(d = new Date()): string {
  const y = d.getUTCFullYear();
  const m = String(d.getUTCMonth() + 1).padStart(2, "0");
  const day = String(d.getUTCDate()).padStart(2, "0");
  return `${y}-${m}-${day}`;
}

export async function consumeDailyQuestion(uid: string, limitPerDay = 3) {
  const userRef = db.collection("users").doc(uid);
  const today = utcYmd(new Date());

  let afterCount = 0;
  let afterDate = today;

  await db.runTransaction(async (tx) => {
    const snap = await tx.get(userRef);
    if (!snap.exists) {
      throw Object.assign(new Error("User not found"), { status: 404 });
    }

    const data = snap.data() || {};
    const lastDate = typeof data.last_question_date === "string" ? data.last_question_date : null;
    const count = typeof data.daily_question_count === "number" ? data.daily_question_count : 0;

    // 날짜가 바뀌었으면 리셋
    const currentCount = lastDate === today ? count : 0;

    if (currentCount >= limitPerDay) {
      throw Object.assign(new Error("Daily limit reached"), {
        status: 429,
        meta: { limit: limitPerDay, used: currentCount, day: today },
      });
    }

    afterCount = currentCount + 1;
    afterDate = today;

    tx.set(
      userRef,
      {
        daily_question_count: afterCount,
        last_question_date: today,
        updated_at: FieldValue.serverTimestamp(),
      },
      { merge: true }
    );
  });

  return { ok: true, day: afterDate, used: afterCount, limit: limitPerDay };
}
