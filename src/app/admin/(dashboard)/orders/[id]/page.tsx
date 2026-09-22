import Link from "next/link";
import { notFound } from "next/navigation";
import { updateOrderStatusAction } from "@/app/admin/actions";
import { createClient } from "@/lib/supabase/server";
import { formatPrice } from "@/lib/site";
import type { Order, OrderItemSnapshot } from "@/lib/types";

type PageProps = {
  params: Promise<{ id: string }>;
  searchParams: Promise<{ error?: string; ok?: string }>;
};

const STATUSES = [
  "new",
  "confirmed",
  "shipped",
  "delivered",
  "cancelled",
] as const;

export default async function AdminOrderDetailPage({
  params,
  searchParams,
}: PageProps) {
  const { id } = await params;
  const { error, ok } = await searchParams;
  const supabase = await createClient();
  const { data } = await supabase.from("orders").select("*").eq("id", id).maybeSingle();

  if (!data) notFound();

  const order = data as Order;
  const items = (Array.isArray(order.items) ? order.items : []) as OrderItemSnapshot[];

  return (
    <div>
      <Link href="/admin/orders" className="text-sm text-muted hover:text-accent">
        ← Orders
      </Link>
      <div className="mt-4 flex flex-wrap items-start justify-between gap-4">
        <div>
          <h1 className="font-display text-3xl text-accent">
            {order.order_number}
          </h1>
          <p className="mt-1 text-sm text-muted">
            {new Date(order.created_at).toLocaleString()} · COD ·{" "}
            <span className="uppercase tracking-wide">{order.status}</span>
          </p>
        </div>
        <form action={updateOrderStatusAction} className="flex items-end gap-2">
          <input type="hidden" name="id" value={order.id} />
          <label className="block text-sm">
            <span className="admin-label">Status</span>
            <select
              name="status"
              defaultValue={order.status}
              className="admin-input w-auto"
            >
              {STATUSES.map((s) => (
                <option key={s} value={s}>
                  {s}
                </option>
              ))}
            </select>
          </label>
          <button
            type="submit"
            className="rounded-lg bg-accent px-4 py-2 text-sm font-bold text-void"
          >
            Update
          </button>
        </form>
      </div>

      {error && <p className="mt-3 text-sm text-danger">{error}</p>}
      {ok && <p className="mt-3 text-sm text-success">Status updated.</p>}

      <div className="mt-8 grid gap-6 md:grid-cols-2">
        <section className="rounded-xl border border-line bg-surface p-5">
          <h2 className="text-sm font-semibold uppercase tracking-wide text-muted">
            Customer
          </h2>
          <dl className="mt-3 space-y-2 text-sm">
            <div>
              <dt className="text-muted">Name</dt>
              <dd className="font-medium text-ink">{order.customer_name}</dd>
            </div>
            <div>
              <dt className="text-muted">Phone</dt>
              <dd className="text-ink">
                <a href={`tel:${order.phone}`} className="hover:text-accent">
                  {order.phone}
                </a>
              </dd>
            </div>
            {order.email && (
              <div>
                <dt className="text-muted">Email</dt>
                <dd className="text-ink">
                  <a
                    href={`mailto:${order.email}`}
                    className="hover:text-accent"
                  >
                    {order.email}
                  </a>
                </dd>
              </div>
            )}
            <div>
              <dt className="text-muted">City</dt>
              <dd className="text-ink">{order.city}</dd>
            </div>
            <div>
              <dt className="text-muted">Address</dt>
              <dd className="whitespace-pre-wrap text-ink">{order.address}</dd>
            </div>
            {order.notes && (
              <div>
                <dt className="text-muted">Notes</dt>
                <dd className="whitespace-pre-wrap text-ink">{order.notes}</dd>
              </div>
            )}
          </dl>
        </section>

        <section className="rounded-xl border border-line bg-surface p-5">
          <h2 className="text-sm font-semibold uppercase tracking-wide text-muted">
            Summary
          </h2>
          <dl className="mt-3 space-y-2 text-sm">
            <div className="flex justify-between gap-4">
              <dt className="text-muted">Payment</dt>
              <dd className="text-ink">Cash on Delivery</dd>
            </div>
            <div className="flex justify-between gap-4">
              <dt className="text-muted">Items</dt>
              <dd className="text-ink">
                {items.reduce((n, i) => n + Number(i.quantity), 0)}
              </dd>
            </div>
            <div className="flex justify-between gap-4 border-t border-line pt-2">
              <dt className="font-semibold text-ink">Total</dt>
              <dd className="font-display text-2xl text-accent">
                {formatPrice(Number(order.subtotal))}
              </dd>
            </div>
          </dl>
        </section>
      </div>

      <section className="mt-8">
        <h2 className="font-display text-2xl text-ink">Line items</h2>
        <ul className="mt-4 divide-y divide-line rounded-xl border border-line bg-surface">
          {items.map((item, idx) => {
            const variant = [item.size, item.color, item.material]
              .filter(Boolean)
              .join(" · ");
            return (
              <li
                key={`${item.productId}-${idx}`}
                className="flex flex-wrap items-center gap-4 px-4 py-4"
              >
                {/* eslint-disable-next-line @next/next/no-img-element */}
                <img
                  src={item.image || ""}
                  alt=""
                  className="h-14 w-14 rounded object-cover bg-paper-deep"
                />
                <div className="min-w-0 flex-1">
                  <p className="font-medium text-ink">{item.title}</p>
                  <p className="text-xs text-muted">
                    {item.sku}
                    {variant ? ` · ${variant}` : ""}
                  </p>
                </div>
                <div className="text-right text-sm">
                  <p className="text-ink">
                    ×{item.quantity} · {formatPrice(Number(item.price))}
                  </p>
                  <p className="font-semibold text-accent">
                    {formatPrice(Number(item.price) * Number(item.quantity))}
                  </p>
                </div>
              </li>
            );
          })}
        </ul>
      </section>
    </div>
  );
}
