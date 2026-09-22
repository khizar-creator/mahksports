"use client";

import { useRouter } from "next/navigation";
import { useState } from "react";
import { useCart } from "@/components/CartProvider";
import { formatPrice } from "@/lib/site";
import type { OrderResult } from "@/lib/cart-types";

export function CheckoutForm() {
  const router = useRouter();
  const { items, subtotal, clear, ready } = useCart();
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  async function onSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    setError(null);
    setLoading(true);

    const form = new FormData(e.currentTarget);
    const payload = {
      customerName: String(form.get("customerName") ?? ""),
      phone: String(form.get("phone") ?? ""),
      email: String(form.get("email") ?? ""),
      address: String(form.get("address") ?? ""),
      city: String(form.get("city") ?? ""),
      notes: String(form.get("notes") ?? ""),
      paymentMethod: "cod" as const,
      items,
    };

    try {
      const res = await fetch("/api/orders", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(payload),
      });
      const data = (await res.json()) as OrderResult;
      if (!data.ok) {
        setError(data.error ?? "Order failed.");
        return;
      }
      clear();
      router.push(`/order/success?order=${encodeURIComponent(data.orderNumber ?? "")}`);
    } catch {
      setError("Network error. Please try again or WhatsApp us.");
    } finally {
      setLoading(false);
    }
  }

  if (!ready) {
    return <p className="text-muted">Loading…</p>;
  }

  if (items.length === 0) {
    return (
      <p className="text-ink-soft">
        Your cart is empty.{" "}
        <a href="/products" className="text-accent underline">
          Continue shopping
        </a>
      </p>
    );
  }

  return (
    <form onSubmit={onSubmit} className="space-y-5">
      {error && (
        <p className="rounded-lg border border-danger/50 bg-danger/10 px-4 py-3 text-sm text-danger">
          {error}
        </p>
      )}
      <div className="grid gap-4 sm:grid-cols-2">
        <label className="block text-sm">
          <span className="text-muted">Full name *</span>
          <input
            name="customerName"
            required
            className="mt-1 w-full rounded-lg border border-line bg-white px-3 py-2 text-ink"
          />
        </label>
        <label className="block text-sm">
          <span className="text-muted">Phone *</span>
          <input
            name="phone"
            type="tel"
            required
            className="mt-1 w-full rounded-lg border border-line bg-white px-3 py-2 text-ink"
          />
        </label>
      </div>
      <label className="block text-sm">
        <span className="text-muted">Email</span>
        <input
          name="email"
          type="email"
          className="mt-1 w-full rounded-lg border border-line bg-white px-3 py-2 text-ink"
        />
      </label>
      <div className="grid gap-4 sm:grid-cols-2">
        <label className="block text-sm">
          <span className="text-muted">City *</span>
          <input
            name="city"
            required
            className="mt-1 w-full rounded-lg border border-line bg-white px-3 py-2 text-ink"
          />
        </label>
        <label className="block text-sm sm:col-span-2">
          <span className="text-muted">Delivery address *</span>
          <textarea
            name="address"
            required
            rows={3}
            className="mt-1 w-full rounded-lg border border-line bg-white px-3 py-2 text-ink"
          />
        </label>
      </div>
      <label className="block text-sm">
        <span className="text-muted">Order notes</span>
        <textarea
          name="notes"
          rows={2}
          className="mt-1 w-full rounded-lg border border-line bg-white px-3 py-2 text-ink"
        />
      </label>
      <p className="text-sm text-ink-soft">
        Payment: <strong >Cash on Delivery</strong> · Total{" "}
        <span className="text-accent">{formatPrice(subtotal)}</span>
      </p>
      <button
        type="submit"
        disabled={loading}
        className="w-full rounded-lg bg-accent py-3 text-sm font-bold uppercase text-void hover:bg-accent-dim disabled:opacity-50"
      >
        {loading ? "Placing order…" : "Place order"}
      </button>
    </form>
  );
}
