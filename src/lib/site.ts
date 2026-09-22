export const site = {
  name: "MAHKSPORTS",
  shortName: "mahksports",
  tagline: "Combat Sports Gear · Activewear · Apparel",
  description:
    "Premium combat sports equipment, performance activewear, and custom apparel — built for fighters, gyms, and wholesale partners worldwide.",
  email: "Mudies.ent@gmail.com",
  phone: "+92 321 7100177",
  phoneE164: "923217100177",
  phones: [
    {
      label: "Pakistan",
      display: "+92 321 7100177",
      e164: "923217100177",
    },
    {
      label: "Europe / Ireland",
      display: "+353 83 175 7766",
      e164: "353831757766",
    },
  ],
  whatsappUrl: "https://wa.me/923217100177",
  whatsappPrefill:
    "Hi MAHKSPORTS — I would like to inquire about your combat sports gear and activewear.",
  locations: [
    {
      id: "pakistan",
      label: "Manufacturing",
      line1: "Bogarrah, Sialkot",
      line2: "Punjab, Pakistan",
      full: "Bogarrah, Sialkot, Punjab, Pakistan",
      lat: 32.46864700317383,
      lng: 74.5260009765625,
      mapsUrl:
        "https://www.google.com/maps?q=32.46864700317383,74.5260009765625&z=17&hl=en",
      mapsEmbedUrl:
        "https://maps.google.com/maps?q=32.46864700317383,74.5260009765625&z=17&output=embed",
    },
    {
      id: "ireland",
      label: "Europe office",
      line1: "Ireland",
      line2: "Europe",
      full: "Ireland",
      mapsUrl: "https://www.google.com/maps/search/?api=1&query=Dublin%2C%20Ireland",
      mapsEmbedUrl:
        "https://maps.google.com/maps?q=Dublin%2C%20Ireland&z=11&output=embed",
    },
  ],
  socials: {
    facebook: "https://www.facebook.com/",
    instagram: "https://www.instagram.com/",
    youtube: "https://www.youtube.com/",
    tiktok: "https://www.tiktok.com/",
  },
} as const;

export function formatPrice(amount: number, currency = "PKR") {
  return new Intl.NumberFormat("en-PK", {
    style: "currency",
    currency,
    maximumFractionDigits: 0,
  }).format(amount);
}

export function slugify(value: string) {
  return value
    .toLowerCase()
    .trim()
    .replace(/[^\w\s-]/g, "")
    .replace(/\s+/g, "-")
    .replace(/-+/g, "-");
}

export function waHref(text?: string) {
  const base = site.whatsappUrl;
  if (!text) return base;
  return `${base}?text=${encodeURIComponent(text)}`;
}
