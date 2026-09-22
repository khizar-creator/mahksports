import type { Metadata } from "next";
import Link from "next/link";
import { site, waHref } from "@/lib/site";

export const metadata: Metadata = {
  title: "Return Policy",
  description: `Returns and exchanges for ${site.name} orders.`,
};

export default function ReturnsPage() {
  return (
    <div className="mx-auto max-w-3xl px-4 py-10 sm:px-6 md:px-8 md:py-16">
      <p className="text-[0.7rem] font-semibold uppercase tracking-[0.24em] text-accent">
        Legal
      </p>
      <h1 className="font-display mt-2 text-4xl text-ink md:text-5xl">
        Return Policy
      </h1>
      <p className="mt-3 text-sm text-muted">
        Last updated: {new Date().toLocaleDateString("en-GB")}
      </p>

      <div className="mt-10 space-y-8 text-base leading-relaxed text-ink-soft">
        <section>
          <h2 className="font-display text-2xl text-ink">Overview</h2>
          <p className="mt-3">
            We want you to receive gear that matches what you ordered. If
            something arrives damaged, incorrect, or with a manufacturing
            fault, contact us promptly so we can help with a return, exchange,
            or replacement.
          </p>
        </section>

        <section>
          <h2 className="font-display text-2xl text-ink">
            Eligible returns
          </h2>
          <ul className="mt-3 list-disc space-y-2 pl-5">
            <li>Wrong item or size shipped compared to your order</li>
            <li>Manufacturing defects found on first use</li>
            <li>Items damaged in transit (report with photos if possible)</li>
          </ul>
        </section>

        <section>
          <h2 className="font-display text-2xl text-ink">
            Non-returnable items
          </h2>
          <ul className="mt-3 list-disc space-y-2 pl-5">
            <li>Items used extensively in training or competition</li>
            <li>Custom-branded / OEM wholesale runs after production starts</li>
            <li>Products without original tags/packaging when required</li>
            <li>Change-of-mind returns after the window below (unless we agree)</li>
          </ul>
        </section>

        <section>
          <h2 className="font-display text-2xl text-ink">Timeframe</h2>
          <p className="mt-3">
            Please contact us within <strong className="text-ink">7 days</strong>{" "}
            of delivery for standard retail issues. Wholesale/custom timelines
            are agreed case by case in your quote.
          </p>
        </section>

        <section>
          <h2 className="font-display text-2xl text-ink">How to request</h2>
          <ol className="mt-3 list-decimal space-y-2 pl-5">
            <li>
              Message us on{" "}
              <a
                href={waHref(
                  `Hi ${site.name} — I need help with a return/exchange.`,
                )}
                target="_blank"
                rel="noreferrer"
                className="text-accent hover:underline"
              >
                WhatsApp
              </a>{" "}
              or email{" "}
              <a href={`mailto:${site.email}`} className="text-accent hover:underline">
                {site.email}
              </a>
              .
            </li>
            <li>Share your order number, issue, and clear photos if relevant.</li>
            <li>
              We confirm whether a return, exchange, or store credit applies and
              share next steps.
            </li>
          </ol>
        </section>

        <section>
          <h2 className="font-display text-2xl text-ink">Refunds</h2>
          <p className="mt-3">
            Approved refunds for COD orders are arranged after we receive and
            inspect the returned item. Timing depends on courier and payment
            method agreed with you.
          </p>
        </section>

        <section>
          <h2 className="font-display text-2xl text-ink">Related</h2>
          <p className="mt-3">
            See also{" "}
            <Link href="/terms" className="text-accent hover:underline">
              Terms & Conditions
            </Link>{" "}
            and{" "}
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
