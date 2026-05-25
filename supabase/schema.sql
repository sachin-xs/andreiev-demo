-- ============================================================
-- ZiShop Static Data — Supabase Schema
-- Region: US East (North Virginia) — closest to New York
-- ============================================================

-- ─────────────────────────────────────────────
-- 1. HOMEPAGE CAROUSEL / SLIDER
-- ─────────────────────────────────────────────
create table if not exists slider_slides (
  id             serial primary key,
  title_key      text not null,          -- i18n translation key
  description_key text not null,         -- i18n translation key
  bg_img         text not null,          -- CSS url() string for background-image
  url            text not null default '/',
  display_order  int  not null default 0
);

-- ─────────────────────────────────────────────
-- 2. HOME BANNERS (with countdown timer)
-- ─────────────────────────────────────────────
create table if not exists banners (
  id                     serial primary key,
  title_key              text not null,
  description_key        text not null,
  button_text_key        text not null,
  img_src                text not null,
  img_width              int  not null,
  img_height             int  not null,
  discount_countdown_days int not null default 7,  -- days from "now" for the countdown
  href                   text not null default '/',
  display_order          int  not null default 0
);

-- ─────────────────────────────────────────────
-- 3. BENEFITS BAR (delivery, support, etc.)
-- ─────────────────────────────────────────────
create table if not exists benefits (
  id            serial primary key,
  img_src       text not null,
  title_key     text not null,
  display_order int  not null default 0
);

-- ─────────────────────────────────────────────
-- 4. BRANDS CAROUSEL
-- ─────────────────────────────────────────────
create table if not exists brands (
  id            serial primary key,
  name          text not null,
  img_src       text not null,
  display_order int  not null default 0
);

-- ─────────────────────────────────────────────
-- 5. CATEGORIES
--    Holds data for BOTH lg (homepage grid) and sm (mobile icon row)
--    lg_styles: the grid/flex positioning JSON used by CategoryLgBox
-- ─────────────────────────────────────────────
create table if not exists categories (
  id               serial primary key,
  name             text not null unique,       -- 'digital', 'fashion', etc.
  title_key        text not null,              -- i18n key
  description_key  text not null,              -- i18n key
  href             text not null,              -- route e.g. /digital
  bg_color_var     text not null,              -- CSS var e.g. var(--digital-category-bgc)
  bg_color_class   text not null,              -- Tailwind class e.g. digitalCategory

  -- large category image (used by CategoryLgBox)
  lg_img_src       text not null,
  lg_img_width     int  not null,
  lg_img_height    int  not null,
  lg_styles        jsonb,                      -- {flexDirection, paddingBlock, paddingInline, gridRow, gridColumn}
  lg_img_custom_styles jsonb,                  -- optional override e.g. {alignSelf: 'flex-start'}

  -- small category icon (used by CategorySmBox)
  sm_img_filename  text not null,              -- filename only e.g. 'digital-category.webp'

  display_order    int  not null default 0
);

-- ─────────────────────────────────────────────
-- 6. NAVIGATION — top-level menu categories
-- ─────────────────────────────────────────────
create table if not exists nav_categories (
  id            serial primary key,
  category_key  text not null unique,   -- 'digital', 'fashion', etc.
  icon_name     text not null,          -- react-icons identifier e.g. 'BsLaptop'
  display_order int  not null default 0
);

-- ─────────────────────────────────────────────
-- 7. NAVIGATION — product groups inside each category
-- ─────────────────────────────────────────────
create table if not exists nav_groups (
  id              serial primary key,
  nav_category_id int  not null references nav_categories(id) on delete cascade,
  title_key       text not null,        -- i18n key e.g. 'laptop', 'mobile'
  icon_name       text not null,
  display_order   int  not null default 0
);

-- ─────────────────────────────────────────────
-- 8. NAVIGATION — leaf subtitles (deepest level)
-- ─────────────────────────────────────────────
create table if not exists nav_subtitles (
  id            serial primary key,
  group_id      int  not null references nav_groups(id) on delete cascade,
  title_key     text not null,          -- i18n key e.g. 'asus', 'apple'
  display_order int  not null default 0
);

-- ─────────────────────────────────────────────
-- 9. NAVIGATION — extra menu items (Offers, Best Sells)
-- ─────────────────────────────────────────────
create table if not exists nav_extra_items (
  id            serial primary key,
  title_key     text not null,
  icon_name     text not null,
  href          text not null,
  display_order int  not null default 0
);

-- ─────────────────────────────────────────────
-- 10. FOOTER — columns
-- ─────────────────────────────────────────────
create table if not exists footer_columns (
  id            serial primary key,
  title_key     text not null,
  display_order int  not null default 0
);

-- ─────────────────────────────────────────────
-- 11. FOOTER — links inside each column
-- ─────────────────────────────────────────────
create table if not exists footer_links (
  id            serial primary key,
  column_id     int  not null references footer_columns(id) on delete cascade,
  text_key      text not null,
  href          text not null,
  display_order int  not null default 0
);

-- ─────────────────────────────────────────────
-- 12. SOCIAL MEDIA LINKS
-- ─────────────────────────────────────────────
create table if not exists social_media (
  id            serial primary key,
  name          text not null,
  icon_name     text not null,          -- react-icons identifier
  href          text not null,
  display_order int  not null default 0
);

-- ─────────────────────────────────────────────
-- 13. PRODUCT LIST SORT OPTIONS
-- ─────────────────────────────────────────────
create table if not exists sort_options (
  id            serial primary key,
  value_key     text not null,          -- i18n key e.g. 'all', 'cheapest'
  display_order int  not null default 0
);

-- ─────────────────────────────────────────────
-- INDEXES for fast lookups
-- ─────────────────────────────────────────────
create index if not exists idx_categories_name         on categories(name);
create index if not exists idx_nav_groups_category     on nav_groups(nav_category_id);
create index if not exists idx_nav_subtitles_group     on nav_subtitles(group_id);
create index if not exists idx_footer_links_column     on footer_links(column_id);

-- ─────────────────────────────────────────────
-- ROW LEVEL SECURITY — all tables public READ only
-- (no auth needed to read static content)
-- ─────────────────────────────────────────────
alter table slider_slides    enable row level security;
alter table banners          enable row level security;
alter table benefits         enable row level security;
alter table brands           enable row level security;
alter table categories       enable row level security;
alter table nav_categories   enable row level security;
alter table nav_groups       enable row level security;
alter table nav_subtitles    enable row level security;
alter table nav_extra_items  enable row level security;
alter table footer_columns   enable row level security;
alter table footer_links     enable row level security;
alter table social_media     enable row level security;
alter table sort_options     enable row level security;

-- Allow anyone (anon key) to SELECT
create policy "public read slider_slides"   on slider_slides   for select using (true);
create policy "public read banners"         on banners         for select using (true);
create policy "public read benefits"        on benefits        for select using (true);
create policy "public read brands"          on brands          for select using (true);
create policy "public read categories"      on categories      for select using (true);
create policy "public read nav_categories"  on nav_categories  for select using (true);
create policy "public read nav_groups"      on nav_groups      for select using (true);
create policy "public read nav_subtitles"   on nav_subtitles   for select using (true);
create policy "public read nav_extra_items" on nav_extra_items for select using (true);
create policy "public read footer_columns"  on footer_columns  for select using (true);
create policy "public read footer_links"    on footer_links    for select using (true);
create policy "public read social_media"    on social_media    for select using (true);
create policy "public read sort_options"    on sort_options    for select using (true);
