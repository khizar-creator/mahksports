const fs = require("fs");

const data = JSON.parse(
  fs.readFileSync("./scripts/rewon-products.json", "utf8"),
);

const S = {
  gloves: "dddddddd-dddd-dddd-dddd-dddddddddd01",
  protect: "dddddddd-dddd-dddd-dddd-dddddddddd02",
  tees: "dddddddd-dddd-dddd-dddd-dddddddddd03",
  shorts: "dddddddd-dddd-dddd-dddd-dddddddddd04",
  hoodies: "dddddddd-dddd-dddd-dddd-dddddddddd05",
  bagsAcc: "dddddddd-dddd-dddd-dddd-dddddddddd06",
  bagsPads: "dddddddd-dddd-dddd-dddd-dddddddddd07",
  aids: "dddddddd-dddd-dddd-dddd-dddddddddd08",
  uniforms: "dddddddd-dddd-dddd-dddd-dddddddddd09",
};

function mapType(type, title, handle, tags) {
  const hay = [type, title, handle, tags].join(" ").toLowerCase();
  if (/motorcycle|motorrad|biker jacket|leather suit|jagd|hunt/.test(hay)) {
    return null;
  }
  if (/bundle|product bundle|combo set|sparring set/.test(hay)) return null;
  if (/example product/.test(hay)) return null;

  if (
    /focus mitt|handpolster|kick shield|kick sheild|thai pad|punching bag/.test(
      hay,
    ) ||
    /Punching Bag|Kick Sheild|Focus Mitt/i.test(type)
  ) {
    return S.bagsPads;
  }

  if (
    /boxing glove|mma grappling|mma glove|bag glove|mitten|hand wrap|innenhand|gel glove/.test(
      hay,
    ) ||
    /Boxing Gloves|MMA Grappling|Hand Wraps/i.test(type)
  ) {
    return S.gloves;
  }

  if (
    /shin|head guard|kopfschutz|chest guard|arm guard|knee pad|ankle wrap|protective gear|brustschutz/.test(
      hay,
    ) ||
    /Protective Gear|Shin Guards|Head Guards|Chest Guard|Knee Pads|Arm Guards|Ankle Wraps/i.test(
      type,
    )
  ) {
    return S.protect;
  }

  if (
    /jiu jitsu|bjj|kimono|karate|taekwondo|judo|gi\b|judogi|belt/.test(hay) ||
    /Jiu Jitsu|Karate|Taekwondo|JiuJitsu Belts|Karate Belt/i.test(type)
  ) {
    return S.uniforms;
  }

  if (
    /hoodie|sweatshirt|jacket|cobra hood|jacke/.test(hay) ||
    /Hoodies|Jackets|Sweatshirts|cobra hood/i.test(type)
  ) {
    return S.hoodies;
  }

  if (
    /t-shirt|tee|rash|funktionsshirt/.test(hay) ||
    /T-Shirts/i.test(type)
  ) {
    return S.tees;
  }

  if (/short/.test(hay)) return S.shorts;

  if (
    /backpack|duffel|travel bag|scarf|schal/.test(hay) ||
    /Travel Backpack|Scarves/i.test(type)
  ) {
    return S.bagsAcc;
  }

  if (
    /lifting|weight belt|dip belt|ab strap|arm blaster|wrist/.test(hay) ||
    /Lifting Straps|Weight Lifting|Dip Belt|Ab Straps|Arm Blaster/i.test(type)
  ) {
    return S.aids;
  }

  return S.aids;
}

function stripHtml(html = "") {
  return html
    .replace(/<script[\s\S]*?<\/script>/gi, "")
    .replace(/<style[\s\S]*?<\/style>/gi, "")
    .replace(/<[^>]+>/g, " ")
    .replace(/&nbsp;/g, " ")
    .replace(/&amp;/g, "&")
    .replace(/&quot;/g, '"')
    .replace(/&#39;/g, "'")
    .replace(/\s+/g, " ")
    .trim()
    .slice(0, 1200);
}

function slugify(s) {
  return s
    .toLowerCase()
    .trim()
    .replace(/[^\w\s-]/g, "")
    .replace(/\s+/g, "-")
    .replace(/-+/g, "-")
    .slice(0, 80);
}

function usdToPkr(usd) {
  const n = Math.round((Number(usd) * 280) / 100) * 100;
  return Math.max(n, 500);
}

function uuid(n) {
  return "aaaaaaaa-aaaa-aaaa-aaaa-" + String(n).padStart(12, "0");
}

function esc(s) {
  return String(s).replace(/'/g, "''");
}

const usedSlugs = new Set();
const products = [];
let n = 1;

for (const p of data.products) {
  const tags = Array.isArray(p.tags) ? p.tags.join(",") : String(p.tags || "");
  const cat = mapType(p.product_type || "", p.title || "", p.handle || "", tags);
  if (!cat) continue;

  const imgs = (p.images || [])
    .map((i) => i.src)
    .filter(Boolean)
    // skip obvious collage/bundle marketing frames when alt mentions bundle
    .filter((_, idx) => {
      const alt = String(p.images[idx]?.alt || "").toLowerCase();
      return !alt.includes("bundle");
    });
  if (!imgs.length) continue;

  const v = p.variants?.[0];
  if (!v) continue;

  const price = Number(v.price);
  const compare = v.compare_at_price ? Number(v.compare_at_price) : null;
  const original = compare && compare > price ? compare : price;
  const sale = compare && compare > price ? price : null;

  let slug = slugify(p.handle || p.title);
  const base = slug;
  let i = 2;
  while (usedSlugs.has(slug)) {
    slug = `${base}-${i}`;
    i += 1;
  }
  usedSlugs.add(slug);

  const desc =
    stripHtml(p.body_html) ||
    `${p.title} — performance combat sports gear from MAHKSPORTS.`;

  const color =
    v.option1 && v.option1 !== "Default Title" ? v.option1 : undefined;
  const size =
    v.option2 && v.option2 !== "Default Title" ? v.option2 : undefined;

  const featured = n <= 16 || (sale != null && n <= 48);

  products.push({
    id: uuid(n),
    category_id: cat,
    title: p.title
      .replace(/\s*\|\s*RewonGear.*/i, "")
      .replace(/\s*Rewon\s*$/i, "")
      .trim()
      .slice(0, 120),
    slug,
    sku: "MHK-" + String(n).padStart(3, "0"),
    description: desc,
    original_price: usdToPkr(original),
    sale_price: sale != null ? usdToPkr(sale) : null,
    wholesale_price: usdToPkr((sale ?? price) * 0.72),
    image_urls: imgs.slice(0, 4),
    in_stock: v.available !== false,
    specifications: {
      ...(size ? { size } : {}),
      ...(color ? { color } : {}),
      material: p.product_type || undefined,
    },
    featured: Boolean(featured),
    sort_order: n,
  });
  n += 1;
}

console.log("imported", products.length);
const byCat = {};
for (const p of products) byCat[p.category_id] = (byCat[p.category_id] || 0) + 1;
console.log(byCat);

const ts = `import type { Product } from "./types";

/** Imported from rewongear.com (owner catalog) — motorcycle/bundle items excluded */
export const rewonProducts: Product[] = ${JSON.stringify(products, null, 2)};
`;
fs.writeFileSync("./src/lib/rewon-products.ts", ts);

const sql = [
  "-- Auto-generated from Rewon catalog (run after categories exist)",
  "truncate table public.products restart identity cascade;",
  "",
];

for (const p of products) {
  const imgs =
    "ARRAY[" + p.image_urls.map((u) => `'${esc(u)}'`).join(",") + "]::text[]";
  const specs = `'${esc(JSON.stringify(p.specifications))}'::jsonb`;
  sql.push(`insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  '${p.id}', '${p.category_id}', '${esc(p.title)}', '${esc(p.slug)}', '${esc(p.sku)}',
  '${esc(p.description)}', ${p.original_price}, ${p.sale_price == null ? "null" : p.sale_price},
  ${p.wholesale_price}, ${imgs}, ${p.in_stock}, ${specs}, ${p.featured}, ${p.sort_order}
);`);
  sql.push("");
}

fs.writeFileSync("./supabase/seed-products-rewon.sql", sql.join("\n"));
console.log("wrote files ok");
