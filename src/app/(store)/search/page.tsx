import type { Metadata } from "next";
import Link from "next/link";
import { ProductGrid } from "@/components/ProductGrid";
import { searchProducts } from "@/lib/data";
import { site } from "@/lib/site";

type PageProps = {
  searchParams: Promise<{ q?: string }>;
};

export async function generateMetadata({
  searchParams,
}: PageProps): Promise<Metadata> {
  const { q } = await searchParams;
  const query = (q ?? "").trim();
  return {
    title: query ? `Search: ${query}` : "Search",
    description: `Search combat sports gear at ${site.name}.`,
  };
}

export default async function SearchPage({ searchParams }: PageProps) {
  const { q } = await searchParams;
  const query = (q ?? "").trim();
  const products = query.length >= 2 ? await searchProducts(query) : [];

  return (
    <div className="mx-auto max-w-7xl px-4 py-10 sm:px-6 md:px-8 md:py-14">
      <p className="text-[0.7rem] font-semibold uppercase tracking-[0.24em] text-accent">
        Search
      </p>
      <h1 className="font-display mt-2 text-4xl text-ink md:text-5xl">
        {query ? (
          <>
            Results for{" "}
            <span className="text-accent">&ldquo;{query}&rdquo;</span>
          </>
        ) : (
          "Find gear"
        )}
      </h1>

      <form action="/search" method="get" className="mt-8 max-w-xl">
        <label className="sr-only" htmlFor="search-q">
          Search products
        </label>
        <div className="flex gap-2">
          <input
            id="search-q"
            name="q"
            type="search"
            defaultValue={query}
            placeholder="Search gloves, apparel, SKU…"
            className="w-full rounded-lg border border-line bg-white px-4 py-3 text-ink outline-none focus:border-accent"
          />
          <button
            type="submit"
            className="shrink-0 bg-accent px-5 py-3 text-sm font-bold uppercase tracking-wide text-white hover:bg-accent-dark"
          >
            Search
          </button>
        </div>
      </form>

      <div className="mt-10">
        {!query ? (
          <p className="text-ink-soft">
            Enter a product name, category, or SKU. Or{" "}
            <Link href="/products" className="text-accent hover:underline">
              browse the full catalog
            </Link>
            .
          </p>
        ) : query.length < 2 ? (
          <p className="text-ink-soft">Type at least 2 characters.</p>
        ) : (
          <>
            <p className="mb-6 text-sm text-muted">
              {products.length}{" "}
              {products.length === 1 ? "product" : "products"} found
            </p>
            <ProductGrid
              products={products}
              emptyMessage={`No products match “${query}”. Try another term or browse categories.`}
            />
          </>
        )}
      </div>
    </div>
  );
}
