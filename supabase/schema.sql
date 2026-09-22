-- MAHKSPORTS — Supabase schema (safe to re-run)
-- Run in Supabase SQL editor, then run seed.sql

create extension if not exists "pgcrypto";

-- ---------------------------------------------------------------------------
-- Categories (hierarchical via parent_id)
-- ---------------------------------------------------------------------------
create table if not exists public.categories (
  id uuid primary key default gen_random_uuid(),
  parent_id uuid references public.categories(id) on delete set null,
  name text not null,
  slug text not null unique,
  description text,
  image_url text,
  sort_order int not null default 0,
  created_at timestamptz not null default now()
);

create index if not exists categories_parent_idx on public.categories(parent_id);

-- ---------------------------------------------------------------------------
-- Products
-- ---------------------------------------------------------------------------
create table if not exists public.products (
  id uuid primary key default gen_random_uuid(),
  category_id uuid not null references public.categories(id) on delete restrict,
  title text not null,
  slug text not null unique,
  sku text not null unique,
  description text not null default '',
  original_price numeric(12, 2) not null check (original_price >= 0),
  sale_price numeric(12, 2) check (sale_price is null or sale_price >= 0),
  wholesale_price numeric(12, 2) check (wholesale_price is null or wholesale_price >= 0),
  image_urls text[] not null default '{}',
  in_stock boolean not null default true,
  specifications jsonb not null default '{}'::jsonb,
  featured boolean not null default false,
  sort_order int not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- Add columns if upgrading an older table
alter table public.products add column if not exists wholesale_price numeric(12, 2);
alter table public.categories add column if not exists parent_id uuid references public.categories(id) on delete set null;

create index if not exists products_category_idx on public.products(category_id);
create index if not exists products_featured_idx on public.products(featured) where featured = true;

create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists products_set_updated_at on public.products;
create trigger products_set_updated_at
  before update on public.products
  for each row execute function public.set_updated_at();

-- ---------------------------------------------------------------------------
-- Wholesale inquiries (optional persistence)
-- ---------------------------------------------------------------------------
create table if not exists public.inquiries (
  id uuid primary key default gen_random_uuid(),
  business_name text not null,
  email text not null,
  phone text not null,
  category_item text not null,
  quantity text not null,
  branding_specs text not null default '',
  delivery_notes text not null default '',
  created_at timestamptz not null default now()
);

-- ---------------------------------------------------------------------------
-- Orders (COD checkout)
-- ---------------------------------------------------------------------------
create table if not exists public.orders (
  id uuid primary key default gen_random_uuid(),
  order_number text not null unique,
  customer_name text not null,
  phone text not null,
  email text,
  address text not null,
  city text not null,
  notes text not null default '',
  payment_method text not null default 'cod',
  status text not null default 'new'
    check (status in ('new', 'confirmed', 'shipped', 'delivered', 'cancelled')),
  subtotal numeric(12, 2) not null check (subtotal >= 0),
  items jsonb not null default '[]'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists orders_created_idx on public.orders (created_at desc);
create index if not exists orders_status_idx on public.orders (status);

drop trigger if exists orders_set_updated_at on public.orders;
create trigger orders_set_updated_at
  before update on public.orders
  for each row execute function public.set_updated_at();

-- ---------------------------------------------------------------------------
-- Row Level Security
-- ---------------------------------------------------------------------------
alter table public.categories enable row level security;
alter table public.products enable row level security;
alter table public.inquiries enable row level security;
alter table public.orders enable row level security;

drop policy if exists "Public read categories" on public.categories;
create policy "Public read categories"
  on public.categories for select
  using (true);

drop policy if exists "Public read products" on public.products;
create policy "Public read products"
  on public.products for select
  using (true);

drop policy if exists "Authenticated manage categories" on public.categories;
create policy "Authenticated manage categories"
  on public.categories for all
  to authenticated
  using (true)
  with check (true);

drop policy if exists "Authenticated manage products" on public.products;
create policy "Authenticated manage products"
  on public.products for all
  to authenticated
  using (true)
  with check (true);

drop policy if exists "Anyone insert inquiries" on public.inquiries;
create policy "Anyone insert inquiries"
  on public.inquiries for insert
  with check (true);

drop policy if exists "Authenticated read inquiries" on public.inquiries;
create policy "Authenticated read inquiries"
  on public.inquiries for select
  to authenticated
  using (true);

drop policy if exists "Anyone insert orders" on public.orders;
create policy "Anyone insert orders"
  on public.orders for insert
  with check (true);

drop policy if exists "Authenticated read orders" on public.orders;
create policy "Authenticated read orders"
  on public.orders for select
  to authenticated
  using (true);

drop policy if exists "Authenticated update orders" on public.orders;
create policy "Authenticated update orders"
  on public.orders for update
  to authenticated
  using (true)
  with check (true);

-- ---------------------------------------------------------------------------
-- Site images (hero / about / banners)
-- ---------------------------------------------------------------------------
create table if not exists public.site_images (
  id uuid primary key default gen_random_uuid(),
  key text not null unique,
  path text not null,
  url text not null,
  folder text not null default 'site',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists site_images_folder_idx on public.site_images (folder);

drop trigger if exists site_images_set_updated_at on public.site_images;
create trigger site_images_set_updated_at
  before update on public.site_images
  for each row execute function public.set_updated_at();

grant usage on schema public to anon, authenticated, service_role;
grant select on table public.site_images to anon, authenticated, service_role;
grant all on table public.site_images to authenticated, service_role;

alter table public.site_images enable row level security;

drop policy if exists "Public read site images" on public.site_images;
create policy "Public read site images"
  on public.site_images for select
  to anon, authenticated
  using (true);

-- Matches existing admin model (authenticated Supabase users)
drop policy if exists "Authenticated manage site images" on public.site_images;
create policy "Authenticated manage site images"
  on public.site_images for all
  to authenticated
  using (true)
  with check (true);

-- ---------------------------------------------------------------------------
-- Storage: product-images + site-images
-- ---------------------------------------------------------------------------
insert into storage.buckets (id, name, public)
values ('product-images', 'product-images', true)
on conflict (id) do update set public = true;

insert into storage.buckets (id, name, public)
values ('site-images', 'site-images', true)
on conflict (id) do update set public = true;

drop policy if exists "Public read product images" on storage.objects;
create policy "Public read product images"
  on storage.objects for select
  using (bucket_id = 'product-images');

drop policy if exists "Authenticated upload product images" on storage.objects;
create policy "Authenticated upload product images"
  on storage.objects for insert
  to authenticated
  with check (bucket_id = 'product-images');

drop policy if exists "Authenticated update product images" on storage.objects;
create policy "Authenticated update product images"
  on storage.objects for update
  to authenticated
  using (bucket_id = 'product-images')
  with check (bucket_id = 'product-images');

drop policy if exists "Authenticated delete product images" on storage.objects;
create policy "Authenticated delete product images"
  on storage.objects for delete
  to authenticated
  using (bucket_id = 'product-images');

drop policy if exists "Public read site images storage" on storage.objects;
create policy "Public read site images storage"
  on storage.objects for select
  using (bucket_id = 'site-images');

drop policy if exists "Authenticated upload site images" on storage.objects;
create policy "Authenticated upload site images"
  on storage.objects for insert
  to authenticated
  with check (bucket_id = 'site-images');

drop policy if exists "Authenticated update site images" on storage.objects;
create policy "Authenticated update site images"
  on storage.objects for update
  to authenticated
  using (bucket_id = 'site-images')
  with check (bucket_id = 'site-images');

drop policy if exists "Authenticated delete site images" on storage.objects;
create policy "Authenticated delete site images"
  on storage.objects for delete
  to authenticated
  using (bucket_id = 'site-images');
