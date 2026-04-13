// TODO fix
export const SHADOW_TRAITS_MAP: Record<string, string> = {
  "aries_1": "Aggression used to hide a deep fear of being weak.",
  "aries_2": "Winning just to prove you have a right to exist.",
  "taurus_1": "Staying in toxic spots just for financial safety.",
  "taurus_2": "Stubbornness as a shield against a scary world.",
  "gemini_1": "Using wit to avoid any real emotional depth.",
  "gemini_2": "Acting 'light' to escape heavy, ugly truths.",
  "cancer_1": "Using 'caretaking' to control everyone around you.",
  "cancer_2": "Playing the victim to avoid real responsibility.",
  "leo_1": "A fragile ego that demands constant attention.",
  "leo_2": "Creating drama just to avoid being ordinary.",
  "virgo_1": "Judging others to distract from your own self-hate.",
  "virgo_2": "Micromanaging because your internal life is a chaos.",
  "libra_1": "Being 'nice' just to avoid standing up for yourself.",
  "libra_2": "Indecisiveness used to dodge any responsibility.",
  "scorpio_1": "Using power plays to protect a wounded core.",
  "scorpio_2": "Testing people constantly to see when they'll leave.",
  "sagittarius_1": "Calling it 'freedom' when it's actually just running away.",
  "sagittarius_2": "Self-righteousness used to hide your own insecurity.",
  "capricorn_1": "Treating people like business deals to stay safe.",
  "capricorn_2": "Coldness as a mask for the fear of losing control.",
  "aquarius_1": "Acting detached to avoid the vulnerability of belonging.",
  "aquarius_2": "A superiority complex used to keep people far away.",
  "pisces_1": "Using self-pity to get out of holding yourself accountable.",
  "pisces_2": "Willful ignorance to keep your comfort zone intact."
};

export function getSunSignFromYmd(birthYmd: string): string | null {
    // birthYmd: "YYYY-MM-DD"
    const m = Number(birthYmd.slice(5, 7));
    const d = Number(birthYmd.slice(8, 10));
    if (!Number.isFinite(m) || !Number.isFinite(d)) return null;
  
    // Western tropical zodiac (approx) by date
    // Aries 3/21–4/19, Taurus 4/20–5/20, Gemini 5/21–6/20, Cancer 6/21–7/22,
    // Leo 7/23–8/22, Virgo 8/23–9/22, Libra 9/23–10/22, Scorpio 10/23–11/21,
    // Sagittarius 11/22–12/21, Capricorn 12/22–1/19, Aquarius 1/20–2/18, Pisces 2/19–3/20
    if ((m === 3 && d >= 21) || (m === 4 && d <= 19)) return "Aries";
    if ((m === 4 && d >= 20) || (m === 5 && d <= 20)) return "Taurus";
    if ((m === 5 && d >= 21) || (m === 6 && d <= 20)) return "Gemini";
    if ((m === 6 && d >= 21) || (m === 7 && d <= 22)) return "Cancer";
    if ((m === 7 && d >= 23) || (m === 8 && d <= 22)) return "Leo";
    if ((m === 8 && d >= 23) || (m === 9 && d <= 22)) return "Virgo";
    if ((m === 9 && d >= 23) || (m === 10 && d <= 22)) return "Libra";
    if ((m === 10 && d >= 23) || (m === 11 && d <= 21)) return "Scorpio";
    if ((m === 11 && d >= 22) || (m === 12 && d <= 21)) return "Sagittarius";
    if ((m === 12 && d >= 22) || (m === 1 && d <= 19)) return "Capricorn";
    if ((m === 1 && d >= 20) || (m === 2 && d <= 18)) return "Aquarius";
    if ((m === 2 && d >= 19) || (m === 3 && d <= 20)) return "Pisces";
  
    return null;
  }
  