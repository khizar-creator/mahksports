"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { slugify } from "@/lib/site";
import type { ProductSpecifications } from "@/lib/types";

export async function loginAction(formData: FormData) {
  const email = String(formData.get("email") ?? "");
  const password = String(formData.get("password") ?? "");
  const next = String(formData.get("next") ?? "/admin");

  if (
    !process.env.NEXT_PUBLIC_SUPABASE_URL ||
    !process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
  ) {
    redirect(
      `/admin/login?error=${encodeURIComponent(
        "Supabase is not configured. Add NEXT_PUBLIC_SUPABASE_URL and NEXT_PUBLIC_SUPABASE_ANON_KEY to .env.local",
      )}`,
    );
  }

  const supabase = await createClient();
  const { error } = await supabase.auth.signInWithPassword({ email, password });

  if (error) {
    redirect(`/admin/login?error=${encodeURIComponent(error.message)}`);
  }

  redirect(next.startsWith("/admin") ? next : "/admin");
}

export async function logoutAction() {
  const supabase = await createClient();
  await supabase.auth.signOut();
  redirect("/admin/login");
}

export async function upsertCategoryAction(formData: FormData) {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) redirect("/admin/login");

  const id = String(formData.get("id") ?? "");
  const name = String(formData.get("name") ?? "").trim();
  const description = String(formData.get("description") ?? "").trim();
  const image_url = String(formData.get("image_url") ?? "").trim() || null;
  const sort_order = Number(formData.get("sort_order") ?? 0);
  const parentRaw = String(formData.get("parent_id") ?? "").trim();
  const parent_id = parentRaw === "" ? null : parentRaw;
  const slug = slugify(String(formData.get("slug") ?? name));

  if (!name || !slug) {
    redirect("/admin/categories?error=Name%20is%20required");
  }

  const payload = {
    name,
    slug,
    description,
    image_url,
    sort_order,
    parent_id,
  };

  const { error } = id
    ? await supabase.from("categories").update(payload).eq("id", id)
    : await supabase.from("categories").insert(payload);

  if (error) {
    redirect(`/admin/categories?error=${encodeURIComponent(error.message)}`);
  }

  revalidatePath("/");
  revalidatePath("/products");
  revalidatePath("/admin/categories");
  if (id) {
    revalidatePath(`/admin/categories/${id}/edit`);
  }
  redirect("/admin/categories?ok=1");
}

export async function deleteCategoryAction(formData: FormData) {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) redirect("/admin/login");

  const id = String(formData.get("id") ?? "");
  const { error } = await supabase.from("categories").delete().eq("id", id);

  if (error) {
    redirect(`/admin/categories?error=${encodeURIComponent(error.message)}`);
  }

  revalidatePath("/");
  revalidatePath("/admin/categories");
  redirect("/admin/categories?ok=1");
}

export async function upsertProductAction(formData: FormData) {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) redirect("/admin/login");

  const id = String(formData.get("id") ?? "");
  const title = String(formData.get("title") ?? "").trim();
  const sku = String(formData.get("sku") ?? "").trim();
  const description = String(formData.get("description") ?? "").trim();
  const category_id = String(formData.get("category_id") ?? "");
  const original_price = Number(formData.get("original_price") ?? 0);
  const saleRaw = String(formData.get("sale_price") ?? "").trim();
  const sale_price = saleRaw === "" ? null : Number(saleRaw);
  const wholesaleRaw = String(formData.get("wholesale_price") ?? "").trim();
  const wholesale_price = wholesaleRaw === "" ? null : Number(wholesaleRaw);
  const in_stock = formData.get("in_stock") === "on";
  const featured = formData.get("featured") === "on";
  const sort_order = Number(formData.get("sort_order") ?? 0);
  const slug = slugify(String(formData.get("slug") ?? title));
  const existingImages = String(formData.get("existing_images") ?? "")
    .split(/[\n,]+/)
    .map((s) => s.trim())
    .filter(Boolean);

  const failRedirect = (message: string): never => {
    const target = id
      ? `/admin/products/${id}/edit?error=${encodeURIComponent(message)}`
      : `/admin/products?error=${encodeURIComponent(message)}`;
    redirect(target);
  };

  const specifications: ProductSpecifications = {
    size: String(formData.get("size") ?? "").trim() || undefined,
    color: String(formData.get("color") ?? "").trim() || undefined,
    material: String(formData.get("material") ?? "").trim() || undefined,
  };

  const files = formData
    .getAll("images")
    .filter((f): f is File => f instanceof File && f.size > 0);
  const uploadedUrls: string[] = [];

  for (const file of files) {
    const ext = file.name.split(".").pop()?.toLowerCase() || "jpg";
    const path = `${Date.now()}-${Math.random().toString(36).slice(2)}.${ext}`;
    const { error: uploadError } = await supabase.storage
      .from("product-images")
      .upload(path, file, { upsert: false, contentType: file.type || undefined });

    if (uploadError) {
      failRedirect(uploadError.message);
    }

    const { data } = supabase.storage.from("product-images").getPublicUrl(path);
    uploadedUrls.push(data.publicUrl);
  }

  // Keep order: remaining existing URLs, then newly uploaded
  const image_urls = [...existingImages, ...uploadedUrls];

  if (!title || !sku || !category_id || !slug) {
    failRedirect("Missing required fields");
  }

  if (!Number.isFinite(original_price) || original_price < 0) {
    failRedirect("Invalid regular price");
  }

  const payload = {
    title,
    slug,
    sku,
    description,
    category_id,
    original_price,
    sale_price:
      sale_price != null && Number.isFinite(sale_price) ? sale_price : null,
    wholesale_price:
      wholesale_price != null && Number.isFinite(wholesale_price)
        ? wholesale_price
        : null,
    image_urls,
    in_stock,
    featured,
    sort_order: Number.isFinite(sort_order) ? sort_order : 0,
    specifications,
  };

  const { data: saved, error } = id
    ? await supabase
        .from("products")
        .update(payload)
        .eq("id", id)
        .select("id, slug")
        .maybeSingle()
    : await supabase
        .from("products")
        .insert(payload)
        .select("id, slug")
        .maybeSingle();

  if (error) {
    failRedirect(error.message);
  }

  const savedSlug = saved?.slug ?? slug;
  const savedId = saved?.id ?? id;

  revalidatePath("/");
  revalidatePath("/products");
  revalidatePath("/search");
  revalidatePath(`/product/${savedSlug}`);
  revalidatePath("/admin/products");
  if (savedId) {
    revalidatePath(`/admin/products/${savedId}/edit`);
  }

  redirect(
    savedId
      ? `/admin/products/${savedId}/edit?ok=1`
      : "/admin/products?ok=1",
  );
}

export async function deleteProductAction(formData: FormData) {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) redirect("/admin/login");

  const id = String(formData.get("id") ?? "");
  const { error } = await supabase.from("products").delete().eq("id", id);

  if (error) {
    redirect(`/admin/products?error=${encodeURIComponent(error.message)}`);
  }

  revalidatePath("/");
  revalidatePath("/admin/products");
  redirect("/admin/products?ok=1");
}

const ORDER_STATUSES = [
  "new",
  "confirmed",
  "shipped",
  "delivered",
  "cancelled",
] as const;

export async function updateOrderStatusAction(formData: FormData) {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) redirect("/admin/login");

  const id = String(formData.get("id") ?? "");
  const status = String(formData.get("status") ?? "");

  if (!id || !(ORDER_STATUSES as readonly string[]).includes(status)) {
    redirect(`/admin/orders/${id}?error=Invalid%20status`);
  }

  const { error } = await supabase
    .from("orders")
    .update({ status })
    .eq("id", id);

  if (error) {
    redirect(
      `/admin/orders/${id}?error=${encodeURIComponent(error.message)}`,
    );
  }

  revalidatePath("/admin");
  revalidatePath("/admin/orders");
  revalidatePath(`/admin/orders/${id}`);
  redirect(`/admin/orders/${id}?ok=1`);
}
