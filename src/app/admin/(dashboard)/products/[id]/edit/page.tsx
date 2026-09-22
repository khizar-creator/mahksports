import Link from "next/link";
import { notFound } from "next/navigation";
import { ProductForm } from "@/components/admin/ProductForm";
import { createClient } from "@/lib/supabase/server";
import type { Product } from "@/lib/types";

type PageProps = {
  params: Promise<{ id: string }>;
  searchParams: Promise<{ error?: string; ok?: string }>;
};

export default async function EditProductPage({
  params,
  searchParams,
}: PageProps) {
  const { id } = await params;
  const { error, ok } = await searchParams;
  const supabase = await createClient();

  const [{ data: product }, { data: categories }] = await Promise.all([
    supabase.from("products").select("*").eq("id", id).maybeSingle(),
    supabase
      .from("categories")
      .select("*")
      .order("sort_order", { ascending: true }),
  ]);

  if (!product) notFound();

  const normalized: Product = {
    ...(product as Product),
    original_price: Number(product.original_price),
    sale_price:
      product.sale_price == null ? null : Number(product.sale_price),
    wholesale_price:
      product.wholesale_price == null
        ? null
        : Number(product.wholesale_price),
    image_urls: Array.isArray(product.image_urls)
      ? product.image_urls
      : [],
    specifications: product.specifications ?? {},
  };

  return (
    <div>
      <Link
        href="/admin/products"
        className="text-sm text-muted hover:text-accent"
      >
        ← Products
      </Link>
      <h1 className="font-display mt-4 text-3xl text-accent">Edit product</h1>
      <p className="mt-1 text-sm text-ink-soft">{normalized.title}</p>
      {error && <p className="mt-3 text-sm text-danger">{error}</p>}
      {ok && (
        <p className="mt-3 text-sm text-success">
          Product saved to Supabase.
        </p>
      )}
      <div className="mt-6">
        <ProductForm categories={categories ?? []} product={normalized} />
      </div>
    </div>
  );
}
