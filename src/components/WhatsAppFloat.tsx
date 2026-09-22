"use client";

import { MessageCircle } from "lucide-react";
import { site } from "@/lib/site";

export function WhatsAppFloat() {
  const href = `${site.whatsappUrl}?text=${encodeURIComponent(site.whatsappPrefill)}`;

  return (
    <a
      href={href}
      target="_blank"
      rel="noopener noreferrer"
      className="fixed bottom-5 right-5 z-50 flex items-center gap-2 rounded-full bg-[#25D366] px-4 py-3 text-sm font-semibold shadow-lg transition hover:scale-105 hover:shadow-xl"
      style={{ color: "#ffffff" }}
      aria-label="Chat on WhatsApp"
    >
      <MessageCircle className="h-5 w-5" aria-hidden />
      <span className="hidden sm:inline">WhatsApp</span>
    </a>
  );
}
