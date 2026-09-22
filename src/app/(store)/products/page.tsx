import type { Metadata } from "next";
import { ProductGrid } from "@/components/ProductGrid";
import { getProducts } from "@/lib/data";
import { site } from "@/lib/site";

export const metadata: Metadata = {
  title: "All Products",
  description: `Shop combat sports gear and activewear at ${site.name}.`,
};

export default async function ProductsPage() {
  const products = await getProducts({ inStockOnly: false });

  return (
    <div className="mx-auto max-w-7xl px-4 py-10 sm:px-6 md:px-8 md:py-14">
      <h1 className="font-display text-4xl text-accent md:text-5xl">Catalog</h1>
      <p className="mt-2 text-ink-soft">
        Gloves, guards, rash guards, apparel, and accessories.
      </p>
      <div className="mt-10">
        <ProductGrid products={products} />
      </div>
    </div>
  );
}
