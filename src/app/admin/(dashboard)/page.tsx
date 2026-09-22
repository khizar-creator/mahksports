import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { hasSupabaseConfig } from "@/lib/supabase/client";

export default async function AdminHomePage() {
  let productCount = "—";
  let categoryCount = "—";
  let orderCount = "—";

  if (hasSupabaseConfig()) {
    try {
      const supabase = await createClient();
      const [products, categories, orders] = await Promise.all([
        supabase.from("products").select("id", { count: "exact", head: true }),
        supabase.from("categories").select("id", { count: "exact", head: true }),
        supabase.from("orders").select("id", { count: "exact", head: true }),
      ]);
      productCount = String(products.count ?? 0);
      categoryCount = String(categories.count ?? 0);
      orderCount = String(orders.count ?? 0);
    } catch {
      // seed mode
    }
  }

  return (
    <div>
      <h1 className="font-display text-4xl text-accent">Dashboard</h1>
      <p className="mt-2 text-ink-soft">
        Manage catalogue and COD orders when Supabase is connected.
      </p>
      <div className="mt-8 grid gap-4 sm:grid-cols-3">
        <div className="rounded-xl border border-line bg-surface p-6">
          <p className="text-sm text-muted">Categories</p>
          <p className="font-display text-4xl text-ink">{categoryCount}</p>
          <Link href="/admin/categories" className="mt-4 inline-block text-sm text-accent">
            Manage →
          </Link>
        </div>
        <div className="rounded-xl border border-line bg-surface p-6">
          <p className="text-sm text-muted">Products</p>
          <p className="font-display text-4xl text-ink">{productCount}</p>
          <Link href="/admin/products" className="mt-4 inline-block text-sm text-accent">
            Manage →
          </Link>
        </div>
        <div className="rounded-xl border border-line bg-surface p-6">
          <p className="text-sm text-muted">Orders</p>
          <p className="font-display text-4xl text-ink">{orderCount}</p>
          <Link href="/admin/orders" className="mt-4 inline-block text-sm text-accent">
            View orders →
          </Link>
        </div>
      </div>
    </div>
  );
}
