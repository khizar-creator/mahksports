"use client";

import Image from "next/image";
import Link from "next/link";
import { useCart } from "@/components/CartProvider";
import { formatPrice } from "@/lib/site";

export default function CartPage() {
  const { items, subtotal, setQuantity, removeItem, ready } = useCart();

  if (!ready) {
    return (
      <div className="mx-auto max-w-3xl px-4 py-16 text-center text-muted">
        Loading cart…
      </div>
    );
  }

  if (items.length === 0) {
    return (
      <div className="mx-auto max-w-3xl px-4 py-16 text-center">
        <h1 className="font-display text-4xl text-accent">Your cart</h1>
        <p className="mt-4 text-ink-soft">No items yet.</p>
        <Link
          href="/products"
          className="mt-6 inline-block rounded-lg bg-accent px-6 py-3 text-sm font-bold text-void"
        >
          Shop catalog
        </Link>
      </div>
    );
  }

  return (
    <div className="mx-auto max-w-3xl px-4 py-10 sm:px-6 md:py-14">
      <h1 className="font-display text-4xl text-accent">Your cart</h1>
      <ul className="mt-8 divide-y divide-line">
        {items.map((item) => (
          <li
            key={`${item.productId}-${item.size}-${item.color}`}
            className="flex gap-4 py-6"
          >
            <div className="relative h-24 w-24 shrink-0 overflow-hidden rounded-lg bg-surface">
              <Image src={item.image} alt="" fill className="object-cover" sizes="96px" />
            </div>
            <div className="min-w-0 flex-1">
              <Link
                href={`/product/${item.slug}`}
                className="font-medium hover:text-accent"
                style={{ color: "#ffffff" }}
              >
                {item.title}
              </Link>
              <p className="text-sm text-muted">{item.sku}</p>
              <p className="mt-2 text-accent">{formatPrice(item.price)}</p>
              <div className="mt-3 flex items-center gap-3">
                <input
                  type="number"
                  min={1}
                  value={item.quantity}
                  onChange={(e) =>
                    setQuantity(item.productId, Number(e.target.value) || 1)
                  }
                  className="w-16 rounded border border-line bg-white px-2 py-1 text-center text-sm"
                />
                <button
                  type="button"
                  onClick={() => removeItem(item.productId)}
                  className="text-sm text-muted hover:text-danger"
                >
                  Remove
                </button>
              </div>
            </div>
            <p className="text-sm font-semibold text-ink-soft">
              {formatPrice(item.price * item.quantity)}
            </p>
          </li>
        ))}
      </ul>
      <div className="mt-8 flex items-center justify-between border-t border-line pt-6">
        <span className="text-lg font-semibold" style={{ color: "#ffffff" }}>
          Subtotal
        </span>
        <span className="text-xl font-bold text-accent">{formatPrice(subtotal)}</span>
      </div>
      <Link
        href="/checkout"
        className="mt-6 block w-full rounded-lg bg-accent py-3 text-center text-sm font-bold uppercase text-void hover:bg-accent-dim"
      >
        Proceed to checkout
      </Link>
    </div>
  );
}
