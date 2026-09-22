import type { Category } from "./types";

export function buildCategoryTree(categories: Category[]) {
  const roots = categories
    .filter((c) => !c.parent_id)
    .sort((a, b) => a.sort_order - b.sort_order);

  return roots.map((root) => ({
    ...root,
    children: categories
      .filter((c) => c.parent_id === root.id)
      .sort((a, b) => a.sort_order - b.sort_order),
  }));
}

export function getDescendantCategoryIds(
  categories: Category[],
  categoryId: string,
): string[] {
  const ids = [categoryId];
  const children = categories.filter((c) => c.parent_id === categoryId);
  for (const child of children) {
    ids.push(...getDescendantCategoryIds(categories, child.id));
  }
  return ids;
}
