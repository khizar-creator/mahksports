import type { Metadata } from "next";
import Link from "next/link";
import { MapPin } from "lucide-react";
import { FadeIn } from "@/components/Motion";
import { sportImages } from "@/lib/sport-images";
import { site, waHref } from "@/lib/site";

export const metadata: Metadata = {
  title: "About",
  description: `Heritage, quality, and global dispatch — ${site.name}.`,
};

const pillars = [
  {
    num: "01",
    title: "Heritage & craft",
    body: "Rooted in Pakistan's manufacturing corridor, where textile mastery meets combat sports demand. Traditional stitching, modern materials, and finishes proven in MMA, boxing, and grappling rooms.",
    image: sportImages.catMma,
  },
  {
    num: "02",
    title: "Quality control",
    body: "Every batch is checked for fit, foam density, seam strength, and color consistency. Retail fighters get the same spec as our wholesale partners — no stripped-down export seconds.",
    image: sportImages.gymFloor,
  },
  {
    num: "03",
    title: "Custom manufacturing",
    body: "Gym logos on gloves, full colorways for fight teams, OEM runs with design assistance and sampling. Built for coaches, distributors, and promotions that need gear that wears their name.",
    image: sportImages.catApparel,
  },
  {
    num: "04",
    title: "Global dispatch",
    body: "We ship across Pakistan and coordinate international freight for wholesale accounts. Clear lead times, export-ready packing, and a team you can reach on WhatsApp when the order matters.",
    image: sportImages.catTraining,
  },
] as const;

export default function AboutPage() {
  return (
    <div>
      {/* Hero — one composition: brand, headline, line, CTAs, full-bleed image */}
      <section className="relative min-h-[70vh] overflow-hidden bg-header md:min-h-[78vh]">
        {/* eslint-disable-next-line @next/next/no-img-element */}
        <img
          src={sportImages.hero2}
          alt=""
          className="hero-kenburns absolute inset-0 h-full w-full object-cover opacity-55"
        />
        <div className="absolute inset-0 bg-gradient-to-t from-header via-header/70 to-header/40" />
        <div className="relative mx-auto flex min-h-[70vh] max-w-7xl flex-col justify-end px-4 pb-14 pt-28 sm:px-6 md:min-h-[78vh] md:px-8 md:pb-20">
          <FadeIn>
            <p
              className="font-display text-4xl tracking-[0.2em] sm:text-5xl md:text-6xl"
              style={{ color: "#ffffff" }}
            >
              MAHK<span className="text-accent">SPORTS</span>
            </p>
            <h1
              className="font-display mt-5 max-w-3xl text-4xl leading-none sm:text-5xl md:text-7xl"
              style={{ color: "#ffffff" }}
            >
              Built for fighters who refuse compromise
            </h1>
            <p className="mt-5 max-w-xl text-base leading-relaxed text-white/75 sm:text-lg">
              Premium combat sports gear, performance layers, and custom apparel —
              designed for real training loads, not just the shelf.
            </p>
            <div className="mt-8 flex flex-wrap gap-3">
              <Link
                href="/products"
                style={{ color: "#ffffff" }}
                className="clip-cta bg-accent px-7 py-3.5 text-[0.7rem] font-bold tracking-[0.16em] uppercase hover:bg-accent-dark"
              >
                Shop gear
              </Link>
              <Link
                href="/wholesale"
                style={{ color: "#ffffff" }}
                className="clip-cta border border-white/35 bg-transparent px-7 py-3.5 text-[0.7rem] font-bold tracking-[0.16em] uppercase hover:border-white hover:bg-white/10"
              >
                Wholesale
              </Link>
            </div>
          </FadeIn>
        </div>
      </section>

      {/* Story */}
      <section className="mx-auto max-w-7xl px-4 py-16 sm:px-6 md:px-8 md:py-24">
        <div className="grid items-center gap-10 md:grid-cols-12 md:gap-14">
          <FadeIn className="md:col-span-5">
            <p className="text-[0.7rem] font-semibold uppercase tracking-[0.24em] text-accent">
              Our story
            </p>
            <h2 className="font-display mt-3 text-4xl text-ink md:text-5xl">
              From the floor to the factory
            </h2>
          </FadeIn>
          <FadeIn delay={0.08} className="md:col-span-7">
            <p className="text-lg leading-relaxed text-ink-soft">
              MAHKSPORTS was built for fighters, coaches, and gym owners who
              refuse to settle for gear that fails mid-session. From leather
              gloves to performance layers, every piece is designed for
              durability under real sparring, pad work, and competition pressure.
            </p>
            <p className="mt-5 leading-relaxed text-ink-soft">
              We combine hands-on manufacturing knowledge with a storefront that
              serves athletes and wholesale partners the same way — honest specs,
              consistent quality, and dispatch you can plan around.
            </p>
          </FadeIn>
        </div>
      </section>

      {/* Pillars — alternating image / copy */}
      <section className="bg-white">
        {pillars.map((pillar, i) => {
          const reverse = i % 2 === 1;
          return (
            <div
              key={pillar.num}
              className={`border-t border-line ${i === pillars.length - 1 ? "border-b" : ""}`}
            >
              <div className="mx-auto grid max-w-7xl md:grid-cols-2">
                <div
                  className={`relative min-h-[260px] overflow-hidden md:min-h-[380px] ${
                    reverse ? "md:order-2" : ""
                  }`}
                >
                  {/* eslint-disable-next-line @next/next/no-img-element */}
                  <img
                    src={pillar.image}
                    alt=""
                    className="absolute inset-0 h-full w-full object-cover transition duration-700 hover:scale-105"
                  />
                </div>
                <div
                  className={`flex flex-col justify-center px-4 py-12 sm:px-8 md:px-12 md:py-16 ${
                    reverse ? "md:order-1" : ""
                  }`}
                >
                  <FadeIn>
                    <p className="text-[0.7rem] font-semibold uppercase tracking-[0.28em] text-accent">
                      {pillar.num}
                    </p>
                    <h2 className="font-display mt-3 text-3xl text-ink md:text-4xl">
                      {pillar.title}
                    </h2>
                    <p className="mt-4 max-w-md text-base leading-relaxed text-ink-soft">
                      {pillar.body}
                    </p>
                  </FadeIn>
                </div>
              </div>
            </div>
          );
        })}
      </section>

      {/* Promise strip */}
      <section className="bg-paper-deep">
        <div className="mx-auto max-w-7xl px-4 py-14 sm:px-6 md:px-8 md:py-20">
          <FadeIn>
            <p className="text-[0.7rem] font-semibold uppercase tracking-[0.24em] text-accent">
              What we stand for
            </p>
            <h2 className="font-display mt-3 max-w-2xl text-4xl text-ink md:text-5xl">
              Same standard for every order
            </h2>
          </FadeIn>
          <div className="mt-10 grid gap-8 sm:grid-cols-3">
            {[
              {
                title: "Fight-ready materials",
                body: "Foams, leathers, and fabrics chosen for impact, grip, and wash cycles — not just first impressions.",
              },
              {
                title: "Transparent wholesale",
                body: "Clear MOQs, sampling paths, and branding options so gyms and distributors can scale without surprises.",
              },
              {
                title: "Direct support",
                body: `Reach us at ${site.email}, ${site.phones.map((p) => p.display).join(" / ")}, or WhatsApp for product questions and freight quotes.`,
              },
            ].map((item, i) => (
              <FadeIn key={item.title} delay={0.05 * i}>
                <h3 className="font-display text-2xl text-ink">{item.title}</h3>
                <p className="mt-3 text-sm leading-relaxed text-ink-soft">
                  {item.body}
                </p>
              </FadeIn>
            ))}
          </div>
        </div>
      </section>

      {/* Locations & contact */}
      <section className="border-t border-line bg-white">
        <div className="mx-auto max-w-7xl px-4 py-14 sm:px-6 md:px-8 md:py-20">
          <FadeIn>
            <p className="text-[0.7rem] font-semibold uppercase tracking-[0.24em] text-accent">
              Visit & contact
            </p>
            <h2 className="font-display mt-3 text-4xl text-ink md:text-5xl">
              Our locations
            </h2>
            <p className="mt-3 max-w-xl text-ink-soft">
              Manufacturing in Sialkot, Pakistan and our Europe office in Ireland —
              reach us by email, phone, or WhatsApp.
            </p>
          </FadeIn>

          <div className="mt-10 grid gap-8 md:grid-cols-2">
            {site.locations.map((loc, i) => (
              <FadeIn key={loc.id} delay={0.05 * i}>
                <div className="overflow-hidden border border-line bg-paper">
                  <div className="flex items-start gap-3 p-5">
                    <span className="inline-flex h-10 w-10 shrink-0 items-center justify-center border border-accent/30 bg-accent/10 text-accent">
                      <MapPin className="h-5 w-5" strokeWidth={2.25} />
                    </span>
                    <div>
                      <p className="text-[0.65rem] font-semibold uppercase tracking-[0.2em] text-accent">
                        {loc.label}
                      </p>
                      <p className="mt-1 font-display text-2xl text-ink">
                        {loc.line1}
                      </p>
                      <p className="text-sm text-ink-soft">{loc.line2}</p>
                    </div>
                  </div>
                  <a
                    href={loc.mapsUrl}
                    target="_blank"
                    rel="noreferrer"
                    className="block border-t border-line"
                    aria-label={`Open map of ${loc.full}`}
                  >
                    <iframe
                      title={`${site.name} — ${loc.label}`}
                      src={loc.mapsEmbedUrl}
                      className="pointer-events-none h-48 w-full border-0"
                      loading="lazy"
                      referrerPolicy="no-referrer-when-downgrade"
                      allowFullScreen
                    />
                  </a>
                </div>
              </FadeIn>
            ))}
          </div>

          <FadeIn delay={0.12}>
            <div className="mt-10 flex flex-wrap items-center gap-3">
              <a
                href={`mailto:${site.email}`}
                className="inline-flex items-center gap-2 bg-accent px-5 py-3 text-sm font-bold uppercase tracking-wide text-white hover:bg-accent-dark"
              >
                Email us · {site.email}
              </a>
              {site.phones.map((p) => (
                <a
                  key={p.e164}
                  href={`tel:${p.e164}`}
                  className="inline-flex items-center gap-2 border border-line bg-white px-5 py-3 text-sm font-semibold text-ink hover:border-accent hover:text-accent"
                >
                  {p.label}: {p.display}
                </a>
              ))}
              <a
                href={waHref()}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-2 border border-line bg-white px-5 py-3 text-sm font-semibold text-ink hover:border-accent hover:text-accent"
              >
                WhatsApp
              </a>
            </div>
          </FadeIn>
        </div>
      </section>

      {/* CTA */}
      <section className="relative overflow-hidden bg-header py-16 md:py-24">
        <div
          className="absolute -right-16 top-0 h-full w-1/2 bg-accent/25"
          style={{ clipPath: "polygon(28% 0, 100% 0, 100% 100%, 0 100%)" }}
        />
        <div className="relative mx-auto flex max-w-7xl flex-col items-start gap-6 px-4 sm:px-6 md:flex-row md:items-center md:justify-between md:px-8">
          <FadeIn>
            <h2
              className="font-display text-4xl md:text-5xl"
              style={{ color: "#ffffff" }}
            >
              Ready to train — or to brand your team?
            </h2>
            <p className="mt-3 max-w-lg text-white/70">
              Shop the catalog, or start a wholesale inquiry for custom logos,
              samples, and volume pricing.
            </p>
          </FadeIn>
          <div className="flex flex-wrap gap-3">
            <Link
              href="/wholesale"
              style={{ color: "#ffffff" }}
              className="clip-cta bg-accent px-8 py-3.5 text-[0.72rem] font-bold tracking-[0.18em] uppercase hover:bg-accent-dark"
            >
              Start inquiry
            </Link>
            <a
              href={waHref()}
              target="_blank"
              rel="noopener noreferrer"
              style={{ color: "#ffffff" }}
              className="clip-cta border border-white/35 px-8 py-3.5 text-[0.72rem] font-bold tracking-[0.18em] uppercase hover:bg-white/10"
            >
              WhatsApp
            </a>
          </div>
        </div>
      </section>
    </div>
  );
}
