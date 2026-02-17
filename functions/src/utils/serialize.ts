export function toIso(v: any): string | null {
  if (!v) return null;

  // Firestore Timestamp 객체
  if (typeof v.toDate === "function") {
    return v.toDate().toISOString();
  }

  // json으로 이미 map 형태로 온 경우({_seconds,_nanoseconds})
  if (typeof v === "object") {
    const s = (v as any)._seconds;
    const ns = (v as any)._nanoseconds ?? 0;

    if (typeof s === "number") {
      const ms = s * 1000 + Math.floor(ns / 1e6);
      return new Date(ms).toISOString();
    }
  }

  // Date
  if (v instanceof Date) {
    return v.toISOString();
  }

  // string
  if (typeof v === "string") {
    return v;
  }

  return null;
}

export function serializeUser(data: any) {
  if (!data) return data;

  return {
    ...data,
    created_at: toIso(data.created_at),
    updated_at: toIso(data.updated_at),
    latest_at: toIso(data.latest_at),

    last_question_date: toIso(data.last_question_date),
    suspended_at: toIso(data.suspended_at),
    blocked_at: toIso(data.blocked_at),
    withdrawal_at: toIso(data.withdrawal_at),

    // birth는 string
    birth: typeof data.birth === "string" ? data.birth : toIso(data.birth),
  };
}
