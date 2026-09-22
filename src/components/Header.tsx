"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { ChevronDown, Menu, Search, ShoppingBag, X } from "lucide-react";
import { useEffect, useRef, useState } from "react";
import { useCart } from "@/components/CartProvider";
import { HeaderSearch } from "@/components/HeaderSearch";
import { buildCategoryTree } from "@/lib/categories";
import type { Category } from "@/lib/types";

type HeaderProps = {
  categories: Category[];
};

export function Header({ categories }: HeaderProps) {
  const pathname = usePathname();
  const { count, openDrawer } = useCart();
  const [mobileOpen, setMobileOpen] = useState(false);
  const [searchOpen, setSearchOpen] = useState(false);
  const [openFlyout, setOpenFlyout] = useState<string | null>(null);
  const flyoutRef = useRef<HTMLDivElement>(null);

  const tree = buildCategoryTree(categories);

  useEffect(() => {
    setMobileOpen(false);
    setOpenFlyout(null);
    setSearchOpen(false);
  }, [pathname]);

  useEffect(() => {
    if (!mobileOpen) return;
    const prev = document.body.style.overflow;
    document.body.style.overflow = "hidden";
    return () => {
      document.body.style.overflow = prev;
    };
  }, [mobileOpen]);

  useEffect(() => {
    const onPointerDown = (e: MouseEvent) => {
      if (flyoutRef.current && !flyoutRef.current.contains(e.target as Node)) {
        setOpenFlyout(null);
      }
    };
    window.addEventListener("mousedown", onPointerDown);
    return () => window.removeEventListener("mousedown", onPointerDown);
  }, []);

  return (
    <header className="relative sticky top-0 z-50 border-b border-white/10 bg-header text-white">
      <div className="mx-auto flex max-w-7xl items-center justify-between gap-4 px-4 py-3 sm:px-6 md:px-8">
        <button
          type="button"
          className="inline-flex h-10 w-10 items-center justify-center text-white lg:hidden"
          aria-expanded={mobileOpen}
          aria-label={mobileOpen ? "Close menu" : "Open menu"}
          onClick={() => {
            setSearchOpen(false);
            setMobileOpen((v) => !v);
          }}
        >
          {mobileOpen ? <X className="h-6 w-6" /> : <Menu className="h-6 w-6" />}
        </button>

        <Link
          href="/"
          className="font-display text-2xl tracking-[0.18em] sm:text-3xl"
          style={{ color: "#ffffff" }}
        >
          MAHK<span className="text-accent">SPORTS</span>
        </Link>

        <nav
          ref={flyoutRef}
          className="hidden items-center gap-0.5 lg:flex"
          aria-label="Main"
        >
          {tree.map((root) => (
            <div key={root.id} className="relative">
              <button
                type="button"
                className="flex max-w-[11rem] items-center gap-1 truncate rounded-md px-2.5 py-2 text-[0.72rem] uppercase tracking-wide text-white/80 transition hover:bg-white/10 hover:text-white xl:max-w-none xl:px-3"
                aria-expanded={openFlyout === root.id}
                onClick={() =>
                  setOpenFlyout((v) => (v === root.id ? null : root.id))
                }
              >
                <span className="truncate">{root.name}</span>
                <ChevronDown className="h-3.5 w-3.5 shrink-0 opacity-70" />
              </button>
              {openFlyout === root.id && (
                <div className="absolute left-0 top-full z-50 mt-1 min-w-[220px] border border-line bg-white py-2 text-ink shadow-xl">
                  <Link
                    href={`/products/${root.slug}`}
                    className="block px-4 py-2 text-sm font-semibold text-accent hover:bg-paper"
                    onClick={() => setOpenFlyout(null)}
                  >
                    All {root.name}
                  </Link>
                  {root.children.map((sub) => (
                    <Link
                      key={sub.id}
                      href={`/products/${sub.slug}`}
                      className="block px-4 py-2 text-sm text-ink-soft hover:bg-paper hover:text-ink"
                      onClick={() => setOpenFlyout(null)}
                    >
                      {sub.name}
                    </Link>
                  ))}
                </div>
              )}
            </div>
          ))}
          <Link
            href="/wholesale"
            className="rounded-md px-3 py-2 text-[0.72rem] uppercase tracking-wide text-white/80 hover:text-white"
          >
            Wholesale
          </Link>
          <Link
            href="/about"
            className="rounded-md px-3 py-2 text-[0.72rem] uppercase tracking-wide text-white/80 hover:text-white"
          >
            About
          </Link>
        </nav>

        <div className="flex items-center gap-0.5">
          <button
            type="button"
            onClick={() => {
              setMobileOpen(false);
              setSearchOpen((v) => !v);
            }}
            className="relative inline-flex h-10 w-10 items-center justify-center rounded-md text-white hover:bg-white/10"
            aria-label={searchOpen ? "Close search" : "Search products"}
            aria-expanded={searchOpen}
          >
            {searchOpen ? <X className="h-5 w-5" /> : <Search className="h-5 w-5" />}
          </button>
          <button
            type="button"
            onClick={() => {
              setSearchOpen(false);
              openDrawer();
            }}
            className="relative inline-flex h-10 w-10 items-center justify-center rounded-md text-white hover:bg-white/10"
            aria-label={count > 0 ? `Cart, ${count} items` : "Open cart"}
          >
            <ShoppingBag className="h-5 w-5" />
            {count > 0 && (
              <span
                className="absolute right-0.5 top-0.5 flex h-4 min-w-4 items-center justify-center rounded-full bg-accent px-1 text-[0.6rem] font-bold"
                style={{ color: "#ffffff" }}
              >
                {count > 99 ? "99+" : count}
              </span>
            )}
          </button>
        </div>
      </div>

      <HeaderSearch open={searchOpen} onOpenChange={setSearchOpen} />

      {mobileOpen && (
        <nav
          className="max-h-[70vh] overflow-y-auto border-t border-white/10 bg-header-soft px-4 py-4 lg:hidden"
          aria-label="Mobile"
        >
          {tree.map((root) => (
            <div key={root.id} className="border-b border-white/10 py-3 last:border-0">
              <Link
                href={`/products/${root.slug}`}
                className="font-display text-xl"
                style={{ color: "#ffffff" }}
                onClick={() => setMobileOpen(false)}
              >
                {root.name}
              </Link>
              <ul className="mt-2 space-y-1 pl-2">
                {root.children.map((sub) => (
                  <li key={sub.id}>
                    <Link
                      href={`/products/${sub.slug}`}
                      className="block py-1.5 text-sm text-white/70 hover:text-white"
                      onClick={() => setMobileOpen(false)}
                    >
                      {sub.name}
                    </Link>
                  </li>
                ))}
              </ul>
            </div>
          ))}
          <Link
            href="/wholesale"
            className="block py-3 font-medium text-white"
            onClick={() => setMobileOpen(false)}
          >
            Wholesale
          </Link>
          <Link
            href="/about"
            className="block py-3 font-medium text-white"
            onClick={() => setMobileOpen(false)}
          >
            About
          </Link>
        </nav>
      )}
    </header>
  );
}
