import type { Metadata } from "next";
import { CheckoutForm } from "@/components/CheckoutForm";

export const metadata: Metadata = {
  title: "Checkout",
};

export default function CheckoutPage() {
  return (
    <div className="mx-auto grid max-w-5xl gap-10 px-4 py-10 sm:px-6 md:grid-cols-5 md:px-8 md:py-14">
      <div className="md:col-span-3">
        <h1 className="font-display text-4xl text-accent">Checkout</h1>
        <p className="mt-2 text-sm text-ink-soft">
          Complete your details — we will confirm via phone or WhatsApp.
        </p>
        <div className="mt-8">
          <CheckoutForm />
        </div>
      </div>
      <aside className="md:col-span-2">
        <div className="rounded-xl border border-line bg-surface p-6">
          <h2 className="font-display text-xl text-accent">Secure checkout</h2>
          <ul className="mt-4 space-y-2 text-sm text-ink-soft">
            <li>Cash on delivery across Pakistan</li>
            <li>Wholesale orders via separate inquiry</li>
            <li>Questions? Use the WhatsApp button</li>
          </ul>
        </div>
      </aside>
    </div>
  );
}
