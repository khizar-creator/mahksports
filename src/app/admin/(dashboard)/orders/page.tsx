import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { formatPrice } from "@/lib/site";
import type { Order } from "@/lib/types";

function statusClass(status: string) {
  switch (status) {
    case "confirmed":
      return "text-accent";
    case "shipped":
    case "delivered":
      return "text-success";
    case "cancelled":
      return "text-danger";
    default:
      return "text-ink";
  }
}

export default async function AdminOrdersPage() {
  const supabase = await createClient();
  const { data, error } = await supabase
    .from("orders")
    .select("*")
    .order("created_at", { ascending: false });

  const orders = (data ?? []) as Order[];

  return (
    <div>
      <h1 className="font-display text-3xl text-accent">Orders</h1>
      <p className="mt-2 text-sm text-ink-soft">
        COD checkouts saved to Supabase. Email notify is optional.
      </p>
      {error && (
        <p className="mt-4 text-sm text-danger">
          {error.message.includes("relation") || error.code === "42P01"
            ? "Orders table missing — run supabase/orders.sql in Supabase SQL Editor."
            : error.message}
        </p>
      )}

      {orders.length === 0 && !error ? (
        <p className="mt-8 text-ink-soft">No orders yet.</p>
      ) : (
        <ul className="mt-8 space-y-3">
          {orders.map((order) => (
            <li
              key={order.id}
              className="flex flex-wrap items-center justify-between gap-3 rounded-lg border border-line bg-surface px-4 py-3"
            >
              <div>
                <p className="font-mono text-sm font-semibold text-ink">
                  {order.order_number}
                </p>
                <p className="mt-0.5 text-sm text-ink-soft">
                  {order.customer_name} · {order.city} ·{" "}
                  {formatPrice(Number(order.subtotal))}
                </p>
                <p className="mt-0.5 text-xs text-muted">
                  {new Date(order.created_at).toLocaleString()} ·{" "}
                  <span className={statusClass(order.status)}>
                    {order.status}
                  </span>
                </p>
              </div>
              <Link
                href={`/admin/orders/${order.id}`}
                className="text-sm text-accent hover:underline"
              >
                View details →
              </Link>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}
