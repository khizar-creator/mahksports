import type { Metadata } from "next";
import Link from "next/link";
import { site } from "@/lib/site";

export const metadata: Metadata = {
  title: "Privacy Policy",
  description: `Privacy policy for ${site.name}.`,
};

export default function PrivacyPage() {
  return (
    <div className="mx-auto max-w-3xl px-4 py-10 sm:px-6 md:px-8 md:py-16">
      <p className="text-[0.7rem] font-semibold uppercase tracking-[0.24em] text-accent">
        Legal
      </p>
      <h1 className="font-display mt-2 text-4xl text-ink md:text-5xl">
        Privacy Policy
      </h1>
      <p className="mt-3 text-sm text-muted">
        Last updated: {new Date().toLocaleDateString("en-GB")}
      </p>

      <div className="mt-10 space-y-8 text-base leading-relaxed text-ink-soft">
        <section>
          <h2 className="font-display text-2xl text-ink">Who we are</h2>
          <p className="mt-3">
            {site.name} (“we”, “us”) operates this storefront for combat sports
            gear, activewear, and wholesale inquiries. Contact:{" "}
            <a href={`mailto:${site.email}`} className="text-accent hover:underline">
              {site.email}
            </a>{" "}
            · {site.phone}.
          </p>
        </section>

        <section>
          <h2 className="font-display text-2xl text-ink">
            Information we collect
          </h2>
          <p className="mt-3">
            When you place an order, submit a wholesale inquiry, or contact us,
            we may collect your name, phone number, email, delivery address,
            city, order notes, and business details you provide.
          </p>
        </section>

        <section>
          <h2 className="font-display text-2xl text-ink">How we use data</h2>
          <ul className="mt-3 list-disc space-y-2 pl-5">
            <li>Process and fulfill Cash on Delivery orders</li>
            <li>Respond to wholesale and product inquiries</li>
            <li>Improve our catalogue and customer support</li>
            <li>Send order-related updates when needed</li>
          </ul>
        </section>

        <section>
          <h2 className="font-display text-2xl text-ink">Sharing</h2>
          <p className="mt-3">
            We do not sell your personal information. We may share order details
            with logistics partners solely to deliver your purchase, and with
            service providers that host this website or email notifications.
          </p>
        </section>

        <section>
          <h2 className="font-display text-2xl text-ink">Cookies & analytics</h2>
          <p className="mt-3">
            The site may use essential cookies for cart and session features.
            Optional analytics, if enabled, help us understand traffic in
            aggregate.
          </p>
        </section>

        <section>
          <h2 className="font-display text-2xl text-ink">Your choices</h2>
          <p className="mt-3">
            Email us to request access, correction, or deletion of personal data
            we hold about you, subject to legal retention needs for completed
            orders.
          </p>
        </section>

        <section>
          <h2 className="font-display text-2xl text-ink">Contact</h2>
          <p className="mt-3">
            Privacy questions:{" "}
            <a href={`mailto:${site.email}`} className="text-accent hover:underline">
              {site.email}
            </a>
            . Related:{" "}
            <Link href="/terms" className="text-accent hover:underline">
              Terms & Conditions
            </Link>
            {" · "}
            <Link href="/returns" className="text-accent hover:underline">
              Return Policy
            </Link>
            .
          </p>
        </section>
      </div>
    </div>
  );
}
