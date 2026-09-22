export type ProductSpecifications = {
  size?: string;
  color?: string;
  material?: string;
  weight_class?: string;
  [key: string]: string | undefined;
};

export type Category = {
  id: string;
  parent_id: string | null;
  name: string;
  slug: string;
  description: string | null;
  image_url: string | null;
  sort_order: number;
  created_at?: string;
};

export type Product = {
  id: string;
  category_id: string;
  title: string;
  slug: string;
  sku: string;
  description: string;
  original_price: number;
  sale_price: number | null;
  wholesale_price: number | null;
  image_urls: string[];
  in_stock: boolean;
  specifications: ProductSpecifications;
  featured: boolean;
  sort_order: number;
  created_at?: string;
  updated_at?: string;
};

export type ProductWithCategory = Product & {
  category: Category;
};

export type WholesaleInquiry = {
  id?: string;
  business_name: string;
  email: string;
  phone: string;
  category_item: string;
  quantity: string;
  branding_specs: string;
  delivery_notes: string;
  created_at?: string;
};

export type OrderStatus =
  | "new"
  | "confirmed"
  | "shipped"
  | "delivered"
  | "cancelled";

export type OrderItemSnapshot = {
  productId: string;
  slug: string;
  title: string;
  sku: string;
  price: number;
  image: string;
  quantity: number;
  size?: string;
  color?: string;
  material?: string;
};

export type Order = {
  id: string;
  order_number: string;
  customer_name: string;
  phone: string;
  email: string | null;
  address: string;
  city: string;
  notes: string;
  payment_method: string;
  status: OrderStatus;
  subtotal: number;
  items: OrderItemSnapshot[];
  created_at: string;
  updated_at?: string;
};
