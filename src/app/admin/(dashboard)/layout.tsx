import Link from "next/link";
import { logoutAction } from "@/app/admin/actions";

export default function AdminDashboardLayout({
  children,
}: LayoutProps<"/admin">) {
  return (
    <div className="mx-auto flex min-h-screen max-w-6xl flex-col px-4 py-6 sm:px-6">
      <header className="flex flex-wrap items-center justify-between gap-4 border-b border-line pb-4">
        <nav className="flex flex-wrap gap-4 text-sm">
          <Link href="/admin" className="font-display text-xl text-accent">
            Admin
          </Link>
          <Link href="/admin/categories" className="text-ink-soft hover:text-accent">
            Categories
          </Link>
          <Link href="/admin/products" className="text-ink-soft hover:text-accent">
            Products
          </Link>
          <Link href="/admin/orders" className="text-ink-soft hover:text-accent">
            Orders
          </Link>
          <Link href="/" className="text-muted hover:text-accent">
            Storefront
          </Link>
        </nav>
        <form action={logoutAction}>
          <button
            type="submit"
            className="text-sm text-muted hover:text-danger"
          >
            Log out
          </button>
        </form>
      </header>
      <div className="flex-1 py-8">{children}</div>
    </div>
  );
}
