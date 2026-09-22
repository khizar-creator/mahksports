import { NextResponse } from "next/server";
import type { CartItem } from "@/lib/cart-types";
import { createOrderNumber, sendOrderEmailToAdmin } from "@/lib/email";
import { hasSupabaseConfig } from "@/lib/supabase/client";
import { createClient } from "@/lib/supabase/server";

export const runtime = "nodejs";

type OrderBody = {
  customerName?: string;
  phone?: string;
  email?: string;
  address?: string;
  city?: string;
  notes?: string;
  paymentMethod?: string;
  items?: CartItem[];
};

export async function POST(req: Request) {
  try {
    const body = (await req.json()) as OrderBody;

    const customerName = (body.customerName || "").trim();
    const phone = (body.phone || "").trim();
    const email = (body.email || "").trim();
    const address = (body.address || "").trim();
    const city = (body.city || "").trim();
    const notes = (body.notes || "").trim();
    const items = Array.isArray(body.items) ? body.items : [];

    if (!customerName || !phone || !address || !city) {
      return NextResponse.json(
        { ok: false, error: "Please fill name, phone, city and address." },
        { status: 400 },
      );
    }

    if (body.paymentMethod && body.paymentMethod !== "cod") {
      return NextResponse.json(
        { ok: false, error: "Only Cash on Delivery is available." },
        { status: 400 },
      );
    }

    if (items.length === 0) {
      return NextResponse.json(
        { ok: false, error: "Your cart is empty." },
        { status: 400 },
      );
    }

    for (const item of items) {
      if (
        !item?.productId ||
        !item?.title ||
        !item?.sku ||
        !Number.isFinite(item.price) ||
        !Number.isFinite(item.quantity) ||
        item.quantity < 1
      ) {
        return NextResponse.json(
          { ok: false, error: "Invalid cart items." },
          { status: 400 },
        );
      }
    }

    if (!hasSupabaseConfig()) {
      return NextResponse.json(
        {
          ok: false,
          error: "Orders are temporarily unavailable. Please WhatsApp us.",
        },
        { status: 503 },
      );
    }

    const subtotal = items.reduce(
      (sum, item) => sum + item.price * item.quantity,
      0,
    );
    const orderNumber = createOrderNumber();

    const supabase = await createClient();
    const { error: insertError } = await supabase.from("orders").insert({
      order_number: orderNumber,
      customer_name: customerName,
      phone,
      email: email || null,
      address,
      city,
      notes,
      payment_method: "cod",
      status: "new",
      subtotal,
      items,
    });

    if (insertError) {
      console.error("Order insert failed:", insertError);
      return NextResponse.json(
        {
          ok: false,
          error:
            insertError.message.includes("relation") ||
            insertError.code === "42P01"
              ? "Orders table is missing. Run supabase/orders.sql in Supabase."
              : "Could not save order. Please try again or WhatsApp us.",
        },
        { status: 500 },
      );
    }

    // Email is optional — never fail the checkout if Resend is down/unconfigured
    try {
      await sendOrderEmailToAdmin({
        orderNumber,
        customerName,
        phone,
        email: email || undefined,
        address,
        city,
        notes: notes || undefined,
        items,
        subtotal,
      });
    } catch (err) {
      console.error("Order email skipped (order saved):", err);
    }

    return NextResponse.json({ ok: true, orderNumber });
  } catch (err) {
    console.error("Order failed:", err);
    const message =
      err instanceof Error
        ? err.message
        : "Could not place order. Please try again or WhatsApp us.";
    return NextResponse.json({ ok: false, error: message }, { status: 500 });
  }
}
