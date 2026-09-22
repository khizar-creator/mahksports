# MAHKSPORTS — Supabase setup

## 1. Create schema
Supabase Dashboard → **SQL Editor** → run:

`supabase/schema.sql`

## 2. Seed categories + products
Run:

`supabase/seed.sql`

This inserts categories (incl. Martial Arts Uniforms) and **~156 products** imported from your Rewon catalog (motorcycle / bundle items skipped). Images use Shopify CDN URLs.

To re-import products only later:

`node scripts/import-rewon.js` then run `supabase/seed-products-rewon.sql`

## 3. Connect the Next.js app
Copy `.env.local.example` → `.env.local` and set:

```
NEXT_PUBLIC_SUPABASE_URL=https://xxxx.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJ...
USE_SUPABASE_CATALOGUE=true
```

Then restart:

```
npm run dev
```

## Notes
- Image URLs in the seed were HTTP-checked (200 OK) against Unsplash.
- Later you can replace `image_urls` with public URLs from the `product-images` Storage bucket via Admin → Products.
- `USE_SUPABASE_CATALOGUE=false` falls back to the local TypeScript seed in `src/lib/seed.ts`.
- Orders: if you already ran an older `schema.sql`, also run `supabase/orders.sql` once so COD checkouts can save.
