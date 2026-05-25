-- ============================================================
-- ZiShop Static Data — Seed (run AFTER schema.sql)
-- ============================================================

-- ─────────────────────────────────────────────
-- 1. SLIDER SLIDES
-- ─────────────────────────────────────────────
insert into slider_slides (title_key, description_key, bg_img, url, display_order) values
  ('digitalBT',    'digitalBD',    'url(''/images/slider-img/digital-banner.webp'')',    '/', 1),
  ('stationeryBT', 'stationeryBD', 'url(''/images/slider-img/stationery-banner.webp'')', '/', 2),
  ('toyBT',        'toyBD',        'url(''/images/slider-img/toy-banner.webp'')',         '/', 3),
  ('houseBT',      'houseBD',      'url(''/images/slider-img/house-banner.webp'')',       '/', 4),
  ('fashionBT',    'fashionBD',    'url(''/images/slider-img/fashion-banner.webp'')',     '/', 5),
  ('beautyBT',     'beautyBD',     'url(''/images/slider-img/beauty-banner.webp'')',      '/', 6);

-- ─────────────────────────────────────────────
-- 2. BANNERS
-- ─────────────────────────────────────────────
insert into banners (title_key, description_key, button_text_key, img_src, img_width, img_height, discount_countdown_days, href, display_order) values
  ('larisaTitle', 'larisaDescription', 'see', '/images/banners-img/home1.webp', 980, 500, 9, '/', 1),
  ('romanoTitle', 'romanoDescription', 'see', '/images/banners-img/home2.webp', 980, 500, 7, '/', 2);

-- ─────────────────────────────────────────────
-- 3. BENEFITS
-- ─────────────────────────────────────────────
insert into benefits (img_src, title_key, display_order) values
  ('/images/benefit-icons/005-delivery-truck-2.webp', 'deliver',         1),
  ('/images/benefit-icons/003-cash-on-delivery.webp', 'cash',            2),
  ('/images/benefit-icons/004-headphones.webp',       'support',         3),
  ('/images/benefit-icons/006-best-seller.webp',      'warrantyBenefit', 4);

-- ─────────────────────────────────────────────
-- 4. BRANDS
-- ─────────────────────────────────────────────
insert into brands (name, img_src, display_order) values
  ('adidas',        '/images/brand-logo-img/adidas.webp',        1),
  ('apple',         '/images/brand-logo-img/apple.webp',         2),
  ('asus',          '/images/brand-logo-img/asus.webp',          3),
  ('benq',          '/images/brand-logo-img/benq.webp',          4),
  ('bvlgari',       '/images/brand-logo-img/bvlgari.webp',       5),
  ('dell',          '/images/brand-logo-img/del.webp',           6),
  ('dior',          '/images/brand-logo-img/dior.webp',          7),
  ('dolce-gabbana', '/images/brand-logo-img/dolce-gabbana.webp', 8),
  ('gucci',         '/images/brand-logo-img/gucci.webp',         9),
  ('hp',            '/images/brand-logo-img/hp.webp',            10),
  ('lg',            '/images/brand-logo-img/lg.webp',            11),
  ('loreal',        '/images/brand-logo-img/loreal.webp',        12),
  ('louis-vuitton', '/images/brand-logo-img/louis-vuitton.webp', 13),
  ('mac',           '/images/brand-logo-img/mac.webp',           14),
  ('maybelline',    '/images/brand-logo-img/maybelline.webp',    15),
  ('msi',           '/images/brand-logo-img/msi.webp',           16),
  ('patek-philippe','/images/brand-logo-img/patek-philippe.webp',17),
  ('puma',          '/images/brand-logo-img/puma.webp',          18),
  ('rolex',         '/images/brand-logo-img/rolex.webp',         19),
  ('samsung',       '/images/brand-logo-img/samsung.webp',       20),
  ('sony',          '/images/brand-logo-img/sony.webp',          21),
  ('toshiba',       '/images/brand-logo-img/toshiba.webp',       22),
  ('versace',       '/images/brand-logo-img/versace.webp',       23),
  ('xiaomi',        '/images/brand-logo-img/xiaomi.webp',        24);

-- ─────────────────────────────────────────────
-- 5. CATEGORIES
-- ─────────────────────────────────────────────
insert into categories (
  name, title_key, description_key, href,
  bg_color_var, bg_color_class,
  lg_img_src, lg_img_width, lg_img_height, lg_styles, lg_img_custom_styles,
  sm_img_filename, display_order
) values
(
  'digital', 'digitalCategoryTitle', 'digitalCategoryDescription', '/digital',
  'var(--digital-category-bgc)', 'digitalCategory',
  '/images/category-img/digital-category.webp', 190, 240,
  '{"flexDirection":"row","paddingBlock":"2rem","paddingInline":"1rem","gridRow":"span 6 / span 6","gridColumn":"span 3 / span 3"}',
  null,
  'digital-category.webp', 1
),
(
  'fashion', 'fashionCategoryTitle', 'fashionCategoryDescription', '/fashion',
  'var(--fashion-category-bgc)', 'fashionCategory',
  '/images/category-img/fashion-category.webp', 240, 250,
  '{"flexDirection":"row","paddingInline":"1rem","paddingBlock":"unset","gridRow":"span 6 / span 6","gridColumn":"span 3 / span 3"}',
  null,
  'fashion-category.webp', 2
),
(
  'beauty', 'beautyCategoryTitle', 'beautyCategoryDescription', '/beauty',
  'var(--beauty-category-bgc)', 'beautyCategory',
  '/images/category-img/beauty-category.webp', 170, 150,
  '{"flexDirection":"row","paddingInline":"1rem","paddingBlock":"0.5rem","gridRow":"span 3 / span 3","gridColumn":"span 3 / span 3"}',
  null,
  'beauty-category.webp', 3
),
(
  'sport', 'sportCategoryTitle', 'sportCategoryDescription', '/sport',
  'var(--sport-category-bgc)', 'sportCategory',
  '/images/category-img/sport-category.webp', 130, 150,
  '{"flexDirection":"row-reverse","paddingInline":"unset","paddingBlock":"0.5rem","gridRow":"span 3 / span 3","gridColumn":"span 3 / span 3"}',
  null,
  'sport-category.webp', 4
),
(
  'house', 'houseCategoryTitle', 'houseCategoryDescription', '/house',
  'var(--house-category-bgc)', 'houseCategory',
  '/images/category-img/house-category.webp', 320, 240,
  '{"flexDirection":"row","paddingInline":"1rem","paddingBlock":"unset","gridRow":"span 2 / span 2","gridColumn":"span 5 / span 5"}',
  null,
  'house-category.webp', 5
),
(
  'toy', 'toyCategoryTitle', 'toyCategoryDescription', '/toy',
  'var(--toy-category-bgc)', 'toyCategory',
  '/images/category-img/toy-category.webp', 130, 110,
  '{"flexDirection":"column","paddingInline":"0.5rem","paddingBlock":"0.5rem","textAlign":"center","gridRow":"span 2 / span 2","gridColumn":"span 2 / span 2"}',
  null,
  'toy-category.webp', 6
),
(
  'stationery', 'stationeryCategoryTitle', 'stationeryCategoryDescription', '/stationery',
  'var(--stationery-category-bgc)', 'stationeryCategory',
  '/images/category-img/stationery-category.webp', 130, 250,
  '{"flexDirection":"row","paddingInline":"0.75rem","paddingBlock":"unset","gridRow":"span 2 / span 2","gridColumn":"span 2 / span 2"}',
  '{"alignSelf":"flex-start"}',
  'stationery-category.webp', 7
);

-- ─────────────────────────────────────────────
-- 6. NAV CATEGORIES (top-level menu)
-- ─────────────────────────────────────────────
insert into nav_categories (category_key, icon_name, display_order) values
  ('digital',    'BsLaptop',         1),
  ('fashion',    'IoShirtOutline',    2),
  ('toys',       'MdOutlineToys',     3),
  ('cosmetic',   'RiHeartPulseLine',  4),
  ('home',       'AiOutlineHome',     5),
  ('sport',      'BiFootball',        6),
  ('stationery', 'BsBook',           7);

-- ─────────────────────────────────────────────
-- 7 & 8. NAV GROUPS + SUBTITLES
-- ─────────────────────────────────────────────

-- digital → laptop
insert into nav_groups (nav_category_id, title_key, icon_name, display_order)
  select id, 'laptop', 'BsLaptop', 1 from nav_categories where category_key = 'digital';
insert into nav_subtitles (group_id, title_key, display_order)
  select g.id, s.title_key, s.ord
  from nav_groups g
  cross join (values
    ('asus',1),('apple',2),('dell',3),('lenovo',4),
    ('samsung',5),('hp',6),('huawei',7),('acer',8),('msi',9)
  ) as s(title_key, ord)
  where g.title_key = 'laptop';

-- digital → mobile
insert into nav_groups (nav_category_id, title_key, icon_name, display_order)
  select id, 'mobile', 'ImMobile', 2 from nav_categories where category_key = 'digital';
insert into nav_subtitles (group_id, title_key, display_order)
  select g.id, s.title_key, s.ord
  from nav_groups g
  cross join (values
    ('samsung',1),('apple',2),('nokia',3),('xiaomi',4),
    ('motorola',5),('lg',6),('sony',7)
  ) as s(title_key, ord)
  where g.title_key = 'mobile';

-- digital → computer
insert into nav_groups (nav_category_id, title_key, icon_name, display_order)
  select id, 'computer', 'FiMonitor', 3 from nav_categories where category_key = 'digital';
insert into nav_subtitles (group_id, title_key, display_order)
  select g.id, s.title_key, s.ord
  from nav_groups g
  cross join (values ('monitor',1),('mouse',2),('keyboard',3),('hard',4)) as s(title_key, ord)
  where g.title_key = 'computer';

-- digital → other
insert into nav_groups (nav_category_id, title_key, icon_name, display_order)
  select id, 'other', 'FiHeadphones', 4 from nav_categories where category_key = 'digital';
insert into nav_subtitles (group_id, title_key, display_order)
  select g.id, s.title_key, s.ord
  from nav_groups g
  cross join (values ('tablet',1),('powerBank',2),('speaker',3),('headphones',4)) as s(title_key, ord)
  where g.title_key = 'other' and g.nav_category_id = (select id from nav_categories where category_key='digital');

-- fashion → women
insert into nav_groups (nav_category_id, title_key, icon_name, display_order)
  select id, 'women', 'GiLargeDress', 1 from nav_categories where category_key = 'fashion';
insert into nav_subtitles (group_id, title_key, display_order)
  select g.id, s.title_key, s.ord
  from nav_groups g
  cross join (values
    ('dress',1),('skirt',2),('jeans',3),('pants',4),
    ('tShirt',5),('shoes',6),('scarf',7)
  ) as s(title_key, ord)
  where g.title_key = 'women';

-- fashion → men
insert into nav_groups (nav_category_id, title_key, icon_name, display_order)
  select id, 'men', 'IoShirtSharp', 2 from nav_categories where category_key = 'fashion';
insert into nav_subtitles (group_id, title_key, display_order)
  select g.id, s.title_key, s.ord
  from nav_groups g
  cross join (values
    ('shirt',1),('pants',2),('tie',3),('tShirt',4),('shoes',5),('jeans',6)
  ) as s(title_key, ord)
  where g.title_key = 'men';

-- fashion → child
insert into nav_groups (nav_category_id, title_key, icon_name, display_order)
  select id, 'child', 'FaBaby', 3 from nav_categories where category_key = 'fashion';
insert into nav_subtitles (group_id, title_key, display_order)
  select g.id, s.title_key, s.ord
  from nav_groups g
  cross join (values
    ('overalls',1),('mittens',2),('babyApron',3),('shoes',4),('tShirt',5)
  ) as s(title_key, ord)
  where g.title_key = 'child';

-- fashion → other accessories
insert into nav_groups (nav_category_id, title_key, icon_name, display_order)
  select id, 'other', 'FaRedhat', 4 from nav_categories where category_key = 'fashion';
insert into nav_subtitles (group_id, title_key, display_order)
  select g.id, s.title_key, s.ord
  from nav_groups g
  cross join (values ('watch',1),('wallet',2),('hat',3),('belt',4)) as s(title_key, ord)
  where g.title_key = 'other' and g.nav_category_id = (select id from nav_categories where category_key='fashion');

-- ─────────────────────────────────────────────
-- 9. EXTRA MENU ITEMS
-- ─────────────────────────────────────────────
insert into nav_extra_items (title_key, icon_name, href, display_order) values
  ('offer',     'AiOutlinePercentage', '/offers', 1),
  ('bestSells', 'RiFireLine',          '/',       2);

-- ─────────────────────────────────────────────
-- 10 & 11. FOOTER COLUMNS + LINKS
-- ─────────────────────────────────────────────
insert into footer_columns (title_key, display_order) values
  ('zishopMap',        1),
  ('customerServices', 2),
  ('shoppingGuide',    3);

insert into footer_links (column_id, text_key, href, display_order)
  select c.id, l.text_key, l.href, l.ord
  from footer_columns c
  cross join (values
    ('aboutUs',              '/about', 1),
    ('contactUs',            '/blank', 2),
    ('saleInZishop',         '/blank', 3),
    ('careerOpportunities',  '/blank', 4)
  ) as l(text_key, href, ord)
  where c.title_key = 'zishopMap';

insert into footer_links (column_id, text_key, href, display_order)
  select c.id, l.text_key, l.href, l.ord
  from footer_columns c
  cross join (values
    ('commonQuestions',  '/blank', 1),
    ('returnProcedures', '/blank', 2),
    ('privacy',          '/blank', 3)
  ) as l(text_key, href, ord)
  where c.title_key = 'customerServices';

insert into footer_links (column_id, text_key, href, display_order)
  select c.id, l.text_key, l.href, l.ord
  from footer_columns c
  cross join (values
    ('howToPlaceAnOrder',       '/blank', 1),
    ('orderSubmissionProcedure','/blank', 2),
    ('paymentMethods',          '/blank', 3)
  ) as l(text_key, href, ord)
  where c.title_key = 'shoppingGuide';

-- ─────────────────────────────────────────────
-- 12. SOCIAL MEDIA
-- ─────────────────────────────────────────────
insert into social_media (name, icon_name, href, display_order) values
  ('instagram', 'AiFillInstagram',  '/', 1),
  ('linkedin',  'FaLinkedin',       '/', 2),
  ('twitter',   'FaTwitterSquare',  '/', 3),
  ('telegram',  'FaTelegramPlane',  '/', 4);

-- ─────────────────────────────────────────────
-- 13. SORT OPTIONS
-- ─────────────────────────────────────────────
insert into sort_options (value_key, display_order) values
  ('all',             1),
  ('newestProducts',  2),
  ('popular',         3),
  ('cheapest',        4),
  ('expensive',       5);
