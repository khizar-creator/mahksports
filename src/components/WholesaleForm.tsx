"use client";

import { useState } from "react";

export function WholesaleForm() {
  const [loading, setLoading] = useState(false);
  const [message, setMessage] = useState<{ type: "ok" | "err"; text: string } | null>(
    null,
  );

  async function onSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    setMessage(null);
    setLoading(true);

    const form = new FormData(e.currentTarget);
    const payload = {
      businessName: String(form.get("businessName") ?? ""),
      email: String(form.get("email") ?? ""),
      phone: String(form.get("phone") ?? ""),
      categoryItem: String(form.get("categoryItem") ?? ""),
      quantity: String(form.get("quantity") ?? ""),
      brandingSpecs: String(form.get("brandingSpecs") ?? ""),
      deliveryNotes: String(form.get("deliveryNotes") ?? ""),
    };

    try {
      const res = await fetch("/api/wholesale", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(payload),
      });
      const data = (await res.json()) as { ok: boolean; error?: string };
      if (!data.ok) {
        setMessage({ type: "err", text: data.error ?? "Submission failed." });
        return;
      }
      setMessage({
        type: "ok",
        text: "Inquiry sent. Our team will reply within 1–2 business days.",
      });
      e.currentTarget.reset();
    } catch {
      setMessage({ type: "err", text: "Network error. Please try again." });
    } finally {
      setLoading(false);
    }
  }

  return (
    <form onSubmit={onSubmit} className="space-y-5">
      {message && (
        <p
          className={`rounded-lg px-4 py-3 text-sm ${
            message.type === "ok"
              ? "border border-accent/40 bg-accent/10 text-accent"
              : "border border-danger/50 bg-danger/10 text-danger"
          }`}
        >
          {message.text}
        </p>
      )}
      <label className="block text-sm">
        <span className="text-muted">Business name *</span>
        <input
          name="businessName"
          required
          className="mt-1 w-full rounded-lg border border-line bg-white px-3 py-2 text-ink"
        />
      </label>
      <div className="grid gap-4 sm:grid-cols-2">
        <label className="block text-sm">
          <span className="text-muted">Email *</span>
          <input
            name="email"
            type="email"
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
        <span className="text-muted">Category / item *</span>
        <input
          name="categoryItem"
          required
          placeholder="e.g. Custom MMA gloves, 500 pairs"
          className="mt-1 w-full rounded-lg border border-line bg-white px-3 py-2 text-ink"
        />
      </label>
      <label className="block text-sm">
        <span className="text-muted">Quantity *</span>
        <input
          name="quantity"
          required
          placeholder="MOQ, sizes, colorways"
          className="mt-1 w-full rounded-lg border border-line bg-white px-3 py-2 text-ink"
        />
      </label>
      <label className="block text-sm">
        <span className="text-muted">Branding / specs *</span>
        <textarea
          name="brandingSpecs"
          required
          rows={4}
          placeholder="Logo placement, materials, packaging…"
          className="mt-1 w-full rounded-lg border border-line bg-white px-3 py-2 text-ink"
        />
      </label>
      <label className="block text-sm">
        <span className="text-muted">Delivery notes</span>
        <textarea
          name="deliveryNotes"
          rows={3}
          className="mt-1 w-full rounded-lg border border-line bg-white px-3 py-2 text-ink"
        />
      </label>
      <button
        type="submit"
        disabled={loading}
        className="w-full rounded-lg bg-accent py-3 text-sm font-bold uppercase text-void hover:bg-accent-dim disabled:opacity-50"
      >
        {loading ? "Sending…" : "Submit wholesale inquiry"}
      </button>
    </form>
  );
}
