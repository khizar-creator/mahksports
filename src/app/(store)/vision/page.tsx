import type { Metadata } from "next";
import Link from "next/link";
import { FadeIn } from "@/components/Motion";
import { site, waHref } from "@/lib/site";

export const metadata: Metadata = {
  title: "Our Vision",
  description: `Vision and commitment of ${site.name} — manufacturing in Pakistan, European presence in Ireland.`,
};

const commitments = [
  {
    title: "Manufacturing excellence",
    body: "Continuous investment in production capability, product development, and quality management at our Sialkot base.",
  },
  {
    title: "European presence",
    body: "A dedicated Ireland operation that keeps us close to gyms, clubs, retailers, and sports businesses across Europe.",
  },
  {
    title: "Complete partnership",
    body: "From product development and customization through manufacturing, quality control, and international supply — one clear relationship.",
  },
] as const;

const foundations = [
  {
    title: "Manufacturing capability",
    body: "Established production infrastructure in Sialkot with multiple in-house processes — sublimation, embroidery, stitching, hosiery, and combat sportswear.",
  },
  {
    title: "Customization",
    body: "Products developed to individual specifications: design, branding, materials, colors, sizing, and production requirements.",
  },
  {
    title: "International experience",
    body: "Export operations since 2015, with proven experience serving international customers and managing export requirements.",
  },
  {
    title: "European presence",
    body: "MAHK Sports Ltd in Ireland provides a local point of contact for European customers and face-to-face meetings.",
  },
] as const;

export default function VisionPage() {
  return (
    <div>
      <section className="relative overflow-hidden bg-header py-16 md:py-24">
        <div
          className="absolute -right-20 top-0 h-full w-1/2 bg-accent/20"
          style={{ clipPath: "polygon(28% 0, 100% 0, 100% 100%, 0 100%)" }}
        />
        <div className="relative mx-auto max-w-7xl px-4 sm:px-6 md:px-8">
          <FadeIn>
            <p className="text-[0.7rem] font-semibold uppercase tracking-[0.24em] text-accent">
              Mudies Enterprises &amp; MAHK Sports Ltd
            </p>
            <h1
              className="font-display mt-3 max-w-3xl text-5xl leading-none md:text-7xl"
              style={{ color: "#ffffff" }}
            >
              Our Vision
            </h1>
            <p className="mt-5 max-w-2xl text-base leading-relaxed text-white/75 md:text-lg">
              Manufacturing excellence in Pakistan. European business presence
              in Ireland. International sportswear solutions.
            </p>
          </FadeIn>
        </div>
      </section>

      <section className="mx-auto max-w-7xl px-4 py-14 sm:px-6 md:px-8 md:py-20">
        <div className="grid gap-10 md:grid-cols-12 md:gap-14">
          <FadeIn className="md:col-span-5">
            <p className="text-[0.7rem] font-semibold uppercase tracking-[0.24em] text-accent">
              Long-term direction
            </p>
            <h2 className="font-display mt-3 text-4xl text-ink md:text-5xl">
              Building MAHK Sports in Europe
            </h2>
          </FadeIn>
          <FadeIn delay={0.08} className="md:col-span-7">
            <p className="text-lg leading-relaxed text-ink-soft">
              Our long-term vision is to establish MAHK Sports as a recognized
              sportswear and combat sportswear brand in the European market
              while continuing to strengthen our manufacturing and export
              capabilities in Pakistan.
            </p>
            <p className="mt-5 leading-relaxed text-ink-soft">
              We aim to build sustainable, long-term relationships with gyms,
              sports clubs, retailers, distributors and sports businesses by
              combining manufacturing expertise with responsive European
              customer support.
            </p>
          </FadeIn>
        </div>
      </section>

      <section className="bg-white">
        <div className="mx-auto max-w-7xl px-4 py-14 sm:px-6 md:px-8 md:py-20">
          <FadeIn>
            <p className="text-[0.7rem] font-semibold uppercase tracking-[0.24em] text-accent">
              Our commitment
            </p>
            <h2 className="font-display mt-3 max-w-2xl text-4xl text-ink md:text-5xl">
              How we grow the business
            </h2>
            <p className="mt-4 max-w-2xl leading-relaxed text-ink-soft">
              We are committed to developing our business through continuous
              investment in manufacturing capability, product development,
              quality management, customer service and international market
              expansion.
            </p>
          </FadeIn>
          <div className="mt-10 grid gap-8 md:grid-cols-3">
            {commitments.map((item, i) => (
              <FadeIn key={item.title} delay={0.05 * i}>
                <p className="text-[0.65rem] font-semibold uppercase tracking-[0.2em] text-accent">
                  {String(i + 1).padStart(2, "0")}
                </p>
                <h3 className="font-display mt-2 text-2xl text-ink">
                  {item.title}
                </h3>
                <p className="mt-3 text-sm leading-relaxed text-ink-soft">
                  {item.body}
                </p>
              </FadeIn>
            ))}
          </div>
          <FadeIn delay={0.15}>
            <p className="mt-10 max-w-3xl leading-relaxed text-ink-soft">
              Our Pakistan operation provides the manufacturing foundation of
              the business, while our Ireland operation provides a direct
              connection to the European market. Together, these operations
              enable us to offer customers a complete business relationship —
              from product development and customization through manufacturing,
              quality control and international supply.
            </p>
          </FadeIn>
        </div>
      </section>

      <section className="bg-paper-deep">
        <div className="mx-auto max-w-7xl px-4 py-14 sm:px-6 md:px-8 md:py-20">
          <FadeIn>
            <p className="text-[0.7rem] font-semibold uppercase tracking-[0.24em] text-accent">
              Competitive foundation
            </p>
            <h2 className="font-display mt-3 text-4xl text-ink md:text-5xl">
              What we stand on
            </h2>
          </FadeIn>
          <div className="mt-10 grid gap-6 sm:grid-cols-2">
            {foundations.map((item, i) => (
              <FadeIn key={item.title} delay={0.04 * i}>
                <div className="border border-line bg-white p-6">
                  <h3 className="font-display text-2xl text-ink">{item.title}</h3>
                  <p className="mt-3 text-sm leading-relaxed text-ink-soft">
                    {item.body}
                  </p>
                </div>
              </FadeIn>
            ))}
          </div>
        </div>
      </section>

      <section className="mx-auto max-w-7xl px-4 py-14 sm:px-6 md:px-8 md:py-16">
        <FadeIn>
          <p className="text-[0.7rem] font-semibold uppercase tracking-[0.24em] text-accent">
            At a glance
          </p>
          <h2 className="font-display mt-3 text-4xl text-ink">
            Our business
          </h2>
        </FadeIn>
        <dl className="mt-8 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
          {[
            ["Established", "2015"],
            ["Manufacturing base", "Sialkot, Pakistan"],
            ["European presence", "Ireland (2018)"],
            ["MAHK Sports Ltd", "Incorporated Ireland, 2023"],
            ["Brand focus", "European development 2026"],
            ["Core markets", "Ireland & Europe"],
            ["Core sectors", "Sportswear · Teamwear · Combat"],
            ["Structure", "Pakistan manufacture · Ireland sales"],
          ].map(([label, value], i) => (
            <FadeIn key={label} delay={0.03 * i}>
              <dt className="text-[0.65rem] font-semibold uppercase tracking-wider text-muted">
                {label}
              </dt>
              <dd className="mt-1 text-sm font-semibold text-ink">{value}</dd>
            </FadeIn>
          ))}
        </dl>
      </section>

      <section className="relative overflow-hidden bg-header py-14 md:py-20">
        <div className="relative mx-auto flex max-w-7xl flex-col items-start gap-6 px-4 sm:px-6 md:flex-row md:items-center md:justify-between md:px-8">
          <FadeIn>
            <h2
              className="font-display text-4xl md:text-5xl"
              style={{ color: "#ffffff" }}
            >
              Partner with MAHKSPORTS
            </h2>
            <p className="mt-3 max-w-lg text-white/70">
              Talk to us about wholesale, custom branding, or European supply.
            </p>
          </FadeIn>
          <div className="flex flex-wrap gap-3">
            <Link
              href="/wholesale"
              style={{ color: "#ffffff" }}
              className="clip-cta bg-accent px-7 py-3.5 text-[0.7rem] font-bold tracking-[0.16em] uppercase hover:bg-accent-dark"
            >
              Wholesale inquiry
            </Link>
            <a
              href={waHref()}
              target="_blank"
              rel="noreferrer"
              style={{ color: "#ffffff" }}
              className="clip-cta border border-white/35 px-7 py-3.5 text-[0.7rem] font-bold tracking-[0.16em] uppercase hover:bg-white/10"
            >
              WhatsApp
            </a>
            <Link
              href="/about"
              style={{ color: "#ffffff" }}
              className="clip-cta border border-white/35 px-7 py-3.5 text-[0.7rem] font-bold tracking-[0.16em] uppercase hover:bg-white/10"
            >
              About us
            </Link>
          </div>
        </div>
      </section>
    </div>
  );
}
