import { FieldPath, Timestamp } from "firebase-admin/firestore";
import { db, FieldValue } from "../config/firebase";
import { utcYmd } from "../utils/date";

type ReadingFullDoc = {
  id: string;
  created_at: any;
  updated_at: any;
  uid: string;
  question: string;
  interpretation: string;
  unsaid_line: string;
  status: string;
  deleted_at: any | null;
};

type ReadingSummaryDoc = {
  id: string;
  created_at: any;
  updated_at: any;
  uid: string;
  question: string;
  unsaid_line: string;
  status: string;
  deleted_at: any | null;
};

function tsToIso(v: any): string {
  // Firestore Timestamp -> ISO
  if (!v) return new Date().toISOString();
  if (typeof v.toDate === "function") return v.toDate().toISOString();
  if (v instanceof Date) return v.toISOString();

  return new Date().toISOString();
}

function docToSummary(doc: FirebaseFirestore.QueryDocumentSnapshot) {
  const d = doc.data() as any;

  return {
    id: doc.id,
    created_at: tsToIso(d.created_at),
    updated_at: tsToIso(d.updated_at),
    uid: d.uid,
    question: d.question,
    unsaid_line: d.unsaid_line,
    status: d.status ?? "active",
    deleted_at: d.deleted_at ? tsToIso(d.deleted_at) : null,

  };
}

function docToFull(doc: FirebaseFirestore.DocumentSnapshot) {
  const d = (doc.data() || {}) as any;

  return {
    id: doc.id,
    created_at: tsToIso(d.created_at),
    updated_at: tsToIso(d.updated_at),
    uid: d.uid,
    question: d.question,
    interpretation: d.interpretation,
    unsaid_line: d.unsaid_line,
    status: d.status ?? "active",
    deleted_at: d.deleted_at ? tsToIso(d.deleted_at) : null,
  };
}

export async function createReading(params: {
  uid: string;
  question: string;
  interpretation: string;
  unsaidLine: string;

}) {
  const { uid, question, interpretation, unsaidLine } = params;
  const isDev = process.env.FUNCTIONS_EMULATOR === "true";
  const limitPerDay = isDev ? 100 : 3;


  const now = FieldValue.serverTimestamp();
  const today = utcYmd(new Date());

  const userRef = db.collection("users").doc(uid);

  const readingRef = db.collection("readings").doc(); // Firestore docId는 자동
  const summaryRef = db.collection("reading_summaries").doc(readingRef.id);

  const fullPayload: ReadingFullDoc = {
    id: readingRef.id,
    created_at: now,
    updated_at: now,
    uid,
    question,
    interpretation,
    unsaid_line: unsaidLine,
    status: "active",
    deleted_at: null,
  };

  const summaryPayload: ReadingSummaryDoc = {
    id: readingRef.id,
    created_at: now,
    updated_at: now,
    uid,
    question,
    unsaid_line: unsaidLine,
    status: "active",
    deleted_at: null,
  };

  let usedAfter = 0;

  await db.runTransaction(async (tx) => {
        const userSnap = await tx.get(userRef);

        if (!userSnap.exists) {
          throw Object.assign(new Error("User not found"), { status: 404 });
        }
    
        const u = userSnap.data() || {};

        const lastDate = typeof u.last_question_date === "string" ? u.last_question_date : null;
        const prevCount = typeof u.daily_question_count === "number" ? u.daily_question_count : 0;

        const currentCount = lastDate === today ? prevCount : 0;
    
        if (currentCount >= limitPerDay) {
          throw Object.assign(new Error("Daily limit reached"), {
            status: 429,
            code: "DAILY_QUOTA_EXCEEDED",
            meta: { limit: limitPerDay, used: currentCount, day: today },
          });
        }
    
    usedAfter = currentCount + 1;
    
    tx.set(readingRef, fullPayload);
    tx.set(summaryRef, summaryPayload);
    
    tx.update(
      userRef,
      {
        daily_question_count: usedAfter,
        last_question_date: today,
        updated_at: now,
      },
     
    );
  });

  // timestamps resolve를 위해 read-back
  const saved = await readingRef.get();
  const data = saved.data() || {};

  return {
    id: readingRef.id,
    created_at: tsToIso(data.created_at),
    updated_at: tsToIso(data.updated_at),
    uid: data.uid,
    question: data.question,
    interpretation: data.interpretation,
    unsaid_line: data.unsaid_line,
    status: data.status ?? "active",
    deleted_at: data.deleted_at ? tsToIso(data.deleted_at) : null,
    quota: {
      day: today,
      used: usedAfter,
      limit: limitPerDay,
      remaining: Math.max(0, limitPerDay - usedAfter),
    },
  };
  
}

export async function listReadings(
  uid: string,
  opts: { limit: number; cursor: string | null; cursorId: string | null }
) {
  let q: FirebaseFirestore.Query = db
    .collection("reading_summaries")
    .where("uid", "==", uid)
    .where("status", "==", "active")
    .orderBy("created_at", "desc")
    .orderBy(FieldPath.documentId(), "desc")
    .limit(opts.limit);

  if (opts.cursor && opts.cursorId) {
    const cursorDate = new Date(opts.cursor);

    if (!Number.isFinite(cursorDate.getTime())) {
      throw Object.assign(new Error("Invalid cursor"), { status: 400 });
    }

    q = q.startAfter(Timestamp.fromDate(cursorDate), opts.cursorId);
  }

  const snap = await q.get();
  const items = snap.docs.map(docToSummary);

  const last = snap.docs[snap.docs.length - 1];
  const nextCursor = last ? tsToIso(last.data()?.created_at) : null;
  const nextCursorId = last ? last.id : null;

  return {
    items,
    next: last
      ? { cursor: nextCursor, cursor_id: nextCursorId }
      : null,
  };
}

export async function getReadingById(uid: string, id: string) {
  const doc = await db.collection("readings").doc(id).get();

  if (!doc.exists) {
    throw Object.assign(new Error("Reading not found"), { status: 404 });
  }

  const data = doc.data() as any;

  if (data.uid !== uid) {
    throw Object.assign(new Error("Forbidden"), { status: 403 });
  }

  if (data.status === "deleted") {
    throw Object.assign(new Error("Reading not found"), { status: 404 });
  }

  return docToFull(doc);
}

export async function deleteReading(uid: string, id: string) {
  const readingRef = db.collection("readings").doc(id);
  const summaryRef = db.collection("reading_summaries").doc(id);
  const now = FieldValue.serverTimestamp();

  await db.runTransaction(async (tx) => {
    // reads first
    const snap = await tx.get(readingRef);

    if (!snap.exists) {
      throw Object.assign(new Error("Reading not found"), { status: 404 });
    }

    const data = snap.data() as any;

    if (data.uid !== uid) {
      throw Object.assign(new Error("Forbidden"), { status: 403 });
    }

    // 이미 deleted면 멱등 처리 (OK 반환)
    if (data.status === "deleted") return;

    // writes after reads
    tx.set(
      readingRef,
      { status: "deleted", deleted_at: now, updated_at: now },
      { merge: true }
    );

    tx.set(
      summaryRef,
      { status: "deleted", deleted_at: now, updated_at: now },
      { merge: true }
    );
  });

  return { ok: true };
}
