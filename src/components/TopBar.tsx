import Link from "next/link";

const messages = [
  "Sale on selected fight gear — shop best sellers",
  "Wholesale & custom branding available",
  "WhatsApp +92 321 7100177",
  "Global dispatch · Retail & bulk orders",
];

function Track() {
  return (
    <div className="flex shrink-0 items-center gap-10 px-6" aria-hidden>
      {messages.map((text) => (
        <span key={text} className="inline-flex items-center gap-10">
          <span>{text}</span>
          <span className="text-accent">◆</span>
        </span>
      ))}
      <Link href="/products" className="font-semibold hover:text-accent">
        Shop now
      </Link>
      <span className="text-accent">◆</span>
    </div>
  );
}

export function TopBar() {
  return (
    <div className="relative z-[60] overflow-hidden bg-header text-white">
      <p className="sr-only">{messages.join(" · ")}</p>
      <div className="flex w-max py-2 text-[0.65rem] tracking-[0.14em] uppercase text-white/85 marquee-track">
        <Track />
        <Track />
      </div>
    </div>
  );
}
