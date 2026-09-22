import type { Metadata } from "next";
import Link from "next/link";
import { site } from "@/lib/site";

export const metadata: Metadata = {
  title: "Terms & Conditions",
  description: `Terms and conditions for shopping at ${site.name}.`,
};

export default function TermsPage() {
  return (
    <div className="mx-auto max-w-3xl px-4 py-10 sm:px-6 md:px-8 md:py-16">
      <p className="text-[0.7rem] font-semibold uppercase tracking-[0.24em] text-accent">
        Legal
      </p>
      <h1 className="font-display mt-2 text-4xl text-ink md:text-5xl">
        Terms & Conditions
      </h1>
      <p className="mt-3 text-sm text-muted">
        Last updated: {new Date().toLocaleDateString("en-GB")}
      </p>

      <div className="mt-10 space-y-8 text-base leading-relaxed text-ink-soft">
        <section>
          <h2 className="font-display text-2xl text-ink">Agreement</h2>
          <p className="mt-3">
            By browsing or placing an order on {site.name}, you agree to these
            Terms & Conditions. If you do not agree, please do not use this
            storefront.
          </p>
        </section>

        <section>
          <h2 className="font-display text-2xl text-ink">Products & pricing</h2>
          <p className="mt-3">
            We aim to show accurate product details, images, and prices. Prices
            are listed in PKR unless stated otherwise and may change without
            notice. Sale prices apply only while marked as on sale. We may
            correct errors or cancel orders placed at an incorrect price.
          </p>
        </section>

        <section>
          <h2 className="font-display text-2xl text-ink">Orders</h2>
          <ul className="mt-3 list-disc space-y-2 pl-5">
            <li>
              Retail checkout currently supports Cash on Delivery (COD) unless
              we confirm another method with you.
            </li>
            <li>
              Submitting an order is an offer to buy; we confirm acceptance by
              phone, WhatsApp, or email.
            </li>
            <li>
              Provide a correct name, phone, city, and delivery address so we
              can fulfill your order.
            </li>
          </ul>
        </section>

        <section>
          <h2 className="font-display text-2xl text-ink">Wholesale</h2>
          <p className="mt-3">
            Wholesale and OEM inquiries are handled separately. Quotes, MOQs,
            samples, and lead times are confirmed in writing after you submit
            the wholesale form or contact us.
          </p>
        </section>

        <section>
          <h2 className="font-display text-2xl text-ink">
            Shipping & delivery
          </h2>
          <p className="mt-3">
            Dispatch times depend on stock and destination. Delays caused by
            couriers, weather, or incorrect address details are outside our
            direct control; we will help resolve them where we can.
          </p>
        </section>

        <section>
          <h2 className="font-display text-2xl text-ink">
            Returns & refunds
          </h2>
          <p className="mt-3">
            Returns are covered by our{" "}
            <Link href="/returns" className="text-accent hover:underline">
              Return Policy
            </Link>
            .
          </p>
        </section>

        <section>
          <h2 className="font-display text-2xl text-ink">Liability</h2>
          <p className="mt-3">
            Combat sports and training carry inherent risk. Use gear as
            intended and follow sport safety guidelines. To the extent allowed
            by law, {site.name} is not liable for indirect or consequential
            loss arising from product use or delivery delays.
          </p>
        </section>

        <section>
          <h2 className="font-display text-2xl text-ink">Contact</h2>
          <p className="mt-3">
            Questions about these terms:{" "}
            <a href={`mailto:${site.email}`} className="text-accent hover:underline">
              {site.email}
            </a>{" "}
            · {site.phone}. Also see our{" "}
            <Link href="/privacy" className="text-accent hover:underline">
              Privacy Policy
            </Link>
            .
          </p>
        </section>
      </div>
    </div>
  );
}
