import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { ProductGrid } from "@/components/ProductGrid";
import { buildCategoryTree } from "@/lib/categories";
import { getCategories, getCategoryBySlug, getProducts } from "@/lib/data";

type PageProps = {
  params: Promise<{ category: string }>;
};

export async function generateStaticParams() {
  const categories = await getCategories();
  return categories.map((c) => ({ category: c.slug }));
}

export async function generateMetadata({
  params,
}: PageProps): Promise<Metadata> {
  const { category: slug } = await params;
  const category = await getCategoryBySlug(slug);
  return { title: category?.name ?? "Category" };
}

export default async function CategoryPage({ params }: PageProps) {
  const { category: slug } = await params;
  const category = await getCategoryBySlug(slug);
  if (!category) notFound();

  const [allCategories, products] = await Promise.all([
    getCategories(),
    getProducts({ categorySlug: slug }),
  ]);

  const tree = buildCategoryTree(allCategories);
  const root = tree.find(
    (r) => r.slug === slug || r.children.some((c) => c.slug === slug),
  );
  const subcats =
    root?.slug === slug ? root.children : root?.children ?? [];

  return (
    <div className="mx-auto max-w-7xl px-4 py-10 sm:px-6 md:px-8 md:py-14">
      <p className="text-xs uppercase tracking-widest text-muted">Category</p>
      <h1 className="font-display mt-2 text-4xl text-volt md:text-5xl">
        {category.name}
      </h1>
      {category.description && (
        <p className="mt-3 max-w-2xl text-ink-soft">{category.description}</p>
      )}

      {subcats.length > 0 && (
        <div className="mt-6 flex flex-wrap gap-2">
          {root && root.slug !== slug && (
            <Link
              href={`/products/${root.slug}`}
              className="rounded-full border border-line px-4 py-1.5 text-sm text-ink-soft hover:border-volt"
            >
              All {root.name}
            </Link>
          )}
          {subcats.map((sub) => (
            <Link
              key={sub.id}
              href={`/products/${sub.slug}`}
              className={`rounded-full border px-4 py-1.5 text-sm ${
                sub.slug === slug
                  ? "border-volt bg-volt/10 text-volt"
                  : "border-line text-ink-soft hover:border-volt"
              }`}
            >
              {sub.name}
            </Link>
          ))}
        </div>
      )}

      <div className="mt-10">
        <ProductGrid products={products} />
      </div>
    </div>
  );
}
