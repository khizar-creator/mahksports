import { upsertCategoryAction } from "@/app/admin/actions";
import type { Category } from "@/lib/types";

type CategoryFormProps = {
  category?: Category;
  roots: Category[];
};

export function CategoryForm({ category, roots }: CategoryFormProps) {
  return (
    <form
      action={upsertCategoryAction}
      className="grid max-w-2xl gap-4 rounded-xl border border-line bg-white p-6 shadow-sm"
    >
      {category?.id && <input type="hidden" name="id" value={category.id} />}

      <label className="block text-sm">
        <span className="admin-label">Name *</span>
        <input
          name="name"
          defaultValue={category?.name}
          required
          className="admin-input"
          placeholder="e.g. Boxing & MMA Gloves"
        />
      </label>

      <label className="block text-sm">
        <span className="admin-label">Type</span>
        <select
          name="parent_id"
          defaultValue={category?.parent_id ?? ""}
          className="admin-input"
        >
          <option value="">Main category</option>
          {roots
            .filter((r) => r.id !== category?.id)
            .map((r) => (
              <option key={r.id} value={r.id}>
                Sub-category under: {r.name}
              </option>
            ))}
        </select>
        <span className="mt-1 block text-xs text-muted">
          Choose “Main category” for top-level, or pick a parent for a
          sub-category.
        </span>
      </label>

      <label className="block text-sm">
        <span className="admin-label">URL slug</span>
        <input
          name="slug"
          defaultValue={category?.slug}
          className="admin-input"
          placeholder="Auto from name if empty"
        />
      </label>

      <label className="block text-sm">
        <span className="admin-label">Description</span>
        <textarea
          name="description"
          defaultValue={category?.description ?? ""}
          rows={3}
          className="admin-input"
        />
      </label>

      <label className="block text-sm">
        <span className="admin-label">Image URL</span>
        <input
          name="image_url"
          defaultValue={category?.image_url ?? ""}
          className="admin-input"
          placeholder="https://…"
        />
      </label>

      <label className="block text-sm">
        <span className="admin-label">Sort order</span>
        <input
          name="sort_order"
          type="number"
          defaultValue={category?.sort_order ?? 0}
          className="admin-input"
        />
      </label>

      <button
        type="submit"
        className="rounded-lg bg-accent px-5 py-2.5 text-sm font-bold text-white hover:bg-accent-dark"
      >
        {category ? "Save category" : "Create category"}
      </button>
    </form>
  );
}
