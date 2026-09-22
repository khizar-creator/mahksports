import Link from "next/link";
import { deleteProductAction } from "@/app/admin/actions";
import { createClient } from "@/lib/supabase/server";
import { formatPrice } from "@/lib/site";
import type { Product } from "@/lib/types";

type PageProps = {
  searchParams: Promise<{ error?: string; ok?: string }>;
};

export default async function AdminProductsPage({ searchParams }: PageProps) {
  const { error, ok } = await searchParams;
  const supabase = await createClient();
  const [{ data: products }, { data: categories }] = await Promise.all([
    supabase.from("products").select("*").order("sort_order", { ascending: true }),
    supabase.from("categories").select("id, name"),
  ]);

  const catName = new Map(
    (categories ?? []).map((c: { id: string; name: string }) => [c.id, c.name]),
  );

  return (
    <div>
      <div className="flex flex-wrap items-center justify-between gap-4">
        <div>
          <h1 className="font-display text-3xl text-accent">Products</h1>
          <p className="mt-1 text-sm text-ink-soft">
            {(products ?? []).length} products · edit pricing, sale badge, images
          </p>
        </div>
        <Link
          href="/admin/products/new"
          className="rounded-lg bg-accent px-4 py-2 text-sm font-bold text-white hover:bg-accent-dark"
        >
          + New product
        </Link>
      </div>
      {error && <p className="mt-2 text-sm text-danger">{error}</p>}
      {ok && <p className="mt-2 text-sm text-success">Saved.</p>}

      <ul className="mt-8 space-y-3">
        {((products ?? []) as Product[]).map((p) => {
          const onSale =
            p.sale_price != null && Number(p.sale_price) < Number(p.original_price);
          const img = p.image_urls?.[0];
          return (
            <li
              key={p.id}
              className="flex flex-wrap items-center gap-4 rounded-xl border border-line bg-white px-4 py-3 shadow-sm"
            >
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img
                src={img || ""}
                alt=""
                className="h-14 w-14 shrink-0 rounded object-cover bg-paper-deep"
              />
              <div className="min-w-0 flex-1">
                <div className="flex flex-wrap items-center gap-2">
                  <p className="font-medium text-ink">{p.title}</p>
                  {onSale && (
                    <span className="bg-accent px-1.5 py-0.5 text-[0.65rem] font-bold uppercase text-white">
                      Sale
                    </span>
                  )}
                  {p.featured && (
                    <span className="border border-line px-1.5 py-0.5 text-[0.65rem] uppercase text-muted">
                      Featured
                    </span>
                  )}
                  {!p.in_stock && (
                    <span className="text-[0.65rem] uppercase text-danger">
                      Out of stock
                    </span>
                  )}
                </div>
                <p className="mt-0.5 text-xs text-muted">
                  {p.sku} · {catName.get(p.category_id) ?? "—"} ·{" "}
                  {onSale ? (
                    <>
                      <span className="text-accent">
                        {formatPrice(Number(p.sale_price))}
                      </span>{" "}
                      <span className="line-through">
                        {formatPrice(Number(p.original_price))}
                      </span>
                    </>
                  ) : (
                    formatPrice(Number(p.original_price))
                  )}
                </p>
              </div>
              <div className="flex gap-3">
                <Link
                  href={`/admin/products/${p.id}/edit`}
                  className="text-sm font-medium text-accent hover:underline"
                >
                  Edit
                </Link>
                <form action={deleteProductAction}>
                  <input type="hidden" name="id" value={p.id} />
                  <button
                    type="submit"
                    className="text-sm text-danger hover:underline"
                  >
                    Delete
                  </button>
                </form>
              </div>
            </li>
          );
        })}
      </ul>
    </div>
  );
}
