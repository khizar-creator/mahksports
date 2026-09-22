"use client";

import { useState } from "react";
import { upsertProductAction } from "@/app/admin/actions";
import type { Category, Product } from "@/lib/types";

type ProductFormProps = {
  categories: Category[];
  product?: Product;
};

function normalizeImageUrls(value: unknown): string[] {
  if (Array.isArray(value)) {
    return value.map(String).map((s) => s.trim()).filter(Boolean);
  }
  if (typeof value === "string" && value.trim()) {
    try {
      const parsed = JSON.parse(value);
      if (Array.isArray(parsed)) {
        return parsed.map(String).map((s) => s.trim()).filter(Boolean);
      }
    } catch {
      return value
        .split("\n")
        .map((s) => s.trim())
        .filter(Boolean);
    }
  }
  return [];
}

export function ProductForm({ categories, product }: ProductFormProps) {
  const specs = product?.specifications ?? {};
  const initiallyOnSale =
    product?.sale_price != null &&
    Number(product.sale_price) < Number(product.original_price);
  const [onSale, setOnSale] = useState(initiallyOnSale);
  const [imageUrls, setImageUrls] = useState<string[]>(() =>
    normalizeImageUrls(product?.image_urls),
  );
  const [pendingFiles, setPendingFiles] = useState<string[]>([]);

  const roots = categories.filter((c) => !c.parent_id);
  const categoryOptions = roots.flatMap((root) => {
    const children = categories.filter((c) => c.parent_id === root.id);
    return [
      { id: root.id, label: `${root.name} (main)` },
      ...children.map((c) => ({ id: c.id, label: `— ${c.name}` })),
    ];
  });

  function removeImage(url: string) {
    setImageUrls((prev) => prev.filter((u) => u !== url));
  }

  function addImageUrl(raw: string) {
    const url = raw.trim();
    if (!url || imageUrls.includes(url)) return;
    setImageUrls((prev) => [...prev, url]);
  }

  return (
    <form action={upsertProductAction} className="grid max-w-3xl gap-6">
      {product?.id && <input type="hidden" name="id" value={product.id} />}
      <input type="hidden" name="existing_images" value={imageUrls.join("\n")} />

      <section className="rounded-xl border border-line bg-white p-5 shadow-sm">
        <h2 className="text-sm font-semibold uppercase tracking-wide text-muted">
          Basic info
        </h2>
        <div className="mt-4 grid gap-4">
          <label className="block text-sm">
            <span className="admin-label">Product title *</span>
            <input
              name="title"
              defaultValue={product?.title}
              required
              className="admin-input"
              placeholder="e.g. Classic Boxing Gloves 12oz"
            />
          </label>
          <div className="grid gap-4 sm:grid-cols-2">
            <label className="block text-sm">
              <span className="admin-label">SKU *</span>
              <input
                name="sku"
                defaultValue={product?.sku}
                required
                className="admin-input"
                placeholder="MHK-BOX-12"
              />
            </label>
            <label className="block text-sm">
              <span className="admin-label">URL slug</span>
              <input
                name="slug"
                defaultValue={product?.slug}
                className="admin-input"
                placeholder="Auto from title if empty"
              />
            </label>
          </div>
          <label className="block text-sm">
            <span className="admin-label">Category *</span>
            <select
              name="category_id"
              defaultValue={product?.category_id}
              required
              className="admin-input"
            >
              <option value="">Select category</option>
              {categoryOptions.map((c) => (
                <option key={c.id} value={c.id}>
                  {c.label}
                </option>
              ))}
            </select>
          </label>
          <label className="block text-sm">
            <span className="admin-label">Description</span>
            <textarea
              name="description"
              defaultValue={product?.description}
              rows={5}
              className="admin-input"
              placeholder="Materials, use case, sizing notes…"
            />
          </label>
        </div>
      </section>

      <section className="rounded-xl border border-line bg-white p-5 shadow-sm">
        <h2 className="text-sm font-semibold uppercase tracking-wide text-muted">
          Pricing
        </h2>
        <div className="mt-4 grid gap-4 sm:grid-cols-2">
          <label className="block text-sm sm:col-span-2">
            <span className="flex items-center gap-2 font-medium text-ink">
              <input
                type="checkbox"
                checked={onSale}
                onChange={(e) => setOnSale(e.target.checked)}
              />
              This is a sale item (show Sale badge)
            </span>
            <span className="mt-1 block text-xs text-muted">
              When checked, enter a sale price below the regular price.
            </span>
          </label>
          <label className="block text-sm">
            <span className="admin-label">Regular price (PKR) *</span>
            <input
              name="original_price"
              type="number"
              step="1"
              min="0"
              defaultValue={product?.original_price ?? 0}
              required
              className="admin-input"
            />
          </label>
          <label className="block text-sm">
            <span className="admin-label">Sale price (PKR)</span>
            <input
              name="sale_price"
              type="number"
              step="1"
              min="0"
              defaultValue={
                onSale || initiallyOnSale ? (product?.sale_price ?? "") : ""
              }
              disabled={!onSale}
              className="admin-input disabled:bg-paper-deep disabled:opacity-60"
              placeholder={onSale ? "Discounted price" : "Enable sale above"}
            />
          </label>
          {!onSale && <input type="hidden" name="sale_price" value="" />}
          <label className="block text-sm sm:col-span-2">
            <span className="admin-label">Wholesale price (PKR)</span>
            <input
              name="wholesale_price"
              type="number"
              step="1"
              min="0"
              defaultValue={product?.wholesale_price ?? ""}
              className="admin-input"
              placeholder="Optional"
            />
          </label>
        </div>
      </section>

      <section className="rounded-xl border border-line bg-white p-5 shadow-sm">
        <h2 className="text-sm font-semibold uppercase tracking-wide text-muted">
          Specs & media
        </h2>
        <div className="mt-4 grid gap-4 sm:grid-cols-3">
          <label className="block text-sm">
            <span className="admin-label">Size</span>
            <input
              name="size"
              defaultValue={specs.size}
              className="admin-input"
              placeholder="12 oz / M"
            />
          </label>
          <label className="block text-sm">
            <span className="admin-label">Color</span>
            <input
              name="color"
              defaultValue={specs.color}
              className="admin-input"
              placeholder="Black / Red"
            />
          </label>
          <label className="block text-sm">
            <span className="admin-label">Material</span>
            <input
              name="material"
              defaultValue={specs.material}
              className="admin-input"
              placeholder="Leather"
            />
          </label>
        </div>

        <div className="mt-6">
          <p className="admin-label">Current images</p>
          {imageUrls.length === 0 ? (
            <p className="mt-2 text-sm text-muted">No images yet.</p>
          ) : (
            <ul className="mt-3 grid grid-cols-2 gap-3 sm:grid-cols-3">
              {imageUrls.map((url) => (
                <li
                  key={url}
                  className="group relative overflow-hidden rounded-lg border border-line bg-paper-deep"
                >
                  {/* eslint-disable-next-line @next/next/no-img-element */}
                  <img
                    src={url}
                    alt=""
                    className="aspect-square h-full w-full object-cover"
                  />
                  <button
                    type="button"
                    onClick={() => removeImage(url)}
                    className="absolute right-1.5 top-1.5 rounded bg-black/75 px-2 py-1 text-[0.65rem] font-semibold text-white opacity-100 transition hover:bg-danger sm:opacity-0 sm:group-hover:opacity-100"
                  >
                    Remove
                  </button>
                </li>
              ))}
            </ul>
          )}
        </div>

        <label className="mt-4 block text-sm">
          <span className="admin-label">Add image URL</span>
          <div className="mt-1 flex gap-2">
            <input
              type="url"
              id="add-image-url"
              className="admin-input"
              placeholder="https://…"
              onKeyDown={(e) => {
                if (e.key === "Enter") {
                  e.preventDefault();
                  addImageUrl((e.target as HTMLInputElement).value);
                  (e.target as HTMLInputElement).value = "";
                }
              }}
            />
            <button
              type="button"
              className="shrink-0 rounded-lg border border-line px-3 text-sm font-semibold text-ink hover:border-accent hover:text-accent"
              onClick={() => {
                const input = document.getElementById(
                  "add-image-url",
                ) as HTMLInputElement | null;
                if (!input) return;
                addImageUrl(input.value);
                input.value = "";
              }}
            >
              Add
            </button>
          </div>
        </label>

        <label className="mt-4 block text-sm">
          <span className="admin-label">Upload new images</span>
          <input
            name="images"
            type="file"
            accept="image/*"
            multiple
            className="mt-1 block w-full text-sm"
            onChange={(e) => {
              const files = Array.from(e.target.files ?? []);
              setPendingFiles(files.map((f) => f.name));
            }}
          />
          {pendingFiles.length > 0 && (
            <p className="mt-1 text-xs text-muted">
              {pendingFiles.length} file(s) will upload on save:{" "}
              {pendingFiles.join(", ")}
            </p>
          )}
        </label>

        <div className="mt-4 grid gap-4 sm:grid-cols-3">
          <label className="block text-sm">
            <span className="admin-label">Sort order</span>
            <input
              name="sort_order"
              type="number"
              defaultValue={product?.sort_order ?? 0}
              className="admin-input"
            />
          </label>
          <label className="flex items-end gap-2 pb-2 text-sm text-ink">
            <input
              name="in_stock"
              type="checkbox"
              defaultChecked={product?.in_stock ?? true}
            />
            In stock
          </label>
          <label className="flex items-end gap-2 pb-2 text-sm text-ink">
            <input
              name="featured"
              type="checkbox"
              defaultChecked={product?.featured ?? false}
            />
            Featured on home
          </label>
        </div>
      </section>

      <button
        type="submit"
        className="rounded-lg bg-accent px-6 py-3 text-sm font-bold uppercase tracking-wide text-white hover:bg-accent-dark"
      >
        {product ? "Save product" : "Create product"}
      </button>
    </form>
  );
}
