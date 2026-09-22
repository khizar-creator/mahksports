"use client";

import { useMemo, useState } from "react";
import { useCart } from "@/components/CartProvider";
import { formatPrice } from "@/lib/site";
import type { ProductWithCategory } from "@/lib/types";

type AddToCartButtonsProps = {
  product: ProductWithCategory;
};

function parseOptions(specValue?: string) {
  if (!specValue) return ["One size"];
  if (specValue.includes("/")) {
    return specValue.split("/").map((s) => s.trim());
  }
  if (specValue.includes("–") || specValue.includes("-")) {
    return specValue
      .split(/[–-]/)
      .map((s) => s.trim())
      .filter(Boolean);
  }
  return [specValue];
}

export function AddToCartButtons({ product }: AddToCartButtonsProps) {
  const { addItem } = useCart();
  const price = product.sale_price ?? product.original_price;

  const sizes = useMemo(
    () => parseOptions(product.specifications.size),
    [product.specifications.size],
  );
  const colors = useMemo(
    () => parseOptions(product.specifications.color),
    [product.specifications.color],
  );
  const materials = useMemo(
    () => parseOptions(product.specifications.material),
    [product.specifications.material],
  );

  const [size, setSize] = useState(sizes[0]);
  const [color, setColor] = useState(colors[0]);
  const [material, setMaterial] = useState(materials[0]);
  const [qty, setQty] = useState(1);

  const disabled = !product.in_stock;

  return (
    <div className="mt-8 space-y-5">
      {sizes.length > 1 && (
        <div>
          <p className="mb-2 text-xs font-semibold uppercase tracking-widest text-muted">
            Size
          </p>
          <div className="flex flex-wrap gap-2">
            {sizes.map((s) => (
              <button
                key={s}
                type="button"
                onClick={() => setSize(s)}
                className={`rounded-lg border px-3 py-2 text-sm ${
                  size === s
                    ? "border-accent bg-accent/10 text-accent"
                    : "border-line text-ink-soft hover:border-accent/50"
                }`}
              >
                {s}
              </button>
            ))}
          </div>
        </div>
      )}

      {colors.length > 1 && (
        <div>
          <p className="mb-2 text-xs font-semibold uppercase tracking-widest text-muted">
            Color
          </p>
          <div className="flex flex-wrap gap-2">
            {colors.map((c) => (
              <button
                key={c}
                type="button"
                onClick={() => setColor(c)}
                className={`rounded-lg border px-3 py-2 text-sm ${
                  color === c
                    ? "border-accent bg-accent/10 text-accent"
                    : "border-line text-ink-soft hover:border-accent/50"
                }`}
              >
                {c}
              </button>
            ))}
          </div>
        </div>
      )}

      {materials.length > 1 && (
        <div>
          <p className="mb-2 text-xs font-semibold uppercase tracking-widest text-muted">
            Material
          </p>
          <div className="flex flex-wrap gap-2">
            {materials.map((m) => (
              <button
                key={m}
                type="button"
                onClick={() => setMaterial(m)}
                className={`rounded-lg border px-3 py-2 text-sm ${
                  material === m
                    ? "border-accent bg-accent/10 text-accent"
                    : "border-line text-ink-soft hover:border-accent/50"
                }`}
              >
                {m}
              </button>
            ))}
          </div>
        </div>
      )}

      <div className="flex flex-wrap items-center gap-4">
        <label className="flex items-center gap-2 text-sm text-ink-soft">
          Qty
          <input
            type="number"
            min={1}
            max={99}
            value={qty}
            onChange={(e) => setQty(Math.max(1, Number(e.target.value) || 1))}
            className="w-16 rounded-lg border border-line bg-white px-2 py-2 text-center text-ink"
          />
        </label>
        <button
          type="button"
          disabled={disabled}
          onClick={() =>
            addItem(
              {
                productId: product.id,
                slug: product.slug,
                title: product.title,
                sku: product.sku,
                price,
                image: product.image_urls[0] ?? "",
                size,
                color,
                material,
              },
              qty,
            )
          }
          style={{ color: "#ffffff" }}
          className="flex-1 bg-accent px-6 py-3 text-sm font-bold uppercase tracking-wide transition hover:bg-accent-dark disabled:cursor-not-allowed disabled:opacity-40"
        >
          {disabled ? "Out of stock" : `Add to cart — ${formatPrice(price)}`}
        </button>
      </div>

      {product.wholesale_price != null && (
        <p className="text-sm text-muted">
          Wholesale from{" "}
          <span className="font-semibold text-accent">
            {formatPrice(product.wholesale_price)}
          </span>
          {" · "}
          <a href="/wholesale" className="underline hover:text-accent">
            Request bulk pricing
          </a>
        </p>
      )}
    </div>
  );
}
