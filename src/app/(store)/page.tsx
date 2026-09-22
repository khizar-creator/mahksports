import { HomeSections } from "@/components/HomeSections";
import { getCategories, getProducts } from "@/lib/data";
import { buildCategoryTree } from "@/lib/categories";

export default async function HomePage() {
  const [categories, allProducts, featured] = await Promise.all([
    getCategories(),
    getProducts({ inStockOnly: true }),
    getProducts({ featured: true, inStockOnly: true }),
  ]);

  const roots = buildCategoryTree(categories);
  const byRoot = roots.map((root) => {
    const childIds = new Set([
      root.id,
      ...root.children.map((c) => c.id),
    ]);
    const products = allProducts.filter((p) =>
      childIds.has(p.category_id),
    );
    return { category: root, products };
  });

  return (
    <HomeSections
      categories={categories}
      featured={featured.length ? featured : allProducts}
      byRoot={byRoot}
    />
  );
}
