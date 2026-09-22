import { NextResponse } from "next/server";
import { searchProducts } from "@/lib/data";
import { formatPrice } from "@/lib/site";

export async function GET(req: Request) {
  const { searchParams } = new URL(req.url);
  const q = (searchParams.get("q") ?? "").trim();

  if (q.length < 2) {
    return NextResponse.json({ ok: true, products: [] });
  }

  const products = await searchProducts(q);
  const limited = products.slice(0, 8).map((p) => ({
    id: p.id,
    title: p.title,
    slug: p.slug,
    sku: p.sku,
    price: p.sale_price ?? p.original_price,
    priceLabel: formatPrice(p.sale_price ?? p.original_price),
    image: p.image_urls[0] ?? "",
    category: p.category.name,
  }));

  return NextResponse.json({
    ok: true,
    total: products.length,
    products: limited,
  });
}
