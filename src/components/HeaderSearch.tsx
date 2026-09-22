"use client";

import Link from "next/link";
import { useRouter } from "next/navigation";
import { Search, X } from "lucide-react";
import { useEffect, useId, useRef, useState } from "react";

type SearchHit = {
  id: string;
  title: string;
  slug: string;
  sku: string;
  priceLabel: string;
  image: string;
  category: string;
};

type HeaderSearchProps = {
  open: boolean;
  onOpenChange: (open: boolean) => void;
};

export function HeaderSearch({ open, onOpenChange }: HeaderSearchProps) {
  const router = useRouter();
  const inputRef = useRef<HTMLInputElement>(null);
  const panelRef = useRef<HTMLDivElement>(null);
  const titleId = useId();
  const [query, setQuery] = useState("");
  const [hits, setHits] = useState<SearchHit[]>([]);
  const [total, setTotal] = useState(0);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    if (!open) return;
    const t = window.setTimeout(() => inputRef.current?.focus(), 40);
    return () => window.clearTimeout(t);
  }, [open]);

  useEffect(() => {
    if (!open) return;
    const onKey = (e: KeyboardEvent) => {
      if (e.key === "Escape") onOpenChange(false);
    };
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [open, onOpenChange]);

  useEffect(() => {
    if (!open) return;
    const q = query.trim();
    if (q.length < 2) {
      setHits([]);
      setTotal(0);
      setLoading(false);
      return;
    }

    const controller = new AbortController();
    setLoading(true);
    const timer = window.setTimeout(async () => {
      try {
        const res = await fetch(`/api/search?q=${encodeURIComponent(q)}`, {
          signal: controller.signal,
        });
        const data = (await res.json()) as {
          products?: SearchHit[];
          total?: number;
        };
        setHits(data.products ?? []);
        setTotal(data.total ?? 0);
      } catch (err) {
        if ((err as Error).name !== "AbortError") {
          setHits([]);
          setTotal(0);
        }
      } finally {
        setLoading(false);
      }
    }, 220);

    return () => {
      controller.abort();
      window.clearTimeout(timer);
    };
  }, [query, open]);

  function goToResults(e?: React.FormEvent) {
    e?.preventDefault();
    const q = query.trim();
    if (!q) return;
    onOpenChange(false);
    router.push(`/search?q=${encodeURIComponent(q)}`);
  }

  if (!open) return null;

  return (
    <div
      className="absolute inset-x-0 top-full z-[60] border-b border-white/10 bg-header shadow-2xl"
      ref={panelRef}
      role="dialog"
      aria-modal="true"
      aria-labelledby={titleId}
    >
      <div className="mx-auto max-w-7xl px-4 py-4 sm:px-6 md:px-8">
        <p id={titleId} className="sr-only">
          Search products
        </p>
        <form onSubmit={goToResults} className="flex items-center gap-2">
          <Search className="h-5 w-5 shrink-0 text-white/50" aria-hidden />
          <input
            ref={inputRef}
            type="search"
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            placeholder="Search gloves, apparel, SKU…"
            className="w-full bg-transparent text-base text-white outline-none placeholder:text-white/40"
            autoComplete="off"
            aria-label="Search products"
          />
          <button
            type="button"
            onClick={() => onOpenChange(false)}
            className="inline-flex h-9 w-9 items-center justify-center rounded-md text-white/70 hover:bg-white/10 hover:text-white"
            aria-label="Close search"
          >
            <X className="h-5 w-5" />
          </button>
        </form>

        <div className="mt-3 max-h-[60vh] overflow-y-auto">
          {query.trim().length < 2 ? (
            <p className="py-3 text-sm text-white/45">
              Type at least 2 characters to search.
            </p>
          ) : loading ? (
            <p className="py-3 text-sm text-white/45">Searching…</p>
          ) : hits.length === 0 ? (
            <p className="py-3 text-sm text-white/45">
              No products match “{query.trim()}”.
            </p>
          ) : (
            <ul className="divide-y divide-white/10">
              {hits.map((hit) => (
                <li key={hit.id}>
                  <Link
                    href={`/product/${hit.slug}`}
                    onClick={() => onOpenChange(false)}
                    className="flex items-center gap-3 py-3 transition hover:bg-white/5"
                  >
                    {/* eslint-disable-next-line @next/next/no-img-element */}
                    <img
                      src={hit.image}
                      alt=""
                      className="h-12 w-12 shrink-0 rounded object-cover bg-white/10"
                    />
                    <div className="min-w-0 flex-1">
                      <p className="truncate text-sm font-medium text-white">
                        {hit.title}
                      </p>
                      <p className="truncate text-xs text-white/50">
                        {hit.category} · {hit.sku}
                      </p>
                    </div>
                    <span className="shrink-0 text-sm text-accent">
                      {hit.priceLabel}
                    </span>
                  </Link>
                </li>
              ))}
            </ul>
          )}

          {total > hits.length && (
            <button
              type="button"
              onClick={() => goToResults()}
              className="mt-2 w-full py-3 text-sm font-semibold text-accent hover:underline"
            >
              View all {total} results →
            </button>
          )}
        </div>
      </div>
    </div>
  );
}
