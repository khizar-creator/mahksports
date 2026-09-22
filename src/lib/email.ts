import { Resend } from "resend";
import { formatPrice, site } from "@/lib/site";
import type { CartItem } from "@/lib/cart-types";

export function createOrderNumber() {
  const stamp = Date.now().toString(36).toUpperCase();
  const rand = Math.random().toString(36).slice(2, 6).toUpperCase();
  return `MHK-${stamp}-${rand}`;
}

type OrderEmailInput = {
  orderNumber: string;
  customerName: string;
  phone: string;
  email?: string;
  address: string;
  city: string;
  notes?: string;
  items: CartItem[];
  subtotal: number;
};

export type WholesaleEmailInput = {
  businessName: string;
  email: string;
  phone: string;
  categoryItem: string;
  quantity: string;
  brandingSpecs: string;
  deliveryNotes: string;
};

export async function sendOrderEmailToAdmin(order: OrderEmailInput) {
  const apiKey = process.env.RESEND_API_KEY;
  if (!apiKey) {
    console.warn("RESEND_API_KEY missing — order email skipped.");
    return;
  }

  const adminEmail = process.env.ADMIN_EMAIL || site.email;
  const fromEmail =
    process.env.RESEND_FROM || "MAHKSPORTS <onboarding@resend.dev>";

  const resend = new Resend(apiKey);

  const lines = order.items
    .map((item) => {
      const variant = [item.size, item.color, item.material]
        .filter(Boolean)
        .join(", ");
      const variantNote = variant ? ` (${variant})` : "";
      return `• ${item.title}${variantNote} (${item.sku}) × ${item.quantity} — ${formatPrice(item.price * item.quantity)}`;
    })
    .join("\n");

  const text = [
    `New order — ${site.name}`,
    ``,
    `Order #: ${order.orderNumber}`,
    `Payment: Cash on Delivery`,
    ``,
    `Customer: ${order.customerName}`,
    `Phone: ${order.phone}`,
    order.email ? `Email: ${order.email}` : null,
    `City: ${order.city}`,
    `Address: ${order.address}`,
    order.notes ? `Notes: ${order.notes}` : null,
    ``,
    `Items:`,
    lines,
    ``,
    `Subtotal: ${formatPrice(order.subtotal)}`,
  ]
    .filter(Boolean)
    .join("\n");

  const html = `
    <div style="font-family:Manrope,Arial,sans-serif;background:#07080a;color:#ffffff;padding:24px;line-height:1.5">
      <h2 style="margin:0 0 8px;color:#c8f542">New MAHKSPORTS order</h2>
      <p style="margin:0 0 16px;color:#a8adb8">Order # ${order.orderNumber} · COD</p>
      <p style="color:#ffffff"><strong>${escapeHtml(order.customerName)}</strong><br/>
      ${escapeHtml(order.phone)}<br/>
      ${order.email ? `${escapeHtml(order.email)}<br/>` : ""}
      ${escapeHtml(order.city)} — ${escapeHtml(order.address)}
      ${order.notes ? `<br/>Notes: ${escapeHtml(order.notes)}` : ""}</p>
      <table style="width:100%;margin:16px 0;border-collapse:collapse;color:#ffffff">
        ${order.items
          .map(
            (item) => `
          <tr>
            <td style="padding:8px 0;border-bottom:1px solid #111318">${escapeHtml(item.title)}<br/><span style="color:#a8adb8;font-size:12px">${escapeHtml(item.sku)}</span></td>
            <td align="right" style="padding:8px 0;border-bottom:1px solid #111318">×${item.quantity}</td>
            <td align="right" style="padding:8px 0;border-bottom:1px solid #111318">${formatPrice(item.price * item.quantity)}</td>
          </tr>`,
          )
          .join("")}
      </table>
      <p style="font-size:18px;color:#c8f542"><strong>Total: ${formatPrice(order.subtotal)}</strong></p>
    </div>
  `;

  const { error } = await resend.emails.send({
    from: fromEmail,
    to: adminEmail,
    replyTo: order.email || undefined,
    subject: `Order ${order.orderNumber} — ${order.customerName}`,
    text,
    html,
  });

  if (error) {
    throw new Error(error.message || "Failed to send order email.");
  }
}

export async function sendWholesaleEmailToAdmin(input: WholesaleEmailInput) {
  const apiKey = process.env.RESEND_API_KEY;
  if (!apiKey) {
    throw new Error(
      "Email is not configured. Add RESEND_API_KEY to .env.local.",
    );
  }

  const adminEmail = process.env.ADMIN_EMAIL || site.email;
  const fromEmail =
    process.env.RESEND_FROM || "MAHKSPORTS <onboarding@resend.dev>";
  const resend = new Resend(apiKey);

  const text = [
    `Wholesale inquiry — ${site.name}`,
    ``,
    `Business: ${input.businessName}`,
    `Email: ${input.email}`,
    `Phone: ${input.phone}`,
    `Category / Item: ${input.categoryItem}`,
    `Quantity: ${input.quantity}`,
    `Branding / Specs: ${input.brandingSpecs}`,
    `Delivery notes: ${input.deliveryNotes}`,
  ].join("\n");

  const html = `
    <div style="font-family:Manrope,Arial,sans-serif;background:#07080a;color:#ffffff;padding:24px">
      <h2 style="color:#c8f542">Wholesale inquiry</h2>
      <p><strong>Business:</strong> ${escapeHtml(input.businessName)}</p>
      <p><strong>Email:</strong> ${escapeHtml(input.email)}</p>
      <p><strong>Phone:</strong> ${escapeHtml(input.phone)}</p>
      <p><strong>Category / Item:</strong> ${escapeHtml(input.categoryItem)}</p>
      <p><strong>Quantity:</strong> ${escapeHtml(input.quantity)}</p>
      <p><strong>Branding / Specs:</strong><br/>${escapeHtml(input.brandingSpecs)}</p>
      <p><strong>Delivery notes:</strong><br/>${escapeHtml(input.deliveryNotes)}</p>
    </div>
  `;

  const { error } = await resend.emails.send({
    from: fromEmail,
    to: adminEmail,
    replyTo: input.email,
    subject: `Wholesale — ${input.businessName}`,
    text,
    html,
  });

  if (error) {
    throw new Error(error.message || "Failed to send wholesale email.");
  }
}

function escapeHtml(value: string) {
  return value
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;");
}
