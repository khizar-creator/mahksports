import Link from "next/link";
import { notFound } from "next/navigation";
import { CategoryForm } from "@/components/admin/CategoryForm";
import { createClient } from "@/lib/supabase/server";
import type { Category } from "@/lib/types";

type PageProps = {
  params: Promise<{ id: string }>;
};

export default async function EditCategoryPage({ params }: PageProps) {
  const { id } = await params;
  const supabase = await createClient();
  const [{ data: category }, { data: all }] = await Promise.all([
    supabase.from("categories").select("*").eq("id", id).maybeSingle(),
    supabase.from("categories").select("*").order("sort_order"),
  ]);

  if (!category) notFound();

  const roots = ((all ?? []) as Category[]).filter((c) => !c.parent_id);

  return (
    <div>
      <Link
        href="/admin/categories"
        className="text-sm text-muted hover:text-accent"
      >
        ← Categories
      </Link>
      <h1 className="font-display mt-4 text-3xl text-accent">Edit category</h1>
      <p className="mt-1 text-sm text-ink-soft">
        Update main or sub-category name, parent, image, and sort order.
      </p>
      <div className="mt-8">
        <CategoryForm category={category as Category} roots={roots} />
      </div>
    </div>
  );
}
