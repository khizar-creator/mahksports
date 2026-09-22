"use client";

import Link from "next/link";
import { ArrowRight, Star } from "lucide-react";
import { FadeIn } from "@/components/Motion";
import { HeroSlider } from "@/components/HeroSlider";
import { ProductGrid } from "@/components/ProductGrid";
import { buildCategoryTree } from "@/lib/categories";
import type { Category, ProductWithCategory } from "@/lib/types";

type HomeSectionsProps = {
  categories: Category[];
  featured: ProductWithCategory[];
  byRoot: { category: Category; products: ProductWithCategory[] }[];
};

const reviews = [
  {
    name: "Williams John",
    text: "Great fit and high quality. Absolutely fantastic gloves for the price.",
    product: "Boxing Gloves",
  },
  {
    name: "Miss P",
    text: "Bought for my son who boxes — well made, comfortable, absorbs contact well.",
    product: "Classic Head Guard",
  },
  {
    name: "James Howard",
    text: "Used at Muay Thai — comfy with plenty of protection. Highly recommended.",
    product: "MMA Gloves",
  },
];

export function HomeSections({
  categories,
  featured,
  byRoot,
}: HomeSectionsProps) {
  const roots = buildCategoryTree(categories);

  return (
    <>
      <HeroSlider />

      {/* Full-width category strip — 4 categories */}
      <section className="bg-white">
        <div className="grid sm:grid-cols-2 lg:grid-cols-4">
          {roots.slice(0, 4).map((cat, i) => (
            <Link
              key={cat.id}
              href={`/products/${cat.slug}`}
              className="group relative min-h-[220px] overflow-hidden border-b border-r border-line sm:min-h-[280px] lg:min-h-[320px]"
            >
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img
                src={cat.image_url ?? ""}
                alt=""
                className="absolute inset-0 h-full w-full object-cover transition duration-700 group-hover:scale-105"
              />
              <div className="absolute inset-0 bg-gradient-to-t from-black/75 via-black/25 to-transparent" />
              <div className="absolute inset-x-0 bottom-0 p-5 md:p-6">
                <p className="text-[0.65rem] tracking-[0.2em] uppercase text-white/70">
                  {String(i + 1).padStart(2, "0")}
                </p>
                <h2
                  className="font-display mt-1 text-2xl text-white md:text-3xl"
                  style={{ color: "#ffffff" }}
                >
                  {cat.name}
                </h2>
                <span className="mt-2 inline-flex items-center gap-1 text-sm font-medium text-accent">
                  Shop now <ArrowRight className="h-4 w-4" />
                </span>
              </div>
            </Link>
          ))}
        </div>
      </section>

      {/* Best sellers */}
      <section className="mx-auto max-w-7xl px-4 py-14 sm:px-6 md:px-8 md:py-20">
        <FadeIn>
          <div className="flex flex-wrap items-end justify-between gap-4">
            <div>
              <p className="text-[0.7rem] font-semibold uppercase tracking-[0.24em] text-accent">
                Best sellers
              </p>
              <h2 className="font-display mt-2 text-4xl text-ink md:text-5xl">
                Most popular gear
              </h2>
            </div>
            <Link
              href="/products"
              className="text-sm font-semibold text-accent hover:underline"
            >
              View all products →
            </Link>
          </div>
        </FadeIn>
        <div className="mt-10">
          <ProductGrid products={featured.slice(0, 8)} />
        </div>
      </section>

      {/* Full-width category product bands (Rewon-style) */}
      {byRoot.map((block, idx) => (
        <section
          key={block.category.id}
          className={idx % 2 === 0 ? "bg-paper-deep" : "bg-white"}
        >
          <div className="relative clip-diagonal overflow-hidden">
            <div className="relative min-h-[240px] md:min-h-[300px]">
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img
                src={block.category.image_url ?? ""}
                alt=""
                className="absolute inset-0 h-full w-full object-cover"
              />
              <div className="absolute inset-0 bg-header/55" />
              <div className="relative mx-auto flex max-w-7xl flex-col justify-end px-4 py-14 sm:px-6 md:px-8 md:py-16">
                <p className="text-[0.7rem] font-semibold uppercase tracking-[0.28em] text-accent">
                  Collection
                </p>
                <h2
                  className="font-display mt-2 text-4xl md:text-6xl"
                  style={{ color: "#ffffff" }}
                >
                  {block.category.name}
                </h2>
                <p className="mt-2 max-w-xl text-sm text-white/80">
                  {block.category.description}
                </p>
                <Link
                  href={`/products/${block.category.slug}`}
                  style={{ color: "#ffffff" }}
                  className="clip-cta mt-6 inline-flex w-fit bg-accent px-6 py-3 text-[0.7rem] font-bold tracking-[0.16em] uppercase hover:bg-accent-dark"
                >
                  Explore collection
                </Link>
              </div>
            </div>
          </div>
          <div className="mx-auto max-w-7xl px-4 py-12 sm:px-6 md:px-8 md:py-14">
            <ProductGrid products={block.products.slice(0, 4)} />
            <div className="mt-8 text-center">
              <Link
                href={`/products/${block.category.slug}`}
                className="inline-flex items-center gap-2 text-sm font-semibold text-ink hover:text-accent"
              >
                See all {block.category.name} <ArrowRight className="h-4 w-4" />
              </Link>
            </div>
          </div>
        </section>
      ))}

      {/* Wholesale CTA with clip */}
      <section className="relative overflow-hidden bg-header py-16 md:py-24">
        <div
          className="absolute -right-20 top-0 h-full w-1/2 bg-accent/20"
          style={{ clipPath: "polygon(25% 0, 100% 0, 100% 100%, 0 100%)" }}
        />
        <div className="relative mx-auto flex max-w-7xl flex-col items-start gap-6 px-4 sm:px-6 md:flex-row md:items-center md:justify-between md:px-8">
          <div>
            <h2
              className="font-display text-4xl md:text-5xl"
              style={{ color: "#ffffff" }}
            >
              Wholesale & custom branding
            </h2>
            <p className="mt-3 max-w-lg text-white/70">
              Gyms, distributors, and fight promotions — volume pricing, logo
              runs, and worldwide dispatch.
            </p>
          </div>
          <Link
            href="/wholesale"
            style={{ color: "#ffffff" }}
            className="clip-cta shrink-0 bg-accent px-8 py-3.5 text-[0.72rem] font-bold tracking-[0.18em] uppercase hover:bg-accent-dark"
          >
            Start inquiry
          </Link>
        </div>
      </section>

      {/* Reviews */}
      <section className="mx-auto max-w-7xl px-4 py-14 sm:px-6 md:px-8 md:py-20">
        <FadeIn>
          <p className="text-[0.7rem] font-semibold uppercase tracking-[0.24em] text-accent">
            Reviews
          </p>
          <h2 className="font-display mt-2 text-4xl text-ink md:text-5xl">
            Let customers speak for us
          </h2>
        </FadeIn>
        <div className="mt-10 grid gap-6 md:grid-cols-3">
          {reviews.map((r) => (
            <blockquote
              key={r.name}
              className="clip-card-corner border border-line bg-white p-6 shadow-sm"
            >
              <div className="flex gap-0.5 text-accent">
                {Array.from({ length: 5 }).map((_, i) => (
                  <Star key={i} className="h-4 w-4 fill-current" />
                ))}
              </div>
              <p className="mt-4 text-sm leading-relaxed text-ink-soft">
                {r.text}
              </p>
              <footer className="mt-4 text-sm font-semibold text-ink">
                {r.name}
                <span className="mt-0.5 block text-xs font-normal text-muted">
                  {r.product}
                </span>
              </footer>
            </blockquote>
          ))}
        </div>
      </section>
    </>
  );
}
