"use client";

import Link from "next/link";
import { AnimatePresence, motion } from "framer-motion";
import { ChevronLeft, ChevronRight } from "lucide-react";
import { useEffect, useState } from "react";
import { sportImages } from "@/lib/sport-images";

const slides = [
  {
    image: sportImages.hero1,
    eyebrow: "Best sellers",
    title: "Boxing gloves built for hard rounds",
    copy: "Leather and synthetic training gloves — retail and wholesale ready.",
    cta: { href: "/products/boxing-mma-gloves", label: "Shop gloves" },
  },
  {
    image: sportImages.hero2,
    eyebrow: "Mix Martial Arts",
    title: "Fight gear for the cage and the gym",
    copy: "MMA gloves, shin guards, and headgear engineered for sparring camps.",
    cta: { href: "/products/mix-martial-arts", label: "Shop MMA" },
  },
  {
    image: sportImages.hero3,
    eyebrow: "Sports wear",
    title: "Train harder in performance fabrics",
    copy: "Rash guards, fight shorts, and dry-fit layers for every session.",
    cta: { href: "/products/sports-wear", label: "Shop sportswear" },
  },
  {
    image: sportImages.hero4,
    eyebrow: "Wholesale",
    title: "Custom branding for academies",
    copy: "Bulk orders, logo runs, and global dispatch — talk to our team.",
    cta: { href: "/wholesale", label: "Wholesale inquiry" },
  },
];

export function HeroSlider() {
  const [index, setIndex] = useState(0);

  useEffect(() => {
    const id = window.setInterval(() => {
      setIndex((i) => (i + 1) % slides.length);
    }, 5500);
    return () => window.clearInterval(id);
  }, []);

  const slide = slides[index];

  return (
    <section className="relative clip-hero-slash min-h-[78vh] overflow-hidden bg-header text-white sm:min-h-[85vh]">
      {slides.map((item, i) => (
        <div
          key={item.image}
          className={`absolute inset-0 transition-opacity duration-700 ${
            i === index ? "opacity-100" : "opacity-0"
          }`}
          aria-hidden={i !== index}
        >
          {/* eslint-disable-next-line @next/next/no-img-element */}
          <img
            src={item.image}
            alt=""
            className={`h-full w-full object-cover ${i === index ? "hero-kenburns" : ""}`}
          />
          <div className="absolute inset-0 bg-gradient-to-r from-black/80 via-black/50 to-black/25" />
        </div>
      ))}

      <div className="relative z-10 mx-auto flex min-h-[78vh] max-w-7xl flex-col justify-end px-4 pb-20 pt-28 sm:min-h-[85vh] sm:px-6 md:justify-center md:px-8 md:pb-28">
        <AnimatePresence mode="wait">
          <motion.div
            key={index}
            initial={{ opacity: 0, y: 24 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -12 }}
            transition={{ duration: 0.45 }}
            className="max-w-2xl"
          >
            <p className="text-[0.7rem] font-semibold uppercase tracking-[0.28em] text-accent">
              {slide.eyebrow}
            </p>
            <h1
              className="font-display mt-3 text-5xl leading-[0.95] sm:text-6xl md:text-7xl lg:text-8xl"
              style={{ color: "#ffffff" }}
            >
              {slide.title}
            </h1>
            <p className="mt-4 max-w-lg text-sm leading-relaxed text-white/80 sm:text-base">
              {slide.copy}
            </p>
            <div className="mt-8 flex flex-wrap gap-3">
              <Link
                href={slide.cta.href}
                style={{ color: "#ffffff" }}
                className="clip-cta bg-accent px-8 py-3.5 text-[0.72rem] font-bold tracking-[0.18em] uppercase transition hover:bg-accent-dark"
              >
                {slide.cta.label}
              </Link>
              <Link
                href="/products"
                className="border border-white/40 px-8 py-3.5 text-[0.72rem] font-semibold tracking-[0.18em] uppercase text-white transition hover:border-white hover:bg-white/10"
              >
                Shop catalog
              </Link>
            </div>
          </motion.div>
        </AnimatePresence>

        <div className="mt-10 flex items-center gap-4">
          <button
            type="button"
            aria-label="Previous slide"
            onClick={() => setIndex((i) => (i - 1 + slides.length) % slides.length)}
            className="inline-flex h-10 w-10 items-center justify-center border border-white/30 text-white hover:bg-white/10"
          >
            <ChevronLeft className="h-5 w-5" />
          </button>
          <div className="flex gap-2">
            {slides.map((_, i) => (
              <button
                key={i}
                type="button"
                aria-label={`Go to slide ${i + 1}`}
                onClick={() => setIndex(i)}
                className={`h-1.5 transition-all ${
                  i === index ? "w-10 bg-accent" : "w-5 bg-white/40"
                }`}
              />
            ))}
          </div>
          <button
            type="button"
            aria-label="Next slide"
            onClick={() => setIndex((i) => (i + 1) % slides.length)}
            className="inline-flex h-10 w-10 items-center justify-center border border-white/30 text-white hover:bg-white/10"
          >
            <ChevronRight className="h-5 w-5" />
          </button>
        </div>
      </div>
    </section>
  );
}
