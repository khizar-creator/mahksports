import Link from "next/link";
import { deleteCategoryAction } from "@/app/admin/actions";
import { CategoryForm } from "@/components/admin/CategoryForm";
import { createClient } from "@/lib/supabase/server";
import type { Category } from "@/lib/types";

type PageProps = {
  searchParams: Promise<{ error?: string; ok?: string }>;
};

export default async function AdminCategoriesPage({ searchParams }: PageProps) {
  const { error, ok } = await searchParams;
  const supabase = await createClient();
  const { data } = await supabase
    .from("categories")
    .select("*")
    .order("sort_order", { ascending: true });

  const categories = (data ?? []) as Category[];
  const roots = categories.filter((c) => !c.parent_id);

  return (
    <div>
      <div className="flex flex-wrap items-end justify-between gap-4">
        <div>
          <h1 className="font-display text-3xl text-accent">Categories</h1>
          <p className="mt-1 text-sm text-ink-soft">
            Manage main categories and sub-categories. Use Edit to update either.
          </p>
        </div>
      </div>
      {error && <p className="mt-3 text-sm text-danger">{error}</p>}
      {ok && <p className="mt-3 text-sm text-success">Saved.</p>}

      <div className="mt-8 grid gap-10 lg:grid-cols-2">
        <div>
          <h2 className="mb-3 text-sm font-semibold uppercase tracking-wide text-muted">
            Add category
          </h2>
          <CategoryForm roots={roots} />
        </div>

        <div>
          <h2 className="mb-3 text-sm font-semibold uppercase tracking-wide text-muted">
            All categories
          </h2>
          <div className="space-y-4">
            {roots.map((root) => {
              const children = categories.filter((c) => c.parent_id === root.id);
              return (
                <div
                  key={root.id}
                  className="overflow-hidden rounded-xl border border-line bg-white shadow-sm"
                >
                  <div className="flex flex-wrap items-center justify-between gap-3 border-b border-line bg-paper px-4 py-3">
                    <div>
                      <p className="font-semibold text-ink">{root.name}</p>
                      <p className="text-xs text-muted">
                        Main · /{root.slug} · sort {root.sort_order}
                      </p>
                    </div>
                    <div className="flex gap-3">
                      <Link
                        href={`/admin/categories/${root.id}/edit`}
                        className="text-sm font-medium text-accent hover:underline"
                      >
                        Edit
                      </Link>
                      <form action={deleteCategoryAction}>
                        <input type="hidden" name="id" value={root.id} />
                        <button
                          type="submit"
                          className="text-sm text-danger hover:underline"
                        >
                          Delete
                        </button>
                      </form>
                    </div>
                  </div>
                  {children.length > 0 ? (
                    <ul className="divide-y divide-line">
                      {children.map((sub) => (
                        <li
                          key={sub.id}
                          className="flex flex-wrap items-center justify-between gap-3 px-4 py-3 pl-8"
                        >
                          <div>
                            <p className="text-sm font-medium text-ink">
                              {sub.name}
                            </p>
                            <p className="text-xs text-muted">
                              Sub · /{sub.slug}
                            </p>
                          </div>
                          <div className="flex gap-3">
                            <Link
                              href={`/admin/categories/${sub.id}/edit`}
                              className="text-sm font-medium text-accent hover:underline"
                            >
                              Edit
                            </Link>
                            <form action={deleteCategoryAction}>
                              <input type="hidden" name="id" value={sub.id} />
                              <button
                                type="submit"
                                className="text-sm text-danger hover:underline"
                              >
                                Delete
                              </button>
                            </form>
                          </div>
                        </li>
                      ))}
                    </ul>
                  ) : (
                    <p className="px-4 py-3 text-sm text-muted">
                      No sub-categories yet.
                    </p>
                  )}
                </div>
              );
            })}
            {roots.length === 0 && (
              <p className="text-sm text-ink-soft">No categories yet.</p>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}
