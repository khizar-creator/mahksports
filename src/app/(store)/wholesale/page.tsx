import type { Metadata } from "next";
import { WholesaleForm } from "@/components/WholesaleForm";
import { site } from "@/lib/site";

export const metadata: Metadata = {
  title: "Wholesale Inquiry",
  description: `Bulk orders and custom manufacturing with ${site.name}.`,
};

export default function WholesalePage() {
  return (
    <div className="mx-auto grid max-w-5xl gap-12 px-4 py-10 sm:px-6 md:grid-cols-2 md:px-8 md:py-14">
      <div>
        <h1 className="font-display text-4xl text-accent md:text-5xl">
          Wholesale
        </h1>
        <p className="mt-4 leading-relaxed text-ink-soft">
          Partner with MAHKSPORTS for OEM/ODM combat sports gear, branded
          activewear, and accessories. Share your quantities, specs, and
          delivery timeline — our manufacturing team will respond with pricing
          and lead times.
        </p>
        <ul className="mt-6 space-y-2 text-sm text-ink-soft">
          <li>Custom logos, tags, and packaging</li>
          <li>Sample runs before bulk production</li>
          <li>Export-ready dispatch</li>
        </ul>
        <p className="mt-6 text-sm">
          Prefer chat?{" "}
          <a href={site.whatsappUrl} className="text-accent underline">
            WhatsApp {site.phone}
          </a>
        </p>
      </div>
      <div className="rounded-2xl border border-line bg-surface p-6 md:p-8">
        <WholesaleForm />
      </div>
    </div>
  );
}
