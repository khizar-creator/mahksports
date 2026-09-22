import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { AddToCartButtons } from "@/components/AddToCartButtons";
import { ProductCard } from "@/components/ProductCard";
import { ProductGallery } from "@/components/ProductGallery";
import { getProductBySlug, getProducts } from "@/lib/data";
import { formatPrice } from "@/lib/site";

type PageProps = {
  params: Promise<{ slug: string }>;
};

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { slug } = await params;
  const product = await getProductBySlug(slug);
  return {
    title: product?.title ?? "Product",
    description: product?.description,
  };
}

export async function generateStaticParams() {
  const products = await getProducts();
  return products.map((p) => ({ slug: p.slug }));
}

export default async function ProductPage({ params }: PageProps) {
  const { slug } = await params;
  const product = await getProductBySlug(slug);
  if (!product) notFound();

  const price = product.sale_price ?? product.original_price;
  const onSale =
    product.sale_price != null && product.sale_price < product.original_price;
  const specs = Object.entries(product.specifications).filter(([, v]) => v);

  const related = (await getProducts({ categorySlug: product.category.slug }))
    .filter((p) => p.id !== product.id)
    .slice(0, 4);

  return (
    <div className="mx-auto max-w-7xl px-4 py-8 sm:px-6 md:px-8 md:py-14">
      <div className="grid gap-10 md:grid-cols-2 md:gap-14">
        <ProductGallery images={product.image_urls} title={product.title} />

        <div className="md:sticky md:top-28 md:self-start">
          <Link
            href={`/products/${product.category.slug}`}
            className="text-xs uppercase tracking-widest text-volt hover:underline"
          >
            {product.category.name}
          </Link>
          <h1
            className="font-display mt-3 text-4xl leading-tight text-ink md:text-5xl"
          >
            {product.title}
          </h1>
          <p className="mt-2 text-sm text-muted">SKU {product.sku}</p>

          <div className="mt-5 flex flex-wrap items-center gap-3">
            {onSale && (
              <span className="bg-accent px-2.5 py-1 text-[0.7rem] font-bold uppercase tracking-wide text-white">
                Sale
              </span>
            )}
            <span className="text-2xl font-semibold text-accent">
              {formatPrice(price)}
            </span>
            {onSale && (
              <span className="text-muted line-through">
                {formatPrice(product.original_price)}
              </span>
            )}
          </div>

          <p className="mt-3 text-sm">
            {product.in_stock ? (
              <span className="text-success">In stock</span>
            ) : (
              <span className="text-danger">Sold out</span>
            )}
          </p>

          <p className="mt-6 leading-relaxed text-ink-soft">{product.description}</p>

          {specs.length > 0 && (
            <dl className="mt-6 grid grid-cols-2 gap-3 text-sm">
              {specs.map(([key, value]) => (
                <div key={key} className="rounded-lg border border-line bg-surface p-3">
                  <dt className="text-xs uppercase text-muted">{key.replace(/_/g, " ")}</dt>
                  <dd className="mt-1 font-medium text-ink">
                    {value}
                  </dd>
                </div>
              ))}
            </dl>
          )}

          <AddToCartButtons product={product} />
        </div>
      </div>

      {related.length > 0 && (
        <section className="mt-20 border-t border-line pt-14">
          <h2 className="font-display text-3xl text-volt">You may also like</h2>
          <div className="mt-8 grid grid-cols-2 gap-4 lg:grid-cols-4">
            {related.map((p) => (
              <ProductCard key={p.id} product={p} />
            ))}
          </div>
        </section>
      )}
    </div>
  );
}
