import Link from "next/link";
import { formatPrice } from "@/lib/site";
import type { ProductWithCategory } from "@/lib/types";

type ProductCardProps = {
  product: ProductWithCategory;
};

export function ProductCard({ product }: ProductCardProps) {
  const price = product.sale_price ?? product.original_price;
  const onSale =
    product.sale_price != null && product.sale_price < product.original_price;
  const image = product.image_urls[0];
  const save = onSale ? product.original_price - (product.sale_price ?? 0) : 0;

  return (
    <Link
      href={`/product/${product.slug}`}
      className="group flex flex-col overflow-hidden border border-line bg-white transition hover:-translate-y-0.5 hover:shadow-lg"
      style={{
        clipPath:
          "polygon(0 0, 100% 0, 100% calc(100% - 14px), calc(100% - 14px) 100%, 0 100%)",
      }}
    >
      <div className="relative aspect-[4/5] overflow-hidden bg-paper-deep">
        {image ? (
          // eslint-disable-next-line @next/next/no-img-element
          <img
            src={image}
            alt={product.title}
            className="h-full w-full  transition duration-500 group-hover:scale-105"
          />
        ) : (
          <div className="flex h-full items-center justify-center text-muted">
            No image
          </div>
        )}
        {onSale && (
          <span
            className="absolute left-2 top-2 bg-accent px-2 py-1 text-[0.65rem] font-bold uppercase tracking-wide"
            style={{ color: "#ffffff" }}
          >
            Sale · −{Math.round((save / product.original_price) * 100)}%
          </span>
        )}
      </div>
      <div className="flex flex-1 flex-col p-4">
        <p className="text-[0.65rem] uppercase tracking-widest text-muted">
          {product.category.name}
        </p>
        <h3 className="mt-1 line-clamp-2 text-sm font-semibold leading-snug text-ink group-hover:text-accent sm:text-base">
          {product.title}
        </h3>
        <div className="mt-auto flex flex-wrap items-baseline gap-2 pt-3">
          <span className="text-lg font-bold text-ink">{formatPrice(price)}</span>
          {onSale && (
            <span className="text-sm text-muted line-through">
              {formatPrice(product.original_price)}
            </span>
          )}
        </div>
      </div>
    </Link>
  );
}
