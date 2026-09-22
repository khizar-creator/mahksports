import { NextResponse } from "next/server";
import { sendWholesaleEmailToAdmin } from "@/lib/email";
import { createClient } from "@/lib/supabase/server";
import { hasSupabaseConfig } from "@/lib/supabase/client";

export const runtime = "nodejs";

type WholesaleBody = {
  businessName?: string;
  email?: string;
  phone?: string;
  categoryItem?: string;
  quantity?: string;
  brandingSpecs?: string;
  deliveryNotes?: string;
};

export async function POST(req: Request) {
  try {
    const body = (await req.json()) as WholesaleBody;

    const businessName = (body.businessName || "").trim();
    const email = (body.email || "").trim();
    const phone = (body.phone || "").trim();
    const categoryItem = (body.categoryItem || "").trim();
    const quantity = (body.quantity || "").trim();
    const brandingSpecs = (body.brandingSpecs || "").trim();
    const deliveryNotes = (body.deliveryNotes || "").trim();

    if (
      !businessName ||
      !email ||
      !phone ||
      !categoryItem ||
      !quantity ||
      !brandingSpecs
    ) {
      return NextResponse.json(
        { ok: false, error: "Please complete all required fields." },
        { status: 400 },
      );
    }

    if (hasSupabaseConfig()) {
      try {
        const supabase = await createClient();
        await supabase.from("inquiries").insert({
          business_name: businessName,
          email,
          phone,
          category_item: categoryItem,
          quantity,
          branding_specs: brandingSpecs,
          delivery_notes: deliveryNotes,
        });
      } catch {
        // Email is primary notification path
      }
    }

    await sendWholesaleEmailToAdmin({
      businessName,
      email,
      phone,
      categoryItem,
      quantity,
      brandingSpecs,
      deliveryNotes,
    });

    return NextResponse.json({ ok: true });
  } catch (err) {
    console.error("Wholesale inquiry failed:", err);
    const message =
      err instanceof Error ? err.message : "Could not send inquiry.";
    return NextResponse.json({ ok: false, error: message }, { status: 500 });
  }
}
