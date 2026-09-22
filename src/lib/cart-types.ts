export type CartItem = {
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

export type CheckoutPayload = {
  customerName: string;
  phone: string;
  email?: string;
  address: string;
  city: string;
  notes?: string;
  paymentMethod: "cod";
  items: CartItem[];
};

export type OrderResult = {
  ok: boolean;
  orderNumber?: string;
  error?: string;
};
