export default function AdminRootLayout({
  children,
}: LayoutProps<"/admin">) {
  return (
    <div className="min-h-screen bg-paper text-ink">{children}</div>
  );
}
