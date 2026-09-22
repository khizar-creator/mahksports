import { ProductCard } from "@/components/ProductCard";
import type { ProductWithCategory } from "@/lib/types";

type ProductGridProps = {
  products: ProductWithCategory[];
  emptyMessage?: string;
};

export function ProductGrid({
  products,
  emptyMessage = "No products in this category yet.",
}: ProductGridProps) {
  if (products.length === 0) {
    return (
      <p className="py-16 text-center text-muted" style={{ color: "#8b919c" }}>
        {emptyMessage}
      </p>
    );
  }

  return (
    <div className="grid grid-cols-2 gap-4 sm:gap-6 lg:grid-cols-3 xl:grid-cols-4">
      {products.map((product) => (
        <ProductCard key={product.id} product={product} />
      ))}
    </div>
  );
}
