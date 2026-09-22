import {
  Headset,
  PackageCheck,
  RefreshCw,
  ShieldCheck,
  Truck,
} from "lucide-react";

const items = [
  {
    Icon: Truck,
    title: "Fast dispatch",
    text: "Orders packed quickly for Pakistan-wide delivery.",
  },
  {
    Icon: ShieldCheck,
    title: "Secure checkout",
    text: "Cash on Delivery with clear order confirmation.",
  },
  {
    Icon: RefreshCw,
    title: "Easy support",
    text: "WhatsApp us for size, wholesale, or tracking help.",
  },
  {
    Icon: PackageCheck,
    title: "Quality checked",
    text: "Gear inspected before it leaves our warehouse.",
  },
  {
    Icon: Headset,
    title: "Expert advice",
    text: "Fighters and gyms get real product guidance.",
  },
] as const;

export function TrustBar() {
  return (
    <section className="border-t border-line bg-white">
      <div className="mx-auto grid max-w-7xl gap-6 px-4 py-10 sm:grid-cols-2 sm:px-6 md:grid-cols-5 md:px-8 md:py-12">
        {items.map(({ Icon, title, text }) => (
          <div key={title} className="flex flex-col items-start gap-3 text-left">
            <span className="inline-flex h-11 w-11 items-center justify-center border border-line text-accent">
              <Icon className="h-5 w-5" strokeWidth={1.75} />
            </span>
            <div>
              <p className="font-display text-lg text-ink">{title}</p>
              <p className="mt-1 text-sm leading-relaxed text-ink-soft">{text}</p>
            </div>
          </div>
        ))}
      </div>
    </section>
  );
}
