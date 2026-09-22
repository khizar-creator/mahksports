/** Only verified working Unsplash URLs (HTTP 200 checked). */
const u = (id: string, w = 1000) =>
  `https://images.unsplash.com/${id}?auto=format&fit=crop&w=${w}&q=80`;

export const sportImages = {
  hero1: u("photo-1549719386-74dfcbf7dbed", 2000),
  hero2: u("photo-1555597673-b21d5c935865", 2000),
  hero3: u("photo-1517836357463-d25dfeac3438", 2000),
  hero4: u("photo-1571019614242-c5c5dee9f50b", 2000),

  boxingGloves: u("photo-1549719386-74dfcbf7dbed"),
  boxingGlovesAlt: u("photo-1555597673-b21d5c935865"),
  mmaGloves: u("photo-1583454110551-21f2fa2afe61"),
  mmaGlovesAlt: u("photo-1517466787929-bc90951d0974"),
  shinGuards: u("photo-1623874514711-0f321325f318"),
  headgear: u("photo-1605296867304-46d5465a13f1"),
  bag: u("photo-1518611012118-696072aa579a"),
  pads: u("photo-1576678927484-cc907957088c"),
  rashGuard: u("photo-1534438327276-14e5300c3a48"),
  rashGuardAlt: u("photo-1550345332-09e3ac987658"),
  shorts: u("photo-1594381898411-846e7d193883"),
  trainingTee: u("photo-1521572163474-6864f9cf17ab"),
  compression: u("photo-1571019613454-1cb2f99b2d8b"),
  hoodie: u("photo-1556821840-3a63f95609a7"),
  hoodieAlt: u("photo-1503342217505-b0a15ec3261c"),
  gymBag: u("photo-1553062407-98eeb64c6a62"),
  handWraps: u("photo-1517438476312-10d79c077509"),
  cap: u("photo-1588850561407-ed78c282e89b"),
  gymFloor: u("photo-1581009146145-b5ef050c2e1e"),
  athlete: u("photo-1534367507873-d2d7e24c797f"),

  catMma: u("photo-1555597673-b21d5c935865", 1600),
  catSports: u("photo-1517836357463-d25dfeac3438", 1600),
  catApparel: u("photo-1571019614242-c5c5dee9f50b", 1600),
  catTraining: u("photo-1518611012118-696072aa579a", 1600),
} as const;
