export function utcYmd(d = new Date()): string {
  const y = d.getUTCFullYear();
  const m = String(d.getUTCMonth() + 1).padStart(2, "0");
  const day = String(d.getUTCDate()).padStart(2, "0");
  return `${y}-${m}-${day}`;
}

// YYYY-MM-DD
export function isIsoYmd(s: string) {
  return /^\d{4}-\d{2}-\d{2}$/.test(s);
}

// DD/MM/YYYY
export function isDmySlash(s: string) {
  return /^\d{2}\/\d{2}\/\d{4}$/.test(s);
}

// 2026-02-31 같은 값 방지
export function isValidDateYmd(ymd: string) {
  if (!isIsoYmd(ymd)) return false;
  const [y, m, d] = ymd.split("-").map((v) => parseInt(v, 10));
  const dt = new Date(Date.UTC(y, m - 1, d));
  return (
    dt.getUTCFullYear() === y &&
    dt.getUTCMonth() === m - 1 &&
    dt.getUTCDate() === d
  );
}

/**
 * DD/MM/YYYY -> YYYY-MM-DD
 * - 입력이 유효하지 않으면 null
 * - 실제 날짜 유효성까지 검사
 */
export function dmyToYmd(dmy: string): string | null {
  if (!isDmySlash(dmy)) return null;

  const [dd, mm, yyyy] = dmy.split("/");
  const ymd = `${yyyy}-${mm}-${dd}`;

  return isValidDateYmd(ymd) ? ymd : null;
}

/**
 * YYYY-MM-DD -> DD/MM/YYYY
 * - 표시용
 */
export function ymdToDmy(ymd: string): string | null {
  if (!isValidDateYmd(ymd)) return null;
  const [y, m, d] = ymd.split("-");
  return `${d}/${m}/${y}`;
}
