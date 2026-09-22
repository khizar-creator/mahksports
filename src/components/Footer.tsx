import Link from "next/link";
import { Mail, MapPin, Phone } from "lucide-react";
import { PaymentIcons } from "@/components/PaymentIcons";
import { site, waHref } from "@/lib/site";

function FacebookIcon({ className }: { className?: string }) {
  return (
    <svg viewBox="0 0 24 24" className={className} fill="currentColor" aria-hidden>
      <path d="M14 9h3V6h-3c-1.6 0-3 1.3-3 3v2H8v3h3v7h3v-7h3l1-3h-4V9c0-.6.4-1 1-1z" />
    </svg>
  );
}

function InstagramIcon({ className }: { className?: string }) {
  return (
    <svg viewBox="0 0 24 24" className={className} fill="currentColor" aria-hidden>
      <path d="M7 2h10a5 5 0 0 1 5 5v10a5 5 0 0 1-5 5H7a5 5 0 0 1-5-5V7a5 5 0 0 1 5-5zm0 2a3 3 0 0 0-3 3v10a3 3 0 0 0 3 3h10a3 3 0 0 0 3-3V7a3 3 0 0 0-3-3H7zm5 3.5A4.5 4.5 0 1 1 7.5 12 4.5 4.5 0 0 1 12 7.5zm0 2A2.5 2.5 0 1 0 14.5 12 2.5 2.5 0 0 0 12 9.5zM17.5 6.8a1.1 1.1 0 1 1-1.1 1.1 1.1 1.1 0 1 1 1.1-1.1z" />
    </svg>
  );
}

function YoutubeIcon({ className }: { className?: string }) {
  return (
    <svg viewBox="0 0 24 24" className={className} fill="currentColor" aria-hidden>
      <path d="M23.5 6.2a3 3 0 0 0-2.1-2.1C19.5 3.5 12 3.5 12 3.5s-7.5 0-9.4.6A3 3 0 0 0 .5 6.2 31.5 31.5 0 0 0 0 12a31.5 31.5 0 0 0 .5 5.8 3 3 0 0 0 2.1 2.1c1.9.6 9.4.6 9.4.6s7.5 0 9.4-.6a3 3 0 0 0 2.1-2.1A31.5 31.5 0 0 0 24 12a31.5 31.5 0 0 0-.5-5.8zM9.8 15.5v-7l6.2 3.5-6.2 3.5z" />
    </svg>
  );
}

function TikTokIcon({ className }: { className?: string }) {
  return (
    <svg viewBox="0 0 24 24" className={className} fill="currentColor" aria-hidden>
      <path d="M19.59 6.69a4.83 4.83 0 0 1-3.77-4.25V2h-3.45v13.67a2.89 2.89 0 0 1-2.88 2.5 2.89 2.89 0 0 1-2.89-2.89 2.89 2.89 0 0 1 2.89-2.89c.28 0 .54.04.79.1v-3.5a6.37 6.37 0 0 0-.79-.05A6.34 6.34 0 0 0 3.15 15.2a6.34 6.34 0 0 0 6.34 6.34 6.34 6.34 0 0 0 6.34-6.34V8.73a8.19 8.19 0 0 0 4.76 1.52V6.84a4.84 4.84 0 0 1-1-.15z" />
    </svg>
  );
}

function WhatsAppIcon({ className }: { className?: string }) {
  return (
    <svg viewBox="0 0 24 24" className={className} fill="currentColor" aria-hidden>
      <path d="M20.5 3.5A11 11 0 0 0 2.9 17.7L2 22l4.4-.9A11 11 0 1 0 20.5 3.5zM12 20.2a9.1 9.1 0 0 1-4.6-1.3l-.3-.2-3.4.9.9-3.3-.2-.3A9.1 9.1 0 1 1 12 20.2zm5-6.8c-.3-.1-1.6-.8-1.9-.9-.2-.1-.4-.1-.6.1-.2.3-.7.9-.8 1-.2.1-.3.2-.6.1s-1.2-.4-2.3-1.4c-.9-.8-1.4-1.7-1.6-2-.2-.3 0-.4.1-.5l.4-.5c.1-.2.2-.3.3-.5.1-.2 0-.4 0-.5l-.8-2c-.2-.5-.4-.4-.6-.4h-.5c-.2 0-.5.1-.7.3-.2.3-.9.9-.9 2.2s.9 2.5 1.1 2.7c.1.2 1.8 2.8 4.4 3.9 2.1.9 2.6.8 3.1.7.5-.1 1.5-.6 1.7-1.2.2-.5.2-1 .1-1.1-.1-.2-.3-.2-.5-.3z" />
    </svg>
  );
}

const socialLinks = [
  {
    href: site.socials.facebook,
    label: "Facebook",
    Icon: FacebookIcon,
    className:
      "bg-[#1877F2] text-white shadow-[0_4px_14px_rgba(24,119,242,0.45)] hover:bg-[#0f66d8] hover:shadow-[0_6px_18px_rgba(24,119,242,0.55)]",
  },
  {
    href: site.socials.instagram,
    label: "Instagram",
    Icon: InstagramIcon,
    className:
      "bg-gradient-to-br from-[#f58529] via-[#dd2a7b] to-[#8134af] text-white shadow-[0_4px_14px_rgba(221,42,123,0.45)] hover:brightness-110 hover:shadow-[0_6px_18px_rgba(221,42,123,0.55)]",
  },
  {
    href: site.socials.youtube,
    label: "YouTube",
    Icon: YoutubeIcon,
    className:
      "bg-[#FF0000] text-white shadow-[0_4px_14px_rgba(255,0,0,0.4)] hover:bg-[#e00000] hover:shadow-[0_6px_18px_rgba(255,0,0,0.5)]",
  },
  {
    href: site.socials.tiktok,
    label: "TikTok",
    Icon: TikTokIcon,
    className:
      "bg-white text-black shadow-[0_4px_14px_rgba(255,255,255,0.25)] hover:bg-accent hover:text-white hover:shadow-[0_6px_18px_rgba(225,29,46,0.45)]",
  },
] as const;

function LocationColumn({
  location,
  phone,
}: {
  location: (typeof site.locations)[number];
  phone: (typeof site.phones)[number];
}) {
  return (
    <div className="max-w-[200px]">
      <p className="text-[0.7rem] font-semibold uppercase tracking-[0.2em] text-white/45">
        {location.label}
      </p>
      <div className="mt-3 overflow-hidden rounded-md border border-white/12">
        <div className="flex items-start gap-1.5 px-2 py-1.5">
          <MapPin className="mt-0.5 h-3.5 w-3.5 shrink-0 text-accent" strokeWidth={2.5} />
          <div className="min-w-0 leading-tight">
            <p className="text-xs font-medium text-white">{location.line1}</p>
            <p className="text-[0.7rem] text-white/50">{location.line2}</p>
          </div>
        </div>
        <a
          href={location.mapsUrl}
          target="_blank"
          rel="noreferrer"
          className="block border-t border-white/10"
          aria-label={`Open map of ${location.full}`}
        >
          <iframe
            title={`${site.name} — ${location.label}`}
            src={location.mapsEmbedUrl}
            className="pointer-events-none h-[72px] w-full border-0"
            loading="lazy"
            referrerPolicy="no-referrer-when-downgrade"
            allowFullScreen
          />
        </a>
      </div>
      <a
        href={`tel:${phone.e164}`}
        className="mt-2 inline-flex items-center gap-1.5 text-xs text-white/75 transition hover:text-accent"
      >
        <Phone className="h-3.5 w-3.5 shrink-0 text-accent" />
        {phone.display}
      </a>
    </div>
  );
}

export function Footer() {
  const [pakistan, ireland] = site.locations;
  const [pkPhone, euPhone] = site.phones;

  return (
    <footer className="mt-auto border-t border-line bg-header text-white">
      <div className="mx-auto grid max-w-7xl gap-8 px-4 py-10 sm:grid-cols-2 sm:px-6 md:grid-cols-3 lg:grid-cols-5 lg:gap-6 lg:px-8 lg:py-12">
        <div>
          <p className="font-display text-3xl tracking-wider" style={{ color: "#ffffff" }}>
            MAHK<span className="text-accent">SPORTS</span>
          </p>
          <p className="mt-2 text-sm leading-relaxed text-white/65">
            {site.tagline}
          </p>
          <p className="mt-5 text-[0.65rem] font-semibold uppercase tracking-[0.2em] text-white/45">
            Follow us
          </p>
          <div className="mt-2.5 flex flex-nowrap items-center gap-3">
            {socialLinks.map(({ href, label, Icon, className }) => (
              <a
                key={label}
                href={href}
                target="_blank"
                rel="noreferrer"
                aria-label={label}
                className={`inline-flex h-11 w-11 shrink-0 items-center justify-center rounded-full transition duration-200 hover:-translate-y-0.5 sm:h-12 sm:w-12 ${className}`}
              >
                <Icon className="h-5 w-5" />
              </a>
            ))}
          </div>
          <div className="mt-4 flex flex-col gap-1.5">
            <a
              href={`mailto:${site.email}`}
              className="inline-flex w-fit items-center gap-2 rounded-md border border-white/20 bg-white/5 px-3 py-1.5 text-xs font-semibold text-white transition hover:border-accent hover:bg-accent"
            >
              <Mail className="h-3.5 w-3.5 shrink-0" />
              Email us
            </a>
            <a
              href={waHref(site.whatsappPrefill)}
              target="_blank"
              rel="noreferrer"
              className="inline-flex w-fit items-center gap-2 rounded-md bg-[#25D366] px-3 py-1.5 text-xs font-semibold text-white transition hover:bg-[#1ebe57]"
            >
              <WhatsAppIcon className="h-3.5 w-3.5 shrink-0" />
              WhatsApp
            </a>
          </div>
        </div>

        <div>
          <p className="text-[0.7rem] font-semibold uppercase tracking-[0.2em] text-white/45">
            Shop
          </p>
          <ul className="mt-3 space-y-1.5 text-sm text-white/80">
            <li>
              <Link href="/products" className="hover:text-accent">
                All products
              </Link>
            </li>
            <li>
              <Link href="/products/mix-martial-arts" className="hover:text-accent">
                Mix Martial Arts
              </Link>
            </li>
            <li>
              <Link href="/products/sports-wear" className="hover:text-accent">
                Sports Wear
              </Link>
            </li>
            <li>
              <Link href="/wholesale" className="hover:text-accent">
                Wholesale inquiry
              </Link>
            </li>
          </ul>
        </div>

        <div>
          <p className="text-[0.7rem] font-semibold uppercase tracking-[0.2em] text-white/45">
            Company
          </p>
          <ul className="mt-3 space-y-1.5 text-sm text-white/80">
            <li>
              <Link href="/about" className="hover:text-accent">
                About us
              </Link>
            </li>
            <li>
              <Link href="/vision" className="hover:text-accent">
                Our vision
              </Link>
            </li>
            <li>
              <Link href="/privacy" className="hover:text-accent">
                Privacy policy
              </Link>
            </li>
            <li>
              <Link href="/terms" className="hover:text-accent">
                Terms & conditions
              </Link>
            </li>
            <li>
              <Link href="/returns" className="hover:text-accent">
                Return policy
              </Link>
            </li>
            <li>
              <Link href="/admin/login" className="hover:text-accent">
                Admin
              </Link>
            </li>
          </ul>
        </div>

        <LocationColumn location={pakistan} phone={pkPhone} />
        <LocationColumn location={ireland} phone={euPhone} />
      </div>

      <div className="border-t border-white/10 px-4 py-4 sm:px-6 md:px-8">
        <div className="mx-auto flex max-w-7xl flex-col items-center gap-3">
          <PaymentIcons />
          <div className="flex w-full flex-col items-center justify-between gap-2 text-center text-xs text-white/40 sm:flex-row">
            <p>
              © {new Date().getFullYear()} {site.name}. All rights reserved.
            </p>
            <p>
              Developed by{" "}
              <a
                href="https://quantrodigital.com"
                target="_blank"
                rel="noreferrer"
                className="text-white/70 underline-offset-2 hover:text-accent hover:underline"
              >
                Quantro Digital
              </a>
            </p>
          </div>
        </div>
      </div>
    </footer>
  );
}
