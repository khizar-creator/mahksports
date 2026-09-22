import { CartDrawer } from "@/components/CartDrawer";
import { CartProvider } from "@/components/CartProvider";
import { Footer } from "@/components/Footer";
import { Header } from "@/components/Header";
import { TopBar } from "@/components/TopBar";
import { TrustBar } from "@/components/TrustBar";
import { WhatsAppFloat } from "@/components/WhatsAppFloat";
import { getCategories } from "@/lib/data";

export default async function StoreLayout({
  children,
}: LayoutProps<"/">) {
  const categories = await getCategories();

  return (
    <CartProvider>
      <TopBar />
      <Header categories={categories} />
      <main className="flex-1 bg-paper">{children}</main>
      <TrustBar />
      <Footer />
      <CartDrawer />
      <WhatsAppFloat />
    </CartProvider>
  );
}
