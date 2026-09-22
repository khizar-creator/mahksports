import type { ReactNode } from "react";

/** Polished payment method badges for the storefront footer */

type BadgeProps = {
  label: string;
  children: ReactNode;
  className?: string;
};

function Badge({ label, children, className = "bg-white" }: BadgeProps) {
  return (
    <li>
      <span
        title={label}
        aria-label={label}
        className={`group inline-flex h-10 w-[58px] items-center justify-center overflow-hidden rounded-md shadow-[0_2px_8px_rgba(0,0,0,0.35)] ring-1 ring-white/10 transition duration-200 hover:-translate-y-0.5 hover:shadow-[0_6px_16px_rgba(0,0,0,0.45)] ${className}`}
      >
        {children}
      </span>
    </li>
  );
}

export function PaymentIcons() {
  return (
    <div className="flex w-full flex-col items-center gap-3">
      <p className="text-[0.65rem] font-semibold uppercase tracking-[0.22em] text-white/40">
        We accept
      </p>
      <ul
        className="flex flex-wrap items-center justify-center gap-2.5 sm:gap-3"
        aria-label="Payment methods"
      >
        {/* Visa */}
        <Badge label="Visa" className="bg-[#1A1F71]">
          <svg viewBox="0 0 48 32" className="h-6 w-9" aria-hidden>
            <text
              x="24"
              y="21"
              textAnchor="middle"
              fill="#fff"
              fontSize="14"
              fontFamily="Arial, Helvetica, sans-serif"
              fontStyle="italic"
              fontWeight="800"
              letterSpacing="-0.5"
            >
              VISA
            </text>
          </svg>
        </Badge>

        {/* Mastercard */}
        <Badge label="Mastercard" className="bg-[#1a1a1a]">
          <svg viewBox="0 0 48 32" className="h-7 w-10" aria-hidden>
            <circle cx="19" cy="16" r="9" fill="#EB001B" />
            <circle cx="29" cy="16" r="9" fill="#F79E1B" />
            <path
              fill="#FF5F00"
              d="M24 8.7a9 9 0 0 1 0 14.6 9 9 0 0 1 0-14.6z"
            />
          </svg>
        </Badge>

        {/* Amex */}
        <Badge label="American Express" className="bg-[#2E77BC]">
          <svg viewBox="0 0 48 32" className="h-6 w-10" aria-hidden>
            <text
              x="24"
              y="20"
              textAnchor="middle"
              fill="#fff"
              fontSize="11"
              fontFamily="Arial, Helvetica, sans-serif"
              fontWeight="800"
              letterSpacing="0.5"
            >
              AMEX
            </text>
          </svg>
        </Badge>

        {/* PayPal */}
        <Badge label="PayPal" className="bg-white">
          <svg viewBox="0 0 48 32" className="h-6 w-10" aria-hidden>
            <text
              x="24"
              y="20"
              textAnchor="middle"
              fontSize="12"
              fontFamily="Arial, Helvetica, sans-serif"
              fontWeight="800"
              fontStyle="italic"
            >
              <tspan fill="#003087">Pay</tspan>
              <tspan fill="#009CDE">Pal</tspan>
            </text>
          </svg>
        </Badge>

        {/* Apple Pay */}
        <Badge label="Apple Pay" className="bg-black">
          <svg viewBox="0 0 48 32" className="h-6 w-10" aria-hidden>
            <path
              fill="#fff"
              d="M16.2 11.2c.6-.7 1-1.6.9-2.5-.8.1-1.9.6-2.5 1.3-.6.7-1.1 1.6-.9 2.5 1 .1 1.9-.5 2.5-1.3zm.6 1.2c-1.4-.1-2.5.8-3.2.8-.7 0-1.7-.7-2.8-.7-1.4 0-2.8.8-3.5 2.1-1.5 2.6-.4 6.4 1.1 8.5.7 1 1.5 2.1 2.7 2.1 1.1 0 1.5-.7 2.8-.7s1.6.7 2.8.7c1.1 0 1.9-1 2.6-2 .8-1.1 1.1-2.2 1.1-2.3 0 0-2.2-.8-2.2-3.2 0-2 1.6-3 1.7-3-.9-1.3-2.3-1.5-2.9-1.5-.1 0-.2 0-.2 0z"
            />
            <text
              x="34"
              y="21"
              textAnchor="middle"
              fill="#fff"
              fontSize="11"
              fontFamily="Arial, Helvetica, sans-serif"
              fontWeight="600"
            >
              Pay
            </text>
          </svg>
        </Badge>

        {/* Google Pay */}
        <Badge label="Google Pay" className="bg-white">
          <svg viewBox="0 0 48 32" className="h-6 w-10" aria-hidden>
            <text
              x="24"
              y="20"
              textAnchor="middle"
              fontSize="11"
              fontFamily="Arial, Helvetica, sans-serif"
              fontWeight="700"
            >
              <tspan fill="#4285F4">G</tspan>
              <tspan fill="#EA4335">o</tspan>
              <tspan fill="#FBBC05">o</tspan>
              <tspan fill="#4285F4">g</tspan>
              <tspan fill="#34A853">l</tspan>
              <tspan fill="#EA4335">e</tspan>
              <tspan fill="#5F6368"> Pay</tspan>
            </text>
          </svg>
        </Badge>

        {/* Klarna */}
        <Badge label="Klarna" className="bg-[#FFB3C7]">
          <svg viewBox="0 0 48 32" className="h-6 w-10" aria-hidden>
            <text
              x="24"
              y="20"
              textAnchor="middle"
              fill="#0A0B09"
              fontSize="11"
              fontFamily="Arial, Helvetica, sans-serif"
              fontWeight="800"
            >
              Klarna
            </text>
          </svg>
        </Badge>

        {/* Discover */}
        <Badge label="Discover" className="bg-white">
          <svg viewBox="0 0 48 32" className="h-7 w-11" aria-hidden>
            <circle cx="36" cy="16" r="8" fill="#F47216" />
            <text
              x="18"
              y="19"
              textAnchor="middle"
              fill="#1a1a1a"
              fontSize="7"
              fontFamily="Arial, Helvetica, sans-serif"
              fontWeight="800"
              letterSpacing="0.3"
            >
              DISCOVER
            </text>
          </svg>
        </Badge>

        {/* COD */}
        <Badge label="Cash on Delivery" className="bg-accent">
          <span className="text-[0.7rem] font-bold tracking-[0.12em] text-white">
            COD
          </span>
        </Badge>
      </ul>
    </div>
  );
}
