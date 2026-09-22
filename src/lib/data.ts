import { getDescendantCategoryIds } from "./categories";
import { categories as seedCategories, products as seedProducts } from "./seed";
import { hasSupabaseConfig } from "./supabase/client";
import { createClient } from "./supabase/server";
import type { Category, Product, ProductWithCategory } from "./types";

function useSupabaseCatalogue() {
  return (
    hasSupabaseConfig() && process.env.USE_SUPABASE_CATALOGUE === "true"
  );
}

function attachCategory(
  list: Product[],
  cats: Category[],
): ProductWithCategory[] {
  return list
    .map((product) => {
      const category = cats.find((c) => c.id === product.category_id);
      if (!category) return null;
      return { ...product, category };
    })
    .filter(Boolean) as ProductWithCategory[];
}

function normalizeProduct(row: Product): Product {
  return {
    ...row,
    original_price: Number(row.original_price),
    sale_price: row.sale_price == null ? null : Number(row.sale_price),
    wholesale_price:
      row.wholesale_price == null ? null : Number(row.wholesale_price),
    image_urls: row.image_urls ?? [],
    specifications: row.specifications ?? {},
  };
}

function seedCategoriesSorted() {
  return [...seedCategories].sort((a, b) => a.sort_order - b.sort_order);
}

function seedProductsFiltered(filters?: {
  categorySlug?: string;
  featured?: boolean;
  inStockOnly?: boolean;
  query?: string;
}) {
  const cats = seedCategoriesSorted();
  let list = attachCategory(seedProducts.map(normalizeProduct), cats);

  if (filters?.categorySlug) {
    const cat = cats.find((c) => c.slug === filters.categorySlug);
    if (cat) {
      const ids = getDescendantCategoryIds(cats, cat.id);
      list = list.filter((p) => ids.includes(p.category_id));
    } else {
      list = [];
    }
  }
  if (filters?.featured) list = list.filter((p) => p.featured);
  if (filters?.inStockOnly) list = list.filter((p) => p.in_stock);
  list = applySearchQuery(list, filters?.query);
  return list.sort((a, b) => a.sort_order - b.sort_order);
}

export async function getCategories(): Promise<Category[]> {
  if (!useSupabaseCatalogue()) {
    return seedCategoriesSorted();
  }

  try {
    const supabase = await createClient();
    const { data, error } = await supabase
      .from("categories")
      .select("*")
      .order("sort_order", { ascending: true });

    if (error || !data?.length) return seedCategoriesSorted();
    return data as Category[];
  } catch {
    return seedCategoriesSorted();
  }
}

export async function getCategoryBySlug(slug: string): Promise<Category | null> {
  const cats = await getCategories();
  return cats.find((c) => c.slug === slug) ?? null;
}

export async function getProducts(filters?: {
  categorySlug?: string;
  featured?: boolean;
  inStockOnly?: boolean;
  query?: string;
}): Promise<ProductWithCategory[]> {
  if (!useSupabaseCatalogue()) {
    return seedProductsFiltered(filters);
  }

  try {
    const cats = await getCategories();
    const supabase = await createClient();
    let query = supabase.from("products").select("*").order("sort_order", {
      ascending: true,
    });

    if (filters?.featured) query = query.eq("featured", true);
    if (filters?.inStockOnly) query = query.eq("in_stock", true);

    const { data, error } = await query;
    if (error || !data?.length) return seedProductsFiltered(filters);

    let list = attachCategory(
      (data as Product[]).map(normalizeProduct),
      cats,
    );

    if (filters?.categorySlug) {
      const cat = cats.find((c) => c.slug === filters.categorySlug);
      if (cat) {
        const ids = getDescendantCategoryIds(cats, cat.id);
        list = list.filter((p) => ids.includes(p.category_id));
      } else {
        list = [];
      }
    }

    return applySearchQuery(list, filters?.query);
  } catch {
    return seedProductsFiltered(filters);
  }
}

function applySearchQuery(
  list: ProductWithCategory[],
  query?: string,
): ProductWithCategory[] {
  const q = query?.trim().toLowerCase();
  if (!q) return list;

  return list.filter((p) => {
    const haystack = [
      p.title,
      p.sku,
      p.description,
      p.category.name,
      p.slug,
      ...Object.values(p.specifications ?? {}).filter(Boolean),
    ]
      .join(" ")
      .toLowerCase();
    return haystack.includes(q);
  });
}

export async function searchProducts(
  query: string,
): Promise<ProductWithCategory[]> {
  return getProducts({ query, inStockOnly: false });
}

export async function getProductBySlug(
  slug: string,
): Promise<ProductWithCategory | null> {
  const products = await getProducts();
  return products.find((p) => p.slug === slug) ?? null;
}
