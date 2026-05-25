/**
 * staticData.ts
 * ─────────────────────────────────────────────────────────────
 * Drop-in replacements for every mock/* import in the project.
 * Each function fetches from Supabase, ordered by display_order.
 *
 * Usage in getStaticProps / getServerSideProps:
 *   import { getSliderSlides } from "../lib/staticData";
 *   const slides = await getSliderSlides();
 *
 * All functions return typed arrays; on error they throw so
 * Next.js catches it in build-time data fetching.
 * ─────────────────────────────────────────────────────────────
 */

import { supabase } from "./supabase";

// ─── Types ───────────────────────────────────────────────────

export interface SliderSlide {
  id: number;
  title_key: string;
  description_key: string;
  bg_img: string;
  url: string;
  display_order: number;
}

export interface Banner {
  id: number;
  title_key: string;
  description_key: string;
  button_text_key: string;
  img_src: string;
  img_width: number;
  img_height: number;
  discount_countdown_days: number;
  href: string;
  display_order: number;
}

export interface Benefit {
  id: number;
  img_src: string;
  title_key: string;
  display_order: number;
}

export interface Brand {
  id: number;
  name: string;
  img_src: string;
  display_order: number;
}

export interface Category {
  id: number;
  name: string;
  title_key: string;
  description_key: string;
  href: string;
  bg_color_var: string;
  bg_color_class: string;
  lg_img_src: string;
  lg_img_width: number;
  lg_img_height: number;
  lg_styles: {
    flexDirection: string;
    paddingBlock: string;
    paddingInline: string;
    gridRow: string;
    gridColumn: string;
    textAlign?: string;
  };
  lg_img_custom_styles: Record<string, string> | null;
  sm_img_filename: string;
  display_order: number;
}

export interface NavSubtitle {
  id: number;
  group_id: number;
  title_key: string;
  display_order: number;
}

export interface NavGroup {
  id: number;
  nav_category_id: number;
  title_key: string;
  icon_name: string;
  display_order: number;
  subtitles?: NavSubtitle[];
}

export interface NavCategory {
  id: number;
  category_key: string;
  icon_name: string;
  display_order: number;
  groups?: NavGroup[];
}

export interface NavExtraItem {
  id: number;
  title_key: string;
  icon_name: string;
  href: string;
  display_order: number;
}

export interface FooterLink {
  id: number;
  column_id: number;
  text_key: string;
  href: string;
  display_order: number;
}

export interface FooterColumn {
  id: number;
  title_key: string;
  display_order: number;
  links?: FooterLink[];
}

export interface SocialMedia {
  id: number;
  name: string;
  icon_name: string;
  href: string;
  display_order: number;
}

export interface SortOption {
  id: number;
  value_key: string;
  display_order: number;
}

// ─── Fetchers ────────────────────────────────────────────────

async function fetchOrThrow<T>(
  table: string,
  select = "*",
  order = "display_order"
): Promise<T[]> {
  const { data, error } = await supabase
    .from(table)
    .select(select)
    .order(order);
  if (error) throw new Error(`[Supabase] ${table}: ${error.message}`);
  return (data ?? []) as T[];
}

/** Homepage hero carousel slides */
export const getSliderSlides = () =>
  fetchOrThrow<SliderSlide>("slider_slides");

/** Homepage promotional banners with countdown timers */
export const getBanners = () =>
  fetchOrThrow<Banner>("banners");

/** Benefits bar (delivery, support, warranty, etc.) */
export const getBenefits = () =>
  fetchOrThrow<Benefit>("benefits");

/** Brand logos carousel */
export const getBrands = () =>
  fetchOrThrow<Brand>("brands");

/** All categories (used by both lg grid and sm icon row) */
export const getCategories = () =>
  fetchOrThrow<Category>("categories");

/** Sort radio-button options for the product list */
export const getSortOptions = () =>
  fetchOrThrow<SortOption>("sort_options");

/** Extra nav items (Offers, Best Sells) */
export const getNavExtraItems = () =>
  fetchOrThrow<NavExtraItem>("nav_extra_items");

/**
 * Full navigation tree: categories → groups → subtitles
 * Returns the same shape as the old mock/menuItems.js
 */
export const getNavMenu = async (): Promise<NavCategory[]> => {
  // 1. top-level categories
  const categories = await fetchOrThrow<NavCategory>(
    "nav_categories",
    "*",
    "display_order"
  );

  // 2. all groups (one query, not N)
  const { data: groups, error: gErr } = await supabase
    .from("nav_groups")
    .select("*")
    .order("display_order");
  if (gErr) throw new Error(`[Supabase] nav_groups: ${gErr.message}`);

  // 3. all subtitles (one query, not N)
  const { data: subtitles, error: sErr } = await supabase
    .from("nav_subtitles")
    .select("*")
    .order("display_order");
  if (sErr) throw new Error(`[Supabase] nav_subtitles: ${sErr.message}`);

  // 4. assemble the tree in memory (3 total queries regardless of depth)
  return categories.map((cat) => ({
    ...cat,
    groups: (groups ?? [])
      .filter((g) => g.nav_category_id === cat.id)
      .map((g) => ({
        ...g,
        subtitles: (subtitles ?? []).filter((s) => s.group_id === g.id),
      })),
  }));
};

/**
 * Footer columns including their links
 */
export const getFooterData = async (): Promise<FooterColumn[]> => {
  const columns = await fetchOrThrow<FooterColumn>(
    "footer_columns",
    "*",
    "display_order"
  );

  const { data: links, error } = await supabase
    .from("footer_links")
    .select("*")
    .order("display_order");
  if (error) throw new Error(`[Supabase] footer_links: ${error.message}`);

  return columns.map((col) => ({
    ...col,
    links: (links ?? []).filter((l) => l.column_id === col.id),
  }));
};

/** Social media links */
export const getSocialMedia = () =>
  fetchOrThrow<SocialMedia>("social_media");
