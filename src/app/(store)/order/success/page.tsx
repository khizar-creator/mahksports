import Link from "next/link";

type PageProps = {
  searchParams: Promise<{ order?: string }>;
};

export default async function OrderSuccessPage({ searchParams }: PageProps) {
  const { order } = await searchParams;

  return (
    <div className="mx-auto max-w-lg px-4 py-20 text-center">
      <h1 className="font-display text-4xl text-accent">Order received</h1>
      {order && (
        <p className="mt-4 text-ink-soft">
          Reference:{" "}
          <span className="font-mono text-accent" style={{ color: "#e11d2e" }}>
            {order}
          </span>
        </p>
      )}
      <p className="mt-4 text-sm text-muted">
        We will contact you shortly to confirm delivery.
      </p>
      <Link
        href="/products"
        style={{ color: "#ffffff" }}
        className="mt-8 inline-block bg-accent px-6 py-3 text-sm font-bold hover:bg-accent-dark"
      >
        Continue shopping
      </Link>
    </div>
  );
}
