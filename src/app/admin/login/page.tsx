import Link from "next/link";
import { loginAction } from "@/app/admin/actions";

type PageProps = {
  searchParams: Promise<{ error?: string; next?: string }>;
};

export default async function AdminLoginPage({ searchParams }: PageProps) {
  const { error, next } = await searchParams;

  return (
    <div className="flex min-h-screen items-center justify-center px-4">
      <div className="w-full max-w-md rounded-2xl border border-line bg-surface p-8">
        <Link href="/" className="font-display text-2xl text-accent">
          MAHKSPORTS Admin
        </Link>
        <p className="mt-2 text-sm text-muted">Sign in with Supabase Auth</p>

        {error && (
          <p className="mt-4 rounded-lg border border-danger/40 bg-danger/10 px-3 py-2 text-sm text-danger">
            {error}
          </p>
        )}

        <form action={loginAction} className="mt-6 space-y-4">
          <input type="hidden" name="next" value={next ?? "/admin"} />
          <label className="block text-sm">
            <span className="text-muted">Email</span>
            <input
              name="email"
              type="email"
              required
              className="mt-1 w-full rounded-lg border border-line bg-white px-3 py-2"
            />
          </label>
          <label className="block text-sm">
            <span className="text-muted">Password</span>
            <input
              name="password"
              type="password"
              required
              className="mt-1 w-full rounded-lg border border-line bg-white px-3 py-2"
            />
          </label>
          <button
            type="submit"
            className="w-full rounded-lg bg-accent py-2.5 text-sm font-bold text-void"
          >
            Sign in
          </button>
        </form>
      </div>
    </div>
  );
}
