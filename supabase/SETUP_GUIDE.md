# Supabase Setup Guide — ZiShop Static Data

## 1. Create Your Supabase Project

1. Go to **https://supabase.com** → Sign in / Create a free account
2. Click **"New project"**
3. Fill in:
   | Field | Value |
   |---|---|
   | **Name** | `zishop` (or anything you like) |
   | **Database password** | Generate a strong one — save it |
   | **Region** | **`East US (North Virginia)`** ← closest to New York |
4. Click **"Create new project"** — takes ~2 min to provision

---

## 2. Get Your API Keys

1. In your project dashboard → **Project Settings** (gear icon, bottom-left)
2. Click **"API"** tab
3. Copy two values:
   - **Project URL** → looks like `https://abcdefgh.supabase.co`
   - **anon / public key** → a long JWT string

---

## 3. Set Environment Variables

Copy `.env.local.example` → `.env.local` and fill in:

```env
NEXT_PUBLIC_SUPABASE_URL=https://YOUR_PROJECT_REF.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=YOUR_ANON_PUBLIC_KEY
```

> `.env.local` is already in `.gitignore` — never commit it.

---

## 4. Run the Schema (create tables)

1. In Supabase dashboard → **SQL Editor** (left sidebar, looks like `</>`)
2. Click **"New query"**
3. Open `supabase/schema.sql` from this project → **copy all** → paste into editor
4. Click **"Run"** (green button) → you should see "Success. No rows returned"

---

## 5. Run the Seed (insert data)

1. In **SQL Editor** → click **"New query"** again
2. Open `supabase/seed.sql` from this project → **copy all** → paste into editor
3. Click **"Run"** → "Success"
4. Verify: click **"Table Editor"** in the left sidebar → you should see your 13 tables filled with data

---

## 6. How the Code Uses It

### In `getStaticProps` (server-side, build time)

```tsx
// pages/index.tsx — example
import { getSliderSlides, getBenefits, getBrands } from "../lib/staticData";

export const getStaticProps = async () => {
  const [slides, benefits, brands] = await Promise.all([
    getSliderSlides(),
    getBenefits(),
    getBrands(),
  ]);
  return { props: { slides, benefits, brands } };
};
```

### Available fetch functions

| Function | Replaces | Returns |
|---|---|---|
| `getSliderSlides()` | `mock/slider.js` | `SliderSlide[]` |
| `getBanners()` | `mock/banner.js` | `Banner[]` |
| `getBenefits()` | `mock/benefits.js` | `Benefit[]` |
| `getBrands()` | `mock/brand.js` | `Brand[]` |
| `getCategories()` | `mock/category-lg.js` + `mock/category-sm.js` | `Category[]` |
| `getNavMenu()` | `mock/menuItems.js` | `NavCategory[]` (full tree) |
| `getNavExtraItems()` | `mock/menuItems.js → extraMenu` | `NavExtraItem[]` |
| `getFooterData()` | `mock/footer.js → footerContent` | `FooterColumn[]` |
| `getSocialMedia()` | `mock/footer.js → socialMedia` | `SocialMedia[]` |
| `getSortOptions()` | `mock/sortRadioInput.js` | `SortOption[]` |

---

## 7. Verify Connection (quick test)

Add this temporarily to any `getStaticProps` to test:

```ts
import { supabase } from "../lib/supabase";

const { data } = await supabase.from("benefits").select("*");
console.log("Benefits from Supabase:", data);
```

---

## Why US East (North Virginia)?

Supabase hosts on AWS. The **US East (North Virginia)** region (`us-east-1`) is the AWS
data center closest to New York City (~10 ms latency). This gives:
- Fast cold starts for `getStaticProps` at build time
- Fast API responses if you ever switch to `getServerSideProps`
- Low latency for any client-side Supabase calls

---

## Free Tier Limits (Supabase)

| Resource | Free limit |
|---|---|
| Database size | 500 MB |
| Bandwidth | 5 GB/month |
| API requests | Unlimited |
| Projects | 2 active |

These static content tables use well under 1 MB total — the free tier is fine forever for this use case.
