-- =============================================================================
-- MAHKSPORTS — Supabase SEED (categories + products + working image URLs)
-- =============================================================================
-- HOW TO RUN:
-- 1. In Supabase Dashboard → SQL Editor, run supabase/schema.sql first (if needed)
-- 2. Then paste/run THIS entire file
-- 3. In your app .env.local set:
--      NEXT_PUBLIC_SUPABASE_URL=...
--      NEXT_PUBLIC_SUPABASE_ANON_KEY=...
--      USE_SUPABASE_CATALOGUE=true
-- 4. Restart: npm run dev
-- =============================================================================

-- Clear existing catalogue (safe for fresh projects)
truncate table public.products restart identity cascade;
truncate table public.categories restart identity cascade;

-- ---------------------------------------------------------------------------
-- Categories (4 roots + 9 subcategories)
-- Fixed UUIDs so product FKs stay stable
-- ---------------------------------------------------------------------------
insert into public.categories (id, parent_id, name, slug, description, image_url, sort_order) values
-- Roots
('cccccccc-cccc-cccc-cccc-cccccccccc01', null,
 'Mix Martial Arts', 'mix-martial-arts',
 'Gloves, shin guards, headgear — fight-ready MMA & boxing kit.',
 'https://images.unsplash.com/photo-1555597673-b21d5c935865?auto=format&fit=crop&w=1600&q=80', 1),

('cccccccc-cccc-cccc-cccc-cccccccccc02', null,
 'Sports Wear', 'sports-wear',
 'Performance fabrics for training and competition.',
 'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?auto=format&fit=crop&w=1600&q=80', 2),

('cccccccc-cccc-cccc-cccc-cccccccccc03', null,
 'Clothing Apparel & Accessories', 'clothing-apparel-accessories',
 'Street-to-gym layers, bags, wraps, and caps.',
 'https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?auto=format&fit=crop&w=1600&q=80', 3),

('cccccccc-cccc-cccc-cccc-cccccccccc04', null,
 'Training Equipment', 'training-equipment',
 'Heavy bags, pads, and gym floor essentials.',
 'https://images.unsplash.com/photo-1518611012118-696072aa579a?auto=format&fit=crop&w=1600&q=80', 4),

-- MMA subs
('dddddddd-dddd-dddd-dddd-dddddddddd01', 'cccccccc-cccc-cccc-cccc-cccccccccc01',
 'Boxing & MMA Gloves', 'boxing-mma-gloves',
 'Training and competition gloves.',
 'https://images.unsplash.com/photo-1549719386-74dfcbf7dbed?auto=format&fit=crop&w=1000&q=80', 1),

('dddddddd-dddd-dddd-dddd-dddddddddd02', 'cccccccc-cccc-cccc-cccc-cccccccccc01',
 'Shin Guards & Headgear', 'shin-guards-headgear',
 'Protection for sparring and competition.',
 'https://images.unsplash.com/photo-1623874514711-0f321325f318?auto=format&fit=crop&w=1000&q=80', 2),

('dddddddd-dddd-dddd-dddd-dddddddddd09', 'cccccccc-cccc-cccc-cccc-cccccccccc01',
 'Martial Arts Uniforms', 'martial-arts-uniforms',
 'BJJ gis, karate, judo, and taekwondo suits.',
 'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?auto=format&fit=crop&w=1000&q=80', 3),

-- Sports Wear subs
('dddddddd-dddd-dddd-dddd-dddddddddd03', 'cccccccc-cccc-cccc-cccc-cccccccccc02',
 'Rash Guards & Tees', 'rash-guards-tees',
 'Moisture-wicking tops for grappling and gym.',
 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?auto=format&fit=crop&w=1000&q=80', 1),

('dddddddd-dddd-dddd-dddd-dddddddddd04', 'cccccccc-cccc-cccc-cccc-cccccccccc02',
 'Training Shorts', 'training-shorts',
 'Flexible fight shorts and compression cuts.',
 'https://images.unsplash.com/photo-1594381898411-846e7d193883?auto=format&fit=crop&w=1000&q=80', 2),

-- Apparel subs
('dddddddd-dddd-dddd-dddd-dddddddddd05', 'cccccccc-cccc-cccc-cccc-cccccccccc03',
 'Hoodies & Layers', 'hoodies-layers',
 'Warm-up and lifestyle pieces.',
 'https://images.unsplash.com/photo-1556821840-3a63f95609a7?auto=format&fit=crop&w=1000&q=80', 1),

('dddddddd-dddd-dddd-dddd-dddddddddd06', 'cccccccc-cccc-cccc-cccc-cccccccccc03',
 'Bags & Accessories', 'bags-accessories',
 'Duffels, wraps, and training essentials.',
 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?auto=format&fit=crop&w=1000&q=80', 2),

-- Training Equipment subs
('dddddddd-dddd-dddd-dddd-dddddddddd07', 'cccccccc-cccc-cccc-cccc-cccccccccc04',
 'Bags & Pads', 'bags-pads',
 'Heavy bags and focus mitts.',
 'https://images.unsplash.com/photo-1518611012118-696072aa579a?auto=format&fit=crop&w=1000&q=80', 1),

('dddddddd-dddd-dddd-dddd-dddddddddd08', 'cccccccc-cccc-cccc-cccc-cccccccccc04',
 'Training Aids', 'training-aids',
 'Pads and sparring tools.',
 'https://images.unsplash.com/photo-1576678927484-cc907957088c?auto=format&fit=crop&w=1000&q=80', 2);

-- Products imported from Rewon catalog (motorcycle/bundle excluded)

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000001', 'dddddddd-dddd-dddd-dddd-dddddddddd03', 'Herren Kurzarm Funktionsshirt – Atmungsaktiv, schnelltrocknend, olivgrün für Sport & Training', 't-shirt-quick-dry-half-sleeve', 'MHK-001',
  'Herren Funktions T-Shirt Kurzarm – Atmungsaktiv, schnelltrocknend, olivgrün für Sport & Outdoor 🌱 Produktbeschreibung Dieses kurzärmelige Funktionsshirt für Herren kombiniert sportliche Funktion mit schlichtem Stil. Aus leichtem, feuchtigkeitsableitendem Material gefertigt, bleibt es auch bei Hitze und Bewegung angenehm zu tragen. Perfekt für Trainingseinheiten, Outdoor-Aktivitäten oder den Alltag. Produkteigenschaften 💨 Atmungsaktiv & schnelltrocknend – hält dich kühl & trocken 🧵 Flache Nähte – verhindern Reibung & Hautirritationen 🎽 Sportlicher Schnitt – reguläre Passform mit Stretch für volle Bewegungsfreiheit 🌤️ Ideal bei Hitze – leichtes Material mit kühlender Wirkung 🧼 Pflegeleicht – maschinenwaschbar, formstabil & farbecht 📏 Größen: S, M, L, XL, XXL Warum dieses Shirt? ✅ Vielseitig – tragbar beim Joggen, Wandern, Training, auf Reisen oder im Alltag ✅ Minimalistisches Design – kombinierbar mit jeder Sport- oder Freizeitgarderobe ✅ Schnell wieder einsatzbereit – dank kurzer Trocknungszeit ✅ Ideal für warme Tage oder als First Layer im Zwiebelprinzip Pflegehinweise Waschanleitung: Maschinenwäsche bei 30 °C, nicht bleichen. Kein Trockner nötig – lufttrocknet in kürzester ', 9000, null,
  6500, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/133450-1.jpg?v=1670234154','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/133450-2.jpg?v=1670234153','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/133450-3.jpg?v=1670234154','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/133450-4.jpg?v=1670234154']::text[], false, '{"size":"Small","color":"Black","material":"T-Shirts"}'::jsonb, true, 1
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000002', 'dddddddd-dddd-dddd-dddd-dddddddddd03', 'Herren Funktionsshirt Langarm – Atmungsaktiv, schnelltrocknend, olivgrün für Sport & Outdoor', 't-shirt-quick-dry-long-sleeve', 'MHK-002',
  'Atmungsaktives Herren Langarm Funktionsshirt – Sport & Outdoor Training in Olivgrün 🌿 Produktbeschreibung Das atmungsaktive Langarmshirt für Herren vereint Komfort, Funktionalität und stilvolles Design. Ideal für Sport, Outdoor-Aktivitäten oder den lässigen Alltagseinsatz – dieses Shirt in olivgrün passt zu jeder Gelegenheit. Das feuchtigkeitsableitende Material hält dich trocken und bietet gleichzeitig volle Bewegungsfreiheit bei Training oder Freizeit. Produkteigenschaften 💨 Atmungsaktives Funktionsmaterial – transportiert Feuchtigkeit schnell ab 🧵 Flachnähte – reduzieren Reibung und verhindern Hautirritationen 🧘‍♂️ Elastischer Tragekomfort – sitzt angenehm bei Bewegung und Belastung 🌤️ Ganzjahrestauglich – perfekt als Base Layer im Winter oder Solo im Sommer 🎯 Sportlich-minimalistisches Design – ideal kombinierbar mit jeder Trainingskleidung 📏 Größen: S, M, L, XL, XXL Warum dieses Shirt? ✅ Funktionell & stilvoll – ideal für Sport, Wandern, Gym oder Alltag ✅ Geruchsresistent – bleibt länger frisch, auch bei intensiver Nutzung ✅ Pflegeleicht – maschinenwaschbar & schnelltrocknend ✅ Perfekte Wahl für Outdoor-Fans & aktive Männer Pflegehinweise Waschanleitung: Maschinenwäsche', 13400, null,
  9700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/133451-1.jpg?v=1670233594','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/133451-2.jpg?v=1670233595','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/133451-3.jpg?v=1670233594','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/133451-4.jpg?v=1670233594']::text[], false, '{"size":"Small","color":"Black","material":"T-Shirts"}'::jsonb, true, 2
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000003', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'Rewon Boxsackhandschuhe, Golden Series - SCHWARZ/GOLD', 'bag-gloves', 'MHK-003',
  'Kickbox Handschuhe und Muay Thai Handschuhe Unsere Kickbox- und Muay Thai-Handschuhe bieten ausgezeichneten Schutz und Haltbarkeit. Mit laminiertem, authentischem Schaumstoff ausgestattet, schützen sie effektiv die stoßdämpfende Mitte und gewährleisten hohen Komfort und Langlebigkeit. Boxhandschuhe für Frauen und Herren Wir bieten Boxhandschuhe speziell für Frauen und Herren an, die eine perfekte Passform und optimalen Schutz gewährleisten. Sie bestehen aus hochdichtem PU und geformtem EVA, ergänzt durch Schaumstoffpolsterung für eine High-Tech-Stoßdämpfung, die bei jedem Schlag Vertrauen gibt. Beste Boxhandschuhe mit Knöchelschutz Unsere Boxhandschuhe sind die besten auf dem Markt, wenn es um Knöchelschutz geht. Der Daumen ist mit EVA-Polsterung versehen und bietet in Kombination mit zusätzlichem Schaumstoff maximalen Schutz vor Verletzungen, selbst bei intensiven Trainingseinheiten. MMA-Handschuhe für Vielseitiges Training Unsere MMA-Handschuhe sind für vielseitige Trainingseinheiten konzipiert und bieten die notwendige Bewegungsfreiheit und Schutz. Ideal für Mixed Martial Arts-Training und Sparring-Sessions. Boxhandschuhe Günstig – Qualität zu einem erschwinglichen Preis Für Ein', 18500, 10600,
  7700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/bagmit1.jpg?v=1671079644','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/bagmit2.jpg?v=1671079644','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/bagmit3.jpg?v=1671079644']::text[], true, '{"color":"S/M","material":"Boxing Gloves & Mitts"}'::jsonb, true, 3
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000004', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'Boxhandschuhe für Training & Sparring – Kickboxen & MMA', 'boxhandschuhe-training-sparring', 'MHK-004',
  'Boxhandschuhe für Training, Sparring & Kickboxen Die hochwertigen Boxhandschuhe von RewonGear wurden speziell für anspruchsvolle Kampfsportler entwickelt. Ob Boxen, Kickboxen, Muay Thai oder MMA – diese Trainingshandschuhe bieten optimalen Schutz, hohen Tragekomfort und maximale Langlebigkeit. Dank der ergonomischen Passform und der stoßabsorbierenden Polsterung eignen sich die Handschuhe ideal für intensives Training, Sparring und Sandsackarbeit. Das robuste Material sorgt für eine lange Lebensdauer – perfekt für Anfänger, Fortgeschrittene und Profis. Vorteile auf einen Blick Mehrschichtige Polsterung für optimale Stoßdämpfung Stabiler Klettverschluss für sicheren Halt Ergonomisches Design für maximalen Komfort Strapazierfähiges Material für lange Nutzung Ideal für Boxen, Kickboxen, Muay Thai & MMA Für wen geeignet? Diese Boxhandschuhe sind perfekt für: Anfänger im Kampfsport Fitness-Boxer Vereins- und Studio-Training Sparring-Sessions Home-Gym Nutzer Jetzt RewonGear Boxhandschuhe kaufen und dein Training auf das nächste Level bringen.', 15400, 12600,
  9100, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-boxhandschuhe-schwarz-gold-pro.jpg?v=1771254611','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-gear-boxhandschuhe-material-qualitaet.jpg?v=1771255325','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-gear-boxsack-set-pro-training-gr_bentabelle.jpg?v=1771255093','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-gear-precision-punching-mma-boxen.jpg?v=1771254926']::text[], true, '{"color":"8oz","material":"Boxing Gloves & Mitts"}'::jsonb, true, 4
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000005', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'MMA Shooter Handschuhe – Nachttarnung', 'mma-night-camo-shooter-gloves', 'MHK-005',
  'Rewon Camouflage MMA Shooter Handschuhe – Kunstleder, Offene Handfläche & Stabiler Klett 🥋 📝 Produktbeschreibung Die Rewon Camouflage MMA Shooter Handschuhe kombinieren stylischen Tarn-Look mit maximaler Funktionalität: offener Handrücken für besten Grip, stabile Polsterung und robustes Kunstleder. Entwickelt für intensives Sparring, Techniktraining und Fitness-Einheiten – bequem, sicher und modern. ✨ Hauptmerkmale Material: Strapazierfähiges Kunstleder – leicht, langlebig & pflegeleicht Polsterung: Hochdichter Schaum – exzellente Stoßabsorption für Knöchel & Handrücken Offene Handfläche: Verbessert Griffigkeit beim Clinch, Grappling & Schlagkombos Klettverschluss: Extra breiter Riemen sichert Handgelenk – stabil & rutschfest Camouflage-Design: Auffällig & modern – ideal für Boxen, MMA, Kickboxing oder Cardio-Training Unisex & leicht: Angenehmer Tragekomfort bei langen Trainingseinheiten 💥 Vorteile & Problemlösung Sichere Technik & Schutz: Polsterung schützt Trainer wie Sportler beim Sparring und Bag-Workouts Maximale Bewegungsfreiheit: Offene Handfläche fördert Greifen, Clinchen & Dämpfung effizienter Schläge Langanhaltender Komfort: Kunstleder plus Klettverschluss ermöglichen ', 11800, 9200,
  6700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/mma-shooter-handschuhe-nachttarnung-kunstleder-trainingskampf-rewon-gear-air-teak.jpg?v=1744497759','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/mma_shooter_handschuhe_nachttarnung_rewon_kunstleder_air_teak_system_topmodell.webp?v=1744497759','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/mma_shooter_kunstleder_handschuhe_nachttarnung_rewon_training_fight_air_ventilation_secured_grip.webp?v=1744497759','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/mma-shooter-handschuhe-nachttarnung-rewon-kunstleder-training-fight-air-teak-system-comfort-fit.webp?v=1744497759']::text[], false, '{"color":"S/M","material":"MMA Grappling Gloves"}'::jsonb, true, 5
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000006', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'Tattoo Boxhandschuhe Leder für Training & Sparring', 'tattoo-boxhandschuhe-leder-rewongear', 'MHK-006',
  'Tattoo Boxhandschuhe Leder für Training & Sparring Die Tattoo Boxhandschuhe von RewonGear vereinen auffälliges Design mit zuverlässigem Schutz für intensives Training. Entwickelt für Boxen, Kickboxen, Muay Thai und Sparring bieten diese Handschuhe eine optimale Kombination aus Komfort, Stabilität und Langlebigkeit. Dank der ergonomischen Passform und der stoßabsorbierenden Polsterung eignen sich die Handschuhe ideal für Anfänger, Fortgeschrittene und ambitionierte Kampfsportler. Vorteile der RewonGear Tattoo Boxhandschuhe Robustes Leder für lange Haltbarkeit Mehrschichtige Polsterung für optimale Schlagdämpfung Ergonomische Passform für sicheren Sitz Stabiler Klettverschluss für festen Halt Ideal für Boxen, Kickboxen, Muay Thai und Sparring Ob im Gym oder beim Home-Training – mit den Tattoo Boxhandschuhen von RewonGear trainieren Sie sicher, komfortabel und stilvoll.', 16800, 13400,
  9700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/main_image_11zon_17daf22b-214c-448e-a5bb-311311dd0c3e.webp?v=1725896833','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-kickboxen-muay-thai-boxhandschuhe-anfaenger-eva-schutz-premium.webp?v=1744498061','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-boxhandschuhe-kickboxen-muay-thai-anfaenger-eva-schutz-fuer-frauen-und-herren.webp?v=1744498061','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/breathable-mesh-kickbox-muay-thai-gloves.webp?v=1744498061']::text[], false, '{"color":"8oz","material":"Boxing Gloves & Mitts"}'::jsonb, true, 6
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000007', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'Boxhandschuhe - NACHTARNUNG', 'night-camo-boxing-gloves', 'MHK-007',
  'Kickbox Handschuhe und Muay Thai Handschuhe Unsere Kickbox- und Muay Thai-Handschuhe bieten ausgezeichneten Schutz und Haltbarkeit. Mit laminiertem, authentischem Schaumstoff ausgestattet, schützen sie effektiv die stoßdämpfende Mitte und gewährleisten hohen Komfort und Langlebigkeit. Boxhandschuhe für Frauen und Herren Wir bieten Boxhandschuhe speziell für Frauen und Herren an, die eine perfekte Passform und optimalen Schutz gewährleisten. Sie bestehen aus hochdichtem PU und geformtem EVA, ergänzt durch Schaumstoffpolsterung für eine High-Tech-Stoßdämpfung, die bei jedem Schlag Vertrauen gibt. Beste Boxhandschuhe mit Knöchelschutz Unsere Boxhandschuhe sind die besten auf dem Markt, wenn es um Knöchelschutz geht. Der Daumen ist mit EVA-Polsterung versehen und bietet in Kombination mit zusätzlichem Schaumstoff maximalen Schutz vor Verletzungen, selbst bei intensiven Trainingseinheiten. MMA-Handschuhe für Vielseitiges Training Unsere MMA-Handschuhe sind für vielseitige Trainingseinheiten konzipiert und bieten die notwendige Bewegungsfreiheit und Schutz. Ideal für Mixed Martial Arts-Training und Sparring-Sessions. Boxhandschuhe Günstig – Qualität zu einem erschwinglichen Preis Für Ein', 12600, null,
  9100, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/boxhandschuhe-nachtarnung-rewon-kickbox-muay-thai-handschuhe-damen-herren-schutz-haltbarkeit_2.jpg?v=1753791054','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/boxhandschuhe-nachtarnung-rewon-kickbox-muay-thai-handschuhe-damen-herren-schutz-haltbarkeit_1_1.jpg?v=1753791054','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-boxhandschuhe-nachtarnung-kickbox-muay-thai-handschuhe-schwarz-geschuetzt-dauerhaft_1.jpg?v=1753791054','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-boxhandschuhe-nachtarnung-kickbox-muay-thai-schutz-haltbarkeit-unisex-training_1.jpg?v=1753791054']::text[], true, '{"color":"8oz","material":"Boxing Gloves & Mitts"}'::jsonb, true, 7
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000008', 'dddddddd-dddd-dddd-dddd-dddddddddd06', 'Rewon Vintage Reiserucksack – Großer Canvas Wanderrucksack mit Lederdetails & Sicherheitsfächern', 'vintage-travel-backpack', 'MHK-008',
  'Rewon Vintage Reiserucksack – Canvas Wanderrucksack mit Versteckten Fächern & Lederdetails Produktbeschreibung Entdecken Sie den Rewon Vintage Canvas Rucksack – ein extragroßer Reiserucksack für Abenteurer, Pendler und Schüler gleichermaßen. Das robuste Canvas-Material mit klassischen Lederdetails garantiert Langlebigkeit, während versteckte Fächer für Sicherheit bei jeder Reise sorgen. Ideal als Wanderrucksack, Schulrucksack oder stylischer City-Begleiter. Hauptmerkmale 🎒 Multifunktional: Perfekt für Schule, Universität, Arbeit, Wandern oder Reisen 🔒 Versteckte Sicherheitsfächer: Schützen Sie wichtige Gegenstände wie Reisepass, Smartphone und Brieftasche vor Diebstahl 🪶 Bequem zu tragen: Gepolsterte Schultergurte & atmungsaktive Rückwand für ganztägigen Tragekomfort 📐 Größe: 28,5 cm (L) x 48 cm (H) x 18 cm (B) 📚 Viel Stauraum: Platz für Bücher, Kleidung, Tablets, Wasserflasche, Regenschirm & mehr 🎨 Farben: Erhältlich in Grün und Blau 👜 Material: Hochwertiges Canvas & PU-Leder Warum Sie diesen Rucksack lieben werden Sein stilvolles Retro-Design kombiniert mit funktionaler Ausstattung macht ihn zum idealen Begleiter für Schule, Büro, Outdoor-Abenteuer oder die Stadt. Die clev', 23200, null,
  16700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/rewon-sports-vintage-reiserucksack-grau-blau-canvas-wanderrucksack-mit-versteckten-fachern.jpg?v=1744498277','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/rewon-sports-vintage-reiserucksack-grau-blau-canvas-wanderrucksack.jpg?v=1744498277','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/rewon_vintage_reiserucksack_canvas_grau_blau_wanderrucksack.png?v=1744498277','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/rewon-sports-vintage-reiserucksack-grau-blau-canvas-laptop-backpack.png?v=1744498277']::text[], false, '{"color":"Grey","material":"Travel Backpack"}'::jsonb, true, 8
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000009', 'dddddddd-dddd-dddd-dddd-dddddddddd03', 'Stonewash T-Shirt Herren – 100% Baumwolle | Vintage Look, Tapered Neck, Perfekte Passform', 'copy-of-t-shirt-with-white-star', 'MHK-009',
  'Stonewash T-Shirt – 100% Baumwolle, Tapered Neck & Perfekte Passform Produktbeschreibung Dieses Stonewash T-Shirt vereint klassischen Stil mit modernem Tragekomfort. Hergestellt aus 100% reiner Baumwolle, bietet es ein weiches, atmungsaktives Gefühl auf der Haut – ideal für den Alltag, Freizeitaktivitäten oder urbane Looks. Das einzigartige Stonewash-Finish sorgt für einen coolen, dezenten Vintage-Effekt. Eigenschaften 🧵 Material: 100% hochwertige Baumwolle – weich, langlebig, hautfreundlich 👕 Stonewash-Effekt: Verleiht jedem Shirt einen individuellen, ausgewaschenen Look 🎯 Passform: Figurbetonte, moderne Silhouette mit tapered neck für mehr Komfort 🧼 Pflegeleicht: Maschinenwaschbar bei 30° – bleibt auch nach vielen Wäschen in Form 🌿 Atmungsaktiv: Perfekt für warme Tage, sportliche Aktivitäten oder als Layer Styling-Tipps Kombinieren Sie dieses Shirt mit Jeans, Cargo-Hosen oder Shorts für einen lässigen, aber durchdachten Stil. Es eignet sich hervorragend für Streetwear, Casual Friday oder Outdoor-Aktivitäten. FAQs Fällt das T-Shirt größengerecht aus? Ja, die Passform ist normal – wählen Sie Ihre übliche Größe. Ist das Material dehnbar? Nein, es besteht aus 100% Baumwolle, bie', 9800, null,
  7100, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/stonewash-tshirt-100-cotton-tapered-neck-perfect-fit.jpg?v=1744498257','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/stonewash-t-shirt-100-cotton-tapered-neck-perfect-fit.jpg?v=1744498257','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/stonewash-t-shirt-100-cotton-tapered-neck-perfect-fit.png?v=1744498257','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/stonewash-cotton-tshirt-tapered-neck-perfect-fit.png?v=1744498257']::text[], false, '{"color":"Small","material":"T-Shirts"}'::jsonb, true, 9
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000010', 'dddddddd-dddd-dddd-dddd-dddddddddd03', 'Classic T-shirt with Germany Flag', 'classic-t-shirt-with-germany-flag', 'MHK-010',
  'Plain men''s basic T-shirt with Round-neck. The unisex men''s tee offers a comfortable and light wearing feeling / high wearing comfort with a body-hugging and stretch fit (slim fit stretch cut). The shirt can be easily combined and is suitable to worn as underwear or as a classic Round-neck top. Trendy Germany Flag on the sleeve', 7000, null,
  5000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/classic-black-tshirt-germany-flag-sleeve-mens-round-neck-unisex-comfortable-slim-fit-underwear-top.jpg?v=1744498304','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/mens-classic-round-neck-tshirt-germany-flag-slim-fit-black.jpg?v=1744498304','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/classic-men-tshirt-germany-flag-round-neck-slim-fit-comfort-unisex.jpg?v=1744498304','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/classic-mens-round-neck-tshirt-germany-flag-sleeve-slim-fit-comfortable-unisex.jpg?v=1744498304']::text[], false, '{"size":"Small","color":"Black","material":"T-Shirts"}'::jsonb, true, 10
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000011', 'dddddddd-dddd-dddd-dddd-dddddddddd05', 'Cobra Hood', 'cobra-hood', 'MHK-011',
  'A lightweight Cobra outfit that effectively camouflages itself in the color of the undergrowth. Weight only 800g One size Fasteners coated with fabric that reduces reflections The hood can be attached to the headgear Versatile tightening and adjustments', 52900, null,
  38100, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/lightweight_cobra_hood_outfit_camouflage_undergrowth_versatile_adjustable_fabric_coated_fasteners.png?v=1744498372','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/lightweight_cobra_hood_camouflage_outfit_adjustable_fasteners_green_undergrowth.png?v=1744498372','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/lightweight_cobra_hood_camouflage_outfit_800g_fabric_coated_fasteners_adjustable.png?v=1744498372','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/lightweight_cobra_outfit_camouflage_hood_fabric_coated_fasteners_adjustable_fits_all.png?v=1744498371']::text[], false, '{"color":"Green","material":"cobra hood"}'::jsonb, true, 11
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000012', 'dddddddd-dddd-dddd-dddd-dddddddddd06', 'Shemagh Desert Scarf – Sonnenschutz, Rauchfilter & Outdoor-Kühltuch | Taktisches Keffiyeh', 'shemagh-scarf', 'MHK-012',
  'Shemagh Desert Scarf – Schutz vor Sonne, Sand & Hitze 🌵 Produktbeschreibung Der Shemagh Desert Scarf (auch bekannt als Keffiyeh oder Ghutrah ) ist mehr als nur ein stylisches Accessoire. Dieses traditionelle Tuch aus dem Nahen Osten schützt zuverlässig vor Sonne, Wind, Sand und Staub. Perfekt für Outdoor-Abenteuer, Wanderungen, Festivals oder den taktischen Einsatz. Hauptmerkmale 🧵 Material: Atmungsaktiver Baumwollmix – weich & strapazierfähig 🌞 Hitzeschutz: Ideal als Turban oder Halstuch für optimalen Sonnenschutz 💦 Abkühlung bei Hitze: Im Wasser getränkt hält es Kopf & Nacken angenehm kühl 🌬️ Staub-, Rauch- & Sandschutz: Bedeckt Mund und Nase für bessere Atmung in Extremsituationen 🚁 Signalfunktion: In auffälligen Farben nutzbar zur Ortung in Notfällen 🪢 Pull-On-Stil: Einfach überziehen oder knoten – flexibel und leicht zu tragen Vielfältige Trageoptionen Tragen Sie das Shemagh als Hals- oder Kopftuch, Schulterschal oder sogar als Sonnenschutzplane im Outdoor-Bereich. Seine Vielseitigkeit macht es zum unverzichtbaren Begleiter bei jeder Aktivität. Anwendungsbereiche 🌄 Wandern & Camping 🏜️ Wüsten- & Offroad-Touren 🏕️ Festivals & Survival-Trekking 🚴 Outdoor-Sportarten 🛡', 5600, null,
  4000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/shemagh-scarf-cool-summer-signal-pull-on-feature-sand-dust-smoke.jpg?v=1744498385','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/shemagh-scarf-cooling-signal-device-sand-dust-protection.jpg?v=1744498385']::text[], false, '{"color":"Coyote/Coyote","material":"Scarves"}'::jsonb, true, 12
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000013', 'dddddddd-dddd-dddd-dddd-dddddddddd05', 'Classic Hoodie Womens', 'classic-hoodie-womens', 'MHK-013',
  'Everyone needs a cozy go-to hoodie to curl up in, so go for one that''s soft, smooth, and stylish. It''s the perfect choice for cooler evenings! • 50% pre-shrunk cotton, 50% polyester • Fabric weight: 8.0 oz/yd² (271.25 g/m²) • Air-jet spun yarn with a soft feel and reduced pilling • Double-lined hood with matching drawcord • Quarter-turned body to avoid crease down the middle • 1 × 1 athletic rib-knit cuffs and waistband with spandex • Front pouch pocket • Double-needle stitched collar, shoulders, armholes, cuffs, and hem', 23200, null,
  16700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/classic-hoodie-womens-maroon-soft-smooth-stylish-cozy.jpg?v=1744562232','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/classic-hoodie-womens-soft-pink-cozy-stylish-cool-weather-fashion.jpg?v=1744562232','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/classic-hoodie-womens-cozy-soft-red-sweatshirt-cool-evenings-fashion.jpg?v=1744562231','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/classic-hoodie-womens-soft-smooth-stylish-pink.jpg?v=1744562232']::text[], false, '{"size":"Small","color":"Mehroon","material":"Hoodies"}'::jsonb, true, 13
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000014', 'dddddddd-dddd-dddd-dddd-dddddddddd05', 'Classic Hoodie Mens', 'classic-hoodie-mens', 'MHK-014',
  'Everyone needs a cozy go-to hoodie to curl up in, so go for one that''s soft, smooth, and stylish. It''s the perfect choice for cooler evenings! • 50% pre-shrunk cotton, 50% polyester • Fabric weight: 8.0 oz/yd² (271.25 g/m²) • Air-jet spun yarn with a soft feel and reduced pilling • Double-lined hood with matching drawcord • Quarter-turned body to avoid crease down the middle • 1 × 1 athletic rib-knit cuffs and waistband with spandex • Front pouch pocket • Double-needle stitched collar, shoulders, armholes, cuffs, and hem', 23200, null,
  16700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/classic-hoodie-mens-soft-smooth-stylish-black.jpg?v=1744562254','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/classic-brown-hoodie-mens-soft-stylish-comfortable-cool-evenings.jpg?v=1744562254','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/classic-grey-hoodie-mens-soft-smooth-stylish-casual-wear.jpg?v=1744562254','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/classic-blue-hoodie-mens-soft-cozy-stylish-cotton-polyester.jpg?v=1744562254']::text[], false, '{"size":"Small","color":"Black","material":"Hoodies"}'::jsonb, true, 14
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000015', 'dddddddd-dddd-dddd-dddd-dddddddddd03', 'T-shirt Airborne', 't-shirt-airborne', 'MHK-015',
  'T-shirt tactical pocket made of 100% cotton', 10600, null,
  7700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/t-shirt-airborne-tactical-pocket-100-cotton-green.jpg?v=1744562385']::text[], false, '{"size":"Small","color":"OD","material":"T-Shirts"}'::jsonb, true, 15
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000016', 'dddddddd-dddd-dddd-dddd-dddddddddd03', 'T-shirt tactical pocket', 't-shirt-tactical-pocket-1', 'MHK-016',
  'T-shirt tactical pocket made of 100% cotton', 11800, null,
  8500, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/t-shirt-tactical-pocket-100-cotton-black.jpg?v=1744562400','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/t-shirt_tactical_pocket_100_cotton_camo_pattern_sleeve_pockets_military_style.jpg?v=1744562400','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/tshirt-tactical-pocket-100-cotton-khaki.jpg?v=1744562400','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/t-shirt-tactical-pocket-100-cotton-green-mens-casual-military-style-top.jpg?v=1744562400']::text[], false, '{"size":"Small","color":"OD","material":"T-Shirts"}'::jsonb, true, 16
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000017', 'dddddddd-dddd-dddd-dddd-dddddddddd03', 'T-shirt Vintage US Army Star', 't-shirt-vintage-us-army-star', 'MHK-017',
  'T-shirt made of 95% cotton and has a ''peach finish'' finish. Excellent fit and very comfortable thanks to 5% elastane in the fabric.', 10600, null,
  7700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/vintage-us-army-star-tshirt-cotton-elastane-peach-finish-comfortable-fit.jpg?v=1744562408']::text[], false, '{"size":"Small","color":"OD","material":"T-Shirts"}'::jsonb, false, 17
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000018', 'dddddddd-dddd-dddd-dddd-dddddddddd03', 'T-shirt RAF', 't-shirt-raf', 'MHK-018',
  'T-shirt RAF from 100% cotton. The Royal Air Force (RAF) is the United Kingdom''s air force, the oldest independent air force in the world. Formed on 1 April 1918, the RAF has taken a significant role in British military history ever since, playing a large part in World War II and in more recent conflicts.', 10600, null,
  7700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/raf-t-shirt-100-cotton-royal-air-force-logo.jpg?v=1744562581','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/raf-tshirt-100-cotton-roundel-design-uk-military-history.jpg?v=1744562581']::text[], false, '{"size":"Small","color":"Black","material":"T-Shirts"}'::jsonb, false, 18
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000019', 'dddddddd-dddd-dddd-dddd-dddddddddd03', 'T-shirt WW II', 't-shirt-ww-ii', 'MHK-019',
  'T-shirt WW-II made of 100% cotton.', 10600, null,
  7700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/t-shirt-ww2-100-cotton-navy-blue-star-design.jpg?v=1744562592','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/tshirt-ww-ii-100-percent-cotton-green.jpg?v=1744562592','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/t-shirt-ww2-100-cotton-military-design.jpg?v=1744562592']::text[], false, '{"size":"Small","color":"Black","material":"T-Shirts"}'::jsonb, false, 19
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000020', 'dddddddd-dddd-dddd-dddd-dddddddddd03', 'Tactical t-shirt Quick Dry', 'tactical-t-shirt-quick-dry', 'MHK-020',
  'Tactical t-shirt shirt Quick Dry made of 100% polyester Optimal freedom of movement due to the soft stretch fabric. Quick Dry material is quick-drying and moisture-regulating. On both arms are hook and loop panels.', 10600, null,
  7700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/tactical-tshirt-quick-dry-polyester-soft-stretch-moisture-regulating-navy-blue.jpg?v=1744562603','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/tactical-tshirt-quick-dry-navy-blue-polyester-moisture-regulating-stretch-fabric-velcro-panels.jpg?v=1744562603']::text[], false, '{"size":"Small","color":"Blue","material":"T-Shirts"}'::jsonb, false, 20
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000021', 'dddddddd-dddd-dddd-dddd-dddddddddd03', 'T-shirt security long sleeve', 't-shirt-security-long-sleeve', 'MHK-021',
  'Long sleeve t-shirt made of 100% cotton.', 13400, null,
  9700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/black-security-tshirt-long-sleeve-100-cotton.jpg?v=1744562611','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/security_long_sleeve_cotton_tshirt_back_view.jpg?v=1744562611']::text[], false, '{"size":"Small","color":"Black","material":"T-Shirts"}'::jsonb, false, 21
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000022', 'dddddddd-dddd-dddd-dddd-dddddddddd03', 'Polo Quick Dry T-shirt long sleeve', 'polo-quick-dry-t-shirt-long-sleeve', 'MHK-022',
  'Tactical polo shirt Quick Dry made of 100% polyester. Optimal freedom of movement due to the soft stretch fabric. Quick Dry material is quick-drying and moisture-regulating. Both sleeves have a pen pocket. There is also Velcro on the left sleeve.', 13400, null,
  9700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/tactical-quick-dry-long-sleeve-polo-shirt-polyester-stretch-moisture-regulating-sleeve-pocket-velcro.jpg?v=1744562649','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/tactical-polo-quick-dry-long-sleeve-shirt-100-polyester-soft-stretch-fabric-moisture-regulating-pen-pocket-velcro.jpg?v=1744562649','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/tactical_polo_quick_dry_long_sleeve_shirt_100_percent_polyester_moisture_regulating_stretch_fabric_pen_pocket_velcro.jpg?v=1744562649','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/tactical_quick_dry_long_sleeve_polo_shirt_polyester_stretch_moisture_regulating_pen_pocket_velcro_black.jpg?v=1744562649']::text[], false, '{"size":"Small","color":"Black","material":"T-Shirts"}'::jsonb, false, 22
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000023', 'dddddddd-dddd-dddd-dddd-dddddddddd03', 'Polo Quick Dry T-shirt', 'polo-quick-dry-t-shirt', 'MHK-023',
  'Tactical polo shirt Quick Dry made of 100% polyester. Optimal freedom of movement due to the soft stretch fabric. Quick Dry material is quick-drying and moisture-regulating. Both sleeves have a pen pocket. There is also Velcro on the left sleeve.', 12000, null,
  8700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/tactical_polo_quick_dry_shirt_100_percent_polyester_stretch_fabric_moisture_regulating_velcro_sleeve_pen_pocket.jpg?v=1744562671','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/polo_quick_dry_tactical_shirt_polyester_soft_stretch_fabric_moisture_regulating_velcro_pen_pocket.jpg?v=1744562670','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/tactical_polo_quick_dry_tshirt_100_percent_polyester_moisture_regulating_pen_pocket_velcro_olive.jpg?v=1744562671','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/tactical_polo_quick_dry_black_shirt_polyester_stretch_moisture_wicking_pen_pocket_velcro_sleeve.jpg?v=1744562670']::text[], false, '{"size":"Small","color":"Black","material":"T-Shirts"}'::jsonb, false, 23
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000024', 'dddddddd-dddd-dddd-dddd-dddddddddd03', 'Polo security Exclusive T-shirt', 'polo-security-exclusive-t-shirt', 'MHK-024',
  'Security Polo shirt made of 100% Polyester.', 10600, null,
  7700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/polo-security-exclusive-tshirt-100-polyester.jpg?v=1744562677','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/133402PolosecurityExclusive.2.jpg?v=1670306712']::text[], false, '{"size":"Small","color":"Black","material":"T-Shirts"}'::jsonb, false, 24
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000025', 'dddddddd-dddd-dddd-dddd-dddddddddd03', 'Polo Security shirt', 'polo-security-shirt', 'MHK-025',
  'Security Polo shirt made of 100% Cotton.', 10600, null,
  7700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/polo-security-shirt-100-cotton-black-front-view.jpg?v=1744562690','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/black-security-polo-shirt-100-cotton-back-view.jpg?v=1744562690','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/black-security-polo-shirt-100-cotton.jpg?v=1744562690','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/security-polo-shirt-100-cotton-back-view.jpg?v=1744562690']::text[], false, '{"size":"Small","color":"Black","material":"T-Shirts"}'::jsonb, false, 25
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000026', 'dddddddd-dddd-dddd-dddd-dddddddddd03', 'T-shirt Rewon camo', 't-shirt-rewon-camo', 'MHK-026',
  'T-shirt short sleeves made of 100% cotton', 9800, null,
  7100, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/tshirt-rewon-camo-short-sleeve-cotton.jpg?v=1744562714','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/t-shirt-rewon-camo-short-sleeve-100-cotton.jpg?v=1744562714','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/tshirt-rewon-camo-short-sleeve-100-cotton.jpg?v=1744562714','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/rewon_camo_tshirt_short_sleeves_100_percent_cotton_mens_fashion.jpg?v=1744562714']::text[], false, '{"size":"Small","color":"French Camo","material":"T-Shirts"}'::jsonb, false, 26
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000027', 'dddddddd-dddd-dddd-dddd-dddddddddd03', 'T-shirt with white star', 't-shirt-with-white-star', 'MHK-027',
  'T-shirt with white star Made of 100% cotton. Tapered neck and perfect fit.', 9800, null,
  7100, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/133380T-shirtwithwhitestar-1.jpg?v=1670301684','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/133380T-shirtwithwhitestar-2.jpg?v=1670301684']::text[], false, '{"size":"Small","color":"Black","material":"T-Shirts"}'::jsonb, false, 27
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000028', 'dddddddd-dddd-dddd-dddd-dddddddddd03', 'T-shirt Marine', 't-shirt-rewon', 'MHK-028',
  'T-shirt marine with a blue rand made of 100% cotton', 9000, null,
  6500, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/133385T-shirtmarine.jpg?v=1670302832']::text[], false, '{"size":"Small","color":"White","material":"T-Shirts"}'::jsonb, false, 28
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000029', 'dddddddd-dddd-dddd-dddd-dddddddddd03', 'T-shirt', 'copy-of-polo-security-t-shirt', 'MHK-029',
  'T-shirt made of 100% cotton. Tapered neck 175 gram/m2 Top quality', 8400, null,
  6000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/133375T-shirtFostee-1.jpg?v=1670243312','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/133375T-shirtFostee-2.jpg?v=1670243312','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/133375T-shirtFostee-3.jpg?v=1670243312','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/133375T-shirtFostee-4.jpg?v=1670243312']::text[], false, '{"size":"Small","color":"Black","material":"T-Shirts"}'::jsonb, false, 29
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000030', 'dddddddd-dddd-dddd-dddd-dddddddddd03', 'Polo Security T-Shirt', 'polo-security-t-shirt', 'MHK-030',
  'Security Polo stretch made of 95% Cotton en 5% Elastan.', 10600, null,
  7700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/133372PoloSecurityStretch.1.jpg?v=1670242076','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/133372PoloSecurityStretch.2.jpg?v=1670242076']::text[], false, '{"size":"Small","color":"Black","material":"T-Shirts"}'::jsonb, false, 30
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000031', 'dddddddd-dddd-dddd-dddd-dddddddddd03', 'Mens Herren Baumwoll Tanktop – Weiß, Camouflage, Schwarz & Grün – Gym, Freizeit & Alltag', 'mens-tanktop', 'MHK-031',
  'Herren Baumwoll-Tanktop – Klassisch & Bequem in Weiß, Camouflage, Schwarz & Grün 💪 Produktbeschreibung Das Herren Baumwoll-Tanktop ist der perfekte Mix aus Funktionalität und minimalistischem Stil. Ob im Training, in der Freizeit oder beim Layering unter Sport- oder Freizeitkleidung – dieses Tanktop aus atmungsaktiver Baumwolle begleitet dich zuverlässig durch den Tag. Produkteigenschaften 🧵 100 % Baumwolle – weich, atmungsaktiv und hautfreundlich 🎽 Sportlicher Schnitt – betont Schultern und Oberkörper 🎨 Farben: Weiß, Camouflage (Camo), Schwarz und Grün 🌬️ Atmungsaktiv & leicht – ideal für warme Tage und intensives Training 📏 Erhältliche Größen: S, M, L, XL, XXL 🧼 Pflegeleicht – maschinenwaschbar & formstabil Warum dieses Tanktop? ✅ Vielseitig einsetzbar – Sport, Freizeit, Gym, Loungewear oder Outdoor ✅ Zeitloser Stil – basic Design mit markantem Look ✅ Camo-Design – für maskuline Streetwear-Vibes ✅ Hautfreundlich – ohne störende Nähte oder Etiketten Pflegehinweise Maschinenwäsche bei 30 °C. Für optimale Formpflege lufttrocknen. Nicht bleichen. Kein Trockner notwendig. FAQs – Häufig gestellte Fragen Ist das Tanktop figurbetont oder locker? Es bietet eine normale Passform – n', 7000, null,
  5000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/133363-1_c2bc9e22-77bf-4dfd-9928-75c86fe8aa2d.jpg?v=1670240330','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/133364Tanktop-1.jpg?v=1670240330','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/133364Tanktop-2.jpg?v=1670240330','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/133364Tanktop-3.jpg?v=1670240330']::text[], false, '{"size":"Small","color":"Black","material":"T-Shirts"}'::jsonb, false, 31
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000032', 'dddddddd-dddd-dddd-dddd-dddddddddd03', 'Womens Damen Baumwoll Tank Top – 100% Baumwolle, weich & vielseitig – Weiß, Grün, Braun, Schwarz', 'tanktop-ladies', 'MHK-032',
  'Damen Baumwoll-Tanktop – Weich, Stretch & Vielseitig, in Weiß, Grün, Braun & Schwarz 🌸 Produktbeschreibung Das Damen Baumwoll-Tanktop vereint klassische Eleganz mit modernem Tragekomfort. Gefertigt aus 100 % natürlicher Baumwolle bietet es ein angenehmes, atmungsaktives Tragegefühl – ideal für Alltag, Layering oder entspannte Yoga-Praxis. Produkteigenschaften 🧵 100 % hochwertige Baumwolle – weich, natürlich und hautfreundlich 🎈 Softe Stretch-Passform – schmiegt sich sanft an die Körperform 🎨 Vier Farben: zeitloses Weiß, harmonisches Grün, warmes Braun und klassisches Schwarz 👕 Rundhalsausschnitt & schmale Träger – feminin und vielseitig kombinierbar 🌞 Atmungsaktiv & leicht – perfekt für warme Tage oder als Layer unter Bluse oder Cardigan 📏 Größen: XS, S, M, L, XL Warum dieses Top? ✅ Nachhaltig durch 100 % Naturfaser – umweltfreundlich & angenehm ✅ Vielseitig – trägt sich solo im Sommer oder als feminines Layering-Piece ✅ Pflegeleicht & langlebig – maschinenwaschbar & formstabil ✅ Ideal als Geschenk – zeitloses Design in allen Alltagssituationen Pflegehinweise Waschanleitung: Maschinenwäsche bei 30 °C. Nicht bleichen. Bei mittlerer Temperatur bügeln. Für beste Form unverzügli', 7000, null,
  5000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/133363-2.jpg?v=1670234973','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/133363-3.jpg?v=1670234973','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/133363-4.jpg?v=1670234974','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/133363-1.jpg?v=1670234974']::text[], false, '{"size":"Small","color":"Black","material":"T-Shirts"}'::jsonb, false, 32
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000033', 'dddddddd-dddd-dddd-dddd-dddddddddd02', 'Night Camo Schienbeinschoner Kampfsport/Kickboxen - Camouflage', 'night-camo-shin-in-step', 'MHK-033',
  '1. Kunstleder: Für mehr Stärke. 2. Hochwertiger Schaumstoff: Für bessere Stoßdämpfung 3. Klettverschluss: Für sichere Anpassung. Gummizug unter dem Fuß und der Ferse für mehr Komfort. RewonGear bietet diese Schienbeinschoner, die speziell zum Schutz und zur Entfaltung der Kraft Ihrer Tritte entwickelt wurden, speziell für das Training von Muay Thai, Boxen, MMA, Kickboxen, Karate und Taekwondo. Die glatte, dreifach beschichtete Polsterung ist handgefertigt, damit Sie ein Paar Schienbeinschoner haben, die zu Ihrem Kampfstil passen.', 16200, null,
  11700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_schienbeinschoner_kampfsport_kickboxen_mehrfarbig_boxausruestung_kaufen.jpg?v=1744464388','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/schienbeinschoner_kampfsport_kickboxen_mehrfarbig_rewon_kunstleder_hochwertiger_schaumstoff_klettverschluss_boxausrustung_fur_muay_thai_mma.jpg?v=1744464388','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/schienbeinschoner-kampfsport-kickboxen-mehrfarbig-rewon-boxausruestung-muay-thai-karate-mma-training.jpg?v=1744464388']::text[], false, '{"color":"XS","material":"Boxing & Martial Arts Protective Gear"}'::jsonb, false, 33
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000034', 'dddddddd-dddd-dddd-dddd-dddddddddd07', 'Classic Training Punching Bag Empty', 'classic-training-punching-bag-empty', 'MHK-034',
  'Durable and versatile: Made with high-quality synthetic leather for long-lasting use Unique shape: Allows for a wide range of striking techniques, perfect for Muay Thai, boxing and other combat sports Sturdy hanging straps and swivel: Easy to install and use Improve your striking technique: Great tool to improve striking technique and power Suitable for all skill levels: Whether you''re a beginner or an advanced martial artist, this heavy bag is perfect for your training', 23200, null,
  16700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/classic-training-punching-bag-empty-rewon-synthetic-leather-muay-thai-boxing-versatile.jpg?v=1744496189','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/classic-training-punching-bag-empty-rewon-synthetic-leather-muay-thai-boxing-combat-sports.jpg?v=1744496189','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/classic-training-punching-bag-empty-rewon-durable-synthetic-leather-muay-thai-boxing-versatile.jpg?v=1744496189','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/classic-training-punching-bag-empty-rewon-durable-synthetic-leather-muay-thai-boxing-combat-sports.jpg?v=1744496189']::text[], true, '{"color":"5ft","material":"Punching Bag"}'::jsonb, false, 34
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000035', 'dddddddd-dddd-dddd-dddd-dddddddddd07', 'Night Schlagpolster/Kick Pratzen/MMA Trainer Polster – Camouflage', 'night-camo-mma-shield-boxing-shield-striking-pad', 'MHK-035',
  'Hohe Qualität: Das Rewon Gear Armpolster ist aus hochwertigem Kunstleder gefertigt und bietet damit lange Haltbarkeit und Funktionalität. Professionelle Boxausrüstung (Armpolster, Krav Maga, Boxsack) für Kickboxtraining auf hohem Niveau, wodurch das Kickpolster langlebiger und leichter zu reinigen ist. Es ist ideal für Box- und Kampfsporttraining sowie Taekwondo-Training und bietet besseren Schutz bei Tritten, Schlägen, Ellbogen- und Knieschlägen. Das sichere Klettverschlusssystem macht das An- und Ausziehen der Polster einfach und bietet während langer Trainingseinheiten einen hervorragenden Halt. Es ermöglicht die Verwendung des Schlagpolsters in verschiedenen Winkeln. Zufriedenheitsgarantie: Das Kick-Shield ist aus vielseitigem Material gefertigt, das dauerhafte Robustheit garantiert. Wir streben nach Großartigkeit und unser professioneller Kundenservice garantiert Ihre Zufriedenheit.', 14300, null,
  10300, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-schlagpolster-kickpratzen-mma-trainerpolster-mehrfarbig-hohe-qualitaet-boxtraining-zubehoer-kickboxen-ausruestung.webp?v=1744464341','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_shlagpolster_mma_kicktrainings_hochwertig_kunstleder_mehrfarbig_boxequipment_deutschland.webp?v=1744464341','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_boxing_kickpads_mma_trainerpolster_high_quality_mehrfarbig_artificial_leather_boxtraining_zubehoer.webp?v=1744464341','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-mma-trainerpolster-schlagpolster-mehrfarbig-hohe-qualitaet-kunstleder-kickboxtraining-boxausruestung.webp?v=1744464341']::text[], false, '{"color":"Camouflage","material":"Kick Sheild"}'::jsonb, false, 35
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000036', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Taekwondo Anzug (Dobok) – Leicht & Strapazierfähig für Training', 'taekwondo-uniform', 'MHK-036',
  'Taekwondo Anzug (Dobok) für Training & Wettkampf Unser Taekwondo Anzug (Dobok) von RewonGear wurde für intensive Trainingseinheiten und Wettkämpfe entwickelt. Das leichte, atmungsaktive Material sorgt für maximale Bewegungsfreiheit und hohen Tragekomfort. Egal ob Anfänger oder Fortgeschrittener – dieser Dobok bietet die perfekte Kombination aus Strapazierfähigkeit, Komfort und professioneller Optik. Vorteile: Leichtes & atmungsaktives Material Hohe Bewegungsfreiheit Robuste Verarbeitung für langes Training Ideal für Training & Wettkampf Schneller Versand in Deutschland & Europa Trainiere mit Vertrauen – trainiere mit RewonGear.', 23200, 14800,
  10700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/taekwondo_mma_karate_anzug_weiss_rewon_komfort_haltdauer.webp?v=1744496245','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/taekwondo-anzug-weiss-rewon-karateanzug-mma-polyester-baumwolle-komfort-atmungsaktiv.webp?v=1744496245','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/taekwondo-anzug-mma-karateanzug-weiss-rewon-reinforced-stitching-comfortable-durable-sturdy-belt.webp?v=1744496245','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/taekwondo-anzug-mma-karateanzug-weiss-rewon-polyester-baumwolle-atmungsaktiv-komfortabel-haltdauer.webp?v=1744496245']::text[], true, '{"size":"000","color":"White","material":"Taekwondo Uniform"}'::jsonb, true, 36
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000037', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Karateanzug | Karate-Gi | Karate Trainingsbekleidung - Schwarz', 'karate-uniform-lightweight', 'MHK-037',
  'Karateanzug – Leicht, Robust & Maximale Bewegungsfreiheit Dieser Karateanzug bietet zuverlässige Qualität zu einem wettbewerbsfähigen Preis und ist die ideale Wahl für Karate-Einsteiger, Fortgeschrittene sowie Vereine . Entwickelt für intensives Training, überzeugt er durch Komfort, Langlebigkeit und funktionales Design. Gefertigt aus einer strapazierfähigen Polyester-Baumwoll-Mischung , kombiniert der Karate-Gi hohe Reißfestigkeit mit angenehmem Tragegefühl – auch bei langen Trainingseinheiten. Besondere Merkmale Verstärkte Nähte an stark beanspruchten Bereichen für erhöhte Haltbarkeit Ergonomischer Schulter-Schnitt für schnelle, freie und kontrollierte Bewegungen Weiter geschnittene Hose , ideal für Dehnübungen, hohe Kicks und tiefe Stellungen Leichtes Material , geeignet für Training und Wettkampf Produktdetails Farbe: Schwarz Material: Polyester / Baumwolle Lieferumfang: Jacke, Hose und Gürtel Ein funktioneller und langlebiger Karateanzug , der maximale Bewegungsfreiheit bietet und zuverlässige Performance im täglichen Training unterstützt.', 15400, null,
  11100, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/karateanzug-karate-gi-mehrfarbig-rewon-polyester-baumwolle-kampfsport-trainingsbekleidung.webp?v=1744463989','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/karateanzug-karate-gi-trainingsbekleidung-mehrfarbig-rewon-polyester-baumwolle-stark-vernaht.webp?v=1744459908','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/karateanzug-karate-gi-training-multicolor-rewon-durable-polyester-cotton.webp?v=1744463989','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/karateanzug-karate-gi-groessentabelle-mehrfarbig-rewon.webp?v=1744463989']::text[], true, '{"size":"000","color":"Black","material":"Karate Uniform"}'::jsonb, false, 37
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000038', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Basic 1.5 Kampfsport JJ Anzug | Ju Jutsu Gi | BJJ Kimono – Blau Redon', 'basic1-5-jiu-jitsu-gi', 'MHK-038',
  'Die ideale Balance zwischen Gewicht und Weichheit. Für alle Arten von Training und Wettkampf ist der Rewon BJJ Gi die beste Wahl. Unser BJJ ist anderen Marken überlegen, da er in drei wunderschönen Farben angeboten wird. Alle BJJ-Gi sind mit einem kostenlosen weißen Gürtel ausgestattet, der wie der Gi aus einer hochwertigen Stoffbasis besteht. Hinweis: Bitte überprüfen Sie vor der Bestellung die „GRÖSSENTABELLE“ in den Bildern, um Ihre Größenauswahl zu treffen.', 18500, null,
  13300, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/mehrfarbig-ju-jutsu-gi-bjj-kimono-rewon-boxtraining-ausruestung.webp?v=1744463854','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/kampfsport-jj-anzug-basic-ju-jutsu-gi-bjj-kimono-rewon-blau-jujutsu-bjj-gi-multicolor-boxausruestung-trainingszubehoer.webp?v=1744463854','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/kampfsport-ju-jutsu-gi-bjj-kimono-rewon-mehrfarbig-boxhandschuhe-kaufen-boxtraining-zubehoer-fitnessprodukte.jpg?v=1744463854','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/blue2.jpg?v=1726239111']::text[], false, '{"size":"A0","color":"Blue","material":"Jiu Jitsu GI"}'::jsonb, false, 38
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000039', 'dddddddd-dddd-dddd-dddd-dddddddddd08', 'Knee Wraps', 'knee-wraps-2', 'MHK-039',
  'IMPROVE LEG POSITION, STABILITY AND STRENGTH! REWON GEAR knee wraps will increase your leg strength during squats, leg presses and other strenuous leg exercises when worn in conjunction with an excellent training plan. Within the first session you will find that you have more strength. You''ve never experienced knee wraps better than these. Knee wraps provide better support and stability during strenuous leg exercises. Knee Sleeves improve exercise efficiency, protect your knee joint from potential damage from hard lifting, and provide extra compression. Rewon Gear Knee wraps are the most effective pair of knee sleeves: Rewon Gear Knee wraps are the ONLY popular pair of 72-inch knee wraps that feature our branded elastic with strap attachment contain. As a result, it is easy for you Wrapping your knees and keeping the wraps in place giving you a great leg exercise. Because Rewon Gear knee wraps provide tight knee compression when doing squats, power lifting, cross training, weightlifting, bodybuilding or any other leg activity. You''ll be able to lift more weight, set new personal records, and achieve greater peak performance. Break down obstacles and push yourself. Find out why our ', 7000, null,
  5000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-gear-knee-wraps-leg-strength-stability-support-exercise.jpg?v=1744496405','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-knee-wraps-leg-stability-strength-training-support.jpg?v=1744496405','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_knee_wraps_leg_stability_strength_support_exercise_gear.jpg?v=1744496405']::text[], false, '{"color":"Black/Blue","material":"Lifting Straps"}'::jsonb, false, 39
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000040', 'dddddddd-dddd-dddd-dddd-dddddddddd08', 'Knee Wraps', 'knee-wraps-1', 'MHK-040',
  'IMPROVE LEG POSITION, STABILITY AND STRENGTH! REWON GEAR knee wraps will increase your leg strength during squats, leg presses and other strenuous leg exercises when worn in conjunction with an excellent training plan. Within the first session you will find that you have more strength. You''ve never experienced knee wraps better than these. Knee wraps provide better support and stability during strenuous leg exercises. Knee Sleeves improve exercise efficiency, protect your knee joint from potential damage from hard lifting, and provide extra compression. Rewon Gear Knee wraps are the most effective pair of knee sleeves: Rewon Gear Knee wraps are the ONLY popular pair of 72-inch knee wraps that feature our branded elastic with strap attachment contain. As a result, it is easy for you Wrapping your knees and keeping the wraps in place giving you a great leg exercise. Because Rewon Gear knee wraps provide tight knee compression when doing squats, power lifting, cross training, weightlifting, bodybuilding or any other leg activity. You''ll be able to lift more weight, set new personal records, and achieve greater peak performance. Break down obstacles and push yourself. Find out why our ', 7000, null,
  5000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-gear-knee-wraps-leg-support-strength-stability-fitness-training-equipment.jpg?v=1744496420','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-gear-knee-wraps-pink-leg-strength-stability-support-exercise.jpg?v=1744496420','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_knee_wraps_leg_strength_support_stability_exercise_gear.jpg?v=1744496420']::text[], false, '{"color":"Pink","material":"Lifting Straps"}'::jsonb, false, 40
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000041', 'dddddddd-dddd-dddd-dddd-dddddddddd08', 'Knee Wraps', 'knee-wraps', 'MHK-041',
  'IMPROVE LEG POSITION, STABILITY AND STRENGTH! REWON GEAR knee wraps will increase your leg strength during squats, leg presses and other strenuous leg exercises when worn in conjunction with an excellent training plan. Within the first session you will find that you have more strength. You''ve never experienced knee wraps better than these. Knee wraps provide better support and stability during strenuous leg exercises. Knee Sleeves improve exercise efficiency, protect your knee joint from potential damage from hard lifting, and provide extra compression. Rewon Gear Knee wraps are the most effective pair of knee sleeves: Rewon Gear Knee wraps are the ONLY popular pair of 72-inch knee wraps that feature our branded elastic with strap attachment contain. As a result, it is easy for you Wrapping your knees and keeping the wraps in place giving you a great leg exercise. Because Rewon Gear knee wraps provide tight knee compression when doing squats, power lifting, cross training, weightlifting, bodybuilding or any other leg activity. You''ll be able to lift more weight, set new personal records, and achieve greater peak performance. Break down obstacles and push yourself. Find out why our ', 7000, null,
  5000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_gear_knee_wraps_strength_stability_leg_exercises_support.jpg?v=1744496434','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-gear-knee-wraps-improve-stability-strength-exercise-support.jpg?v=1744496434','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-gear-knee-wraps-leg-strength-stability-exercise.jpg?v=1744496434']::text[], true, '{"color":"Aqua","material":"Lifting Straps"}'::jsonb, false, 41
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000042', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Echtes Leder 6 Zoll Fitness Gürtel Gewichtheben/Trainingsgürtel - Braun', '6-leather-weightlifting-belt', 'MHK-042',
  'The first thought on a weightlifter''s mind is to stay in good shape. Our sling allows you to do just that. When you lift, you put pressure on your abs and back. But with quality leather, our bodybuilding belt gives you the core and lumbar protection you need. Features: - Color: Black - Material: Leather LIGHTWEIGHT AND PORTABLE: Heavy enough for support but light enough for travel. This weight lifting leather belt lets you rolls up easily and fits in a gym bag - SECURE FIT: The double pin buckles ensure a snug fit that won''t ride down or ride up your waist. - MADE TO LAST: Each belt is engineered with superior construction to ensure excellent performance. - BETTER LUMBAR SUPPORT: Your fitness and exercise goals can be achieved while protecting your back and core during workouts and workouts. - APPLICABLE PEOPLE: Ideal for beginners or experienced weightlifters. while protecting your back and core during workouts and workouts. - APPLICABLE PEOPLE: Ideal for beginners or experienced weightlifters. while protecting your back and core during workouts and workouts. - APPLICABLE PEOPLE: Ideal for beginners or experienced weightlifters.', 12600, null,
  9100, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/echtes-leder-6-zoll-fitness-gurtel-braun-rewon-gewichtheben-trainingsgurtel.jpg?v=1744496706','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/echtes-leder-fitness-guertel-braun-rewon-leather-weightlifting-belt.jpg?v=1744496706','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_brown_6_inch_leather_weightlifting_belt_size_chart_fitness_training_lumbar_support.jpg?v=1744496706','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/3_a7846a61-da39-45d7-b2b5-ed1c35826b38.jpg?v=1704284128']::text[], false, '{"size":"Brown","color":"S","material":"Weight Lifting Belts"}'::jsonb, false, 42
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000043', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Echtes Leder 4 Zoll Fitness Gürtel Gewichtheben/Trainingsgürtel - Braun', 'leather-weightlifting-belt', 'MHK-043',
  'Der erste Gedanke eines Gewichthebers ist, in Form zu bleiben. Unsere Schlinge ermöglicht Ihnen genau das. Beim Heben üben Sie Druck auf Ihre Bauchmuskeln und Ihren Rücken aus. Aber mit hochwertigem Leder bietet Ihnen unser Bodybuilding-Gürtel den Rumpf- und Lendenschutz, den Sie brauchen. Eigenschaften: – Farbe: Schwarz – Material: Leder LEICHT UND TRAGBAR: Schwer genug zum Stützen, aber leicht genug für unterwegs. Dieser Gewichthebergürtel aus Leder lässt sich einfach zusammenrollen und passt in eine Sporttasche – SICHERE PASSFORM: Die doppelten Dornschnallen sorgen für eine bequeme Passform, die nicht an der Taille hoch- oder herunterrutscht. – LANGLEBIG: Jeder Gürtel ist mit einer hochwertigen Konstruktion ausgestattet, um eine hervorragende Leistung zu gewährleisten. – BESSERE LENDENWIRBELSTÜTZE: Sie können Ihre Fitness- und Trainingsziele erreichen und gleichzeitig Ihren Rücken und Rumpf während des Trainings und der Übungen schützen. – ANWENDBARE PERSONEN: Ideal für Anfänger oder erfahrene Gewichtheber. Und gleichzeitig Ihren Rücken und Rumpf während des Trainings und der Übungen schützen. – ANWENDBARE PERSONEN: Ideal für Anfänger oder erfahrene Gewichtheber. Und gleichzeiti', 10600, null,
  7700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/echtes_leder_gewichtheben_fitness_gurtel_braun_rewon.jpg?v=1744496723','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/custom_weightlifting_belt.jpg?v=1719293418','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/echtes-leder-4-zoll-fitness-gurtel-braun-rewon-gewichtheben-trainingsgurtel.jpg?v=1744496723','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/echtes-leder-fitness-guertel-gewichtheben-trainingsguertel-braun-rewon.jpg?v=1744496723']::text[], false, '{"size":"Brown","color":"S","material":"Weight Lifting Belts"}'::jsonb, false, 43
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000044', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Powerlifting Lever Belts', 'powerlifting-lever-belts', 'MHK-044',
  'Are you ready to reach your fitness goals? Choose one of these men''s and women''s fitness belts for extra support as you get stronger and become a happier, healthier, and better version of yourself. Unlike the other brands on the market, we cut individual pieces of A-grade leather from the selected material only for uniform thickness throughout the belt, providing the best, most comfortable and durable belt on the market. The contoured shape of our 10mm -The weight lifting lever belt stabilizes your back and abdomen during heavy lifting, increasing core stability and promoting proper posture. The 10mm thickness provides the optimal strength and flexibility for excellent support and performance during squats, dead lifts and high volume training.', 20700, null,
  14900, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/powerlifting-lever-belt-rewon-a-grade-leather-fitness-support_1.jpg?v=1744496741','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/powerlifting-lever-belt-rewon-fitness-support-high-quality-leather-men-women.jpg?v=1744496741','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/powerlifting-lever-belt-rewon-a-grade-leather-fitness-support.jpg?v=1744496741','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/powerlifting_lever_belt_rewon_fitness_mens_womens_leather_support.jpg?v=1744496741']::text[], false, '{"color":"S","material":"Weight Lifting Belts"}'::jsonb, false, 44
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000045', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'Schienbeinschoner aus Baumwolle für Kampfsport/Kickboxen - Schwarz', 'shin-instep-cotton', 'MHK-045',
  'Diese Muay-Thai-Schienbeinschoner sind vorgeformt, um sich der natürlichen Krümmung Ihres Schienbeins anzupassen. Ihre MMA-Schienbeinschoner können dank eines sicheren Verschlusssystems mit dehnbarem Riemen angepasst werden. Wenn Sie also unseren Kickbox-Schienbeinschutz für Männer tragen, können Sie kompakte Schienbeinschoner, Kickpads und Trainingsausrüstung kombinieren, die Ihre Beweglichkeit und Agilität verbessern und Ihnen ermöglichen, an Geschwindigkeit zu gewinnen. Unsere MMA-Beinschoner sind nicht reizend und verstellbare Riemen halten diese MMA-Schienbeinschoner für Männer an Ort und Stelle.', 12900, 10600,
  7700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_schienbeinschoner_kickboxen_kampfsport_mehrfarbig_boxtraining_ausruestung_muay_thai_mma_karate_taekwondo.jpg?v=1744464388']::text[], false, '{"color":"S/M","material":"MMA Shin Guards"}'::jsonb, true, 45
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000046', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'RewonGear Innenhandschuhe Boxen – Elastische Boxbandagen', 'innenhandschuhe-boxen', 'MHK-046',
  'RewonGear Innenhandschuhe für Boxen & Training Die RewonGear Innenhandschuhe bieten zusätzlichen Schutz für Hände und Handgelenke beim Boxtraining, Kickboxen oder MMA. Sie dienen als praktische Alternative zu klassischen Boxbandagen und lassen sich schnell und unkompliziert anziehen. Das elastische und atmungsaktive Material sorgt für einen angenehmen Sitz unter Boxhandschuhen und unterstützt die Stabilität bei intensiven Trainingseinheiten. Ideal für Sportler, die Wert auf Komfort, Hygiene und zuverlässigen Handschutz legen. Vorteile der RewonGear Innenhandschuhe Elastisches, atmungsaktives Material Schnelles An- und Ausziehen Zusätzlicher Schutz für Knöchel und Handgelenk Perfekt unter Boxhandschuhen tragbar Ideal für Boxen, Kickboxen, MMA & Fitness Ideal geeignet für Die RewonGear Innenhandschuhe sind optimal für: Sandsacktraining Fitness-Boxen Kampfsport im Gym Training zuhause Trainieren Sie sicher und komfortabel mit der bewährten Qualität von RewonGear .', 6200, null,
  4400, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_innenhandschuhe_schwarz_karbonfasermaterial_atmungsaktiv_bequeme_passform_daumen_integration_fitness_boxing_mma.jpg?v=1744496808','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/innenhandschuhe-schwarz-rewon-gear-kohlefasermaterial-atmungsaktiv-fitnesshandschuhe-boxhandschuhe-mma-zubehor.jpg?v=1744496808','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_schwarz_innenhandschuhe_kohlefaser_gummizug_box_mma_fitness_hand_schutz.jpg?v=1744496808','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/innenhandschuhe-schwarz-rewon-gear-atmungsaktiv-kohlefaser-gummizug-daumenschutz.jpg?v=1744496808']::text[], false, '{"color":"S/M","material":"Boxing & MMA Hand Wraps"}'::jsonb, false, 46
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000047', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'Arm Handgelenkbandagen | Handgelenkstütze - Blau', 'hand-wraps-3', 'MHK-047',
  'Diese Rewon-Handbandagen bestehen aus hochwertigem Stoff mit genau dem richtigen Maß an Elastizität. Diese Bandagen sind bequem, langlebig und passen sich Ihren Händen an, um beim Training eine zusätzliche Schicht Unterstützung und Schutz zu bieten. Hervorragend geeignet für Boxen, Kickboxen, Muay Thai und andere Kampfsportarten. Zwei Bandagen sind im Paket enthalten. Eigenschaften: Länge und Dehnbarkeit im mexikanischen Stil Daumenschlaufe als Ausgangspunkt „Diese Seite nach oben“-Aufdruck auf einem extrabreiten Klettverschluss Trockner- und maschinenwaschbar Halbelastisches Material, das langlebig ist', 5300, 2800,
  2000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-blau-handgelenkbandagen-elastisch-schutz-trainingsport-kampfsport-boxen-kickboxen-muaythai-zwei-stueck.webp?v=1744496842','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_blaue_handgelenkbandagen_training_boxen_kampfsport_handstuetze.webp?v=1744496842','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_blau_handgelenkbandagen_handgelenkstuetze_boxen_kampfsport_training_hochwertig_langlebig_elastisch_schutz.webp?v=1744496842','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-blaue-handgelenkbandagen-schutz-trainingshilfe-boxen-kampfsport.webp?v=1744496842']::text[], true, '{"color":"2.5M","material":"Boxing & MMA Hand Wraps"}'::jsonb, true, 47
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000048', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'Arm Handgelenkbandagen | Handgelenkstütze - Schwarz', 'hand-wraps-2', 'MHK-048',
  'Diese Rewon-Handbandagen bestehen aus hochwertigem Stoff mit genau dem richtigen Maß an Elastizität. Diese Bandagen sind bequem, langlebig und passen sich Ihren Händen an, um beim Training eine zusätzliche Schicht Unterstützung und Schutz zu bieten. Hervorragend geeignet für Boxen, Kickboxen, Muay Thai und andere Kampfsportarten. Zwei Bandagen sind im Paket enthalten. Eigenschaften: Länge und Dehnbarkeit im mexikanischen Stil Daumenschlaufe als Ausgangspunkt „Diese Seite nach oben“-Aufdruck auf einem extrabreiten Klettverschluss Trockner- und maschinenwaschbar Halbelastisches Material, das langlebig ist', 5300, 2800,
  2000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/3.5MTR1STBLK.jpg?v=1713270317','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/arm-handgelenkbandagen-schwarz-handgelenkstuetze-rewon-boxen-kickboxen-muay-thai-kampfsport.jpg?v=1744496856','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_schwarz_wrist_wraps_elastic_support_training_protection_martial_arts_kickboxing_boxing.jpg?v=1744496856']::text[], false, '{"color":"2.5M","material":"Boxing & MMA Hand Wraps"}'::jsonb, true, 48
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000049', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'Knieschoner | Kniestütze | Knieprotektoren - Weiß/Schwarz', 'knee-pad-cotton-1', 'MHK-049',
  'Fortschrittlicher Knieschutz: Die Knieschoner von Rewon wurden mit fortschrittlicher Polstertechnologie entwickelt und bieten eine hervorragende Stoßdämpfung. Reduziert das Risiko von Verletzungen und Überlastungen. KOMFORTABLES UND HAUTFREUNDLICHES MATERIAL: Unsere bequeme Kniebandage besteht aus einem weichen und atmungsaktiven Stoff und gewährleistet maximalen Komfort bei längerem Tragen. Verhindert Hautreizungen und Beschwerden. KOMFORTABLES UND HAUTFREUNDLICHES MATERIAL: Unsere bequeme Kniebandage besteht aus einem weichen und atmungsaktiven Stoff und gewährleistet maximalen Komfort bei längerem Tragen. Verhindert Hautreizungen und Beschwerden. Zwei Farboptionen: Drücken Sie Ihren Stil und Ihre Individualität mit unseren Knieschonern aus, die in Rot und Weiß/Schwarz erhältlich sind und zu jeder Aktivität und jedem Outfit passen. Ideal für verschiedene Aktivitäten: Egal, ob Sie Sport treiben, im Garten arbeiten oder Handarbeiten verrichten, unsere Kniebandage ist der perfekte Begleiter und bietet in jeder Situation zuverlässigen Halt und Schutz.', 8400, 4800,
  3400, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_knieschoner_kniestuetze_knieprotektoren_mehrfarbig_boxtraining_fitness_kickboxen_ausruestung.jpg?v=1744459659','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/knieschoner-kniestutze-knieprotektoren-mehrfarbig-rewon-boxing-fitness-training-ausrustung.jpg?v=1744463716','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-knieschoner-knieprotektoren-mehrfarbig-komfortabler-stossdaempfender-kniestuetze.jpg?v=1743710098']::text[], true, '{"color":"S/M","material":"Safety Knee Pads"}'::jsonb, false, 49
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000050', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'Knieschoner | Kniestütze | Knieprotektoren - Rot', 'knee-pad-cotton', 'MHK-050',
  'Fortschrittlicher Knieschutz: Die Knieschoner von Rewon wurden mit fortschrittlicher Polstertechnologie entwickelt und bieten eine hervorragende Stoßdämpfung. Reduziert das Risiko von Verletzungen und Überlastungen. KOMFORTABLES UND HAUTFREUNDLICHES MATERIAL: Unsere bequeme Kniebandage besteht aus einem weichen und atmungsaktiven Stoff und gewährleistet maximalen Komfort bei längerem Tragen. Verhindert Hautreizungen und Beschwerden. KOMFORTABLES UND HAUTFREUNDLICHES MATERIAL: Unsere bequeme Kniebandage besteht aus einem weichen und atmungsaktiven Stoff und gewährleistet maximalen Komfort bei längerem Tragen. Verhindert Hautreizungen und Beschwerden. Zwei Farboptionen: Drücken Sie Ihren Stil und Ihre Individualität mit unseren Knieschonern aus, die in Rot und Weiß/Schwarz erhältlich sind und zu jeder Aktivität und jedem Outfit passen. Ideal für verschiedene Aktivitäten: Egal, ob Sie Sport treiben, im Garten arbeiten oder Handarbeiten verrichten, unsere Kniebandage ist der perfekte Begleiter und bietet in jeder Situation zuverlässigen Halt und Schutz.', 8400, 2800,
  2000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_knieschoner_kniestuetze_knieprotektoren_mehrfarbig_fortschrittlicher_knieschutz_sports_equipment.jpg?v=1744459659','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_knieschoner_knieprotektoren_mehrfarbig_boxing_fitness_training_knieschutz_stossdaempfung.jpg?v=1744463716']::text[], true, '{"color":"S/M","material":"Safety Knee Pads"}'::jsonb, false, 50
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000051', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'Unterarmschutz | Taekwondo Unterarmschutz - Weiß', 'forearm-protection', 'MHK-051',
  'Produktbeschreibungen Stoffschützer von Rewongear. Größen: Erhältlich in den Größen SMALL/MEDIUM/LARGE/XL. Paketinhalt: Verkauf paarweise. Material: Ein Schaumstoffpolster an den Problemzonen verhindert das Risiko von Blutergüssen. Hautfreundliches Baumwollmaterial, waschbar bis 30 Grad. KOMFORTABLE UND ANPASSBARE PASSFORM: Diese Muay-Thai-ARM-Schoner sind vorgeformt, um sich der natürlichen Krümmung Ihres Arms anzupassen. Ihre ARM-Schoner können dank eines sicheren Verschlusssystems mit einem dehnbaren Riemen angepasst werden. Wenn Sie also unseren Armschutz für Männer tragen, können Sie kompakte ARM-Schoner tragen, und die Trainingsausrüstung verbessert die Beweglichkeit und Agilität, sodass Sie schneller werden.', 5300, null,
  3800, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/weiss_unterarmschutz_taekwondo_rewon_stoffschutz_arm.jpg?v=1744496914','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_weiss_unterarmschutz_taekwondo_stoffschuetzer_schaumstoffpolster_hautfreundlich_komfortabel_anpassbare_passform.jpg?v=1744496914']::text[], false, '{"color":"S","material":"Boxing & Martial Arts Arm Guards"}'::jsonb, false, 51
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000052', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'Rewon Tiefschutz Jockstrap – Mesh Cup für MMA, Boxen & Muay Thai', 'groin-protector', 'MHK-052',
  'Rewon Tiefschutz – Komfortabler Baumwoll-Jockstrap für Kampfsport 🛡️ 🏋️ Produkt-Highlight Der Rewon Gear Tiefschutz wurde speziell für Boxer, MMA-Kämpfer und Muay-Thai-Enthusiasten entwickelt. Mit seiner atmungsaktiven Netzstruktur und dem festen elastischen Bund bietet er maximalen Tragekomfort und zuverlässigen Schutz bei jeder Trainingseinheit. ✨ Eigenschaften im Überblick ✅ Material: Hochwertige Baumwolle mit Mesh-Struktur – atmungsaktiv und hygienisch ✅ Schutz: Herausnehmbare Hartschale für optimalen Genitalschutz ✅ Komfort: Breiter, elastischer Bund für sicheren Sitz ohne Druckstellen ✅ Design: Klassisches Weiß mit Rewon-Logo – stilvoll und funktional 🛠️ Funktion & Problemlösung 🚫 Kein Verrutschen: Anatomische Passform mit stabilem Sitz 🌀 Kein Schwitzen: Luftdurchlässige Materialien für optimales Körperklima 👊 Kein Risiko: Ideal für intensives Sparring & Wettkämpfe 📏 Größe & Passform Erhältlich in S, M, L, XL Unisex-Schnitt für Männer Bitte Größentabelle beachten 🧼 Pflegehinweise Maschinenwaschbar bei 30 °C (ohne Schutzschale) Schonende Reinigung empfohlen ❓ FAQs Ist der Schutz für Turniere geeignet? ✅ Ja, er erfüllt alle gängigen Wettkampfanforderungen. Ist die Harts', 7600, 6200,
  4400, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/tiefschutz-box-jockstrap-mma-muay-thai-shockdoctor-weiss-rewon-schutzausrustung.jpg?v=1744497159','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/tiefschutz-box-jockstrap-mma-muay-thai-weiss-schockdoctor-rewon-breiter-bund-super-support-schweissableitend-polstertaschen.jpg?v=1744497159','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_tiefschutz_box_jockstrap_mma_muay_thai_shockdoctor_weis_breiterbund_schweissableitend_pollycotton_support.jpg?v=1744497159']::text[], true, '{"color":"S","material":"Boxing & Martial Arts Protective Gear"}'::jsonb, false, 52
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000053', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'Gel Innenhandschuhe Boxen – Boxbandagen', 'gel-innenhandschuhe-boxen', 'MHK-053',
  'Gel Innenhandschuhe für Boxen & Training Die Gel Innenhandschuhe von RewonGear bieten zuverlässigen Schutz für Knöchel und Handgelenke beim Boxtraining, Kickboxen oder MMA. Dank der stoßdämpfenden Gelpolsterung werden die Hände effektiv entlastet und optimal auf intensive Trainingseinheiten vorbereitet. Das elastische und atmungsaktive Material sorgt für eine bequeme Passform unter Boxhandschuhen, während der stabile Klettverschluss zusätzlichen Halt am Handgelenk bietet. Eine praktische Alternative zu klassischen Boxbandagen – ideal für schnelles und komfortables Training. Vorteile der Gel Innenhandschuhe Stoßabsorbierende Gelpolsterung Atmungsaktives, elastisches Material Sicherer Klettverschluss für Handgelenkstabilität Schneller anzulegen als klassische Boxbandagen Ideal für Boxen, Kickboxen, MMA & Fitness Ideal geeignet für Diese Gel Innenhandschuhe sind perfekt für: Sandsacktraining Sparring-Vorbereitung Fitness-Boxen Kampfsport im Gym oder zuhause Mit RewonGear trainieren Sie komfortabel, geschützt und effizient.', 8400, 3900,
  2800, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/handbandagen-gelbandagen-weiss-rewon-atmungsaktiv-elastisch-schutz-unter-boxhandschuhen.webp?v=1744497197','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/handbandagen_gelbandagen_weiss_rewon_ergonomic_comfy_gear.webp?v=1744497197','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/white-handbandagen-gelbandagen-rewon-boxing-mma-fitness-gloves.webp?v=1744497197','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-handbandagen-gelbandagen-weiss-groessentabelle-s-m-l-xl.webp?v=1744497197']::text[], true, '{"color":"S/M","material":"Boxing & Martial Arts Protective Gear"}'::jsonb, false, 53
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000054', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'Handbandagen/Gelbandagen - BLAU', 'boxing-inner-gel-gloves', 'MHK-054',
  'Hergestellt aus atmungsaktivem, weichem Gelmaterial aus permanent dehnbarem Kohlefasermaterial Elastisch für eine bequeme Passform um die Hand Bedecken die Hälfte der Finger und haben einen angenähten Daumen für zusätzlichen Halt Dieses Produkt kann unter Box-, MMA- oder Fitnesshandschuhen für zusätzlichen Halt und Schutz verwendet werden. Maschinenwäsche wird aufgrund des empfindlichen Gewebes nicht empfohlen, kann aber in leicht warmem Waschmittelwasser ausgespült werden. Die hochwertigen Innenhandschuhe von Rewon Gear bestehen aus atmungsaktivem, weichem, permanent dehnbarem Kohlefasermaterial mit Gummizug für eine bequeme Passform um die Hand. Sie bedecken die Hälfte der Finger und haben einen angenähten Daumen für zusätzlichen Halt für Ihren Daumen. empfiehlt dieses Produkt zur Verwendung unter Box-, MMA- oder Fitnesshandschuhen für zusätzlichen Halt und Schutz. Maschinenwäsche wird aufgrund des empfindlichen Gewebes nicht empfohlen, kann aber in leicht warmem Waschmittelwasser ausgespült werden.', 8400, 3900,
  2800, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/handbandagen-gelbandagen-blau-rewon-gelmaterial-kohlefaser-elastisch-fit-box-mma-fitnesshandschuhe-schutz.jpg?v=1744497236','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/handbandagen-gelbandagen-blau-rewon-atmungsaktiv-elastisch-kohlefasermaterial-box-mma-fitnesshandschuhe-schutz-halt.jpg?v=1744497236','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-handbandagen-gelbandagen-blau-atmungsaktiv-boxhandschuhe-mma-fitness-daumen-halt-schutz.jpg?v=1744497236','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/blau-handbandagen-gelbandagen-rewon-atmungsaktiv-elastisch-kohlefaser-halb-finger-box-mma-fitnesshandschuhe-zusatzlicher-halt-schutz.jpg?v=1744497236']::text[], false, '{"color":"S/M","material":"Boxing & Martial Arts Protective Gear"}'::jsonb, false, 54
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000055', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Rewon Neopren Dip-Gürtel mit Stahlkette – Grau Camo', 'neopren-dip-guertel-stahlkette-grau-camo-rewon', 'MHK-055',
  'Rewon Neopren Dip-Gürtel Grau Camo Kraft & Stil für Ihr Training Bringen Sie neue Intensität in Ihr Workout mit dem Rewon Neopren Dip-Gürtel im stylischen Grau Camo Design. Dieser Gürtel ist das unverzichtbare Tool für Calisthenics-Athleten, Bodybuilder und Kraftsportler, die ihre Grenzen bei Dips, Klimmzügen und Kniebeugen durch zusätzliche Gewichte erweitern wollen. Warum dieser Dip-Gürtel? Extreme Belastbarkeit: Die schwere, langlebige Stahlkette ermöglicht die sichere Befestigung von Hantelscheiben oder Kettlebells für maximale Widerstände. Premium Neopren-Komfort: Das weiche, aber extrem reißfeste Neopren-Material schont die Hüfte und verhindert schmerzhaftes Einschneiden während schwerer Sätze. Sichere Passform: Dank der konturierten Form schmiegt sich der Gürtel perfekt an Ihren Körper an und bietet stabilen Halt ohne zu verrutschen. Universelle Größe: Das verstellbare Design sorgt für eine optimale Passform bei jeder Taillengröße. Stylisches Camo-Design: Heben Sie sich im Gym ab mit der exklusiven Grau Camo Optik. Einsatzbereiche: Ideal für professionelles Training im Bereich Calisthenics, Gewichtheben, Crossfit und Bodybuilding. Perfekt für Übungen wie: Gewichtete Dips (Ba', 7600, null,
  5400, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/dip-belt-with-chain-adjustable-heavy-duty-neoprene-dipping-pullups-lunges-fitness.jpg?v=1743710574','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/adjustable-dip-belt-with-chain-high-quality-neoprene-contoured-construction-fitness-gear.jpg?v=1743710574','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/dip-belt-with-chain-heavy-duty-neoprene-fitness-kit-weightlifting-resistance.jpg?v=1743710574']::text[], false, '{"color":"Grey Camo","material":"Dip Belt"}'::jsonb, false, 55
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000056', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'Rewon Excellence Boxhandschuhe R5 - GRÜN', 'r5-excellence-boxing-gloves-2', 'MHK-056',
  'Kickbox Handschuhe und Muay Thai Handschuhe Unsere Kickbox- und Muay Thai-Handschuhe bieten ausgezeichneten Schutz und Haltbarkeit. Mit laminiertem, authentischem Schaumstoff ausgestattet, schützen sie effektiv die stoßdämpfende Mitte und gewährleisten hohen Komfort und Langlebigkeit. Boxhandschuhe für Frauen und Herren Wir bieten Boxhandschuhe speziell für Frauen und Herren an, die eine perfekte Passform und optimalen Schutz gewährleisten. Sie bestehen aus hochdichtem PU und geformtem EVA, ergänzt durch Schaumstoffpolsterung für eine High-Tech-Stoßdämpfung, die bei jedem Schlag Vertrauen gibt. Beste Boxhandschuhe mit Knöchelschutz Unsere Boxhandschuhe sind die besten auf dem Markt, wenn es um Knöchelschutz geht. Der Daumen ist mit EVA-Polsterung versehen und bietet in Kombination mit zusätzlichem Schaumstoff maximalen Schutz vor Verletzungen, selbst bei intensiven Trainingseinheiten. MMA-Handschuhe für Vielseitiges Training Unsere MMA-Handschuhe sind für vielseitige Trainingseinheiten konzipiert und bieten die notwendige Bewegungsfreiheit und Schutz. Ideal für Mixed Martial Arts-Training und Sparring-Sessions. Boxhandschuhe Günstig – Qualität zu einem erschwinglichen Preis Für Ein', 16800, 12000,
  8700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/GREEN1.jpg?v=1694074385','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-excellence-boxhandschuhe-r5-gruen-kickbox-muay-thai-handschuhe-schutz-haltbarkeit_1.jpg?v=1743710911','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-excellence-green-kickbox-muay-thai-boxing-gloves-r5-durability-comfort.jpg?v=1743710911','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-excellence-boxhandschuhe-r5-gruen-kickbox-muay-thai-handschuhe-schutz-haltbarkeit.jpg?v=1743710911']::text[], false, '{"color":"8oz","material":"Boxing Gloves & Mitts"}'::jsonb, false, 56
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000057', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'Rewon Excellence Boxhandschuhe R5 - GELB', 'r5-excellence-boxing-gloves-1', 'MHK-057',
  'Kickbox Handschuhe und Muay Thai Handschuhe Unsere Kickbox- und Muay Thai-Handschuhe bieten ausgezeichneten Schutz und Haltbarkeit. Mit laminiertem, authentischem Schaumstoff ausgestattet, schützen sie effektiv die stoßdämpfende Mitte und gewährleisten hohen Komfort und Langlebigkeit. Boxhandschuhe für Frauen und Herren Wir bieten Boxhandschuhe speziell für Frauen und Herren an, die eine perfekte Passform und optimalen Schutz gewährleisten. Sie bestehen aus hochdichtem PU und geformtem EVA, ergänzt durch Schaumstoffpolsterung für eine High-Tech-Stoßdämpfung, die bei jedem Schlag Vertrauen gibt. Beste Boxhandschuhe mit Knöchelschutz Unsere Boxhandschuhe sind die besten auf dem Markt, wenn es um Knöchelschutz geht. Der Daumen ist mit EVA-Polsterung versehen und bietet in Kombination mit zusätzlichem Schaumstoff maximalen Schutz vor Verletzungen, selbst bei intensiven Trainingseinheiten. MMA-Handschuhe für Vielseitiges Training Unsere MMA-Handschuhe sind für vielseitige Trainingseinheiten konzipiert und bieten die notwendige Bewegungsfreiheit und Schutz. Ideal für Mixed Martial Arts-Training und Sparring-Sessions. Boxhandschuhe Günstig – Qualität zu einem erschwinglichen Preis Für Ein', 16800, 12000,
  8700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-excellence-r5-kickbox-muay-thai-boxhandschuhe-gelb.jpg?v=1743710932','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-excellence-r5-boxhandschuhe-gelb-kickbox-muay-thai-handschuhe-schutz-dauerhaft.jpg?v=1743710932','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-excellence-boxhandschuhe-r5-gelb-kickbox-muay-thai-handschuhe-schutz-haltbarkeit-frauen-herren.jpg?v=1743710932','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-excellence-boxhandschuhe-r5-gelb-kickbox-muay-thai-handschuhe-fuer-frauen-herren-schutz-haltbarkeit.jpg?v=1743710932']::text[], false, '{"color":"8oz","material":"Boxing Gloves & Mitts"}'::jsonb, false, 57
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000058', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'R5 Excellence Boxhandschuhe Leder – Training & Sparring', 'r5-excellence-boxhandschuhe-leder', 'MHK-058',
  'R5 Excellence Leder Boxhandschuhe für Training & Sparring Die R5 Excellence Boxhandschuhe aus Leder von RewonGear wurden für ambitionierte Boxer, Kickboxer und Muay-Thai-Athleten entwickelt. Sie bieten erstklassigen Schutz, hohe Langlebigkeit und maximalen Komfort bei intensiven Trainingseinheiten. Das hochwertige Leder sorgt für eine lange Lebensdauer, während die mehrlagige Polsterung Stöße effektiv absorbiert und Ihre Hände optimal schützt. Die ergonomische Form unterstützt eine natürliche Fausthaltung und verbessert die Schlagkontrolle. Vorteile der R5 Excellence Boxhandschuhe Hochwertiges Leder für maximale Haltbarkeit Mehrlagige Polsterung für optimalen Schutz Ergonomische Passform für sicheren Halt Ideal für Boxen, Kickboxen & Muay Thai Perfekt für Training, Sparring & Wettkampfvorbereitung Mit den R5 Excellence Leder Boxhandschuhen von RewonGear trainieren Sie auf professionellem Niveau – im Gym oder zu Hause.', 16800, 12000,
  8700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-excellence-boxhandschuhe-r5-schwarz-kickbox-muay-thai-gloves-protection-durability-unisex.jpg?v=1743710951','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-excellence-boxhandschuhe-r5-schwarz-kickbox-muay-thai-gloves-protection-durability-comfort.jpg?v=1743710951','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-excellence-boxhandschuhe-r5-schwarz-kickbox-muay-thai-gloves-protection-durability.jpg?v=1743710951','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_excellence_boxhandschuhe_r5_schwarz_kickbox_muay_thai_gloves_protection_durability_comfort.jpg?v=1743710951']::text[], false, '{"color":"8oz","material":"Boxing Gloves & Mitts"}'::jsonb, false, 58
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000059', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'Kinder Boxhandschuhe für Training & Kickboxen', 'kinder-boxhandschuhe-kickboxen', 'MHK-059',
  'Kinder Boxhandschuhe für Boxen, Kickboxen & Training Die Kinder Boxhandschuhe von RewonGear sind speziell für junge Einsteiger und Nachwuchssportler entwickelt. Sie bieten zuverlässigen Schutz, hohen Tragekomfort und eine ergonomische Passform für sicheres Training. Die stoßabsorbierende Polsterung schützt Hände und Handgelenke effektiv bei Training, Sandsackarbeit und ersten Sparring-Einheiten. Gleichzeitig sorgt das leichte Design für maximale Bewegungsfreiheit. Vorteile der Kinder Boxhandschuhe Ergonomische Passform für kleine Hände Stoßdämpfende Polsterung für mehr Sicherheit Leichtes und bequemes Tragegefühl Strapazierfähiges Material für lange Nutzung Ideal für Boxen, Kickboxen & Nachwuchs-Training Ideal geeignet für Diese Boxhandschuhe für Kinder sind perfekt für: Anfänger im Kampfsport Kinder-Boxtraining im Verein Home-Training mit Boxsack Nachwuchs-Kickboxer Mit RewonGear Kinder Boxhandschuhen trainieren junge Sportler sicher, komfortabel und mit Spaß.', 10600, null,
  7700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-kinder-boxhandschuhe-rot-schutz-dauerhaftigkeit-stossdaempfung.jpg?v=1743710967','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-kinder-boxhandschuhe-rot-pu-schaumstoff-kinderschutz-stossdaempfend-sicheres-training.jpg?v=1743710967','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/r11.jpg?v=1713269041']::text[], false, '{"color":"6oz","material":"Boxing Gloves & Mitts"}'::jsonb, false, 59
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000060', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'Kinder Boxhandschuhe – Training & Sparring', 'kinder-boxhandschuhe', 'MHK-060',
  'Kinder Boxhandschuhe für Training, Sparring & Kickboxen Die Kinder Boxhandschuhe von RewonGear wurden speziell für junge Boxer entwickelt, die sicher und komfortabel trainieren möchten. Ob beim Boxtraining, Kickboxen oder MMA — diese Handschuhe bieten optimalen Schutz, hohen Tragekomfort und langlebige Qualität. Dank der stoßabsorbierenden Polsterung werden Hände und Handgelenke zuverlässig geschützt. Die ergonomische Passform sorgt für einen festen Sitz, während das atmungsaktive Material ein angenehmes Training ermöglicht. Vorteile auf einen Blick Optimaler Schutz für Kinderhände Stoßdämpfende Schaumstoffpolsterung Ergonomische und bequeme Passform Robustes Material für lange Haltbarkeit Sicherer Klettverschluss für festen Halt Ideal für Boxen, Kickboxen & MMA Für wen geeignet? Diese Kinder Boxhandschuhe sind perfekt für: Anfänger & Nachwuchsboxer Vereinstraining Home-Training Kickbox- und MMA-Einsteiger Warum RewonGear? Mit RewonGear entscheiden Sie sich für geprüfte Kampfsport-Qualität. Unsere Produkte werden von Athleten und Trainern geschätzt und bieten ein starkes Preis-Leistungs-Verhältnis. Jetzt Kinder Boxhandschuhe kaufen und sicher trainieren!', 10600, null,
  7700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/kinder-boxhandschuhe-rosa-rewon-schaumstoff-polsterung-kinderschutz.jpg?v=1744468216','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/kinder-boxhandschuhe-rosa-rewon-schaumstoff-daumenschutz-stossdampfung.jpg?v=1744468215','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/r4.jpg?v=1692961802']::text[], true, '{"color":"6oz","material":"Boxing Gloves & Mitts"}'::jsonb, false, 60
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000061', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'Kinder Boxhandschuhe für Training & Sparring', 'kinder-boxhandschuhe-training', 'MHK-061',
  'Kinder Boxhandschuhe für sicheres Training Die Kinder Boxhandschuhe von RewonGear wurden speziell für junge Sportler entwickelt, die mit Boxen, Kickboxen oder MMA beginnen. Sie bieten optimalen Schutz, hohen Tragekomfort und eine kinderfreundliche Passform für sicheres Training. Dank der stoßdämpfenden Polsterung werden Hände und Handgelenke zuverlässig geschützt – ideal für Training, Sandsack und erste Sparring-Einheiten. Vorteile der RewonGear Kinder Boxhandschuhe Ergonomische Passform für Kinderhände Stoßabsorbierende Polsterung für mehr Sicherheit Leichtes und komfortables Design Robustes Material für lange Haltbarkeit Ideal für Boxen, Kickboxen und MMA Für wen sind diese Kinder Boxhandschuhe geeignet? Diese Boxhandschuhe für Kinder sind perfekt für: Anfänger im Kampfsport Kinder-Boxtraining im Verein Heimtraining mit Boxsack Nachwuchs-Athleten Mit RewonGear starten junge Kämpfer sicher und selbstbewusst ins Training.', 10600, null,
  7700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/kinder_boxhandschuhe_schwarz_rewon_hochdichte_pu_foam_evapolsterung.jpg?v=1744468225','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/kinder-boxhandschuhe-schwarz-rewon-schutz-dauerhaftigkeit-stossdampfung-schaumstoff.jpg?v=1744468225']::text[], false, '{"color":"6oz","material":"Boxing Gloves & Mitts"}'::jsonb, false, 61
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000062', 'dddddddd-dddd-dddd-dddd-dddddddddd06', 'Shemagh scarf', 'shemagh-scarf-10', 'MHK-062',
  'Staying Cool: If water is not an issue, a shemagh can help you stay cool on a hot day. Soak it in water and wrap it around your head and neck. It will last until the water evaporates. Signalling Device: The more colorful ones can be used for signalling other people in case you got lost on a hike in order to attract attention of a helicopter. Closure: Pull On Shemaghs Sand and Dust and Smoke Protection: If there’s smoke in the air, a damp shemagh can reduce smoke inhalation and allow you to breathe better. The shemagh scarf is a traditional headwear in the Middle East. It is also known as a keffiyeh, ghutrah or by other names. It is worn on the head or around the shoulders. Sun Protection: as a turban or loosely over the shoulders and the back. as a neck-scarf it will protect your chest and shoulders from the sun, or as a cover for your face for additional protection. as a sun shade when tied to poles or branches.', 5600, null,
  4000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/shemagh_scarf_cooling_heads_neck_wrap_signal_device_dust_protection_green_design.jpg?v=1744468239','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/shemagh_scarf_cooling_signal_device_sand_dust_protection.jpg?v=1744468239','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/shemagh_scarf_cooling_signal_device_dust_protection_tactical_gear.jpg?v=1744468239']::text[], true, '{"color":"OD/Black/Rifles","material":"Scarves"}'::jsonb, false, 62
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000063', 'dddddddd-dddd-dddd-dddd-dddddddddd06', 'Shemagh scarf', 'shemagh-scarf-9', 'MHK-063',
  'Staying Cool: If water is not an issue, a shemagh can help you stay cool on a hot day. Soak it in water and wrap it around your head and neck. It will last until the water evaporates. Signalling Device: The more colorful ones can be used for signalling other people in case you got lost on a hike in order to attract attention of a helicopter. Closure: Pull On Shemaghs Sand and Dust and Smoke Protection: If there’s smoke in the air, a damp shemagh can reduce smoke inhalation and allow you to breathe better. The shemagh scarf is a traditional headwear in the Middle East. It is also known as a keffiyeh, ghutrah or by other names. It is worn on the head or around the shoulders. Sun Protection: as a turban or loosely over the shoulders and the back. as a neck-scarf it will protect your chest and shoulders from the sun, or as a cover for your face for additional protection. as a sun shade when tied to poles or branches.', 5600, null,
  4000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/shemagh_scarf_cool_weather_signaling_sand_dust_protection.jpg?v=1744468250','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/shemagh_scarf_dark_green_cooling_signal_summer_hiking_safety_accessory.jpg?v=1744468250','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/shemagh_scarf_green_cooling_in_hot_weather_signalling_device_hiking_safety_gear.jpg?v=1744468250']::text[], true, '{"color":"OD/Black/Pineapple","material":"Scarves"}'::jsonb, false, 63
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000064', 'dddddddd-dddd-dddd-dddd-dddddddddd06', 'Shemagh scarf', 'shemagh-scarf-8', 'MHK-064',
  'Staying Cool: If water is not an issue, a shemagh can help you stay cool on a hot day. Soak it in water and wrap it around your head and neck. It will last until the water evaporates. Signalling Device: The more colorful ones can be used for signalling other people in case you got lost on a hike in order to attract attention of a helicopter. Closure: Pull On Shemaghs Sand and Dust and Smoke Protection: If there’s smoke in the air, a damp shemagh can reduce smoke inhalation and allow you to breathe better. The shemagh scarf is a traditional headwear in the Middle East. It is also known as a keffiyeh, ghutrah or by other names. It is worn on the head or around the shoulders. Sun Protection: as a turban or loosely over the shoulders and the back. as a neck-scarf it will protect your chest and shoulders from the sun, or as a cover for your face for additional protection. as a sun shade when tied to poles or branches.', 5600, null,
  4000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/shemagh_scarf_cooling_signal_star_pattern_khaki_head_wrap.jpg?v=1744468266','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/cooling_shemagh_scarf_signal_device_olive_green_stars_patterns_hiking_outdoor_gear.jpg?v=1744468266','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/shemagh_scarf_staying_cool_signal_device_stars_pattern_khaki_neck_head_cover.jpg?v=1744468266']::text[], false, '{"color":"OD/Black/Star","material":"Scarves"}'::jsonb, false, 64
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000065', 'dddddddd-dddd-dddd-dddd-dddddddddd06', 'Shemagh scarf', 'shemagh-scarf-7', 'MHK-065',
  'Staying Cool: If water is not an issue, a shemagh can help you stay cool on a hot day. Soak it in water and wrap it around your head and neck. It will last until the water evaporates. Signalling Device: The more colorful ones can be used for signalling other people in case you got lost on a hike in order to attract attention of a helicopter. Closure: Pull On Shemaghs Sand and Dust and Smoke Protection: If there’s smoke in the air, a damp shemagh can reduce smoke inhalation and allow you to breathe better. The shemagh scarf is a traditional headwear in the Middle East. It is also known as a keffiyeh, ghutrah or by other names. It is worn on the head or around the shoulders. Sun Protection: as a turban or loosely over the shoulders and the back. as a neck-scarf it will protect your chest and shoulders from the sun, or as a cover for your face for additional protection. as a sun shade when tied to poles or branches.', 5600, null,
  4000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/shemagh_scarf_cool_comfort_signal_device_sand_dust_protection.jpg?v=1744468282','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/shemagh_scarf_cooling_signal_device_pull_on_dust_protection.jpg?v=1744468282','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/shemagh_scarf_cooling_signal_device_pull_on_sand_dust_protection.jpg?v=1744468282','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/shemagh_scarf_cooling_wrap_water_soaked_head_neck_signalling_hiking_dust_protection_sand_color.jpg?v=1744468282']::text[], true, '{"color":"Coyote/Brown","material":"Scarves"}'::jsonb, false, 65
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000066', 'dddddddd-dddd-dddd-dddd-dddddddddd06', 'Shemagh scarf', 'shemagh-scarf-6', 'MHK-066',
  'Staying Cool: If water is not an issue, a shemagh can help you stay cool on a hot day. Soak it in water and wrap it around your head and neck. It will last until the water evaporates. Signalling Device: The more colorful ones can be used for signalling other people in case you got lost on a hike in order to attract attention of a helicopter. Closure: Pull On Shemaghs Sand and Dust and Smoke Protection: If there’s smoke in the air, a damp shemagh can reduce smoke inhalation and allow you to breathe better. The shemagh scarf is a traditional headwear in the Middle East. It is also known as a keffiyeh, ghutrah or by other names. It is worn on the head or around the shoulders. Sun Protection: as a turban or loosely over the shoulders and the back. as a neck-scarf it will protect your chest and shoulders from the sun, or as a cover for your face for additional protection. as a sun shade when tied to poles or branches.', 5600, null,
  4000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/cooling_shemagh_scarf_stay_cool_hot_day_signal_device_blue_pattern.jpg?v=1744468298','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/shemagh_scarf_cooling_signal_water_soaked_gray_pattern_outdoor_gear.jpg?v=1744468298','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/shemagh_scarf_blue_grey_cooling_signalling_hiking_sand_dust_protection.jpg?v=1744468298','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/shemagh_scarf_cooling_device_signal_hiking_sand_dust_protection.jpg?v=1744468298']::text[], true, '{"color":"Blue/Black","material":"Scarves"}'::jsonb, false, 66
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000067', 'dddddddd-dddd-dddd-dddd-dddddddddd06', 'Shemagh scarf', 'copy-of-shemagh-scarf', 'MHK-067',
  'Staying Cool: If water is not an issue, a shemagh can help you stay cool on a hot day. Soak it in water and wrap it around your head and neck. It will last until the water evaporates. Signalling Device: The more colorful ones can be used for signalling other people in case you got lost on a hike in order to attract attention of a helicopter. Closure: Pull On Shemaghs Sand and Dust and Smoke Protection: If there’s smoke in the air, a damp shemagh can reduce smoke inhalation and allow you to breathe better. The shemagh scarf is a traditional headwear in the Middle East. It is also known as a keffiyeh, ghutrah or by other names. It is worn on the head or around the shoulders. Sun Protection: as a turban or loosely over the shoulders and the back. as a neck-scarf it will protect your chest and shoulders from the sun, or as a cover for your face for additional protection. as a sun shade when tied to poles or branches.', 5600, null,
  4000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/shemagh_scarf_black_white_pattern_versatile_headgear_signal_aid_cool_down_hot_weather.jpg?v=1744468313','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/shemagh-scarf-stay-cool-signalling-device-sand-dust-protection.jpg?v=1744468313','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/cool-stylish-shemagh-scarf-sand-dust-protection-signal-aid-hiking-accessory.jpg?v=1744468313']::text[], true, '{"color":"Black/White/Star","material":"Scarves"}'::jsonb, false, 67
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000068', 'dddddddd-dddd-dddd-dddd-dddddddddd06', 'Shemagh scarf', 'shemagh-scarf-4', 'MHK-068',
  'Staying Cool: If water is not an issue, a shemagh can help you stay cool on a hot day. Soak it in water and wrap it around your head and neck. It will last until the water evaporates. Signalling Device: The more colorful ones can be used for signalling other people in case you got lost on a hike in order to attract attention of a helicopter. Closure: Pull On Shemaghs Sand and Dust and Smoke Protection: If there’s smoke in the air, a damp shemagh can reduce smoke inhalation and allow you to breathe better. The shemagh scarf is a traditional headwear in the Middle East. It is also known as a keffiyeh, ghutrah or by other names. It is worn on the head or around the shoulders. Sun Protection: as a turban or loosely over the shoulders and the back. as a neck-scarf it will protect your chest and shoulders from the sun, or as a cover for your face for additional protection. as a sun shade when tied to poles or branches.', 5600, null,
  4000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/shemagh_scarf_cooling_signalling_dust_protection_hiking_accessory.jpg?v=1744468337','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/shemagh_scarf_multifunctional_cooling_signal_wrap_dust_protection.jpg?v=1744468337','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/shemagh-scarf-stay-cool-signal-device-sand-dust-protection.jpg?v=1744468337']::text[], false, '{"color":"White/Black","material":"Scarves"}'::jsonb, false, 68
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000069', 'dddddddd-dddd-dddd-dddd-dddddddddd06', 'Shemagh scarf', 'shemagh-scarf-3', 'MHK-069',
  'Staying Cool: If water is not an issue, a shemagh can help you stay cool on a hot day. Soak it in water and wrap it around your head and neck. It will last until the water evaporates. Signalling Device: The more colorful ones can be used for signalling other people in case you got lost on a hike in order to attract attention of a helicopter. Closure: Pull On Shemaghs Sand and Dust and Smoke Protection: If there’s smoke in the air, a damp shemagh can reduce smoke inhalation and allow you to breathe better. The shemagh scarf is a traditional headwear in the Middle East. It is also known as a keffiyeh, ghutrah or by other names. It is worn on the head or around the shoulders. Sun Protection: as a turban or loosely over the shoulders and the back. as a neck-scarf it will protect your chest and shoulders from the sun, or as a cover for your face for additional protection. as a sun shade when tied to poles or branches.', 5600, null,
  4000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/shemagh-scarf-cooling-signal-device-stay-cool-hot-day-dust-protection.jpg?v=1744468559','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/shemagh-scarf-stay-cool-signal-hiking-dust-protection.jpg?v=1744468559']::text[], true, '{"color":"Khaki/Black","material":"Scarves"}'::jsonb, false, 69
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000070', 'dddddddd-dddd-dddd-dddd-dddddddddd06', 'Shemagh scarf', 'shemagh-scarf-2', 'MHK-070',
  'Staying Cool: If water is not an issue, a shemagh can help you stay cool on a hot day. Soak it in water and wrap it around your head and neck. It will last until the water evaporates. Signalling Device: The more colorful ones can be used for signalling other people in case you got lost on a hike in order to attract attention of a helicopter. Closure: Pull On Shemaghs Sand and Dust and Smoke Protection: If there’s smoke in the air, a damp shemagh can reduce smoke inhalation and allow you to breathe better. The shemagh scarf is a traditional headwear in the Middle East. It is also known as a keffiyeh, ghutrah or by other names. It is worn on the head or around the shoulders. Sun Protection: as a turban or loosely over the shoulders and the back. as a neck-scarf it will protect your chest and shoulders from the sun, or as a cover for your face for additional protection. as a sun shade when tied to poles or branches.', 5600, null,
  4000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/shemagh-scarf-green-cooling-protection-hiking-signal-device-sand-dust-smoke.jpg?v=1744468573','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/green_shemagh_scarf_cool_hiking_signalling_protection.jpg?v=1744468572','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/green_shemagh_scarf_cooling_safety_signal_dust_protection.jpg?v=1744468572']::text[], true, '{"color":"OD/OD","material":"Scarves"}'::jsonb, false, 70
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000071', 'dddddddd-dddd-dddd-dddd-dddddddddd06', 'Shemagh scarf', 'shemagh-scarf-1', 'MHK-071',
  'Staying Cool: If water is not an issue, a shemagh can help you stay cool on a hot day. Soak it in water and wrap it around your head and neck. It will last until the water evaporates. Signalling Device: The more colorful ones can be used for signalling other people in case you got lost on a hike in order to attract attention of a helicopter. Closure: Pull On Shemaghs Sand and Dust and Smoke Protection: If there’s smoke in the air, a damp shemagh can reduce smoke inhalation and allow you to breathe better. The shemagh scarf is a traditional headwear in the Middle East. It is also known as a keffiyeh, ghutrah or by other names. It is worn on the head or around the shoulders. Sun Protection: as a turban or loosely over the shoulders and the back. as a neck-scarf it will protect your chest and shoulders from the sun, or as a cover for your face for additional protection. as a sun shade when tied to poles or branches.', 5600, null,
  4000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/black-shemagh-scarf-cool-hot-weather-signalling-device-sand-dust-protection.jpg?v=1744468590','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/black_shemagh_scarf_cooling_headwrap_signal_device_outdoor_gear.jpg?v=1744468590','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/black_shemagh_scarf_cooling_hot_days_signal_device_dust_protection.jpg?v=1744468590']::text[], true, '{"color":"Black/Black","material":"Scarves"}'::jsonb, false, 71
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000072', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'Rewon MMA Handschuhe, Striker 2.0 - SCHWARZ/SCHWARZ', 'mma-grappling-gloves-1', 'MHK-072',
  'MMA-Handschuhe aus Kunstleder Das Paar MMA-Handschuhe „STRIKER 2.0“ ist ein Topmodell, das für Training und MMA-Kämpfe und Freikampf entwickelt wurde. Dieser sehr weiche und bequeme Handschuh bietet hervorragenden Schutz und seine doppelte Befestigung sorgt für außergewöhnlichen Halt. Sein Air-Teak-System sorgt für Belüftung der Hände, damit sie beim Training schnell trocknen. Rewongear bietet die Möglichkeit, Ihr Outfit zu vervollständigen.', 12600, 9200,
  6700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_mma_handschuhe_striker_2.0_schwarz_komfort_schutz_training_boxen_fitness_kunstleder.webp?v=1744465444','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-mma-handschuhe-striker-2-0-schwarz-boxtraining-zubehoer-fitnessprodukte.webp?v=1744465444','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/mma-handschuhe-mehrfarbig-rewon-pu-leather-protection-boxhandschuhe-boxtraining-zubehoer-air-teak-system.webp?v=1744464593','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/mma-handschuhe-mehrfarbig-rewon-boxtraining-zubehoer-premium-durability-boxausruestung-online.webp?v=1744464593']::text[], false, '{"color":"S/M","material":"MMA Grappling Gloves"}'::jsonb, false, 72
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000073', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Rewon Classic 2.0 Kampfsport JJ Anzug | Ju Jutsu Gi | BJJ Kimono – Schwarz', 'rewon-classic-2-0-jiu-jitsu-gi-2', 'MHK-073',
  'Rewon BJJ Jiu-Jitsu Gi – 450 g Kimono aus 100 % Baumwolle mit Twill-Hose 🥋 Produktbeschreibung Der Rewon BJJ Kimono ist die ideale Wahl für anspruchsvolle Brazilian Jiu-Jitsu-Kämpfer:innen. Aus 100 % vorgeschrumpfter Baumwolle gefertigt, bietet dieser Gi optimale Bewegungsfreiheit, Leichtigkeit und maximale Strapazierfähigkeit – ideal für Training und Wettkampf. Produkteigenschaften 🥋 450 g/m² Pearl Weave Baumwolle – robust & atmungsaktiv 👖 10 oz Twill-Hose – extrem langlebig mit verstärktem Kniebereich 🧵 Vorgeschrumpft – kein Einlaufen nach dem Waschen 🪡 Hochwertige Rewon-Stickereien – stylisch & kampftauglich 🧼 EVA-Schaum im Kragen – schneller trocknend & hygienisch 🎨 Farben: Schwarz, Weiß, Blau – mit farblich abgestimmten Stickereien 📏 Größen: Bitte Größentabelle im Bildbereich beachten 🎒 Inkl. Jiu-Jitsu Turnbeutel – perfekt für Transport und Aufbewahrung Warum dieser Gi? ✅ Entwickelt für intensive BJJ-Sessions – im Training und Turnier ✅ Anatomisch geschnitten für beste Passform & Komfort ✅ Mehrfach verstärkte Belastungspunkte für Langlebigkeit ✅ Bietet Schutz, Stil und Bewegungsfreiheit in einem Pflegehinweise Waschempfehlung: In kaltem Wasser waschen und lufttrocknen', 25500, null,
  18300, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-classic-kampfsport-ju-jutsu-gi-bjj-kimono-schwarz-leicht-strapazierfaehig-baumwolle.webp?v=1744465479','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-classic-2-0-bjj-gi-ju-jutsu-schwarz-vorgeschrumpft-450g-leicht-strapazierfaehig.webp?v=1744465478','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-classic-2-0-bjj-kimono-ju-jutsu-gi-schwarz-premium-jiu-jitsu-kampfanzug.webp?v=1744465478','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-classic-2.0-bjj-kimono-ju-jutsu-gi-schwarz-jujutsu-anfaenger-fortgeschrittene.webp?v=1744465478']::text[], false, '{"size":"A0","color":"Black","material":"Jiu Jitsu GI"}'::jsonb, false, 73
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000074', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Rewon Classic 2.0 Kampfsport JJ Anzug | Ju Jutsu Gi | BJJ Kimono – Weiß', 'rewon-classic-2-0-jiu-jitsu-gi-1', 'MHK-074',
  'Dieser BJJ Gi ist leicht und dennoch unerschütterlich strapazierfähig. Er ist aus vorgeschrumpftem Stoff, sodass Sie sich keine Sorgen über das Einlaufen machen müssen (am besten waschen Sie ihn einfach in kaltem Wasser und hängen ihn zum Trocknen auf). Rewon Jiu-Jitsu-Kimono, 100 % Baumwolle, 450 g/Perlenweberei. Mit hochbeständiger Stoffhose aus 10-oz-Twill. Verstärkter Kniebereich für erhöhte Strapazierfähigkeit + zusätzliche Gürtelschlaufen an der Taille für mehr Komfort. Baumwolltwillkragen, gefüllt mit EVA-Schaum für schnelleres Trocknen und überlegenen Komfort. Hochwertige Rewon-Stickerei mit verstellbarer und bequemer Passform. HINWEIS: BITTE ÜBERPRÜFEN SIE VOR DER BESTELLUNGSBESTÄTIGUNG DIE GRÖSSENTABELLE IN DEN BILDERN FÜR IHRE GRÖSSENAUSWAHL.', 25500, null,
  18300, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-jiu-jitsu-gi-bjj-kimono-weiss-jiujitsu-training-kampfsport-anzug.webp?v=1744465505','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-classic-20-jiu-jutsu-gi-bjj-kimono-weiss-vorwaschen-stoff-langlebig-verstarkt-baumwolle.webp?v=1744465505','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-classic-2-0-bjj-gi-ju-jutsu-kimono-weiss-schwarz-blau.webp?v=1744465505','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-classic-2.0-bjj-jujutsu-gi-white-kimono-vorgeschrumpft-stoff-450g-baweolle-ju-jutsu-anzug-boxtraining-jacket-suit.webp?v=1744465505']::text[], false, '{"size":"A0","color":"White","material":"Jiu Jitsu GI"}'::jsonb, false, 74
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000075', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Rewon Classic 2.0 Kampfsport JJ-Anzug | Ju Jutsu Gi | BJJ Kimono – Blau', 'classic-2-0-grey-jiu-jitsu-gi', 'MHK-075',
  'Dieser BJJ Gi ist leicht und dennoch unerschütterlich strapazierfähig. Er ist aus vorgeschrumpftem Stoff, sodass Sie sich keine Sorgen über das Einlaufen machen müssen (am besten waschen Sie ihn einfach in kaltem Wasser und hängen ihn zum Trocknen auf). Rewon Jiu-Jitsu-Kimono, 100 % Baumwolle, 450 g/Perlenweberei. Mit hochbeständiger Stoffhose aus 10-oz-Twill. Verstärkter Kniebereich für erhöhte Strapazierfähigkeit + zusätzliche Gürtelschlaufen an der Taille für mehr Komfort. Baumwolltwillkragen, gefüllt mit EVA-Schaum für schnelleres Trocknen und überlegenen Komfort. Hochwertige Rewon-Stickerei mit verstellbarer und bequemer Passform. HINWEIS: BITTE ÜBERPRÜFEN SIE VOR DER BESTELLUNGSBESTÄTIGUNG DIE GRÖSSENTABELLE IN DEN BILDERN FÜR IHRE GRÖSSENAUSWAHL.', 25500, null,
  18300, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-classic-2-kampfsport-jj-anzug-ju-jutsu-gi-bjj-kimono-blau.webp?v=1744465527','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-classic-2-0-bjj-kimono-blau-ju-jutsu-training-gi-vorgeschrumpfter-stoff-strapazierfaehig.webp?v=1744465527','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-classic-20-jiu-jitsu-anzug-blau-ju-jutsu-bjj-kimono-boxhandschuhe-boxsack-fitnessprodukte.webp?v=1744465527','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/classic-kampfsport-jj-anzug-rewon-ju-jutsu-bjj-kimono-mehrfarbig.webp?v=1744463904']::text[], false, '{"size":"A0","color":"Blue","material":"Jiu Jitsu GI"}'::jsonb, false, 75
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000076', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Rewon Basic 1.5 Kampfsport JJ Anzug | Ju Jutsu Gi | BJJ Kimono – Weiß', 'basic1-5-jiu-jitsu-gi-2', 'MHK-076',
  'Die ideale Balance zwischen Gewicht und Weichheit. Für alle Arten von Training und Wettkampf ist der Rewon BJJ Gi die beste Wahl. Unser BJJ ist anderen Marken überlegen, da er in drei wunderschönen Farben angeboten wird. Alle BJJ-Gi sind mit einem kostenlosen weißen Gürtel ausgestattet, der wie der Gi aus einer hochwertigen Stoffbasis besteht. Hinweis: Bitte überprüfen Sie vor der Bestellung die „GRÖSSENTABELLE“ in den Bildern, um Ihre Größenauswahl zu treffen.', 18500, null,
  13300, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/kampfsport-jj-anzug-basic-ju-jutsu-gi-bjj-kimono-mehrfarbig-rewon-boxprodukte-fitness-gewichts-training.webp?v=1744463854','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/kampfsport-jujutsu-gi-bjj-kimono-mehrfarbig-rewon-boxhand-schuhe-fitnessgeraete-trainings-zubehoer.webp?v=1744463854','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/kampfsport-jujutsu-bjj-gi-mehrfarbig-rewon-boxausrustung-top20-keywords.jpg?v=1744463854','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/kampfsport_jj_anzug_basic_ju_jutsu_gi_bjj_kimono_mehrfarbig_boxausruestung_fuer_training_wettkampf.webp?v=1744463854']::text[], false, '{"size":"A0","color":"White","material":"Jiu Jitsu GI"}'::jsonb, false, 76
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000077', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Double Neoprene Weightlifting Belt', 'copy-of-double-neoprene-weightlifting-belt', 'MHK-077',
  'Rewon weight lifting belts are made of high quality neoprene and feature a Velcro closure. Buckle for stainless steel sliding bar. Suitable for weightlifting and general fitness purposes. It is lightweight, strong and comfortable at the same time. Dual back brace is 5" wide for optimal comfort and pain relief. Maximum comfort by reinforcing the underside of the back and abdomen.', 7800, null,
  5600, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/double-neoprene-weightlifting-belt-rewon-comfortable-velcro-stainless-steel.jpg?v=1743710557','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/double-neoprene-weightlifting-belt-rewon-velcro-closure-stainless-steel-buckle-weightlifting-fitness-5-inch-back-brace.jpg?v=1743710557','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/double-neoprene-weightlifting-belt-rewon-high-quality-velcro-closure-stainless-steel-buckle-comfortable-lightweight.jpg?v=1743710557']::text[], false, '{"size":"Red","color":"S","material":"Weight Lifting Belts"}'::jsonb, false, 77
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000078', 'dddddddd-dddd-dddd-dddd-dddddddddd07', 'Fokushandschuhe Boxen aus Leder – Handpratzen für Boxtraining', 'fokushandschuhe-boxen-leder', 'MHK-078',
  'Fokushandschuhe für präzises Boxtraining Die RewonGear Fokushandschuhe wurden speziell für intensives Boxtraining, MMA und Kickboxen entwickelt. Dank der ergonomisch gebogenen Form ermöglichen diese Handpratzen präzise Schlagkombinationen und ein realistisches Trainingsgefühl. Das robuste Material sorgt für hohe Langlebigkeit, während die stoßdämpfende Polsterung Trainer und Athleten optimal schützt. Hauptmerkmale Hochwertiges Leder / Maya Hide – langlebig & widerstandsfähig Ergonomische Curved-Form für präzise Treffer Starke Stoßabsorption zum Schutz der Hände Leichtes Design für schnelle Kombinationen Ideal für Boxen, MMA, Kickboxen & Muay Thai Für wen geeignet? Diese Box-Handpratzen sind ideal für: Boxtrainer & Coaches MMA-Trainer Kampfsportvereine Personal Trainer Home-Gym Nutzer Warum RewonGear? Mit RewonGear trainieren Sie auf professionellem Niveau. Unsere Fokushandschuhe kombinieren Kontrolle, Komfort und Haltbarkeit — perfekt für ambitionierte Kampfsportler in Deutschland und Europa.', 15400, 12900,
  9300, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_handpolster_schlagpolster_kampfsport_traininghandschuhe_maya_hide_leder_boxen_kickboxen_fokushandschuhe.webp?v=1744464143','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-handpolster-schlagpolster-mehrfarbig-boxtraining-zubehoer-kaufen.jpg?v=1744464143','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_fokushandschuhe_maya_hide_leather_boxpratzen_kickboxen_ausruestung_mehrfarbig_fitnessprodukte_25cm.webp?v=1744460054','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_handpolster_schlagpolster_kampfsport_fokushandschuhe_mehrfarbig_boxausruestung_online.jpg?v=1744464143']::text[], true, '{"color":"Black/Golden","material":"Focus Mitt"}'::jsonb, false, 78
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000079', 'dddddddd-dddd-dddd-dddd-dddddddddd02', 'Schienbeinschoner Kampfsport/Kickboxen - Mehrfarbig', 'schienbeinschoner-kampfsport-kickboxen', 'MHK-079',
  '1. Kunstleder: Für mehr Stärke. 2. Hochwertiger Schaumstoff: Für bessere Stoßdämpfung 3. Klettverschluss: Für sichere Anpassung. Gummizug unter dem Fuß und der Ferse für mehr Komfort. RewonGear bietet diese Schienbeinschoner, die speziell zum Schutz und zur Entfaltung der Kraft Ihrer Tritte entwickelt wurden, speziell für das Training von Muay Thai, Boxen, MMA, Kickboxen, Karate und Taekwondo. Die glatte, dreifach beschichtete Polsterung ist handgefertigt, damit Sie ein Paar Schienbeinschoner haben, die zu Ihrem Kampfstil passen.', 16200, 12000,
  8700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/schienbeinschoner-kampfsport-kickboxen-mehrfarbig-rewon-boxen-taekwondo-muaythai-kunstleder-stossdaempfung.jpg?v=1744464388','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/schienbeinschoner-kampfsport-kickboxen-mehrfarbig-rewon-boxbekleidung-boxtrainingszubehoer-bester-schutz-komfort.jpg?v=1744464388','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/rewon-schienbeinschoner-kampfsport-kickboxen-mehrfarbig-kunstleder-klettverschluss-boxtraining-kickboxen-ausruestung.jpg?v=1744464388','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/rewon_mehrfarbig_schienbeinschoner_kampfsport_kickboxen_muay_thai_boxen_mma_karate_taekwondo.jpg?v=1744464388']::text[], true, '{"size":"XS","color":"Black/Golden","material":"MMA Shin Guards"}'::jsonb, false, 79
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000080', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Kampfsport Judo Anzug | Judoanzug | Judogi - Weiß', 'judo-suit-white', 'MHK-080',
  'Info zu diesem Artikel Reißfest und langlebig: Unser Judo-Anzug für Erwachsene und Kinder ist aus hochwertigsten Materialien mit stabilen Nähten gefertigt und behält seine Form und Funktion auch nach zahlreichen Trainingseinheiten und häufigem Waschen. Entscheiden Sie sich für eine größere Größe für die perfekte Passform. Großartige Qualität zum Spitzenpreis: Rewon Gear nutzt seine umfangreiche Erfahrung, um Spitzenqualität zu einem fairen Preis ohne Kompromisse zu liefern. Unser Judoanzug ist in verschiedenen Größen erhältlich, darunter 130 cm, 140 cm, 150 cm, 160 cm, 170 cm und 180 cm. Atmungsaktiv und belastbar: Der Judo-Anzug aus einem Baumwoll-Polyester-Gemisch bleibt atmungsaktiv, pflegeleicht und angenehm zu tragen. Mit einer Stoffdichte von 320 gm² (Hose) und 335 gm² (Jacke) bleibt es für kontinuierliches Training in Topform. Dieser vorgeschrumpfte Anzug läuft beim Waschen nicht ein. Komplettset: Die Judo-Uniform besteht aus einer Hose mit Kordelzug, einer Jacke und einem Gürtel und ist somit das ideale Judo-Bekleidungsset 110 % Zufriedenheitsgarantie: Probieren Sie unseren Judo-Anzug für Damen und Herren völlig risikofrei aus! Wenn Sie nicht zufrieden sind, kontaktieren Si', 23200, 18500,
  13300, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/kampfsport-judo-anzug-judogi-weiss-rewon-boxhandschuhe-kaufen-top-fitnessprodukte.webp?v=1744464752','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/kampfsport_judo_anzug_weiss_rewon_hochwertig_reissfest.webp?v=1744464752','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/kampfsport_judo_anzug_weiss_rewon_boxtraining_fitnessprodukte.webp?v=1744464752','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/kampfsport-judo-anzug-judogi-weiss-rewon-boxausruestung-fuer-kinder-erwachsene-hochwertig.webp?v=1744464752']::text[], false, '{"size":"000","color":"White","material":"Taekwondo Uniform"}'::jsonb, false, 80
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000081', 'dddddddd-dddd-dddd-dddd-dddddddddd02', 'Rewon Damen Brustschutz Top – Karate Taekwondo Kickboxen Schutz‑Top S–XL', 'female-chest-guard-black', 'MHK-081',
  'Rewon Damen Brustschutz Top – Kampf‑Sport, Kickboxen & Taekwondo Schutz‑Top S–XL 💥 Beschreibung Dieses atmungsaktive Rewon Brustschutz Top für Damen schützt effektiv bei Karate, Taekwondo, Kickboxen oder Muay Thai. Die nahtlose Konstruktion und weiche Polster‑Schalen bieten hohen Tragekomfort – auch bei intensiven Trainingseinheiten. Perfekt abgestimmt auf weibliche Anatomie und in vier Größen (S, M, L, XL) erhältlich. Merkmale 👕 Atmungsaktiver Mesh‑Stretchstoff (96 % Nylon, 4 % Elastan) – kühl, geruchsresistent & flexibel 🔆 Herausnehmbare, schlagabsorbierende Polster – schützen Brust & Dekolleté optimal 🧘 Nahtloses Sport‑Bra‑Design – Racerback, breite Träger & elastischer Saum für sicheren Sitz 📏 Größen S–XL – passgenau für deutsche Konfektionsgrößen (ca. 32–40) 🎨 Farbvarianten Schwarz & Weiß – kombinierbar mit jeder Kampfsport‑Ausrüstung ♻️ Leicht & wiederverwendbar – ideal für Training, Wettkampf & Fitness Warum kaufen? Spezialisiert für weibliche Kampfsportathletinnen – Schutz & Komfort vereint Nahtlose Form & Mesh‑Stoff sorgen für maximale Bewegungsfreiheit ohne Scheuern Vielseitig – geeignet für Karate, Kickboxen, Taekwondo & Fitness Hochwertige Materialien – weniger Ge', 16800, 14000,
  10100, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-brustschutz-damen-schwarz-weiss-karate-taekwondo-kickboxen-schutz-top-20-boxtraining-zubehoer.webp?v=1744464810','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-brustschutz-damen-schwarz-boxprodukte-fitnessgeraete.webp?v=1744464810','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-brustschutz-damen-schwarz-brustprotektor-kampfsport-boxing-products-fitnessprodukte.webp?v=1744464810','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-brustschutz-damen-schwarz-boxtraining-kampfsport-bh.webp?v=1744464810']::text[], false, '{"size":"Black","color":"S","material":"Chest Guard"}'::jsonb, false, 81
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000082', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'Knieschoner | Kniestütze | Knieprotektoren - Mehrfarbig', 'knieschoner-kniestutze-knieprotektoren-mehrfarbig', 'MHK-082',
  '🛡️ Rewon Knieschoner – Maximaler Schutz für Training, MMA & Fitness Schütze deine Knie mit den Rewon Knieschonern – stoßdämpfend, rutschfest und atmungsaktiv. Ob im Kampfsport , beim CrossFit , Bodyweight-Training oder auf der Matte – diese Kniestützen geben dir die Stabilität, die du brauchst, ohne deine Bewegungsfreiheit einzuschränken. ✅ Warum Rewon die richtige Wahl ist: Stark gepolstert für effektive Stoßdämpfung bei Aufprall und Bodenkontakt Elastisches, atmungsaktives Material – verhindert Hitzestau und Schweißansammlungen Rutschfester Sitz – bleibt auch bei schnellen Bewegungen sicher an Ort und Stelle Ergonomisches Design – optimale Passform für Männer & Frauen Leicht zu reinigen – maschinenwaschbar im Schonwaschgang 🎯 Ideal für: MMA, Kickboxen, Karate & Kampfsport Gewichtheben & Functional Training Crosstraining, HIIT & Gym Workouts Sportler mit empfindlichen oder verletzungsanfälligen Knien ❓ Häufige Fragen (FAQ): Sind die Knieschoner auch für Anfänger geeignet? Ja – sie eignen sich für jedes Trainingslevel, vom Einsteiger bis zum Profi. Kann man sie unter langer Sportkleidung tragen? Absolut – das flache Profil passt bequem unter Trainingshosen oder Gi. Wie finde ich ', 8400, 4800,
  3400, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/knieschoner-kniestutze-knieprotektoren-mehrfarbig-rewon-boxing-fitness-training-ausrustung.jpg?v=1744463716','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_knieschoner_kniestuetze_knieprotektoren_mehrfarbig_boxtraining_fitness_kickboxen_ausruestung.jpg?v=1744459659','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-knieschoner-knieprotektoren-mehrfarbig-komfortabler-stossdaempfender-kniestuetze.jpg?v=1743710098','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_knieschoner_knieprotektoren_mehrfarbig_boxing_fitness_training_knieschutz_stossdaempfung.jpg?v=1744463716']::text[], false, '{"size":"S/M","color":"Red","material":"Safety Knee Pads"}'::jsonb, false, 82
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000083', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Kampfsport Judo Anzug | Judoanzug | Judogi - Mehrfarbig', 'kampfsport-judo-anzug-judoanzug-judogi-mehrfarbig', 'MHK-083',
  '🥋 Rewon Judoanzug (Judogi) – Perfekt für Training & Wettkampf Der klassische Judoanzug von Rewon vereint Funktionalität, Komfort und Haltbarkeit. Hergestellt aus atmungsaktiver Baumwolle mit verstärkten Nähten ist dieser Judogi ideal für Einsteiger und fortgeschrittene Kampfsportler. ✅ Warum Rewon die richtige Wahl ist: Robuster Stoff – reißfest und doppelt vernäht 100% Baumwolle – schweißabsorbierend & hautfreundlich Traditioneller Schnitt – erlaubt volle Bewegungsfreiheit Verfügbar in Weiß & Blau – gemäß Judo-Wettkampfnormen Inklusive weißem Gürtel – sofort startbereit 🎯 Ideal für: Judo-Training & Einsteigerkurse Wettkämpfe nach DJB/IBJJF-Vorgaben Selbstverteidigung & traditioneller Kampfsport 🔍 Produktdetails (semantisch suchbar): Marke: Rewon Produktart: Judogi (Judoanzug) Material: 100% Baumwolle, 350g/m² Farben: Weiß & Blau Größen: 120–200 cm Körpergröße ❓ Häufige Fragen (FAQ): Ist der Anzug für Anfänger geeignet? Ja, er ist leicht, bequem und speziell für Anfänger und Fortgeschrittene entwickelt. Wie wäscht man den Judoanzug? Maschinenwaschbar bei 30 °C. Bitte nicht im Trockner trocknen. Ist ein Gürtel dabei? Ja – ein weißer Gürtel ist im Lieferumfang enthalten. 🔥 Jetzt ', 25500, 18500,
  13300, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/kampfsport-judo-anzug-judogi-weiss-rewon-boxhandschuhe-kaufen-top-fitnessprodukte.webp?v=1744464752','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/kampfsport-blauer-judoanzug-rewon-judogi-robust-reissfest-langlebig.webp?v=1744463778','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/kampfsport_judo_anzug_weiss_rewon_hochwertig_reissfest.webp?v=1744464752','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/kampfsport-judo-anzug-judogi-blau-rewon-reissfest-langlebig-fitnessprodukte-boxtraining-jujitsu.webp?v=1744463778']::text[], false, '{"size":"000","color":"White","material":"Taekwondo Uniform"}'::jsonb, false, 83
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000084', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Kampfsport Judo Anzug | Judoanzug | Judogi - Blau', 'kampfsport-judo-anzug-judoanzug-judogi-blau', 'MHK-084',
  '🥋 Rewon BJJ Gi Basic 1.5 – Begin Your BJJ Journey with Confidence Picture this: you step onto the mat — the world fades away. Just you, your breath, and the grip of your opponent. What you wear matters. What you need isn''t just a uniform — it''s a trusted partner: the Rewon BJJ Gi Basic 1.5 . This gi isn''t just apparel, it''s a commitment. For your first roll. Your first tap. Your first tournament win. Built for the evolving world of Brazilian Jiu-Jitsu , the Rewon BJJ Gi is the ideal choice for beginners, advanced fighters, and serious athletes . 💪 Why This Gi Should Be in Your Gym Bag: Lightweight yet tough: Made from durable cotton-polyester blend that offers flexibility and longevity Tear-resistant & breathable: Withstands grappling, takedowns, and intense training sessions Includes white belt: A complete set – perfect for starting your BJJ journey today Color options: Available in black, white, and blue to match your preference or gym requirements Traditional fit: Reinforced seams and athletic tailoring for freedom of movement and durability 🎯 Ideal For: Brazilian Jiu-Jitsu (BJJ) training & sparring Grappling, self-defense & groundwork Beginners, kids, hobbyists, and competit', 25500, 18500,
  13300, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/kampfsport-blauer-judoanzug-rewon-judogi-robust-reissfest-langlebig.webp?v=1744463778','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-judoanzug-blau-judogi-erwachsene-kinder-reissfest-langlebig.webp?v=1744463778','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/kampfsport-judoanzug-blau-rewon-judogi-reissfest-langlebig-boxausruestung.webp?v=1744463778','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/kampfsport-judo-anzug-groessentabelle-judogi-blau-rewon.webp?v=1744463778']::text[], false, '{"size":"000","color":"Blue","material":"Taekwondo Uniform"}'::jsonb, false, 84
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000085', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Kampfsport JJ Anzug Basic 1.5 | Ju Jutsu Gi | BJJ Kimono – Mehrfarbig', 'kampfsport-iu-jiutsu', 'MHK-085',
  '🥋 Rewon BJJ Anzug Basic 1.5 – Dein Einstieg in Brazilian Jiu-Jitsu Mit dem Rewon BJJ Gi Basic 1.5 setzt du auf Qualität, Komfort und Widerstandsfähigkeit im modernen Brazilian Jiu-Jitsu. Verfügbar in Schwarz, Weiß und Blau , erfüllt dieser BJJ Kimono höchste Trainingsansprüche für 2024–2025. ✅ Produktmerkmale: Marke: Rewon – bewährte Kampfsportausrüstung Farben: Schwarz, Weiß, Blau – individuell wählbar Material: Reißfestes Baumwoll-Polyester-Gewebe – atmungsaktiv & langlebig Schnitt: Klassischer BJJ Gi – sportlich, robust & bequem Inklusive: Jacke, Hose & weißer Gürtel Größen: Kinder, Jugendliche & Erwachsene 🎯 Perfekt für: Brazilian Jiu-Jitsu (BJJ) Training No-Gi & Gi-Wettkämpfe Grappling & Bodenkampf Einsteiger & Fortgeschrittene ❓ Häufige Fragen (FAQs): 1. Ist der Gi IBJJF-konform? Der Anzug entspricht dem klassischen BJJ-Schnitt und eignet sich für Training & interne Wettkämpfe. Für IBJJF-Turniere bitte Größenrichtlinien prüfen. 2. Wie fällt der Rewon BJJ Gi aus? Er fällt größengetreu aus. Für lockeren Sitz oder schnelles Wachstum empfehlen wir eine Nummer größer. 3. Ist der Kimono vorgewaschen? Nein, bitte bei max. 30 °C waschen – er kann minimal eingehen. Kein Trockner emp', 25500, 18500,
  13300, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/kampfsport_jj_anzug_basic_ju_jutsu_gi_bjj_kimono_mehrfarbig_boxausruestung_fuer_training_wettkampf.webp?v=1744463854','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/mehrfarbig-ju-jutsu-gi-bjj-kimono-rewon-boxtraining-ausruestung.webp?v=1744463854','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/kampfsport-jj-anzug-basic-ju-jutsu-gi-bjj-kimono-mehrfarbig-rewon-boxprodukte-fitness-gewichts-training.webp?v=1744463854','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/kampfsport-jujutsu-gi-bjj-basic-morefarbig-rewon-boxtraining-fitness.webp?v=1744463854']::text[], false, '{"size":"A0","color":"Black","material":"Jiu Jitsu GI"}'::jsonb, false, 85
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000086', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Classic 2.0 Kampfsport JJ Anzug | Jiu Jitsu Gi | BJJ Kimono – Mehrfarbig', 'ji-jitsu-gi', 'MHK-086',
  '🔥 Rewon Classic 2.0 BJJ Gi – Entfache deine Leidenschaft für Brazilian Jiu-Jitsu Du kommst ins Dojo. Die Matte wartet. Dein Herz schlägt schneller. Du weißt: Heute geht es nicht nur um Technik – es geht um Fokus, Disziplin und Leidenschaft. Der Rewon Classic 2.0 ist nicht irgendein Anzug – er ist dein Statement: Ignite Your Passion. Dieser BJJ Gi verbindet funktionales Design mit ausdrucksstarker Optik . Der dezente Slogan-Stick „IGNITE YOUR PASSION“, kräftige Farben (Blau, Schwarz, Weiß) und das moderne Rewon Branding machen ihn zur idealen Wahl für anspruchsvolle Kampfsportler im Jahr 2025. 💪 Produktvorteile auf einen Blick: Marke: Rewon – etabliert im professionellen Kampfsport Material: Robuste Baumwollmischung – atmungsaktiv & reißfest Design: Moderne Optik mit Stickereien: Rewon Logo, Slogan & Kanji-Elementen Farben: Blau, Schwarz, Weiß – ideal für Training & Turniere Passform: Klassischer BJJ-Schnitt, verstärkte Knie & elastische Taillenoption Inklusive: Jacke + Hose + weißer Gürtel – Komplettset 🎯 Perfekt für: Brazilian Jiu-Jitsu (BJJ) Training & Sparring Grappling, No-Gi Vorbereitung & Selbstverteidigung Wettkampfvorbereitung & technische Entwicklung Sportliche Kinder, ', 30000, 25500,
  18300, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/classic-kampfsport-jj-anzug-rewon-ju-jutsu-bjj-kimono-mehrfarbig.webp?v=1744463904','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-classic-2-kampfsport-jj-anzug-ju-jutsu-gi-bjj-kimono-blau.webp?v=1744465527','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-jiu-jitsu-gi-bjj-kimono-weiss-jiujitsu-training-kampfsport-anzug.webp?v=1744465505','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-classic-kampfsport-ju-jutsu-gi-bjj-kimono-schwarz-leicht-strapazierfaehig-baumwolle.webp?v=1744465479']::text[], false, '{"size":"A0","color":"Black","material":"Jiu Jitsu GI"}'::jsonb, false, 86
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000087', 'dddddddd-dddd-dddd-dddd-dddddddddd05', 'Kinder Sweatshirt – Bequemer Pullover für den Alltag für Jungen & Mädchen', 'kinder-sweatshirt-bequemer-pullover-fur-den-alltag-fur-jungen-madchen-6', 'MHK-087',
  'Dieses hochwertige Kinder Sweatshirt bietet optimalen Komfort und Stil für den Alltag. Hergestellt aus weichem, atmungsaktivem Material sorgt es für angenehme Wärme und ein leichtes Tragegefühl – ideal für Schule, Freizeit oder Outdoor-Aktivitäten. Das schlichte, moderne Design lässt sich vielseitig kombinieren und passt perfekt zu Jeans, Jogginghosen oder Shorts. Dank der robusten Verarbeitung bleibt das Sweatshirt auch nach vielen Waschgängen in Topform.', 9000, null,
  6500, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/USS-12007-R_2.png?v=1774345593','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/USS-12007-R_1.png?v=1774345593']::text[], true, '{"color":"4","material":"Hoodies"}'::jsonb, false, 87
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000088', 'dddddddd-dddd-dddd-dddd-dddddddddd05', 'Kinder Sweatshirt – Bequemer Pullover für den Alltag für Jungen & Mädchen', 'kinder-sweatshirt-bequemer-pullover-fur-den-alltag-fur-jungen-madchen-5', 'MHK-088',
  'Dieses hochwertige Kinder Sweatshirt bietet optimalen Komfort und Stil für den Alltag. Hergestellt aus weichem, atmungsaktivem Material sorgt es für angenehme Wärme und ein leichtes Tragegefühl – ideal für Schule, Freizeit oder Outdoor-Aktivitäten. Das schlichte, moderne Design lässt sich vielseitig kombinieren und passt perfekt zu Jeans, Jogginghosen oder Shorts. Dank der robusten Verarbeitung bleibt das Sweatshirt auch nach vielen Waschgängen in Topform.', 9000, null,
  6500, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/USS-12007-BLU_2.png?v=1774345266','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/USS-12007-BLU_1.png?v=1774345266']::text[], true, '{"color":"4","material":"Hoodies"}'::jsonb, false, 88
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000089', 'dddddddd-dddd-dddd-dddd-dddddddddd02', 'Classic Kopfschutz | MMA Kickboxen Kampfsport | Boxkopfschutz - Golden/Schwarz', 'd9-head-guard', 'MHK-089',
  'Rewon Vollschutz-Kopfschutz – Kunstleder Helm für MMA, Kickboxen & Boxtraining 🥊 Produktbeschreibung Der Rewon Vollschutz-Kopfschutz vereint umfassenden Gesichtsschutz mit sicherem Sitz – ideal für MMA, Kickboxen, Boxen und Sparring auf jedem Level. Das strapazierfähige Kunstleder außen und weiches, wasserabweisendes Innenfutter sorgen für höchsten Komfort und Hygiene. Produkteigenschaften 🛡️ Vollschutz-Design: schirmt Nase, Kinn, Wangen, Augen und Ohren effektiv ab 🔰 Optimaler Stoßschutz: dicht gepolsterter Schaum reduziert Schlagenergie spürbar 🖐️ Robustes Kunstleder-Außenmaterial: langlebig, leicht zu reinigen und schweißresistent 🎯 Verbesserter Sitz: rutschsicherer Klettverschluss für sicheren Halt selbst bei engen Situationen ⚙️ Leicht & handlich: entlastet den Hals, ohne zu beschweren 📏 Größen für alle: erhältlich in drei Größen – Kinder, Jugendliche & Erwachsene Warum dieser Kopfschutz? ✅ Perfekt für alle Level – vom Einsteiger bis zum Profi ✅ Schützt umfangreich – inkl. Gesicht und Kieferbereiche ✅ Pflegeleicht – einfach abwischen und trocknen lassen ✅ Universell einsetzbar – für Boxen, MMA, Kickboxen, Muay Thai, Sparring Pflegehinweise Reinigungsempfehlung: Nach dem ', 16200, 12900,
  9300, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-kopfschutz-boxtraining-kickboxen-mma-mehrfarbig-vollschutz-schaumstoffpolsterung.webp?v=1753789420','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-kopfschutz-multicolor-boxschutz-mma-kickboxen-kampfsport-vollschutz-schaumstoffpolsterung-boxen.webp?v=1753789420','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-mehrfarbig-boxkopfschutz-mma-kickboxen-kampfsport-kaufen-boxtraining-ausruestung-boxhelm_4d6bb8fa-ad92-48ea-87b4-643b08e4fb7b.webp?v=1753789420','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-mehrfarbig-boxkopfschutz-mma-kampfsport-helm-vollschutz-fuer-kickboxen-boxtraining.webp?v=1753789420']::text[], true, '{"color":"Small","material":"Boxing & Martial Arts Protective Gear"}'::jsonb, false, 89
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000090', 'dddddddd-dddd-dddd-dddd-dddddddddd07', 'Classic Handpratzen – Gebogene Schlagpolster aus Maya Hide Leder für effektives Kampfsporttraining', 'raining-punch-mitts', 'MHK-090',
  'Rewon Classic Handpratzen – Maya Hide Leder & Präzise Stoßdämpfung für Trainer:innen 🥊 Produktbeschreibung Die Rewon Classic Handpratzen aus strapazierfähigem Maya Hide Leder wurden entwickelt, um dein Kampfsporttraining auf das nächste Level zu heben. Mit ergonomisch gebogener Form und präziser Stoßabsorption bieten sie Trainer:innen und Kampfathlet:innen ein hervorragendes Feedback bei Boxen, MMA, Kickboxen und mehr. Produkteigenschaften 🧵 Hochwertiges Maya Hide Leder – robust & langlebig 🎯 Ergonomische gebogene Form – natürliche Handlage, geringere Ermüdung 🛡️ Effiziente Stoßdämpfung – schützt Trainerhände und absorbiert Impact zuverlässig ⚖️ Leicht & handlich – 25 cm Länge, ca. 450 g pro Pratze 🥋 Vielseitig einsetzbar – ideal für Boxen, MMA, Kickboxen & Kampfsport-Drills Warum die Rewon Classic Handpratzen? ✅ Entwickelt für intensives Training – perfektes Feedback bei jedem Schlag ✅ Maya Hide Leder – bietet exzellente Strapazierfähigkeit und Premium-Qualität ✅ Ergonomisch geformt – reduziert das Risiko von Gelenk- und Muskelverschleiß ✅ Leicht & handlich – ideal für lange Trainingseinheiten Pflegehinweise Reinigung: Nach dem Training mit einem feuchten Tuch abwischen, dana', 14800, 11800,
  8500, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_handpolster_schlagpolster_kampfsport_traininghandschuhe_maya_hide_leder_boxen_kickboxen_fokushandschuhe.webp?v=1744464143','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/FM3copy.jpg?v=1753788826','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/FM1copy.jpg?v=1753788826','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/FM2copy.jpg?v=1753788826']::text[], false, '{"color":"Black/Golden","material":"Focus Mitt"}'::jsonb, false, 90
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000091', 'dddddddd-dddd-dddd-dddd-dddddddddd07', 'Rewon Classic Schlagpolster/Kickpratzen/MMA Trainerpolster - Schwarz/Golden', 'shield-striking-pad', 'MHK-091',
  'Rewon MMA-Trainerpolster – Stoßdämpfung & Komfort für Kickboxen & MMA 🛡️ Produktbeschreibung Das Rewon MMA-Trainerpolster ist dein zuverlässiger Partner für präzises Schlag‑ und Trittraining. Gefertigt aus strapazierfähigem Kunstleder mit dichter Schaumkern‑Polsterung, bietet es optimalen Schutz für Trainer:innen und Trainingsteilnehmer:innen bei Kickboxen, Muay Thai, MMA & Co. Produkteigenschaften 🧵 Hochwertiges Kunstleder – robust, langlebig & leicht zu reinigen 🛡️ Verdichteter Schaumkern – absorbiert starke Schläge und Tritte präzise 🎯 Ergonomische Rechteckform – perfekte Angriffsfläche, ideal für Tritt‑ und Schlagkombinationen 🎨 Dreifarbiges Design mit Rewon Logo – modern & seriös ⚙️ Griffige Hand‑ und Armriemen – stabiler Halt & kontrolliertes Führen bei jeder Bewegung 🏋️ Vielseitiger Einsatz – perfekt für Sparring, Pratzen- & Shield-Training, Selbstverteidigung und Fitness Warum dieses Polster? ✅ Entwickelt für intensive Praxis – ideal für Trainer:innen und Trainingspartner:innen ✅ Hohe Dämpfung schützt bei schwerem Einsatz ✅ Resistent gegen Schweiß, verschleißfest und hygienisch ✅ Unisex-Design – geeignet für alle Altersgruppen und Trainingsniveaus Pflegehinweise Reini', 19300, 15700,
  11300, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-mma-trainerpolster-mehrfarbig-hohe-qualitaet-kickboxtraining-boxequipment.webp?v=1744464341','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_mehrfarbig_schlagpolster_hochwertige_kunstleder_kickboxtraining_mma_boxpratzen_kaufen.webp?v=1744464342','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-schlagpolster-kickpratzen-mma-trainerpolster-boxtraining-hohe-qualitaet-mehrfarbig.webp?v=1744464341','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_kickpolster_hohe_qualitat_mehrfarbig_boxtraining_kickboxen_mma_trainerpolster.jpg?v=1753788592']::text[], true, '{"color":"Black/Golden","material":"Kick Sheild"}'::jsonb, false, 91
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000092', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'MMA Handschuhe Striker 2.0 – Schwarz/Gold | Rewon Gear', 'mma-handschuhe-striker-2-0-schwarz-gold', 'MHK-092',
  'Profi MMA Handschuhe für Training, Sparring & Fitness Die Rewon MMA-Handschuhe sind die ideale Wahl für Athleten, die keine Kompromisse zwischen Schutz und Beweglichkeit eingehen wollen. Egal ob intensives MMA-Training, Grappling oder Fitness-Boxen – das ergonomische Design unterstützt Ihre Leistung bei jeder Einheit. Top-Features für Ihre Performance: Hochwertiges Kunstleder: Besonders strapazierfähig, langlebig und pflegeleicht für den täglichen Einsatz im Gym. Offenes Finger-Design: Ermöglicht maximale Freiheit bei Greiftechniken (Grappling) und Bodenkämpfen. Optimale Stoßdämpfung: Die dichte Schaumpolsterung schützt Ihre Knöchel zuverlässig vor Verletzungen bei harten Schlägen. Sicherer Handgelenkschutz: Ein extrastarker Klettverschluss stabilisiert das Gelenk und verhindert Umknicken. Atmungsaktiv & Komfortabel: Das offene Design sorgt für eine optimale Belüftung und reduziert Schweißbildung während des Trainings. Warum Rewon Gear? Unsere Ausrüstung wird von Kampfsportlern für Kampfsportler entwickelt. Wir legen Wert auf Qualität, die auch bei härtester Beanspruchung standhält.', 12600, 9200,
  6700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/mma-handschuhe-mehrfarbig-rewon-boxtraining-zubehor-boxhandschuhe-leder-boxausrustung-online.webp?v=1744460411','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-gear-mma-handschuhe-mehrfarbig-pro.jpg?v=1771256117','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-mma-handschuhe-polsterung-details.jpg?v=1771256366','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/mma-handschuhe-mehrfarbig-rewon-boxausruestung-online-boxzubehoer-power-punch.webp?v=1753788397']::text[], false, '{"color":"S/M","material":"MMA Grappling Gloves"}'::jsonb, false, 92
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000093', 'dddddddd-dddd-dddd-dddd-dddddddddd02', 'Rewon Classic Schienbeinschoner Kampfsport/Kickboxen - Schwarz/Gold', 'mma-shin-in-step', 'MHK-093',
  'Rewon Schienbeinschoner – Kunstleder Komfort & Schutz für Kickboxen, Muay Thai, MMA & Karate 🛡️ Produktbeschreibung Die Rewon Schienbeinschoner bieten optimalen Schutz und Komfort für ernsthafte Kampfsportler:innen. Hergestellt aus strapazierfähigem Kunstleder mit hochdichter Schaumauskleidung sind sie ideal für Kickboxen, Muay Thai, MMA, Karate und Taekwondo. Produkteigenschaften 🧵 Robustes Kunstleder – langlebig & einfach zu reinigen 🛡️ Stoßdämpfender Schaumkern – schützt Schienbein & Spann effektiv 🎯 Ergonomische Form – anatomisch für perfekten Sitz & Bewegungsfreiheit ⚡ Mehrfarbiges Design mit Rewon-Branding – stilvoll & leistungsorientiert 🎽 Verstellbare Klettverschlüsse – für sicheren und bequemen Halt 🏆 Allround-Einsatz – ideal für Training, Sparring und Wettkampf Warum diese Schienbeinschoner? ✅ Entwickelt für ernsthafte Kampfsportpraxis – leichter als Metallprotektoren, stabiler als Stoff ✅ Profi-Level Schutz – besonders für harte Schläge und Tritttraining geeignet ✅ Pflegeleicht – einfach mit feuchtem Tuch reinigen ✅ Unisex-Design – geeignet für Männer & Frauen aller Leistungsstufen Pflegehinweise Reinigung: Nach dem Training feucht abwischen. Kein direkter Kontakt ', 14000, 12000,
  8700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/71XGNvYtG_L._AC_SL1500__1.jpg?v=1753788126','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/71dyWTauKRL._AC_SL1500__1.jpg?v=1753788126','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/518giT6CJuL._AC__1.jpg?v=1753788126','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/71jyWM8lEzL._AC_SL1500__1.jpg?v=1753788126']::text[], true, '{"color":"XS","material":"Boxing & Martial Arts Protective Gear"}'::jsonb, false, 93
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000094', 'dddddddd-dddd-dddd-dddd-dddddddddd03', 'T-shirt Security', 't-shirt-security', 'MHK-094',
  'T-shirt short sleeves made of 100% cotton', 9800, null,
  7100, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/security-tshirt-black-short-sleeve-100-cotton.jpg?v=1744562724','https://cdn.shopify.com/s/files/1/0680/2174/8016/products/security-tshirt-short-sleeve-100-percent-cotton-back-view.jpg?v=1744562724']::text[], false, '{"size":"Small","color":"Black","material":"T-Shirts"}'::jsonb, false, 94
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000095', 'dddddddd-dddd-dddd-dddd-dddddddddd03', 'T-shirt Allied star', 't-shirt-allied-star', 'MHK-095',
  'T-shirt with Allied star Made of 100% cotton. Tapered neck and perfect fit.', 9800, null,
  7100, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/products/133382T-shirtAlliedstar.jpg?v=1670302190']::text[], false, '{"size":"Small","color":"OD","material":"T-Shirts"}'::jsonb, false, 95
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000096', 'dddddddd-dddd-dddd-dddd-dddddddddd07', 'T10 Handpolster/Schlagpolster Kampfsport/Fokushandschuhe - Schwarz/Schwarz', 't10-boxing-mitt-punch-mitts', 'MHK-096',
  'Rewon T10 Fokus-Pads – Maximale Präzision für Ihr Kampfsport-Training Bringen Sie Ihr Coaching auf das nächste Level. Die Rewon T10 Focus Mitts aus extrem widerstandsfähigem Maya Hide Leder sind die perfekte Wahl für Trainer und Athleten, die keine Kompromisse bei Qualität und Schutz eingehen. Das ergonomisch gebogene Design fängt Schläge natürlich ab und schont die Gelenke von Trainer und Boxer gleichermaßen. Warum die Rewon T10 Pads überzeugen: Unverwüstliches Maya Hide Leder: Das hochwertige Material ist speziell für intensive Belastungen entwickelt – es ist reißfest, langlebig und behält auch nach unzähligen Trainingseinheiten seine Form. Ergonomische Curve-Technologie: Die natürliche Krümmung der Schlagfläche verbessert das Treffer-Feedback und ermöglicht eine präzise Ausführung von Jabs, Haken und Uppercuts. Maximale Stoßabsorption: Eine hochdichte, mehrlagige Schaumstoffpolsterung verteilt die Aufprallenergie effizient und schützt die Hände und Handgelenke des Trainers vor Ermüdung und Verletzungen. Ultraleichtes Handling: Mit nur ca. 450 g pro Pad fördern diese Mitts explosive Geschwindigkeit und schnelle Kombinationen, ohne die Arme unnötig zu belasten. Optimale Belüftung:', 11800, null,
  8500, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/t10-handpolster-kampfsport-fokushandschuhe-schwarz-rewon-maya-hide-leather.jpg?v=1744497799','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-t10-handpolster-schlagpolster-kampfsport-fokushandschuhe-schwarz-maya-hide-leather.jpg?v=1744497799','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_t10_handpolster_schlagpolster_maya_hide_leder_fokushandschuhe_kampfsport_schwarz_gebogen_trainingshandschuhe.jpg?v=1744497799','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/t10-handpolster-schlagpolster-kampfsport-schwarz-rewon-maya-hide-leather-fokushandschuhe.jpg?v=1744497799']::text[], true, '{"color":"Black/Black","material":"Focus Mitt"}'::jsonb, false, 96
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000097', 'dddddddd-dddd-dddd-dddd-dddddddddd07', 'Night Handpolster/Schlagpolster Kampfsport/Fokushandschuhe – Camouflage', 'night-camo-boxing-training-punch-mitts-curved-focus-pads', 'MHK-097',
  'Rewongear Gebogene Trainingshandschuhe – Maya Hide Leder – Stoßdämpfend, Leicht & Robust 🥊 📝 Produktbeschreibung Trainieren Sie wie ein Profi mit diesen hochwertigen gebogenen Schlagpolstern von Rewongear , gefertigt aus robustem Maya Hide Leder . Sie bieten exzellente Stoßdämpfung, ergonomisches Design und sind ideal für Boxen, MMA und Fitnesstraining. Verkauft als Paar – für effektive Partnerarbeit im Training. ✨ Eigenschaften Material: Hochwertiges Maya Hide Leder – langlebig, widerstandsfähig, pflegeleicht Gebogene Form: Unterstützt präzise Schlagtechniken wie Jabs, Hooks, Uppercuts Innenpolsterung: Optimale Schlagabsorption, schützt die Hände des Trainers Leichtgewicht: Nur ca. 450 g pro Pad – handlich und bequem Perfektes Feedback: Klare Rückmeldung beim Schlagkontakt zur Technikverbesserung Lieferumfang: 1 Paar (2 Stück) – für symmetrisches Training ✅ Vorteile im Einsatz Professionelle Qualität: Ideal für Fitnessstudios, Boxvereine und Heimtraining Universell einsetzbar: Boxen, Kickboxen, MMA, Fitboxen, PT-Sessions Ergonomisches Design: Passt sich der Handform an und sorgt für festen Griff Platzsparend: Kompakt und einfach zu transportieren 📐 Technische Daten Länge: ca. 2', 11800, null,
  8500, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/handpolster_schlagpolster_kampfsport_mehrfarbig_rewon_boxtraining_fitness_zubehoer_maya_hide_leder.jpg?v=1744464143','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-handpolster-schlagpolster-kampfsport-mehrfarbig-boxausruestung-fitness-boxhandschuhe-leder-training.jpg?v=1744464143','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_handpolster_schlagpolster_kampfsport_fokushandschuhe_mehrfarbig_boxausruestung_online.jpg?v=1744464143','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_handpolster_schlagpolster_kampfsport_fokushandschuhe_mehrfarbig_boxtraining_zubehoer_boxausruestung_kaufen.jpg?v=1744464143']::text[], true, '{"color":"Camouflage","material":"Focus Mitt"}'::jsonb, false, 97
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000098', 'dddddddd-dddd-dddd-dddd-dddddddddd07', 'Classic Handpolster/Schlagpolster Kampfsport/Fokushandschuhe - Schwarz/Schwarz', 'classic-boxing-training-punch-mitts-curved-focus-pads', 'MHK-098',
  '🛡️ Rewon Classic Handpratzen – Ergonomische Schlagpolster für Präzision & Schutz 🥊 Steigern Sie Ihre Trainingseffizienz mit den Rewon Classic Handpratzen ! Diese gebogenen, leichten Schlagpolster aus hochwertigem Maya Hide Leder sind speziell dafür konzipiert, Schläge präzise zu absorbieren und bieten sowohl Trainern als auch Athleten ein perfektes Handling – ideal für Boxen, MMA, Kickboxen und mehr. ✨ Produktdetails 📦 Material: Premium Maya Hide Leder – langlebig und widerstandsfähig 🧤 Design: Ergonomisch gebogen für natürliche Handhaltung und geringere Ermüdung 🛡️ Polsterung: Mehrschichtige Dämpfung schützt effektiv vor Aufprall 📏 Maße: Kompakt mit 25 cm Länge und nur 450 g Gewicht – perfekt für schnelles Training 🏋️‍♂️ Einsatz: Für Boxtraining, Kickboxen, MMA, Muay Thai und Sparring ✅ Warum Rewon? 💪 Entwickelt für Leistung und Schutz – diese Fokushandschuhe helfen dir, deine Technik zu verbessern, ohne die Hände zu überlasten. Optimal für alle Leistungsstufen. 🔍 Vorteile auf einen Blick 🔒 Sicherer Sitz mit verstellbaren Handschlaufen 🔁 Langlebig – auch bei intensiver Nutzung 🎯 Höchste Präzision im Schlagtraining 👊 Ideal für Anfänger & Profis ❓ Häufig gestellte Frage', 15400, 11800,
  8500, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/handpolster-schlagpolster-kampfsport-rewon-boxausruestung-boxtraining-zubehoer-boxhandschuhe-leder-mehrfarbig.jpg?v=1744464143','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-handpolster-schlagpolster-mehrfarbig-boxtraining-zubehoer-kaufen.jpg?v=1744464143','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-ergonomically-designed-boxing-focus-pads-schlagpolster-kampfsport.webp?v=1744464143','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/handpolster-schlagpolster-kampfsport-fokushandschuhe-rewon-mehrfarbig-maya-hide-leder-boxtraining-zubehoer-seo-ranking.webp?v=1744464143']::text[], true, '{"color":"Black/Black","material":"Focus Mitt"}'::jsonb, false, 98
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000099', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'T10 Boxhandschuhe Leder für Training & Sparring', 't10-boxhandschuhe-leder', 'MHK-099',
  'T10 Boxhandschuhe Leder – Maximale Performance für Training & Sparring Die RewonGear T10 Boxhandschuhe Leder wurden für ambitionierte Boxer, Kickboxer und MMA-Athleten entwickelt. Hochwertige Materialien, ergonomische Passform und starke Polsterung sorgen für optimalen Schutz bei jedem Training. Ob Sandsack, Sparring oder intensives Boxtraining – diese Boxhandschuhe für Herren und Damen bieten die perfekte Kombination aus Komfort, Stabilität und Langlebigkeit. Ideal für Einsteiger und Fortgeschrittene im Kampfsport. Vorteile der T10 Boxhandschuhe Robuste Polsterung für maximale Schlagabsorption Ergonomisches Design für sichere Handführung Stabiler Klettverschluss für festen Halt Atmungsaktives Innenfutter für hohen Tragekomfort Ideal für Boxen, Kickboxen, Muay Thai & MMA Einsatzbereiche Die RewonGear Boxhandschuhe eignen sich perfekt für: Boxtraining und Sandsack Sparring im Gym Kickboxen und Muay Thai Fitness-Boxen Vereine und Studios (B2B geeignet) Schnelle Lieferung in Deutschland & Europa Bestellen Sie Ihre Boxhandschuhe von RewonGear bequem online. Profitieren Sie von schneller Lieferung innerhalb Deutschlands sowie attraktiven B2B-Konditionen für Vereine, Gyms und Händler.', 15400, 10400,
  7500, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-boxhandschuhe-t10-schwarz-kickbox-muay-thai-handschuhe-protective.webp?v=1744498017','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_boxhandschuhe_t10_kickbox_muay_thai_schwarz_training_handschuhe_fuer_frauen_herren_conquer_one_punch.webp?v=1744498017','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-black-boxhandschuhe-t10-kickbox-muaythai-training.webp?v=1744498017','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_boxhandschuhe_t10_schwarz_kickbox_muay_thai_handschuhe_damen_herren_schutz_haltbarkeit.webp?v=1744498017']::text[], false, '{"color":"8oz","material":"Boxing Gloves & Mitts"}'::jsonb, false, 99
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000100', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'Classic Boxhandschuhe – Training & Sparring', 'classic-boxhandschuhe-training', 'MHK-100',
  'Classic Boxhandschuhe für Training & Sparring Die Classic Boxhandschuhe von RewonGear sind die ideale Wahl für Einsteiger und Fortgeschrittene im Boxen, Kickboxen und Muay Thai. Sie bieten zuverlässigen Schutz, hohen Tragekomfort und eine robuste Verarbeitung für regelmäßiges Training. Die stoßabsorbierende Polsterung schützt Hände und Knöchel effektiv, während der stabile Klettverschluss für einen sicheren Sitz sorgt. Das ergonomische Design unterstützt eine natürliche Faustform und verbessert die Kontrolle bei jedem Schlag. Vorteile der Classic Boxhandschuhe Robuste Verarbeitung für lange Haltbarkeit Effektive Polsterung für optimalen Handschutz Bequeme Passform mit sicherem Klettverschluss Ideal für Boxen, Kickboxen & Muay Thai Perfekt für Training, Fitness & Sparring Mit den Classic Boxhandschuhen von RewonGear trainieren Sie sicher und komfortabel – im Gym oder zu Hause.', 16200, 12600,
  9100, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/boxhandschuhe-classic-schwarz-rewon-kickbox-muay-thai-handschuhe-schutz-haltbarkeit-damen-herren.webp?v=1744498229','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-boxhandschuhe-conquer-one-punch-kickbox-muay-thai-gloves-schwarz.webp?v=1744498229','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/boxhandschuhe-classic-schwarz-kickbox-muay-thai-handschuhe-rewon-hohe-qualitaet-ergo-design-premium-leder-stosdaempfend.webp?v=1744498229','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/boxhandschuhe-classic-schwarz-rewon-kickbox-muay-thai-schutz-haltbarkeit-tri-layer-schaumstoff-hook-loop-strap.webp?v=1744498229']::text[], true, '{"color":"8oz","material":"Boxing Gloves & Mitts"}'::jsonb, false, 100
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000101', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'RewonGear Gel Innenhandschuhe Boxen – Boxbandagen', 'rewongear-gel-innenhandschuhe-boxen', 'MHK-101',
  'RewonGear Gel Innenhandschuhe für Boxen & Training Die RewonGear Gel Innenhandschuhe bieten zuverlässigen Schutz für Knöchel und Handgelenke bei Boxen, Kickboxen und MMA. Die integrierte Gelpolsterung absorbiert Stöße effektiv und reduziert die Belastung der Hände bei intensiven Trainingseinheiten. Dank des elastischen und atmungsaktiven Materials passen sich die RewonGear Innenhandschuhe optimal an die Hand an und sitzen bequem unter Boxhandschuhen. Der stabile Klettverschluss unterstützt zusätzlich die Handgelenkstabilität. Vorteile der RewonGear Gel Innenhandschuhe Stoßdämpfende Gelpolsterung Atmungsaktives, elastisches Material Sicherer Klettverschluss für stabilen Halt Schneller anzulegen als klassische Boxbandagen Ideal für Boxen, Kickboxen, MMA & Fitness Ideal geeignet für Die RewonGear Gel Innenhandschuhe sind perfekt für: Sandsacktraining Sparring-Vorbereitung Fitness-Boxen Kampfsport im Gym oder zuhause Trainieren Sie komfortabel und geschützt mit der bewährten Qualität von RewonGear .', 8400, 3900,
  2800, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/handbandagen-gelbandagen-rot-rewon-atmungsaktiv-elastisch-kohlefaser-finger-halt-fitnesstraining.jpg?v=1744497275','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/handbandagen-gelbandagen-rot-rewon-boxing-mma-gloves-gel-material.jpg?v=1744497275','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/handbandagen_gelbandagen_rot_rewon_boxhandschuhe_finger_daumen_schutz_gelmaterial.jpg?v=1744497275','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-red-gel-handbandagen-boxing-mma-fitness-support.jpg?v=1744497275']::text[], true, '{"color":"S/M","material":"Boxing & Martial Arts Protective Gear"}'::jsonb, false, 101
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000102', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'Gel Handbandagen Boxen – Innenhandschuhe mit Polsterung', 'schwarz-gel-handbandagen-boxen', 'MHK-102',
  'Gel Handbandagen für Boxen & MMA – RewonGear Die hochwertigen Gel Handbandagen von RewonGear bieten optimalen Schutz für Knöchel und Handgelenke beim Boxtraining, Kickboxen oder MMA. Dank stoßabsorbierender Polsterung und elastischem Material sind sie die ideale Alternative zu klassischen Boxbandagen. Diese Innenhandschuhe lassen sich schnell anziehen und passen perfekt unter Boxhandschuhe oder MMA Handschuhe — ideal für intensives Training am Sandsack oder im Sparring. Produktvorteile Stoßdämpfende Gelpolsterung für maximalen Knöchelschutz Atmungsaktives, elastisches Material für hohen Tragekomfort Halbfinger-Design für optimalen Grip Stabiler Klettverschluss zur Handgelenk-Fixierung Schneller anzulegen als klassische Boxbandagen Ideal geeignet für Boxen Kickboxen Muay Thai MMA Fitness & Sandsacktraining Setzen Sie auf die bewährte Qualität von RewonGear und verbessern Sie Ihren Handschutz bei jedem Training.', 8400, 3900,
  2800, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/handbandagen-schwarz-rewon-gelmaterial-kohlefaser-handschutz.webp?v=1744497328','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/handbandagen-gelbandagen-schwarz-rewon-atmungsaktiv-weiches-gelmaterial-boxhandschuhe.webp?v=1744497328','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/feature_b_11zon.webp?v=1725895620','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-black-handbandagen-gelbandagen-comfy-fitting-sport-glove.webp?v=1744497328']::text[], false, '{"color":"S/M","material":"Boxing & Martial Arts Protective Gear"}'::jsonb, false, 102
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000103', 'dddddddd-dddd-dddd-dddd-dddddddddd06', 'Rewon Sporttasche 35L – Mit Schuhfach & Seitentasche', 'sporttasche-35l-schuhfach-grau-rewon', 'MHK-103',
  'Rewon Sporttasche 35L – Der ultimative Begleiter für Sport & Reise Die Rewon Sporttasche 35L in elegantem Grau ist die perfekte Kombination aus Funktionalität, Stil und Langlebigkeit. Egal ob für das tägliche Training im Gym, Kampfsport wie Jiu-Jitsu oder als praktisches Handgepäck für Wochenendtrips – diese Tasche bietet dir den Platz und die Organisation, die du brauchst. Hauptmerkmale: Großes Volumen (35L): Ausreichend Platz für Kleidung, Boxhandschuhe und Zubehör. Separates Schuhfach: Hygienische Trennung von Schuhen oder nasser Kleidung durch ein integriertes Reißverschlussfach. Praktische Seitentasche: Schneller Zugriff auf Essentials wie Handy, Schlüssel oder Trinkflasche. Robustes Material: Hochwertiges, wasserabweisendes Polyester schützt dein Equipment vor Witterungseinflüssen. Vielseitige Tragemöglichkeiten: Ausgestattet mit gepolsterten Handgriffen und einem verstellbaren, abnehmbaren Schultergurt für maximalen Komfort. Technische Daten: Maße: ca. 60 x 30 x 35 cm Kapazität: 35 Liter Farbe: Grau (auch in Rot erhältlich) Pflege: Einfach mit einem feuchten Tuch abwischbar. Warum Rewon Gear? Unsere Taschen sind für Athleten entwickelt, die keine Kompromisse eingehen. Das ze', 22100, 12000,
  8700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/graue-sporttasche-mit-seitentasche-und-schuhfach-rewon-35l.jpg?v=1744497359','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-grau-sporttasche-seitentasche-schuhfach-35l-dimension-60x30x35cm.jpg?v=1744497359','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/graue_sporttasche_rewon_seitentasche_schuhfach_60x30x35cm_35L_unisex_robust_stilvoll.jpg?v=1744497359','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/graue_sporttasche_seitentasche_schuhfach_35L_robust_stilvoll_rewon.jpg?v=1744497359']::text[], true, '{"color":"Grey","material":"Travel Backpack"}'::jsonb, false, 103
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000104', 'dddddddd-dddd-dddd-dddd-dddddddddd06', 'Rewon Sporttasche 35L – Mit Schuhfach & Seitentasche', 'sporttasche-35l-schuhfach-rot-rewon', 'MHK-104',
  'Rewon Sporttasche 35L – Dynamisch, Robust & Funktional Die Rewon Sporttasche 35L in sportlichem Rot ist Ihr idealer Partner für jede Herausforderung. Ob im Boxring, beim Crossfit oder als kompakte Reisetasche – sie vereint modernes Design mit maximaler Funktionalität, damit Sie Ihr Equipment immer bestens organisiert dabei haben. Ihre Vorteile im Überblick: Optimales Volumen (35L): Bietet ausreichend Platz für Ihre Trainingsbekleidung, Handtücher und Schutzausrüstung. Hygienisches Schuhfach: Ein separates Fach mit Reißverschluss sorgt dafür, dass Ihre Schuhe getrennt von Ihrer sauberen Kleidung bleiben. Schnellzugriff-Seitentasche: Praktischer Stauraum für Ihr Smartphone, Geldbeutel oder die Trinkflasche. Langlebiges Design: Gefertigt aus wetterbeständigem Polyester mit wasserabweisender Beschichtung – leicht zu reinigen und extrem robust. Komfortabler Transport: Gepolsterte Griffe sowie ein abnehmbarer, verstellbarer Schultergurt garantieren ein angenehmes Tragegefühl. Technische Daten: Maße: ca. 60 x 30 x 35 cm Fassungsvermögen: 35 Liter Farbe: Rot (auch in Grau verfügbar) Pflegehinweis: Einfach mit einem feuchten Tuch abwischbar (nicht maschinenwaschbar). Für wen ist sie geeigne', 22100, 12000,
  8700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/red-sports-duffel-bag-with-side-pocket-and-shoe-compartment-60x30x35cm-35L-durable-unisex-ideal-for-long-term-use.jpg?v=1744497642','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/sporttasche_rot_rewon_mit_seitentasche_schuhfach_35l_unisex_dauerhaft_60x30x35cm.jpg?v=1744497642','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/sportsbag-red-with-side-pocket-and-shoe-compartment-60x30x35cm-durable-unisex-35L.jpg?v=1744497642','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rote_sporttasche_seitentasche_schuhfach_rewon_60x30x35cm_35L_unisex_robust_strapazierfahig_stilvoll.jpg?v=1744497642']::text[], true, '{"color":"Red","material":"Travel Backpack"}'::jsonb, false, 104
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000105', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Sporttasche | Jiu Jitsu | Karate | Umhängetasche Gym - Schwarz/Rot', 'boxing-mma-jiu-jitsu-backpack-for-gym-school-with-shoes-pocket', 'MHK-105',
  'Rewon Sporttasche Schwarz/Rot – PU-Leder Gym- & Reisetasche 60x30x30 cm 🧳 🛍️ Produktbeschreibung Die Rewon Sporttasche in stilvollem Schwarz/Rot-Design ist die perfekte Lösung für Sport, Reisen, Fitnessstudio und mehr. Mit großzügigem Stauraum, robustem PU-Leder und intelligentem Taschen-Layout ist sie sowohl funktional als auch modisch. Dank ihrer handlichen Maße (60 × 30 × 30 cm) ist sie ideal als Handgepäck einsetzbar. 🧩 Merkmale & Vorteile Hochwertiges PU-Leder: Langlebig, wasserabweisend und leicht zu reinigen Stabile Verarbeitung: Robuste Nähte & verstärkte Tragegriffe Komfortabler Schultergurt: Verstellbar & gepolstert – für bequemes Tragen Multifach-Design: Separate Fächer für Schuhe, Kleidung, Zubehör Handgepäcktauglich: Ideal für Kurztrips, Business-Reisen & Training Reißfest & formstabil: Auch bei voller Beladung zuverlässig 📏 Technische Details Abmessungen: 60 cm × 30 cm × 30 cm Material: Premium PU-Leder & strapazierfähiges Polyester Farbe: Schwarz mit roten Akzenten Trageoptionen: Handgriff & Schultergurt (abnehmbar) Kapazität: ca. 35 L 💬 FAQ – Häufig gestellte Fragen Ist die Tasche wasserdicht? ✅ Das PU-Leder ist wasserabweisend und schützt den Inhalt bei leicht', 25500, 16200,
  11700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_sporttasche_schwarz_rot_jiu_jitsu_karate_umhaengetasche_gym_60x30x30cm_pu_leather.jpg?v=1744497663','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_schwarz_rot_sporttasche_jiu_jitsu_karate_gym_umhaengetasche_60x30x30cm_pu_leder.jpg?v=1744497662','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_schwarz_rot_jiu_jitsu_karate_sporttasche_gym_umbangetasche_pu_leder_60x30x30cm.jpg?v=1744497663','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_schwarz_rot_jiu_jitsu_karate_sporttasche_umhaengetasche_gym_pu_leder_60x30x30.jpg?v=1744497663']::text[], true, '{"color":"Black","material":"Travel Backpack"}'::jsonb, false, 105
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000106', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Classic Sporttasche | Jiu Jitsu | Karate | Umhängetasche Gym - Schwarz/Weiß', 'jiu-jitsu-backpack-for-gym', 'MHK-106',
  'Rewon Premium PU-Leder Sporttasche Schwarz/Weiß Die Rewon Sporttasche verbindet erstklassiges Design mit maximaler Funktionalität . Hergestellt aus hochwertigem PU-Leder in modernem Schwarz/Weiß, bietet sie ausreichend Platz für Sport, Reisen oder den Alltag. Dank durchdachter Aufteilung und komfortabler Trageoptionen ist sie die ideale Tasche für Männer und Frauen, die Wert auf Stil, Langlebigkeit und Praktikabilität legen. Highlights & Funktionen Großzügiges Volumen: 60×30×30 cm – perfekt für Training, Fitness oder Wochenendreisen Premium-Material: Strapazierfähiges PU-Leder, wasserabweisend und pflegeleicht Praktischer U-Reißverschluss: Einfaches Packen und schneller Zugriff auf den Inhalt Sicherer Klettverschluss: Zuverlässiger Halt, auch unterwegs Mehrere Fächer: Separate Seitentaschen für Schuhe, Flaschen oder Zubehör Komfortables Tragen: Gepolsterte Griffe und verstellbarer Schultergurt Unisex-Design: Zeitloses Schwarz/Weiß – stylisch für jede Altersgruppe Vorteile & Anwendung Fitness & Sport: Ideal für Gym, Jiu-Jitsu, Karate, Yoga, Crossfit und mehr Reisen & Alltag: Passt als Handgepäck bei vielen Airlines – optimal für Wochenendtrips Organisation leicht gemacht: Spezielle ', 25500, 16200,
  11700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_classic_sporttasche_jiu_jitsu_karate_gym_bag_schwarz_weiss_pu_leather_60x30x30.jpg?v=1744497682','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-schwarz-weiss-sporttasche-jujitsu-karate-gym-umhangetasche-premium-pu-leder-fitness-travel-bag.jpg?v=1744497682','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-classic-sporttasche-schwarz-weiss-gym-karate-jiu-jitsu-premium-pu-leather.jpg?v=1744497682','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/RWB-461-5.jpg?v=1685605747']::text[], false, '{"color":"Black","material":"Travel Backpack"}'::jsonb, false, 106
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000107', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Classic Sporttasche | Jiu Jitsu | Karate | Umhängetasche Gym - Schwarz/Rot', 'duffle-gym-travel-bag', 'MHK-107',
  'Rewon Sporttasche 35L – Schwarz/Rot, Robust, Vielseitig & Reisegeeignet 🎒 📝 Produktbeschreibung Die Rewon Sporttasche 35L ist dein idealer Begleiter für Training, Reisen und den Alltag. Mit ihrem robusten Design, der markanten Farbgebung in Schwarz/Rot und clever aufgeteiltem Stauraum eignet sie sich perfekt für Männer und Frauen, die auf Funktionalität und Stil setzen. Ob für das Fitnessstudio, Wochenendtrips oder als Handgepäck – diese Tasche überzeugt mit Komfort, Vielseitigkeit und professioneller Optik. ✨ Highlights & Funktionen Großzügiges Volumen: 35 Liter Fassungsvermögen für Kleidung, Ausrüstung und Accessoires Multitaschen-Design: Drei separate Außentaschen – für Schuhe, Pflegeprodukte, Elektronik uvm. Tragekomfort: Verstellbarer, gepolsterter Schultergurt + zwei gepolsterte Handgriffe Flugtauglich: Maße (60 × 30 × 35 cm) – ideal als Handgepäck für Reisen & Wochenendtrips Strapazierfähiges Material: Wasserabweisendes, reißfestes Polyester – langlebig und pflegeleicht Unisex-Design: Modernes Schwarz/Rot – stylisch für Männer & Frauen 💡 Vorteile & Anwendungsbereiche Sport & Fitness: Ideal für Boxtraining, Karate, Gym, Yoga, Crossfit, Jiu-Jitsu und mehr Reisen & Alltag: F', 17900, null,
  12900, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/classic-sporttasche-jiu-jitsu-karate-umhaengetasche-gym-schwarz-rot-rewon-60x30x35cm-35l.jpg?v=1744497697','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_classic_sporttasche_jiu_jitsu_karate_gym_bag_schwarz_rot_35L_men_women_durable_large_capacity.jpg?v=1744497697','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/classic-sporttasche-jiu-jitsu-karate-gym-umhaengetasche-schwarz-rot-rewon.jpg?v=1744497697']::text[], true, '{"color":"Black","material":"Travel Backpack"}'::jsonb, false, 107
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000108', 'dddddddd-dddd-dddd-dddd-dddddddddd07', 'Classic Schlagpolster/Kickpratzen/MMA Trainerpolster – Schwarz/Schwarz', 'classic-mma-shield-boxing-shield-striking-pad', 'MHK-108',
  'Hohe Qualität: Das Rewon Gear Armpolster ist aus hochwertigem Kunstleder gefertigt und bietet damit lange Haltbarkeit und Funktionalität. Professionelle Boxausrüstung (Armpolster, Krav Maga, Boxsack) für Kickboxtraining auf hohem Niveau, wodurch das Kickpolster langlebiger und leichter zu reinigen ist. Es ist ideal für Box- und Kampfsporttraining sowie Taekwondo-Training und bietet besseren Schutz bei Tritten, Schlägen, Ellbogen- und Knieschlägen. Das sichere Klettverschlusssystem macht das An- und Ausziehen der Polster einfach und bietet während langer Trainingseinheiten einen hervorragenden Halt. Es ermöglicht die Verwendung des Schlagpolsters in verschiedenen Winkeln. Zufriedenheitsgarantie: Der Kick-Schild ist aus vielseitigem Material gefertigt, das dauerhafte Robustheit garantiert. Wir streben nach Großartigkeit und unser professioneller Kundenservice garantiert Ihre Zufriedenheit.', 17600, 14300,
  10300, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/classic-schlagpolster-kickpratzen-mma-trainerpolster-schwarz-rewon-hohe-qualitaet-kunstleder-boxausruestung.webp?v=1744497720','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_classic_kickpratzen_mma_trainerpolster_hohe_qualiat_kunstleder_funktional_kickboxtraining_schwarz.webp?v=1744497720','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-gear-black-leather-schlagpolster-kickpratzen-mma-trainerpolster-dual-hook-loop-straps.webp?v=1744497720','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/schlagpolster-kickpratzen-rewon-mehrfarbig-boxtraining-zubehoer-kauf.webp?v=1744464341']::text[], false, '{"color":"Black/Black","material":"Kick Sheild"}'::jsonb, false, 108
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000109', 'dddddddd-dddd-dddd-dddd-dddddddddd02', 'Night Kopfschutz | MMA Kickboxen Kampfsport | Box-Kopfschutz - Camouflage', 'night-camo-head-guard', 'MHK-109',
  'Rewon Camouflage Kopfschutz – Vollgesicht & Ohrenschutz, EVA‑Schaum, Klettverschluss 🛡️ 📝 Produktbeschreibung Der Rewon Camouflage Kopfschutz bietet Rundum‑Schutz für das Gesicht (Nase, Kinn, Wangen, Augen, Ohren) und den Kopf – speziell entwickelt für Box-, MMA‑ und Kickbox‑Training. Hochwertiges Kunstleder mit weichem Futter sorgt für Tragekomfort, während integrierte EVA‑Schaumpolster Stöße wirksam dämpfen. ✨ Eigenschaften Schutzbereich: 360° Vollschildeffekt – klarer Sichtbereich ohne Einschränkung EVA‑Schaumstoff‑Polsterung: Reduziert die Schlagkraft und schützt effektiv Material außen: Strapazierfähiges Kunstleder – reißfest und pflegeleicht Innenfutter: Weiches, wasserabweisendes Textil für angenehmes Tragegefühl Verschluss: Verstellbarer Klettverschluss – perfekter Halt ohne Verrutschen Design: Auffällig Camouflage‑Look mit robustem Gurtband für Style & Funktion 💥 Vorteile & Problemlösung Ganzheitliche Sicherheit: Schützt Kopf & Gesicht vollständig, während Sicht- und Atmungsfreiheit erhalten bleiben Effektive Schlagdämpfung: Einfache Stoßabsorption durch hochwertige EVA‑Polsterung, reduziert Verletzungsrisiken Sichere Passform: Klettverschluss und stabiler Innenraum sor', 13400, null,
  9700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-kopfschutz-multicolor-boxen-mma-kickboxen-vollschutz-padded-headgear.webp?v=1744464515','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-mehrfarbig-boxkopfschutz-kampfsport-mma-kickboxen-vollschutz.webp?v=1744464515','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/mehrfarbiger_boxkopfschutz_mma_kickboxen_kampfsport_rewon_schutz_level_boxbekleidung_boxtraining.webp?v=1744464515','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-boxkopfschutz-mma-kickboxen-kampfsport-mehrfarbig-boxtraining-helm-schutz.webp?v=1744464515']::text[], true, '{"color":"S","material":"Boxing & Martial Arts Protective Gear"}'::jsonb, false, 109
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000110', 'dddddddd-dddd-dddd-dddd-dddddddddd07', 'Tattoo Handpolster/Schlagpolster Kampfsport/Fokushandschuhe - Schwarz', 'tatoo-boxing-training-punch-mitts-curved-focus-pads', 'MHK-110',
  'Rewongear bietet Ihnen dieses Paar gebogener Trainingshandschuhe aus Maya Hide-Leder an. Sie bieten optimale Stoßdämpfung beim Aufprall. Leicht und handlich, perfekte Verarbeitung. Was sie zur Referenz vieler Trainer gemacht hat! Eigenschaften: Länge: 25 cm Gewicht: 450 g Verkauf paarweise.', 13400, 11800,
  8500, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-mehrfarbig-kampfsport-schlagpolster-boxtraining-zubehoer-leder-maaya-hide.webp?v=1744460054','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/handpolster_schlagpolster_kampfsport_mehrfarbig_rewon_boxausrustung_online_boxpratzen_set_boxhandschuhe_kaufen.jpg?v=1744464143','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-handpolster-leder-boxausruestung-schlagpolster-mehrfarbig-training-boxaccessoires-gym.webp?v=1744464143','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_fokushandschuhe_maya_hide_leather_boxpratzen_kickboxen_ausruestung_mehrfarbig_fitnessprodukte_25cm.webp?v=1744460054']::text[], true, '{"color":"Black","material":"Focus Mitt"}'::jsonb, false, 110
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000111', 'dddddddd-dddd-dddd-dddd-dddddddddd02', 'Rewon Karate Kopfschutz Rot – Profi-Helm für Kampfsport & MMA', 'karate-kopfschutz-rot-mma-taekwondo', 'MHK-111',
  'Rewon Profi-Kopfschutz Maximale Sicherheit für Karate, MMA & Sparring Schützen Sie das Wichtigste bei jedem Schlagabtausch. Der Rewon Kampfsporthelm bietet einen lückenlosen 360°-Schutz für das gesamte Gesicht (Nase, Kinn, Wangen, Ohren, Augen) und den Kopf. Entwickelt für Athleten aller Leistungsstufen, kombiniert dieser Helm kompromisslose Sicherheit mit einem uneingeschränkten Sichtfeld. Warum dieser Kopfschutz die richtige Wahl ist: Umfassender Schutz: Die spezielle Konstruktion deckt alle empfindlichen Zonen ab, ohne Sie in Ihrer Reaktionsfähigkeit oder Sicht einzuschränken. Hocheffiziente Dämpfung: Die dicke, strategisch platzierte Schaumstoffpolsterung absorbiert die Wucht von Aufprallen und schützt Sie zuverlässig vor schweren Schlägen. Premium-Materialien: Robustes Kunstleder außen und verstärkte Nähte sorgen für extreme Langlebigkeit. Innen schmeichelt ein weiches, wasserabweisendes Futter der Haut und sorgt für Hygiene. Federleicht & Komfortabel: Dank des geringen Gewichts bleibt Ihre Beweglichkeit voll erhalten. Kein schweres Gefühl, selbst bei langen Trainingseinheiten. Perfekter Sitz: Der intuitive Klettverschluss ermöglicht ein sekundenschnelles Anlegen und garantier', 15700, 12900,
  9300, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-kopfschutz-mehrfarbig-mma-kickboxen-boxtraining-zubehoer-fuer-boxer-aller-leistungsstufen.webp?v=1744464515','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-boxkopfschutz-mehrfarbig-mma-kickboxen-kampfsport-schutzausruestung.webp?v=1744464516','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-kopfschutz-boxing-headgear-kickboxen-mma-mehrfarbig-schutz-posterung.webp?v=1744464516','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-kopfschutz-mma-kickboxen-boxkopfschutz-mehrfarbig-vollschutz-schlagwirkung-boxausruestung.webp?v=1744464516']::text[], true, '{"color":"XS","material":"Boxing & Martial Arts Protective Gear"}'::jsonb, false, 111
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000112', 'dddddddd-dddd-dddd-dddd-dddddddddd02', 'Rewon Karate Kopfschutz – Professioneller Kampfsporthelm für MMA & Taekwondo', 'karate-kopfschutz-blau-mma-taekwondo', 'MHK-112',
  'Rewon Profi-Kopfschutz Maximale Sicherheit für Karate, MMA & Taekwondo Schützen Sie das Wichtigste bei jedem Schlagabtausch. Die Rewongear Karate-Kopfschutzserie bietet einen umfassenden 360°-Schutz für Gesicht (Nase, Kinn, Wangen, Ohren und Augen) sowie den gesamten Kopfbereich. Dieser Helm wurde speziell für Kampfsportler entwickelt, die volle Sicherheit benötigen, ohne dabei auf ein uneingeschränktes Sichtfeld zu verzichten. Ihre Vorteile auf einen Blick: Maximale Dämpfung: Die dicke Schaumstoffpolsterung minimiert die Wucht schwerer Aufpralle und schützt Sie effektiv vor Schlägen jeder Art. Premium-Materialien: Eine strapazierfähige Außenseite aus Kunstleder und verstärkte Nähte garantieren Langlebigkeit, während das weiche, wasserabweisende Innenfutter für hohen Tragekomfort sorgt. Federleichtes Design: Trotz des hohen Schutzniveaus ist der Boxhelm extrem leicht und lässt sich auch bei intensiven Trainingseinheiten angenehm tragen. Sicherer Halt: Dank des verstellbaren Klettverschlusses lässt sich der Helm mühelos selbst anlegen und festziehen – für einen rutschfesten Sitz ohne Verrutschen. Für die ganze Familie: Erhältlich in drei Größen, passend für Kinder, Jugendliche und E', 15700, 12900,
  9300, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-boxkopfschutz-mehrfarbig-boxtraining-zubehor-kickboxen-ausrustung-ideal-fur-alle-level-schutz.webp?v=1744464515','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_boxkopfschutz_mehrfarbig_mma_kickboxen_schutz_boxhelm_kaufen.webp?v=1744464515','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_kopfschutz_mma_kickboxen_boxkopfschutz_mehrfarbig_boxen_kampfsport_schutz_padded_gepolstert.webp?v=1744464515','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_mehrfarbig_boxkopfschutz_mma_kickboxen_kampfsport.webp?v=1744464515']::text[], true, '{"color":"XS","material":"Boxing & Martial Arts Protective Gear"}'::jsonb, false, 112
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000113', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Karateanzug | Karate-Gi | Karate Trainingsbekleidung - Weiß', 'copy-of-karate-uniform-lightweight', 'MHK-113',
  'Wir garantieren Produktqualität zu einem wettbewerbsfähigen Preis für Karate-Anhänger. Hergestellt aus strapazierfähigem Polyester/Baumwolle. Stark vernäht an Druckpunkten für längere Haltbarkeit. Vernäht, um zusätzlichen Platz an den Schultern für schnelle, uneingeschränkte Bewegung zu bieten. Das breitere Hosendesign erleichtert das Dehnen, hohe Tritte und tiefere Positionen1) Farbe: Weiß Lieferumfang: Oberteil + Hose + Gürtel', 14300, null,
  10300, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/karateanzug-karate-gi-trainingsbekleidung-mehrfarbig-rewon-polyester-baumwolle-kaufen.webp?v=1744463989','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/karateanzug-karate-gi-multicolor-rewon-polyester-baumwolle-langlebiger-trainingsanzug-boxing-products-fitness-equipment-germany.webp?v=1744463989','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/karateanzug-karate-gi-karate-trainingsanzug-mehrfarbig-rewon-polyester-baumwolle-stark-vernaeht.webp?v=1744459908','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/karateanzug-karate-gi-trainingsbekleidung-mehrfarbig-rewon-polyester-baumwolle-strapazierfaehig.webp?v=1744463989']::text[], true, '{"size":"000","color":"White","material":"Karate Uniform"}'::jsonb, false, 113
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000114', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Basic 1.5 Kampfsport JJ Anzug | Ju Jutsu Gi | BJJ Kimono – Schwarz', 'basic1-5-jiu-jitsu-gi-1', 'MHK-114',
  'Die ideale Balance zwischen Gewicht und Weichheit. Für alle Arten von Training und Wettkampf ist der Rewon BJJ Gi die beste Wahl. Unser BJJ ist anderen Marken überlegen, da er in drei wunderschönen Farben angeboten wird. Alle BJJ-Gi sind mit einem kostenlosen weißen Gürtel ausgestattet, der wie der Gi aus einer hochwertigen Stoffbasis besteht. Hinweis: Bitte überprüfen Sie vor der Bestellung die „GRÖSSENTABELLE“ in den Bildern, um Ihre Größenauswahl zu treffen.', 31400, 18500,
  13300, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/kampfsport-jujutsu-gi-bjj-basic-morefarbig-rewon-boxtraining-fitness.webp?v=1744463854','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/kampfsport-jj-anzug-basic-ju-jutsu-gi-bjj-kimono-mehrfarbig-rewon-boxing-products.jpg?v=1744463854','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/kampfsport-bjj-jujutsu-gi-rewon-basic-multicolor-boxtraining-zubehoer.jpg?v=1744459783','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/jujutsu-black-bjj-gikampfsport-basic-rewon-gi-boxtraining-zubehor.jpg?v=1744463854']::text[], true, '{"size":"A0","color":"Black","material":"Jiu Jitsu GI"}'::jsonb, false, 114
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000115', 'dddddddd-dddd-dddd-dddd-dddddddddd02', 'Wendebarer Brustschutz - BLAU/ROT', 'wendebarer-brustschutz', 'MHK-115',
  'Wir streben nach Größe und deshalb sorgt unser professioneller Kundenservice für Ihre Zufriedenheit. Unsere Produkte und Trainingsgeräte zeichnen sich durch unübertroffene Herstellungseigenschaften aus, die unübertroffene Leistung vermitteln. Taekwondo, Boxen, MMA, Muay Thai und jede andere Sportart, die Brustschutz erfordert. Elastische Bänder und Klettverschlüsse ermöglichen eine einfache Anpassung und ein angenehmes Tragen. Voller Brustbereich für Karateübungen. Wendbarer (blau/rot) Brustschutz/Brustschutz Hochwertiges Kunstleder, sorgfältig vernäht mit einem einzigartigen Faden aus den hochwertigsten Materialien Elastische Bänder und Klettverschlüsse ermöglichen einfaches Anpassen und Tragen. Taekwondo, Boxen, MMA, Muay Thai und jede andere Sportart, die Brustschutz erfordert. ZUFRIEDENHEITSGARANTIE – Wir streben nach Größe und so sorgt unser professioneller Kundendienst für Ihre Zufriedenheit. Unsere Produkte und Trainingsgeräte werden durch unübertroffene Herstellungseigenschaften unterstützt, die unübertroffene Leistung liefern.', 21800, 18500,
  13300, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/wendebarer-brustschutz-blau-rot-rewon-taekwondo-boxen-mma-muay-thai.jpg?v=1744496278','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/wendebarer-brustschutz-blau-rot-rewon-taekwondo-boxen-mma-muay-thai-brustschutz.jpg?v=1744496278','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/reibares_indreushm_daw_lims_rohd_asschutz_brut_bla_werot_taekwondo_boxen_mma_muay_thai_training.webp?v=1744496278','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/wendebarer-brustschutz-blau-rot-rewon-taekwondo-boxen-mma-muay-thai-schutz.webp?v=1744496278']::text[], false, '{"size":"XS","color":"Red/Blue","material":"Chest Guard"}'::jsonb, false, 115
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000116', 'dddddddd-dddd-dddd-dddd-dddddddddd02', 'Leg Raise Ankle Straps für Kabelzug | Rewon Gear', 'leg-raise-ankle-strap', 'MHK-116',
  '🏋️ Maximiere dein Beintraining mit den hochwertigen Leg Raise Ankle Straps! Diese gepolsterten, verstellbaren Knöchelriemen sind das perfekte Zubehör für Kabelzugmaschinen, Widerstandsbänder und Functional Training . Entwickelt für maximale Beweglichkeit und Widerstand , unterstützen sie gezielt dein Bein-, Hüft- und Gesäßtraining . 🔥 Warum unsere Knöchelbandagen? ✔ Vielseitiges Training – Perfekt für Beinheben, Kickbacks, Hüftabduktionen and Gesäßübungen . ✔ Kompatibel mit allen Kabelzugmaschinen – Funktioniert ideal im Gym oder Home-Gym . ✔ Individuell anpassbar – Verstellbare Klettverschlüsse für perfekten Sitz an Knöchel and Oberschenkel. ✔ Stoßabsorbierende Polsterung – Reduziert Druckstellen & sorgt für maximalen Komfort. ✔ Einheitsgröße – Unisex-Design – Ideal für Männer and Frauen, verkauft als Paar . 💪 Erreiche deine Fitnessziele mit den Leg Raise Ankle Straps! Perfekt für Bodybuilding, Krafttraining, Pilates und Reha-Übungen . 🛒 Jetzt bestellen & dein Beintraining aufs nächste Level bringen!', 6400, null,
  4600, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/leg-raise-ankle-straps-verstellbare-knoechelbandagen-kabelzugtraining-beinuebungen.jpg?v=1744496291','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/leg-raise-ankle-straps-verstellbare-knoechelbandagen-krafttraining-widerstandsbaender-rewon-gear.jpg?v=1744496291']::text[], true, '{"color":"Black","material":"Ankle Wraps"}'::jsonb, false, 116
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000117', 'dddddddd-dddd-dddd-dddd-dddddddddd02', 'Knöchelbandagen | Kickbox-Bandagen | Knöchelbandagen für Muay - Schwarz', 'ankle-wraps', 'MHK-117',
  'Maximaler Schutz & Stabilität für deine Knöchel! Die Rewon Knöchelbandagen wurden speziell für Kampfsportarten wie Kickboxen, Muay Thai, MMA und Taekwondo entwickelt. Mit gezielter Kompression unterstützen sie das Sprunggelenk , fördern die Durchblutung und reduzieren das Risiko von Verletzungen und Schwellungen . 🔥 Warum Rewon Knöchelbandagen? ✔ Gezielte Kompression – Fördert die Durchblutung, reduziert Muskelermüdung & beugt Verletzungen vor. ✔ Stabilisierender Halt – Schützt das Sprunggelenk bei schnellen Bewegungen & harten Tritten. ✔ Perfekt für Kampfsportler – Ideal für Kickboxer, MMA-Fighter, Muay Thai & Taekwondo-Athleten . ✔ Atmungsaktives & elastisches Material – Sorgt für maximalen Komfort & perfekten Sitz, ohne einzuschneiden. ✔ Unverzichtbar für Training & Wettkampf – Unterstützt die Regeneration & Leistungsfähigkeit . 💪 Erreiche dein volles Potenzial mit den Rewon Knöchelbandagen! Egal, ob du im Training oder Wettkampf bist – diese Bandagen bieten dir die Sicherheit, die du brauchst. 🛒 Jetzt bestellen & deine Performance auf das nächste Level bringen!', 4200, null,
  3000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/schwarz_rewon_knoechelbandagen_kickboxen_muaythai_mma_schutz_stabilitaet_knochel.jpg?v=1744496378','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/knochelbandagen_schutz_stabilitat_kickbox_muay_thai_mma_taekwondo_schwarz_rewon.jpg?v=1744496378','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/schwarz-rewon-knoechelbandagen-groessentabelle-kampfsport-kickboxen-muaythai-compression.jpg?v=1744496378']::text[], true, '{"size":"S","color":"Black","material":"Ankle Wraps"}'::jsonb, false, 117
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000118', 'dddddddd-dddd-dddd-dddd-dddddddddd08', 'Rewon Gear Gewichtheber-Kniebandagen | MMA-Knieschutz (Paar) – Schwarz/Weiß', 'knee-wraps-3', 'MHK-118',
  'Über diesen Artikel VERBESSERN SIE BEINSTÜTZUNG, STABILITÄT UND KRAFT: REWON GEAR Kniebandagen steigern Ihre Beinkraft bei Kniebeugen, Beinpressen und anderen anstrengenden Beinübungen, wenn Sie sie in Verbindung mit einem guten Trainingsplan tragen. Schon nach der ersten Sitzung werden Sie feststellen, dass Sie mehr Kraft haben. Sie haben noch nie bessere Kniebandagen erlebt als diese. GUT FÜR IHRE KNIE: Kniebandagen bieten besseren Halt und Stabilität bei anstrengenden Beinübungen. Kniebandagen verbessern die Trainingseffizienz, schützen Ihr Kniegelenk vor möglichen Schäden durch schweres Heben und bieten zusätzliche Kompression. Rewon Gear Kniebandagen sind das effektivste Paar Kniebandagen: Rewon Gear Kniebandagen sind das EINZIGE beliebte Paar 72-Zoll-Kniebandagen, das unser Markengummiband mit Riemenbefestigung enthält. Dadurch können Sie Ihre Knie leicht umwickeln und die Bandagen an Ort und Stelle halten, was Ihnen ein großartiges Beintraining ermöglicht. ÜBERTREIBEN SIE IHRE GRENZEN: Weil die Kniebandagen von Rewon Gear eine enge Kniekompression beim Kniebeugen, Powerlifting, Crosstraining, Gewichtheben, Bodybuilding oder jeder anderen Beinaktivität bieten. Sie werden in d', 5600, null,
  4000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/BLK-WHT1.jpg?v=1704705560','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-gear-gewichtheber-kniebandagen-mma-knieschutz-schwarz-weiss-paar.jpg?v=1744496391','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-gear-gewichtheber-kniebandagen-mma-knieschutz-schwarz-weiss-beinstuetzung-stabilitaet-kraft.jpg?v=1744496391']::text[], true, '{"color":"Black/white","material":"Lifting Straps"}'::jsonb, false, 118
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000119', 'dddddddd-dddd-dddd-dddd-dddddddddd08', 'verstellbares Kopfgeschirr | Nackentrainingsgerät | Widerstandstraining - Schwarz', 'head-harness', 'MHK-119',
  'Steigere deine sportliche Leistung mit dem Rewon Gear verstellbaren Nackentrainer – dem ultimativen Kopfgeschirr für effektives Nackentraining . Hauptmerkmale: Optimales Nackentraining: Dank der gepolsterten und verstellbaren Riemen für Kopf, Stirn und Kinn bietet dieses Nackentrainingsgerät einen sicheren und komfortablen Sitz. Ideal für gezieltes Training der Nackenmuskulatur. Vielseitige D-Ringe: Ausgestattet mit D-Ringen an den Seiten und unter dem Kinn, ermöglicht es eine Vielzahl von Übungen, einschließlich gewichteter Nackenverlängerungen, um die Nacken- und oberen Rückenmuskeln zu stärken. Verbesserung der Nacken- und Rückenmuskulatur: Unverzichtbar für MMA-Kämpfer, Bodybuilder, Gewichtheber, Boxer, Kickboxer und andere Athleten, die ihre Nacken- und oberen Rückenmuskeln aufbauen oder rehabilitieren möchten. Hochwertige Materialien: Hergestellt mit feiner Baumwollpolsterung an Oberseite, Stirn, Kinn und Ohren für maximalen Komfort. Seitliche Paspeln verhindern Hautirritationen durch Metallringe während intensiver Trainingseinheiten. Hinweis: Internationale Produkte können von lokalen Produkten in Bezug auf Passform, Altersfreigabe, Produktsprache, Etikettierung oder Anleitu', 7600, null,
  5400, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_verstellbares_kopfgeschirr_nackentrainingsgeraet_schwarz_widerstandstraining_optimales_tragekomfort.jpg?v=1744496439']::text[], false, '{"color":"Black","material":"Ab Straps"}'::jsonb, false, 119
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000120', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'AB Hebegurte | Bauchtrainerschlaufen | Profi Armschlaufen - Schwarz', 'ab-straps', 'MHK-120',
  'Steigere dein Core-Training mit den Rewon AB Hebegurten – das ultimative Zubehör für ein intensives Bauchmuskeltraining! Diese hochwertigen Armschlaufen bieten maximale Unterstützung und Komfort , sodass du dich voll und ganz auf deine Bauchmuskeln konzentrieren kannst – ohne Griffkraft zu verlieren. 🔥 Deine Vorteile: ✔ Maximale Muskelaktivierung – Perfekt für Beinheben & Knieheben zur Stärkung der gesamten Bauchmuskulatur. ✔ Höchster Komfort & Langlebigkeit – Kein Einschneiden, keine Hautreizungen! Ergonomisches Design für jede Körperform . ✔ Kein fester Griff nötig – Trainiere ohne Belastung für Hände & Arme. ✔ Einfache Befestigung & Universelle Passform – Ideal für Klimmzugstangen, Home-Gyms & Studiogeräte . ✔ Mehr Kraft & Kalorienverbrauch – Fördert die Durchblutung, Fettverbrennung & Muskeldefinition . 💪 Für Einsteiger & Profis – Die ideale Bauchmuskelmaschine! Egal ob im Fitnessstudio oder zu Hause – diese Bauchtrainerschlaufen helfen dir, einen starken Core, definierte Bauchmuskeln und eine athletische V-Form zu erreichen. 🛒 Jetzt in der EU & Deutschland erhältlich – Hol dir dein Upgrade für das Bauchtraining!', 15400, null,
  11100, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_ab_hebegurte_bauchtrainerschlaufen_profi_armschlaufen_schwarz_core_training_komfort_muskelaktivierung.jpg?v=1744496461','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_ab_hebegurte_bauchtrainerschlaufen_armsschlaufen_schwarz_profi_core_training_fitness.jpg?v=1744496461','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_ab_hebegurte_bauchtrainerschlaufen_profi_armschlaufen_schwarz_maximaler_muskelaufbau_fuer_core_training.jpg?v=1744496461','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_ab_hebegurte_bauchtrainerschlaufen_profi_armschlaufen_schwarz_core_training.jpg?v=1744496461']::text[], true, '{"color":"Black","material":"Ab Straps"}'::jsonb, false, 120
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000121', 'dddddddd-dddd-dddd-dddd-dddddddddd08', 'Rewon 14" Handgelenkbandagen Lila | Wrist Wraps', 'weightlifting-wrist-wraps-14-lila-handgelenkbandagen-rewon', 'MHK-121',
  'Rewon Weightlifting Wrist Wraps 14" Lila Profi-Support für Ihr Training Die Rewon 14" Handgelenkbandagen in auffälligem Lila sind die perfekte Wahl für Athleten, die keine Kompromisse bei Sicherheit und Style eingehen. Entwickelt von Profis und getestet von Weltklasse-Powerliftern, bieten diese Bandagen die nötige Steifigkeit für schwerste Lifts bei gleichzeitig hohem Tragekomfort. Ihre Vorteile mit den Rewon Wrist Wraps: Maximale Stabilität: Die 14-Zoll-Länge ermöglicht eine feste Wicklung, die das Handgelenk stabilisiert und schmerzhaftes Abknicken bei Druckübungen wie Bankdrücken oder Schulterdrücken verhindert. Wettkampfkonform: Die Länge ist ideal für das Training im Gym und zudem bei den meisten Powerlifting-Wettkämpfen zugelassen. Premium-Materialien: Ein hochwertiger Baumwoll-Mix sorgt für Hautfreundlichkeit und Langlebigkeit, während der extra starke Klettverschluss auch bei maximaler Spannung sicher hält. Einfaches Handling: Die integrierte Daumenschlaufe ermöglicht ein schnelles und präzises Anlegen der Bandagen. Vielseitig einsetzbar: Perfekt geeignet für Powerlifting, Bodybuilding, Cross-Training, Olympisches Gewichtheben sowie für klassische Übungen wie Squats und Ben', 2800, null,
  2000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewongear-weightlifting-wrist-wraps-14-inch-athlete-tested-power-lifting-bodybuilding-cross-training.jpg?v=1744496480','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewongear-weightlifting-wrist-wraps-14inch-powerlifting-crossfit.jpg?v=1744496480','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewongear_weightlifting_wrist_wraps_14_inch_powerlifting_fitness_support.jpg?v=1744496480','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewongear_weightlifting_wrist_wraps_14_inch_thumb_loop_heavy_duty_velcro_support_fitness.jpg?v=1744496480']::text[], true, '{"color":"Purple","material":"Lifting Straps"}'::jsonb, false, 121
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000122', 'dddddddd-dddd-dddd-dddd-dddddddddd08', 'Rewon 14" Handgelenkbandagen | Kraftsport-Support', 'weightlifting-wrist-wraps-14-zoll-handgelenkbandagen-rewon', 'MHK-122',
  'Rewon Weightlifting Wrist Wraps 14" Profi-Support für schwere Lifts Die Rewon 14" Handgelenkbandagen wurden von Athleten für Athleten entwickelt und von Weltklasse-Powerliftern sowie Fitness-Experten intensiv getestet. Sie bieten die perfekte Mischung aus Flexibilität und extremer Stabilität, um Ihre Handgelenke bei maximalen Belastungen zu schützen. Warum die Rewon Wrist Wraps ein Must-have sind: Gezielte Gelenkunterstützung: Ideal für Übungen wie Bankdrücken, Schulterdrücken, Clean & Jerk oder Snatch. Sie verhindern das Abknicken des Handgelenks und reduzieren das Verletzungsrisiko. Optimale Länge (14 Zoll / ca. 35 cm): Bietet ausreichend Support für Powerlifting und Bodybuilding, ohne die Bewegungsfreiheit bei funktionellem Training (Cross-Training) zu stark einzuschränken. Hoher Tragekomfort: Hergestellt aus einem hochwertigen Baumwoll-Elastik-Mix, der Schweiß absorbiert und auch bei engen Wicklungen nicht einschneidet. Sicherer Halt: Ein verstärkter Daumenloop erleichtert das Anlegen, während der extra starke Klettverschluss für einen bombenfesten Sitz sorgt – kein Verrutschen während des Satzes. Langlebige Qualität: Industrielle Nähte und robuste Materialien garantieren eine ', 2800, null,
  2000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_gear_weightlifting_wrist_wraps_14inch_powerlifting_bodybuilding.jpg?v=1744496499','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewongear_weightlifting_wrist_wraps_14_inch_powerlifting_bodybuilding_cross_training.jpg?v=1744496499','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewongear_weightlifting_wrist_wraps_14_inch_powerlifting_bodybuilding_crossfit.jpg?v=1744496499','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_gear_weightlifting_wrist_wraps_14_inch_heavy_duty_velcro_thumb_loop_support_powerlifting_fitness.jpg?v=1744496499']::text[], true, '{"color":"Black","material":"Lifting Straps"}'::jsonb, false, 122
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000123', 'dddddddd-dddd-dddd-dddd-dddddddddd08', 'Weightlifting Hand Grips Workout Pads', 'weightlifting-hand-grips-workout-pads', 'MHK-123',
  'Our weightlifting training grip pads are extremely durable and comfortable! Just what you need to build really strong and big muscles on your body while protecting your hands from getting rude and sore.Are you bored of your ordinary gloves? You can now replace them with something new, but still effective and even better - hand pads for weightlifting. No more smelly hands that require a weekly trip to the washing machine. Your hands can now breathe freely and stay protected during your workout. Because of our many years of experience in this field, we know exactly what you need! Our amazing design team and dedicated staff work tirelessly to meet all your needs.', 3400, null,
  2400, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_weightlifting_hand_grips_workout_pads_durable_comfortable_training.jpg?v=1744496524','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/weightlifting-hand-grips-training-pads-rewon-durable-comfortable-gym-accessories-muscle-building.jpg?v=1744496524','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_weightlifting_hand_grips_workout_pads_durable_protection.jpg?v=1744496524','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/woman-weightlifting-hand-grips-training-gym-fitness-workout.jpg?v=1744496524']::text[], true, '{"color":"Black","material":"Lifting Straps"}'::jsonb, false, 123
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000124', 'dddddddd-dddd-dddd-dddd-dddddddddd08', 'Figure 8 Gewichthebergürtel | Kreuzheben | Gewichtheben | Powerlifting - Schwarz', 'figure-8-lifting-straps', 'MHK-124',
  'Über dieses Produkt: Über diesen Artikel Suchen Sie nicht weiter, wenn Sie nach den besten Kreuzhebegurten auf dem Markt suchen. Professionelle Gewichtheber, die über 1.200 Pfund heben, verwenden Figure 8-Gewichthebegurte. Aufgrund des 1/4 Zoll dicken Baumwollgewebes und des Figure-8-Designs sind sie die bequemsten und haltbarsten Handgelenkgurte auf dem Markt. Wir sind überzeugt, dass Sie sie lieben werden. Wenn Sie nicht vollständig zufrieden sind, kontaktieren Sie uns bitte und wir erstatten Ihnen den gesamten Kaufpreis! Maße: Bitte messen Sie Ihren Handgelenkumfang, um sicherzustellen, dass Sie die richtige Größe bestellen. (Eine Größentabelle finden Sie in der Bildergalerie.) Dieser Gewichthebergurt passt sowohl Männern als auch Frauen bequem und eng. Ernsthafte Kreuzheber, starke Wettkämpfer und Powerlifter wählen Figure 8-Gewichthebegurte. Material: Figure 8-Gewichthebegurte bestehen aus strapazierfähiger Baumwolle mit einer speziellen Webart für optimale Haltbarkeit. Was auch immer Ihr Trainingsziel ist und Sie die Hantel fester greifen müssen, unsere dicken Baumwoll-Verstärkungsgurte sind die haltbarsten auf dem heutigen Markt. Diese Kreuzhebegurte verbessern Ihre Hebetech', 3900, null,
  2800, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/figure8-gewichthebergurt-kreuzheben-powerlifting-schwarz-rewon-gear.jpg?v=1744496589','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/figure-8-gewichthebergurtel-kreuzheben-gewichtheben-powerlifting-schwarz-rewon.jpg?v=1744496589','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/figure-8-gewichthebergurtel-kreuzheben-powerlifting-schwarz-rewon.jpg?v=1744496589']::text[], false, '{"color":"Black","material":"Lifting Straps"}'::jsonb, false, 124
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000125', 'dddddddd-dddd-dddd-dddd-dddddddddd08', 'Wrist Straps with Wrist Support', 'wrist-straps-with-wrist-support', 'MHK-125',
  'Industrial-grade padding and heavy-duty double-sided stitching are used in the construction of weightlifting wrist straps to help you maintain your grip. Our dead lift straps are ideal weightlifting straps for both men and women to work out in the gym without worrying about losing support thanks to the superior cotton blend neoprene padding. Our lifting straps are the best lifting straps on the market because they provide a stronger grip than other wrist straps. Weightlifting wrist straps improve security by providing a better grip. Our wrist wraps for weightlifting are made of high quality materials such as cotton and neoprene that prevent slipping. This means, that the bar is held securely in place during gymnastics exercises by our dead lift straps. Our training wristbands give you the protection you need to avoid injury and allow you to lift weights safely.', 3900, null,
  2800, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/wrist-straps-with-support-rewon-weightlifting-double-stitching-neoprene-padding.jpg?v=1744496602','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_wrist_straps_support_weightlifting_strong_grip_durable_padding_adjustable_fitness_gym_black.jpg?v=1744496602','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_weightlifting_wrist_straps_with_support_industrial_padding_for_gym_crossfit_training_deadlifts.jpg?v=1744496602']::text[], true, '{"color":"Black","material":"Lifting Straps"}'::jsonb, false, 125
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000126', 'dddddddd-dddd-dddd-dddd-dddddddddd08', 'Weight Lifting Wrist Hook Straps', 'weight-lifting-wrist-hook-straps', 'MHK-126',
  'Rewon Gear weight lifting hooks are made from high quality materials that have undergone rigorous testing. The best fitness wrist hooks for dead lifts are our weight lifting bands for men and women. Rowing, lat pulls and pull-ups. These weightlifting hand straps have padded straps and a metal hook so you can lift weight longer. As our bar grip hooks can keep their shape while lifting large barbells or performing pull-ups on a pull-up bar, they are ideal for power weightlifting. If you are looking for robust straps to help you lift more weight and perform more repetitions, these power weight lifting hooks are the ideal option! Your wrist is wrapped in neoprene material that follows its curves.', 4200, null,
  3000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_gear_weight_lifting_wrist_hook_straps_fitness_wrist_hooks_for_deadlifts_and_pullups.jpg?v=1744496630','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_weight_lifting_wrist_hook_straps_high_quality_fitness_for_deadlifts_men_women.jpg?v=1744496630','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_weight_lifting_wrist_hooks_straps_padded_metal_deadlift_fitness_training_hand_grips.jpg?v=1744496630','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_weight_lifting_wrist_hook_straps_fitness_metal_hooks_comfortable_support_gym_accessory.jpg?v=1744496630']::text[], true, '{"color":"Black","material":"Lifting Straps"}'::jsonb, false, 126
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000127', 'dddddddd-dddd-dddd-dddd-dddddddddd08', 'Rewon Zughilfen | Kreuzhebegurte für maximalen Grip', 'zughilfen-powerlifting-kreuzhebegurte-schwarz-rewon', 'MHK-127',
  'Rewon Powerlifting Zughilfen Lassen Sie nicht zu, dass Ihre Griffkraft über Ihren Erfolg entscheidet. Die Rewon Powerlifting Zughilfen wurden speziell entwickelt, um die Last von Ihren Fingern auf Ihre Handgelenke zu übertragen, damit Sie sich voll und ganz auf die Zielmuskulatur konzentrieren können – ideal für Kreuzheben, schweres Rudern und Klimmzüge. Warum die Rewon Lifting Straps Ihr Training verändern: Extremer Grip: Das hochwertige Baumwollmaterial sorgt für einen bombenfesten Halt an der Hantelstange, selbst bei verschwitzten Händen. Keine Kreide mehr nötig! Zero Break-In Zeit: Dank 100% weicher Baumwolle passen sich die Gurte sofort Ihrem Handgelenk an – keine Blasen oder Druckstellen ab dem ersten Training. Maximaler Komfort: Die integrierte Soft-Tech Neopren-Polsterung schützt Ihre Handgelenke vor einschneidenden Riemen und verhindert Schmerzen bei maximalen Gewichten. Überlegene Länge (ca. 58 cm / 23 Zoll): Die extralangen Straps ermöglichen mehrfaches Umwickeln der Stange für ultimative Sicherheit und Kontrolle. Langlebigkeit: Verstärkte Nähte und robustes Web-Gewebe garantieren, dass diese Zughilfen selbst härtesten Powerlifting-Einheiten standhalten. Produktdetails: ', 4800, null,
  3400, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/zughilfen-powerlifting-handgelenkbandagen-gewichtheben-kreuzhebegurte-schwarz-rewon-rutschfester-griff.jpg?v=1744496651','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_powerlifting_wrist_straps_black_fitness_adjustable_neoprene_support.jpg?v=1744496651','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_premium_wrist_straps_black_powerlifting_weightlifting_grip_support_cotton_webbing.jpg?v=1744496651','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_gewichtheber_armbaender_schwarz_kreuzhebegurte_anleitung.jpg?v=1744496651']::text[], true, '{"color":"Black","material":"Lifting Straps"}'::jsonb, false, 127
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000128', 'dddddddd-dddd-dddd-dddd-dddddddddd08', 'Bizeps-Isolator | Arm Blaster | Bizeps-Trainer | Arm-Trainer - Schwarz', 'arm-blaster', 'MHK-128',
  'Produktbeschreibung: Steigern Sie Ihre Bizepskraft mit dem Rewon Bizeps-Isolator , einem professionellen Arm Blaster, der speziell dafür entwickelt wurde, Ihre Bizepsmuskeln gezielt zu isolieren und zu stärken. Dieses innovative Trainingsgerät für Langhantel- und Kurzhantelcurls sorgt dafür, dass Ihre Ellbogen während des Trainings an Ort und Stelle bleiben, wodurch der Schwingeffekt verhindert und die Effektivität jeder Wiederholung maximiert wird. Optimaler Fokus auf den Bizeps: Der Arm Blaster wurde entwickelt, um Ihnen zu helfen, den Muskelaufbau in den Armen zu maximieren. Es hält Ihre Ellbogen stabil und sorgt dafür, dass Sie sich voll und ganz auf den Bizeps konzentrieren können – für präzisere und intensivere Workouts. Perfekt für Bodybuilder und Kraftsportler: Ob Sie ein Bodybuilder, Gewichtheber oder Sportler sind, der seine Arm- und Schulterkraft steigern möchte – der Rewon Bizeps-Isolator ist der ideale Trainingspartner. Er unterstützt nicht nur den Aufbau von kräftigen Bizeps, sondern fördert auch den Kraftzuwachs in anderen wichtigen Bewegungen, die Ihre Fitnessreise vorantreiben. Hochwertiges Material und Komfort: Dieser Bizepscurl-Isolator besteht aus strapazierfähi', 12000, null,
  8700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/3_5535c5ee-3b73-47cc-b022-c4ff1f294502.jpg?v=1713271506','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/bizeps-isolator-arm-blaster-schwarz-rewon-bizeps-trainer-ellbogen-stabilisierung.jpg?v=1744496665','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/bizeps-isolator-arm-blaster-bizeps-trainer-schwarz-rewon-premium-quality.jpg?v=1744496665','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/arm-blaster-bizeps-isolator-trainer-schwarz-rewon-added-padding-extra-long-strap-fitness-accessory.jpg?v=1744496665']::text[], true, '{"color":"Black","material":"Arm Blaster"}'::jsonb, false, 128
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000129', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Double Neoprene Weightlifting Belt', 'double-neoprene-weightlifting-belt', 'MHK-129',
  'Rewon weight lifting belts are made of high quality neoprene and feature a Velcro closure. Buckle for stainless steel sliding bar. Suitable for weightlifting and general fitness purposes. It is lightweight, strong and comfortable at the same time. Dual back brace is 5" wide for optimal comfort and pain relief. Maximum comfort by reinforcing the underside of the back and abdomen.', 7800, null,
  5600, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/double_neoprene_weightlifting_belt_rewon_high_quality_velcro_closure_stainless_steel_buckle_fitness_comfortable_back_brace.jpg?v=1744496687','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/double-neoprene-weightlifting-belt-rewon-high-quality-comfortable-fitness-back-support.jpg?v=1744496687','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/double-neoprene-weightlifting-belt-rewon-high-quality-velcro-stainless-steel-buckle-5-inch-back-support.jpg?v=1744496687','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/double-neoprene-weightlifting-belt-rewon-high-quality-velcro-closure-5-inch-wide-comfortable-fitness.jpg?v=1744496687']::text[], true, '{"size":"Black","color":"S","material":"Weight Lifting Belts"}'::jsonb, false, 129
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000130', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Dip Belt with Chain', 'dip-belt-with-chain', 'MHK-130',
  'The dive belt is fully adjustable with a heavy duty steel chain to fit any waist. It stays where it''s supposed to be while dipping or chinning as it has a contoured construction. A must-have fitness kit for anyone looking to supercharge their dips, pull-ups, and lunges by adding resistance beyond body weight. You can easily attach both weight plates with the clip. Made from high quality neoprene material. Comes with steel chain and clip. Fully adjustable and one size fits all. Just add weight for dips and pull-ups', 7600, null,
  5400, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/dip-belt-rewon-heavy-duty-adjustable-neoprene-with-chain-for-dips-pull-ups.jpg?v=1744496759','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/dip-belt-chain-rewon-adjustable-neoprene-fitness-weightlifting.jpg?v=1744496759','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/dip-belt-with-chain-rewon-heavy-duty-steel-fitness-kit-adjustable-neoprene-padding.jpg?v=1744496759']::text[], true, '{"color":"Black","material":"Dip Belt"}'::jsonb, false, 130
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000131', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'Arm Handgelenkbandagen | Handgelenkstütze - Weiß', 'hand-wraps-1', 'MHK-131',
  'Diese Rewon-Handbandagen bestehen aus hochwertigem Stoff mit genau dem richtigen Maß an Elastizität. Diese Bandagen sind bequem, langlebig und passen sich Ihren Händen an, um beim Training eine zusätzliche Schicht Unterstützung und Schutz zu bieten. Hervorragend geeignet für Boxen, Kickboxen, Muay Thai und andere Kampfsportarten. Zwei Bandagen sind im Paket enthalten. Eigenschaften: Länge und Dehnbarkeit im mexikanischen Stil Daumenschlaufe als Ausgangspunkt „Diese Seite nach oben“-Aufdruck auf einem extrabreiten Klettverschluss Trockner- und maschinenwaschbar Halbelastisches Material, das langlebig ist', 5300, 2800,
  2000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/arm-handgelenkbandagen-handgelenkschutz-weiss-rewon-boxen-kampfsport-training.webp?v=1744496876','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/WhatsApp_Image_2024-10-23_at_16.39.56_5b827e0a.webp?v=1729686907','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_handgelenkbandagen_handstuetze_weiss_boxen_kampfsport.jpg?v=1744496876','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_weisse_handgelenkbandagen_handgelenkstuetze_boxen_kampfsport.jpg?v=1744496876']::text[], true, '{"color":"2.5M","material":"Boxing & MMA Hand Wraps"}'::jsonb, false, 131
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000132', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'Arm Handgelenksbandagen | Handgelenstütze - Rot', 'hand-wraps', 'MHK-132',
  'Diese Rewon-Handbandagen bestehen aus hochwertigem Stoff mit genau dem richtigen Maß an Elastizität. Diese Bandagen sind bequem, langlebig und passen sich Ihren Händen an, um beim Training eine zusätzliche Schicht Unterstützung und Schutz zu bieten. Hervorragend geeignet für Boxen, Kickboxen, Muay Thai und andere Kampfsportarten. Zwei Bandagen sind im Paket enthalten. Eigenschaften: Länge und Dehnbarkeit im mexikanischen Stil Daumenschlaufe als Ausgangspunkt „Diese Seite nach oben“-Aufdruck auf einem extrabreiten Klettverschluss Trockner- und maschinenwaschbar Halbelastisches Material, das langlebig ist', 5300, 2800,
  2000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_handgelenksbandagen_rot_handstuetze_boxen_kampfsport.webp?v=1744496903','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_handgelenksbandagen_rot_handgelenkstuetze_training_boxen_kampfsport.webp?v=1744496902','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_red_handgelenksbandagen_handgelenkstuetze_boxing_muay_thai_kickboxing.webp?v=1744496902','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-rot-handgelenksbandagen-handgelenkstuetze-boxen-kampfsport-training.webp?v=1744496902']::text[], true, '{"color":"2.5M","material":"Boxing & MMA Hand Wraps"}'::jsonb, false, 132
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000133', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'Schienbeinschoner Kampfsport/Kickboxen - Schwarz', 'shin-guards', 'MHK-133',
  'KOMFORTABLE UND ANPASSBARE PASSFORM – Diese Muay-Thai-Schienbeinschoner sind vorgeformt, um sich der natürlichen Krümmung Ihres Schienbeins anzupassen. Ihre MMA-Schienbeinschoner können dank eines sicheren Verschlusssystems mit dehnbarem Riemen angepasst werden. Wenn Sie also unseren Kickbox-Schienbeinschutz für Männer tragen, können Sie kompakte Schienbeinschoner, Kickpads und Trainingsausrüstung kombinieren, die Ihre Beweglichkeit und Agilität verbessern und Ihnen ermöglichen, an Geschwindigkeit zu gewinnen. Unsere MMA-Beinschoner sind nicht reizend und verstellbare Riemen halten diese MMA-Schienbeinschoner für Männer an Ort und Stelle.', 11200, 6400,
  4600, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/schienbeinschoner-kampfsport-kickboxen-schwarz-rewon-muay-thai-komfortable-passform.jpg?v=1744496923','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/schienbeinschoner-kickboxen-mma-muay-thai-rewon-schwarz-komfort-passform.jpg?v=1744496923']::text[], true, '{"color":"S","material":"MMA Shin Guards"}'::jsonb, false, 133
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000134', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'Schienbeinschoner Spann Kampfsport/Kickboxen - Weiß', 'shin-guards-instep-3', 'MHK-134',
  'KOMFORTABLE UND ANPASSBARE PASSFORM – Diese Muay-Thai-Schienbeinschoner sind vorgeformt, um sich der natürlichen Krümmung Ihres Schienbeins anzupassen. Ihre MMA-Schienbeinschoner können dank eines sicheren Verschlusssystems mit dehnbarem Riemen angepasst werden. Wenn Sie also unseren Kickbox-Schienbeinschutz für Männer tragen, können Sie kompakte Schienbeinschoner, Kickpads und Trainingsausrüstung kombinieren, die Ihre Beweglichkeit und Agilität verbessern und Ihnen ermöglichen, an Geschwindigkeit zu gewinnen. Unsere MMA-Beinschoner sind nicht reizend und verstellbare Riemen halten diese MMA-Schienbeinschoner für Männer an Ort und Stelle.', 11200, 7000,
  5000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/schienbeinschoner-kampfsport-kickboxen-rewon-mehrfarbig-anpassbare-passform.jpg?v=1744464055','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/mehrfarbig_kampfsport_schienbeinschoner_rewon_kickboxen_muay_thai_mma_fitness_boxausruestung.jpg?v=1744464055','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_mehrfarbig_schienbeinschoner_kickboxen_muay_thai_mma_boxbekleidung_herren.jpg?v=1744464055']::text[], true, '{"color":"XS","material":"MMA Shin Guards"}'::jsonb, false, 134
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000135', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'Schienbeinschoner Spann Kampfsport/Kickboxen - Blau', 'shin-guards-instep-2', 'MHK-135',
  'KOMFORTABLE UND ANPASSBARE PASSFORM – Diese Muay-Thai-Schienbeinschoner sind vorgeformt, um sich der natürlichen Krümmung Ihres Schienbeins anzupassen. Ihre MMA-Schienbeinschoner können dank eines sicheren Verschlusssystems mit dehnbarem Riemen angepasst werden. Wenn Sie also unseren Kickbox-Schienbeinschutz für Männer tragen, können Sie kompakte Schienbeinschoner, Kickpads und Trainingsausrüstung kombinieren, die Ihre Beweglichkeit und Agilität verbessern und Ihnen ermöglichen, an Geschwindigkeit zu gewinnen. Unsere MMA-Beinschoner sind nicht reizend und verstellbare Riemen halten diese MMA-Schienbeinschoner für Männer an Ort und Stelle.', 11200, 7000,
  5000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-schienbeinschoner-kickboxen-muay-thai-blau-komfortable-passform.jpg?v=1744464055','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/schienbeinschoner-spann-kampfsport-kickboxen-mehrfarbig-rewon-boxtraining-boxen-fitnessprodukte-de.jpg?v=1744464055','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-muay-thai-schienbeinschoner-anpassbare-kickbox-ausruestung-mehrfarbig-komfortable-passform.jpg?v=1744464055']::text[], true, '{"color":"XS","material":"MMA Shin Guards"}'::jsonb, false, 135
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000136', 'dddddddd-dddd-dddd-dddd-dddddddddd02', 'Rewon Schienbeinschoner: Kickboxen & Muay Thai Schutz – Rot', 'shin-guards-instep-1', 'MHK-136',
  'Rewon Schienbeinschoner – Komfort & Schutz für Kickboxen & Muay Thai (Rot) Die Rewon Schienbeinschoner in auffälligem Rot wurden für maximale Sicherheit, Tragekomfort und Langlebigkeit entwickelt. Ideal für Kickboxen, Muay Thai und MMA – sie schützen Schienbein und Spann effektiv bei jeder Trainingsintensität. Ihr schlankes Design sorgt für Flexibilität und Agilität, ohne an Stabilität zu verlieren. Vorteile auf einen Blick: Stoßdämpfung: Die dichte Polsterung absorbiert Schläge gezielt und schützt Ihre Schienbeine. Anatomische Passform: Ergonomisch geformt, um sich der natürlichen Krümmung Ihres Schienbeins anzupassen – sitzt fest ohne zu verrutschen. Fokus auf Leistung: Das geringe Gewicht unterstützt Ihre Geschwindigkeit und Technik im Training. Hochwertiges Material: Gefertigt aus strapazierfähigem Material mit dehnbaren Riemen für eine lange Lebensdauer. Fester Halt: Ein sicheres Verschlusssystem sorgt für einen zuverlässigen Sitz bei jedem Kick. Pflegehinweise: Handwäsche empfohlen. Lufttrocknen, nicht in direkter Sonne. Kein Bügeln oder chemische Reinigung.', 11200, 7000,
  5000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_schienbeinschoner_mehrfarbig_kickboxen_muay-thai_mma_komfort.jpg?v=1744464055','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-kampfsport-schienbeinschoner-mehrfarbig-kickboxen-muay-thai-komfort-anpassbare-passform.jpg?v=1744464055','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/schienbeinschoner-kampfsport-kickboxen-mehrfarbig-rewon-komfortable-anpassbare-muay-thai-boxequipment.jpg?v=1744464055']::text[], true, '{"color":"XS","material":"MMA Shin Guards"}'::jsonb, false, 136
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000137', 'dddddddd-dddd-dddd-dddd-dddddddddd02', 'Rewon Schienbeinschoner: Kickboxen & Muay Thai Schutz', 'schienbeinschoner-kickboxen-muay-thai', 'MHK-137',
  'Rewon Schienbeinschoner – Komfort & Schutz für Kickboxen & Muay Thai Die Rewon Schienbeinschoner wurden für maximale Sicherheit, Tragekomfort und Langlebigkeit entwickelt. Ideal für Kickboxen, Muay Thai und MMA – sie schützen Schienbein und Spann effektiv bei jeder Trainingsintensität. Ihr schlankes Design sorgt für Flexibilität, ohne an Stabilität zu verlieren. Vorteile auf einen Blick: Stoßdämpfung: Dichte EVA-Polsterung absorbiert Schläge gezielt. Anatomische Passform: Ergonomisch geformt – sitzt fest ohne zu verrutschen. Fokus auf Leistung: Unterstützt Geschwindigkeit & Technik mit geringem Gewicht. Hochwertiges Material: Atmungsaktives Stretch-Material mit doppelter Naht für Langlebigkeit. Fester Halt: Klettverschlüsse sorgen für zuverlässigen Sitz.', 11200, 7000,
  5000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_schienbeinschoner_muay_thai_kickboxen_mehrfarbig_boxausruestung_komfort.jpg?v=1744464055','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-schienbeinschoner-spann-kampfsport-mehrfarbig-muay-thai-kickboxen-komfortable-passform.jpg?v=1744464055','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-schienbeinschoner-muay-thai-kickboxen-mehrfarbig-boxtraining-komfort-fit-verschlusssystem-dehnbare-riemen.jpg?v=1744464055']::text[], true, '{"color":"XS","material":"MMA Shin Guards"}'::jsonb, false, 137
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000138', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Rewon Echtes Leder 4 Zoll Fitness Gürtel Gewichtheben/Trainingsgürtel - Schwarz', 'weightlifting-belt-4inch', 'MHK-138',
  'Der erste Gedanke eines Gewichthebers ist, in Form zu bleiben. Unsere Schlinge ermöglicht Ihnen genau das. Beim Heben üben Sie Druck auf Ihre Bauchmuskeln und Ihren Rücken aus. Aber mit hochwertigem Leder bietet Ihnen unser Bodybuilding-Gürtel den Rumpf- und Lendenschutz, den Sie brauchen. Eigenschaften: – Farbe: Schwarz – Material: Leder LEICHT UND TRAGBAR: Schwer genug zum Stützen, aber leicht genug für unterwegs. Dieser Gewichthebergürtel aus Leder lässt sich einfach zusammenrollen und passt in eine Sporttasche – SICHERE PASSFORM: Die doppelten Dornschnallen sorgen für eine bequeme Passform, die nicht an der Taille hoch- oder herunterrutscht. – LANGLEBIG: Jeder Gürtel ist mit einer hochwertigen Konstruktion ausgestattet, um eine hervorragende Leistung zu gewährleisten. – BESSERE LENDENWIRBELSTÜTZE: Sie können Ihre Fitness- und Trainingsziele erreichen und gleichzeitig Ihren Rücken und Rumpf während des Trainings und der Übungen schützen. – ANWENDBARE PERSONEN: Ideal für Anfänger oder erfahrene Gewichtheber. Und gleichzeitig Ihren Rücken und Rumpf während des Trainings und der Übungen schützen. – ANWENDBARE PERSONEN: Ideal für Anfänger oder erfahrene Gewichtheber. Und gleichzeiti', 10600, null,
  7700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-leder-fitness-guertel-gewichtheben-training-schwarz.jpg?v=1743710524','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-echtes-leder-fitness-guertel-schwarz-gewichtheben-trainingsguertel_1.jpg?v=1743710524','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-echtes-leder-fitness-guertel-schwarz-gewichtheben-trainingsguertel.jpg?v=1743710524','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_echtes_leder_fitness_gurtel_gewichtheben_training_schwarz.jpg?v=1743710524']::text[], true, '{"size":"Black","color":"S","material":"Weight Lifting Belts"}'::jsonb, false, 138
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000139', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Neopren Dip-Gürtel mit Kette | Rewon Gear', 'neopren-dip-guertel-stahlkette-fitness-rewon', 'MHK-139',
  'Rewon Neopren Dip-Gürtel – Maximale Intensität für Ihr Krafttraining Bringen Sie Ihr Training auf das nächste Level mit dem verstellbaren Rewon Neopren Dip-Gürtel . Dieser hochwertige Gürtel ist das ideale Zubehör für alle, die bei Übungen wie Dips, Klimmzügen oder Kniebeugen mit zusätzlichen Gewichten arbeiten möchten, um Kraft und Muskelmasse effektiv zu steigern. Die Highlights im Überblick: Robuste Stahlkette: Die langlebige und schwere Stahlkette ermöglicht eine sichere Befestigung von Gewichtsscheiben oder Kettlebells. Hochwertiges Neopren: Gefertigt aus strapazierfähigem Neopren-Material, bietet der Gürtel maximalen Komfort und eine lange Lebensdauer, selbst bei hoher Belastung. Ergonomisches Design: Die konturierte Konstruktion sorgt dafür, dass der Gürtel während des Trainings fest an Ort und Stelle bleibt und nicht verrutscht. Verstellbare Passform: Dank des flexiblen Designs passt sich der Gürtel jeder Taillengröße an und bietet einen stets sicheren Sitz. Vielseitig einsetzbar: Perfekt geeignet für klassisches Krafttraining, Calisthenics, Crossfit und Bodyweight-Übungen mit Zusatzgewicht. Produktdetails: Material: Strapazierfähiges Neopren & Stahlkette. Einsatzbereich: D', 7600, null,
  5400, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/dip-belt-with-chain-neoprene-adjustable-weightlifting-fitness-pullups-dips-lunges-heavy-duty-steel-chain.jpg?v=1743710588','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/dip-belt-with-chain-adjustable-fitness-weightlifting-neoprene.jpg?v=1743710588','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/dip-belt-with-chain-heavy-duty-neoprene-fitness-accessory.jpg?v=1743710588']::text[], true, '{"color":"Red","material":"Dip Belt"}'::jsonb, false, 139
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000140', 'dddddddd-dddd-dddd-dddd-dddddddddd06', 'Shemagh scarf', 'shemagh-scarf-5', 'MHK-140',
  'Staying Cool: If water is not an issue, a shemagh can help you stay cool on a hot day. Soak it in water and wrap it around your head and neck. It will last until the water evaporates. Signalling Device: The more colorful ones can be used for signalling other people in case you got lost on a hike in order to attract attention of a helicopter. Closure: Pull On Shemaghs Sand and Dust and Smoke Protection: If there’s smoke in the air, a damp shemagh can reduce smoke inhalation and allow you to breathe better. The shemagh scarf is a traditional headwear in the Middle East. It is also known as a keffiyeh, ghutrah or by other names. It is worn on the head or around the shoulders. Sun Protection: as a turban or loosely over the shoulders and the back. as a neck-scarf it will protect your chest and shoulders from the sun, or as a cover for your face for additional protection. as a sun shade when tied to poles or branches.', 5600, null,
  4000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/shemagh_scarf_cooling_signalling_desert_pattern_neck_wrap_accessory.jpg?v=1744468325','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/cooling_shemagh_scarf_tan_black_pattern_signal_device.jpg?v=1744468325','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/shemagh_scarf_cooling_head_wrap_signal_device_tactical_gear_sand_dust_protection.jpg?v=1744468325']::text[], true, '{"color":"Coyote/Black/Rifles","material":"Scarves"}'::jsonb, false, 140
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000141', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Rewon Sporttasche | Jiu Jitsu | Karate | Umhängetasche Gym - Schwarz/Weiß', 'jiu-jitsu-backpack-for-gym-karate-backpack-for-gym-school-traveling-any-sports', 'MHK-141',
  'Rewon Premium Sporttasche Schwarz/Weiß Die Rewon Sporttasche vereint stilvolles Design mit robuster Funktionalität. Hergestellt aus hochwertigem PU-Leder in elegantem Schwarz/Weiß, bietet sie viel Platz für Sport, Kampfsport und Reisen. Mit den Maßen 60×30×30 cm passt alles, was Sie für Gym, Dojo oder Wochenendtrips benötigen. Hauptmerkmale Premium PU-Leder: Robust, langlebig und leicht zu pflegen Sicherer Klettverschluss: Einfache Handhabung und zuverlässiger Halt Geräumige Maße: 60×30×30 cm für Kleidung, Trainingsausrüstung und Zubehör U-förmiger Reißverschluss: Schnelles Packen und leichter Zugriff Belüftete Fächer: Frontfach mit Mesh-Einsatz für nasse Kleidung oder Schuhe Stylisches Design: Modernes Schwarz/Weiß mit Jiu-Jitsu-Akzenten Vielseitig einsetzbar: Ideal für Fitness, Jiu-Jitsu, Karate, Kickboxen, Muay Thai und mehr Warum diese Tasche? Entwickelt für aktive Athleten, Kampfsportler:innen und Vielreisende Langlebiges Material für den täglichen Einsatz Perfekte Größe für Gym, Dojo, Sporthallen oder Wochenendtrips Kombiniert Funktionalität, Komfort und modernes Design FAQs Ist die Tasche wasserdicht? Sie ist wasserabweisend – ideal für Alltag, Gym oder Reisen, aber nicht vo', 25500, 16200,
  11700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-schwarz-weiss-sporttasche-jujitsu-karate-gym-fitness-boxtraining-premium-leather.jpg?v=1744461238','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_sporttasche_jiu_jitsu_karate_umbro_schwarz_weiss_premium_pu_leder_gym_sport_reisetasche.jpg?v=1744465458','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_sporttasche_schwarz_weiss_jiu_jitsu_karate_fitness_umhaengetasche_premium_pu_leder.jpg?v=1744465458']::text[], true, '{"color":"Black","material":"Travel Backpack"}'::jsonb, false, 141
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000142', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Rewon Brazilian Jiu Jitsu | BJJ | Kimono-Gürtel – Mehrfarbig', 'jiu-jitsu-bjj-premium-belt-ranked-stripe-sleeve-bar-belt-durable', 'MHK-142',
  'Rewon BJJ Gürtel – 100 % Baumwolle, 8-fach genäht, Farben Weiß bis Schwarz 🥋🍃 Produktbeschreibung Der Rewon BJJ Gürtel vereint Stärke und Stil für Brazilian Jiu-Jitsu. Hergestellt aus 100 % hochwertiger Baumwolle und mit achtfacher Naht gefertigt, bietet er robuste Leistung bei intensivem Training und Wettkampf. Produkteigenschaften 🧵 100 % Baumwolle – langlebig & angenehm zu tragen 🪡 8-fache Naht – verstärkte Struktur gegen Reißen 🏆 Farbvarianten: Weiß, Blau, Lila, Braun, Schwarz 💪 Steifheit & Gewohnheit – hart beim Anfang, wird mit der Zeit geschmeidig 🎖️ Optimale Performance – ideal für Kontrolle, Würfe, Backtakes & Kimura 📏 5 Größen – passend für jedes Level und Körpergröße Warum dieser Gürtel? ✅ Professionelle Qualität zu fairem Preis ✅ Verstärkte Verarbeitung für maximale Haltbarkeit ✅ Motivierende Farbwahl passend zu Ihrem Jiu-Jitsu-Rang ✅ Schlichtes Design mit Rewon Branding für Ihr Training Pflegehinweise Waschanleitung: In kaltem Wasser waschen, lufttrocknen lassen. So bleibt die Form und Festigkeit erhalten. Häufig gestellte Fragen Passt der Gürtel in Wettkämpfen? Ja, der Gürtel entspricht IBJJF- und ADCC-Anforderungen für Wettkampf und Training. Entfaltet sich d', 7000, null,
  5000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-brazilian-jiu-jitsu-bjj-kimono-belt-multicolor-high-quality-support-throws-training.webp?v=1744561654','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-brazilian-jiu-jitsu-bjj-kimono-gurtel-mehrfarbig-multicolor-training-belt.webp?v=1744561654','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-bjj-kimono-gurtel-mehrfarbig-jiu-jitsu-brazilian-training-belt.webp?v=1744561654','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-brazilian-jiu-jitsu-multicolor-kimono-belt-BJJ-training.webp?v=1744561654']::text[], true, '{"size":"A0","color":"White","material":"JiuJitsu Belts"}'::jsonb, false, 142
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000143', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Rewon Farbgürtel für Karate, Taekwondo & Judo – 100 % Baumwolle, 220–310 cm, mehrfach vernäht, in 6 Farben', 'karate-colour-rank-belt', 'MHK-143',
  'Rewon Kampfsport-Gürtel – Farbgürtel für Karate, Taekwondo & Judo (220–310 cm) 🥋🎯 Produktbeschreibung Die Rewon Farbgürtel bieten ambitionierten Kampfsportler:innen aller Altersklassen Qualität, Stärke und Rangpräsenz. Diese Gürtel bestehen aus robuster Baumwolle mit stabiler Nahtverarbeitung – ideal für tägliches Training, Prüfung oder Wettkampf. Produktdetails 🎨 Farben: Gelb, Orange, Grün, Blau, Rot, Braun 📏 Größen: 220 cm, 240 cm, 260 cm, 280 cm, 300 cm, 310 cm – passend für Kinder & Erwachsene 🧵 Material: 100 % Baumwolle mit mehrfacher Naht für erhöhte Langlebigkeit 🥋 Einsatzbereiche: Karate, Taekwondo, Judo, traditionelle Kampfkünste ✅ Strapazierfähig: Entwickelt für intensives Training & Turnierbedingungen Warum Rewon Gürtel? 🏅 Erfüllt internationale Standards für Prüfung & Wettkampf 📚 Ideal für alle Graduierungslevel – vom Anfänger bis zum Fortgeschrittenen 🎽 Atmungsaktives Baumwollgewebe – angenehm zu tragen bei langen Trainingseinheiten 🔒 Farbbeständig – kein Ausbluten beim Waschen Pflegehinweise Waschempfehlung: Handwäsche oder Schonwaschgang bei niedriger Temperatur. Lufttrocknen – kein Trockner! Häufige Fragen (FAQs) Für welche Kampfsportarten sind die Gürtel ', 5600, null,
  4000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/karate_taekwondo_judo_belts_multicolor_rank_achievement_strong_durable_training_competition.webp?v=1744561492','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/green-martial-arts-belt-karate-taekwondo-judo-rank-durable-stitching.jpg?v=1744561492','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/karate-taekwondo-judo-green-belt-martial-arts-training-competition-strong-stitching.jpg?v=1744561492','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/red-karate-taekwondo-judo-rank-belt-durable-martial-arts-equipment-multiple-stitching.jpg?v=1744561492']::text[], true, '{"size":"1 / 220cm","color":"Yellow","material":"Karate Belt"}'::jsonb, false, 143
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000144', 'dddddddd-dddd-dddd-dddd-dddddddddd08', 'Knee Wraps', 'copy-of-knee-wraps', 'MHK-144',
  'IMPROVE LEG POSITION, STABILITY AND STRENGTH! REWON GEAR knee wraps will increase your leg strength during squats, leg presses and other strenuous leg exercises when worn in conjunction with an excellent training plan. Within the first session you will find that you have more strength. You''ve never experienced knee wraps better than these. Knee wraps provide better support and stability during strenuous leg exercises. Knee Sleeves improve exercise efficiency, protect your knee joint from potential damage from hard lifting, and provide extra compression. Rewon Gear Knee wraps are the most effective pair of knee sleeves: Rewon Gear Knee wraps are the ONLY popular pair of 72-inch knee wraps that feature our branded elastic with strap attachment contain. As a result, it is easy for you Wrapping your knees and keeping the wraps in place giving you a great leg exercise. Because Rewon Gear knee wraps provide tight knee compression when doing squats, power lifting, cross training, weightlifting, bodybuilding or any other leg activity. You''ll be able to lift more weight, set new personal records, and achieve greater peak performance. Break down obstacles and push yourself. Find out why our ', 7000, null,
  5000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/RED-1_83f9377a-015e-4e2e-80bd-911c2c982c79.jpg?v=1704706233','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/RED-3_0542a798-b42f-4f81-ac1d-275e7285defa.jpg?v=1713271607','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/RED2.jpg?v=1713271607']::text[], true, '{"color":"Red/Black","material":"Lifting Straps"}'::jsonb, false, 144
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000145', 'dddddddd-dddd-dddd-dddd-dddddddddd02', 'Leg Raise Ankle Straps Kabelzug Gym | Rewon Gear', 'leg-raise-ankle-strap-1', 'MHK-145',
  'Optimieren Sie Ihr Bein- und Gesäßtraining mit Rewon Gear Leg Raise Ankle Straps. Ideal für Kabelzugmaschinen und funktionelles Training im Gym. Benefits: Verstellbare & gepolsterte Knöchelriemen Starker Halt für Kabelzugübungen Komfortabel & langlebig Perfekt für Bein- und Glute-Training', 6400, null,
  4600, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/ENGLEDRED1.jpg?v=1704705437','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/ENGLEDRED.jpg?v=1704705438']::text[], true, '{"color":"Red","material":"Ankle Wraps"}'::jsonb, false, 145
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000146', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Rewon Echtes Leder 6 Zoll Fitness Gürtel Gewichtheben/Trainingsgürtel - Schwarz', 'weightlifting-belt-6-inch', 'MHK-146',
  'Rewon 6-Zoll Gewichthebergürtel aus Leder Maximaler Schutz für Ihr Training Erreichen Sie Ihre Fitnessziele mit maximaler Sicherheit. Unser Bodybuilding-Gürtel aus hochwertigem Leder bietet Ihnen genau den Rumpf- und Lendenschutz, den Sie bei schweren Lifts benötigen. Warum der Rewon Ledergürtel? Optimaler Schutz: Bietet gezielte Unterstützung für Bauchmuskeln und Rücken, um den Druck beim Heben sicher zu verteilen. Sichere Passform: Dank der robusten doppelten Dornschnallen sitzt der Gürtel fest und rutscht während der Übungen nicht an der Taille. Hochwertiges Material: Gefertigt aus langlebigem schwarzem Leder für eine hervorragende und dauerhafte Leistung. Mobil & Kompakt: Schwer genug für stabilen Support, aber flexibel genug, um ihn einfach zusammenzurollen und in der Sporttasche zu verstauen. Technische Details & Highlights: Bessere Lendenwirbelstütze: Schützt Rücken und Rumpf effektiv bei Kniebeugen, Kreuzheben und anderen Kraftübungen. Vielseitig einsetzbar: Ideal für Anfänger und erfahrene Profis im Gewichtheben oder Bodybuilding. Farbe: Klassisches Schwarz.', 12600, null,
  9100, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-leder-fitness-guertel-gewichtheben-schwarz.jpg?v=1743710542','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-echtes-leder-fitness-trainingsguertel-schwarz-gewichtheben-bodybuilding-ruckenschutz.jpg?v=1743710542','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_leder_fitness_guertel_schwarz_gewichtheben_trainingsguertel.jpg?v=1743710542','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/weightlifting_belt_near_me.jpg?v=1719295368']::text[], true, '{"size":"Black","color":"S","material":"Weight Lifting Belts"}'::jsonb, false, 146
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000147', 'dddddddd-dddd-dddd-dddd-dddddddddd05', 'Kinder Pullover Basic Baumwolle | Rewon Gear', 'kinder-sweatshirt-unisex-gelb', 'MHK-147',
  'Maximaler Komfort für kleine Abenteurer Dieses hochwertige Kinder Sweatshirt ist der ideale Begleiter für Schule, Sport und Freizeit. Gefertigt aus besonders weichem, atmungsaktivem Material, bietet es wohlige Wärme, ohne die Bewegungsfreiheit einzuschränken. Warum Eltern Rewon Gear vertrauen: Hautfreundlich & Weich: Sanft zur empfindlichen Kinderhaut für ganztägigen Tragekomfort. Formbeständig: Dank verstärkter Nähte und robuster Verarbeitung bleibt der Pullover auch nach vielen Waschgängen in Topform. Unisex-Design: Der zeitlose Schnitt passt perfekt zu Jeans, Jogginghosen oder Shorts. Pflegehinweis: Waschmaschinenfest und langlebig – entwickelt für den aktiven Alltag Ihrer Kinder.', 9000, null,
  6500, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/USS-12007-Y_2.png?v=1774345953','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/USS-12007-Y_1.png?v=1774345953']::text[], true, '{"color":"4","material":"Sweatshirts"}'::jsonb, false, 147
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000148', 'dddddddd-dddd-dddd-dddd-dddddddddd05', 'Kinder Pullover & Sweatshirt – Grau | Rewon Gear', 'kinder-sweatshirt-grau-unisex', 'MHK-148',
  'Gemütliches Kinder Sweatshirt in Anthrazit-Grau Dieses hochwertige Kinder Sweatshirt kombiniert zeitlosen Stil mit maximalem Komfort für den Alltag. Hergestellt aus einem weichen, atmungsaktiven Materialmix, sorgt es für angenehme Wärme bei jeder Aktivität – ob in der Schule oder beim Outdoor-Sport. Ihre Vorteile bei Rewon Gear: Premium-Komfort: Besonders weich auf der Haut und atmungsaktiv. Alltagstauglich: Das schlichte Design lässt sich perfekt zu Jeans oder Jogginghosen kombinieren. Höchste Qualität: Robuste Verarbeitung, die auch nach vielen Waschgängen die Form behält. Pflegehinweis: Waschmaschinenfest und langlebig – entwickelt für aktive Kinder.', 9000, null,
  6500, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/USS-12004_cedf6cf1-79ce-4dd8-b178-fe73ab6ed75c.jpg?v=1774344700']::text[], true, '{"color":"4","material":"Sweatshirts"}'::jsonb, false, 148
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000149', 'dddddddd-dddd-dddd-dddd-dddddddddd05', 'Vintage A-2 Leder Fliegerjacke Braun – Echter Lammfellkragen Bomber', 'vintage-brown-a2-leather-flight-bomber-jacket-shearling', 'MHK-149',
  'Legendäre Vintage A-2 Fliegerjacke – Der absolute Klassiker Diese ikonische A-2 Bomberjacke ist eine originalgetreue Nachbildung der berühmten USAAF-Fliegerjacke aus dem Zweiten Weltkrieg. Hergestellt aus hochwertigem, dunkelbraunem genarbtem Rinds- oder Ziegenleder (weich, robust und mit natürlicher Patina), kombiniert sie authentischen Militär-Look mit hohem Tragekomfort. Highlights & Ausstattung: Echter dicker Lammfellkragen, -manschetten & -bund – für maximale Wärme und luxuriöses Gefühl Dunkelbraunes genarbtes Leder – weich, langlebig, mit authentischer Vintage-Oberfläche Robuster Reißverschluss vorne mit Lederzieher Hoher Umlegekragen mit Druckknöpfen & Schnallenriemen – optimaler Windschutz Zwei große Pattentaschen vorne + Innentasche Einstellbare Seitenschnallen an der Taille für perfekten Sitz Elastische Strickbündchen in Braun passend zum Leder Quilt- oder Satin-Innenfutter – angenehm auf der Haut & wärmend HERREN JACKEN GRÖßENTABELLE (in Zoll / inches) Größe XS S M L XL 2XL 3XL 4XL 5XL 6XL Brustumfang (Chest) 43 45 47 50 52 54 56 60 64 68 Taille (Waist) 40 42 44 46 48 52 54 57 61 65 Länge (Length) 25.5 26 26.5 27 27.5 28 28.5 29 29.5 30 Schulter (Shoulder) 19 19.5 20 20.', 131000, null,
  94300, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/s-l1600-4.png?v=1771601055','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/s-l1600-2.jpg?v=1771601054','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/s-l1600-5.jpg?v=1771601057','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/s-l1600-6.jpg?v=1771601060']::text[], true, '{"color":"S"}'::jsonb, false, 149
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000150', 'dddddddd-dddd-dddd-dddd-dddddddddd09', 'Karateanzug | Karate-Gi | Karate Trainingsbekleidung - Mehrfarbig', 'karateanzug-karate-gi', 'MHK-150',
  'Rewon Karateanzug – Professioneller Karate Gi für Training & Prüfung Der Rewon Karateanzug ist ein hochwertiger Karate Gi für Training, Kata, Kumite und Gürtelprüfungen . Entwickelt für Anfänger und Fortgeschrittene , bietet dieser Karateanzug eine optimale Kombination aus Bewegungsfreiheit, Strapazierfähigkeit und Tragekomfort . Das robuste Baumwoll-Polyester-Material ist atmungsaktiv, reißfest und pflegeleicht. Verstärkte Nähte an stark beanspruchten Zonen sorgen für eine lange Lebensdauer auch bei regelmäßigem und intensivem Dojo-Training. Der klassische Karate-Schnitt unterstützt schnelle Techniken, hohe Kicks und stabile Stellungen ohne Einschränkung. Dank der Wahl zwischen klassischem Weiß und modernem Schwarz eignet sich der Rewon Karate Gi sowohl für traditionelles Karate als auch für zeitgemäßes Vereinstraining. Produktdetails Marke: Rewon Produkttyp: Karateanzug / Karate Gi Material: Baumwolle-Polyester-Mischgewebe Farben: Weiß oder Schwarz Passform: Klassischer Karate-Schnitt mit optimaler Bewegungsfreiheit Einsatzbereich: Karate Training, Kata, Kumite, Prüfungen Zielgruppe: Kinder, Jugendliche und Erwachsene Lieferumfang: Jacke, Hose und Gürtel Vorteile des Rewon Karate', 20700, 14800,
  10700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/karateanzug-mehrfarbig-rewon-karate-gi-karate-trainingsbekleidung-polyester-baumwolle-boxtraining-zubehoer.webp?v=1744463989','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/karateanzug-karate-gi-trainingsbekleidung-mehrfarbig-rewon-boxing-products-fitness-equipment-german.webp?v=1744463989','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/karateanzug-karate-gi-trainingsbekleidung-mehrfarbig-rewon-polyester-baumwolle-kaufen.webp?v=1744463989','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/karateanzug-karate-gi-mehrfarbig-rewon-polyester-baumwolle-kampfsport-trainingsbekleidung.webp?v=1744463989']::text[], true, '{"size":"000","color":"White","material":"Karate Uniform"}'::jsonb, false, 150
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000151', 'dddddddd-dddd-dddd-dddd-dddddddddd02', 'Schienbeinschoner Spann Kampfsport/Kickboxen - Mehrfarbig', 'schienbeinschoner-spann-kampfsport', 'MHK-151',
  '🥋 Rewon Schienbeinschoner & Spannschutz – Für Kämpfer, die keine Kompromisse machen Du weißt, wie sich ein guter Kick anfühlt – und wie sich ein schlechter Block schmerzt. Jeder Schlag auf dem Weg zur Perfektion zählt. Der Rewon Schienbeinschoner mit integriertem Spannschutz wurde für Athleten entwickelt, die Technik, Schutz und Bewegungsfreiheit brauchen – ohne Kompromisse. Ob im Muay Thai, Kickboxen oder MMA – diese Schützer geben dir das Selbstvertrauen, mit dem du auf die Matte trittst und härter trainierst, länger kämpfst und besser performst. Rewon schützt dich – du gehst an dein Limit. ✅ Produktmerkmale: Marke: Rewon – vertrauenswürdig im internationalen Kampfsport Material: Atmungsaktive Baumwollmischung mit stoßdämpfendem Polsterkern Design: Integrierter Spannschutz + elastische Riemen für festen Halt Farben: Erhältlich in Schwarz, Blau, Rot & Weiß Passform: Anatomisch geformt, dehnbar, rutschfest und bewegungsfreundlich 🎯 Ideal für: Kickboxen, Muay Thai, MMA, Karate, Taekwondo Vereine, Studios, Kampfsportschulen Anfänger bis Fortgeschrittene ❓ Häufige Fragen (FAQs): 1. Für welche Kampfsportarten ist der Schoner geeignet? Ideal für Kickboxen, Muay Thai, MMA, Karate, Taek', 9000, 7000,
  5000, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-schienbeinschoner-muay-thai-kickboxen-mehrfarbig-boxtraining-komfort-fit-verschlusssystem-dehnbare-riemen.jpg?v=1744464055','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-kampfsport-schienbeinschoner-mehrfarbig-kickboxen-muay-thai-komfort-anpassbare-passform.jpg?v=1744464055','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/schienbeinschoner-spann-kampfsport-kickboxen-mehrfarbig-rewon-boxtraining-boxen-fitnessprodukte-de.jpg?v=1744464055','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/mehrfarbig_kampfsport_schienbeinschoner_rewon_kickboxen_muay_thai_mma_fitness_boxausruestung.jpg?v=1744464055']::text[], true, '{"size":"XS","color":"Black","material":"MMA Shin Guards"}'::jsonb, false, 151
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000152', 'dddddddd-dddd-dddd-dddd-dddddddddd07', 'Schlagpolster/Kickpratzen/MMA Trainerpolster -  Mehrfarbig', 'schlagpolster-kickpratzen', 'MHK-152',
  '🥊 Rewon Gear Armpolster – Premium Kickshield für intensives Kampfsporttraining Trainiere auf höchstem Niveau mit dem Rewon Gear Armpolster – entwickelt für anspruchsvolle Boxer, Kickboxer und Kampfsportler. 🔝 Hohe Qualität & Langlebigkeit Gefertigt aus hochwertigem Kunstleder , bietet unser Armpolster ausgezeichnete Haltbarkeit und einfache Reinigung. Ideal für intensives Kickbox-, Taekwondo- und MMA-Training . ✔️ Robustes, langlebiges Material ✔️ Schlag- & trittfest – optimaler Schutz für Sparring ✔️ Einfach zu reinigen – hygienisch & pflegeleicht 🛡️ Maximaler Schutz & Flexibilität Das Kickshield ist speziell geformt, um Schläge, Kniestöße und Tritte sicher abzufedern . Perfekt für Krav Maga, Thai-Boxen und Selbstverteidigungstraining. 💪 Sicherer Halt dank Klettverschlusssystem Das ergonomische Klettsystem sorgt für festen Sitz am Arm, selbst bei langen Trainingseinheiten. Es ermöglicht verschiedene Trainingswinkel und erhöht die Effektivität deiner Technik. 🎯 Für Profis & ambitionierte Athleten Ob im Studio oder im Home-Gym: Das Rewon Gear Armpolster ist das ideale Tool für Trainer, Boxer und Kampfsportbegeisterte, die Wert auf Qualität, Schutz und Performance legen. ✅ Zufri', 15400, 14300,
  10300, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_mehrfarbig_schlagpolster_hochwertige_kunstleder_kickboxtraining_mma_boxpratzen_kaufen.webp?v=1744464342','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/classic-schlagpolster-mma-kickpratzen-rewon-schwarz-kunstleder-kickboxtraining-armpolster-kravmaga-taekwondo.webp?v=1744497720','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-kickpratzen-mma-trainerpolster-boxausruestung-mehrfarbig-kunstleder-fuer-kampfsport-training.webp?v=1744464341','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-schlagpolster-kickpratzen-mma-trainerpolster-boxtraining-hohe-qualitaet-mehrfarbig.webp?v=1744464341']::text[], true, '{"color":"Camouflage","material":"Kick Sheild"}'::jsonb, false, 152
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000153', 'dddddddd-dddd-dddd-dddd-dddddddddd02', 'Kopfschutz | MMA Kickboxen Kampfsport | Boxkopfschutz - Mehrfarbig', 'kopfschutz-karate-mehrfarbig', 'MHK-153',
  'Rewon Profi-Kopfschutz: Maximale Sicherheit bei voller Sicht Ob im Training oder beim intensiven Sparring – der richtige Schutz ist entscheidend. Die Rewongear Kopfschutz-Serie wurde entwickelt, um höchste Sicherheitsstandards mit uneingeschränkter Performance zu vereinen. Dank des ergonomischen Designs genießen Sie einen lückenlosen Vollschutz für Nase, Kinn, Wangen, Ohren und Augen, ohne dass Ihr Sichtfeld eingeschränkt wird. Ihre Vorteile im Überblick: Rundum-Schutz für jedes Level: Speziell konzipiert für Kampfsportler (Boxen, MMA, Karate, Taekwondo), die Wert auf Sicherheit legen, ohne ihre Umgebung aus den Augen zu verlieren. Hocheffiziente Stoßdämpfung: Eine dichte, strategisch platzierte Schaumstoffpolsterung absorbiert die Aufprallenergie und schützt Sie zuverlässig vor harten Schlägen und Tritten. Langlebigkeit trifft Komfort: Die Außenseite aus robustem Kunstleder mit verstärkten Nähten hält härtesten Belastungen stand. Das wasserabweisende Innenfutter bleibt auch bei intensiven Workouts weich und hygienisch. Ultraleichte Bauweise: Dank des geringen Gewichts bleibt Ihre Agilität voll erhalten. Kein schweres Gefühl am Kopf – volle Konzentration auf den Gegner. Individuell', 12000, null,
  8700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-kopfschutz-mma-kickboxen-boxkopfschutz-mehrfarbig-vollschutz-schlagwirkung-boxausruestung.webp?v=1744464516','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-boxkopfschutz-mehrfarbig-mma-kickboxen-kampfsport-schutzausruestung.webp?v=1744464516','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-kopfschutz-boxing-headgear-kickboxen-mma-mehrfarbig-schutz-posterung.webp?v=1744464516','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_mehrfarbig_boxkopfschutz_mma_kickboxen_kopfschutz_boxtraining_ausruestung_schutz_fuer_alle_level.webp?v=1744464516']::text[], false, '{"size":"XS","color":"Red","material":"Head Guards"}'::jsonb, false, 153
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000154', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'MMA Handschuhe Pro – Leder & Doppelverschluss | Rewon Gear', 'mma-handschuhe-grappling-leder', 'MHK-154',
  'Profi MMA Handschuhe für Grappling & Sparring Erreichen Sie Ihr nächstes Level mit den Rewon Gear MMA Handschuhen. Diese Handschuhe wurden speziell für harten Einsatz im Training und Wettkampf entwickelt. Sie bieten die perfekte Balance zwischen Schutz und Flexibilität. Ihre Vorteile für maximale Performance: Sicherer Halt: Der doppelte Klettverschluss stabilisiert das Handgelenk und verhindert Verletzungen. Optimale Belüftung: Das integrierte Air-Leak-System sorgt für kühle Hände und schnellere Trocknungszeiten. Hoher Tragekomfort: Weiches Innenfutter und ergonomische Passform für natürliche Handbewegungen. Produktdetails: Ideal für MMA, Grappling und Sandsacktraining. Robuste Qualität für langanhaltende Freude am Sport.', 14000, 9200,
  6700, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/mma-handschuhe-mehrfarbig-rewon-boxtraining-boxhandschuhe-kaufen-boxausruestung-online-belueftung-air-teak-system.webp?v=1753788397','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/mma-handschuhe-rewon-mehrfarbig-boxausruestung-air-teak-system.webp?v=1753788397','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/mma-handschuhe-mehrfarbig-rewon-boxausruestung-online-boxtraining-mma-handschuhe-comfort-air-teak-system.webp?v=1744464593','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/mma-handschuhe-mehrfarbig-rewon-boxausruestung-online-boxzubehoer-power-punch.webp?v=1753788397']::text[], true, '{"size":"L/XL","color":"Black/Golden","material":"MMA Grappling Gloves"}'::jsonb, false, 154
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000155', 'dddddddd-dddd-dddd-dddd-dddddddddd01', 'Boxhandschuhe - Mehrfarbig', 'boxhandschuhe-mehrfarbig', 'MHK-155',
  'Kickbox Handschuhe und Muay Thai Handschuhe Unsere Kickbox- und Muay Thai-Handschuhe bieten ausgezeichneten Schutz und Haltbarkeit. Mit laminiertem, authentischem Schaumstoff ausgestattet, schützen sie effektiv die stoßdämpfende Mitte und gewährleisten hohen Komfort und Langlebigkeit. Boxhandschuhe für Frauen und Herren Wir bieten Boxhandschuhe speziell für Frauen und Herren an, die eine perfekte Passform und optimalen Schutz gewährleisten. Sie bestehen aus hochdichtem PU und geformtem EVA, ergänzt durch Schaumstoffpolsterung für eine High-Tech-Stoßdämpfung, die bei jedem Schlag Vertrauen gibt. Beste Boxhandschuhe mit Knöchelschutz Unsere Boxhandschuhe sind die besten auf dem Markt, wenn es um Knöchelschutz geht. Der Daumen ist mit EVA-Polsterung versehen und bietet in Kombination mit zusätzlichem Schaumstoff maximalen Schutz vor Verletzungen, selbst bei intensiven Trainingseinheiten. MMA-Handschuhe für Vielseitiges Training Unsere MMA-Handschuhe sind für vielseitige Trainingseinheiten konzipiert und bieten die notwendige Bewegungsfreiheit und Schutz. Ideal für Mixed Martial Arts-Training und Sparring-Sessions. Boxhandschuhe Günstig – Qualität zu einem erschwinglichen Preis Für Ein', 18500, 12900,
  9300, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/milti_img_2_11zon.webp?v=1725895325','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/main_image_11zon_17daf22b-214c-448e-a5bb-311311dd0c3e.webp?v=1725896833','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/boxhandschuhe-classic-schwarz-rewon-kickbox-muay-thai-handschuhe-schutz-haltbarkeit-damen-herren.webp?v=1744498229','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon_boxhandschuhe_nachtarnung_kickbox_muay_thai_komfort_schutz_damen_herren.jpg?v=1744498093']::text[], true, '{"size":"8oz","color":"Black/Golden","material":"Boxing Gloves & Mitts"}'::jsonb, false, 155
);

insert into public.products (
  id, category_id, title, slug, sku, description,
  original_price, sale_price, wholesale_price, image_urls,
  in_stock, specifications, featured, sort_order
) values (
  'aaaaaaaa-aaaa-aaaa-aaaa-000000000156', 'dddddddd-dddd-dddd-dddd-dddddddddd02', 'Rewon Damen Brustschutz Top – Karate Taekwondo Kickboxen Schutz‑Top S–XL', 'brustschutz-damen-weiss', 'MHK-156',
  'Rewon Brustschutz Damen – Weiß | Atmungsaktiver Brustprotektor für Kampfsport Der REWON Brustschutz für Damen in Weiß ist die perfekte Wahl für Kampfsportlerinnen, die Wert auf Sicherheit, Komfort und Leistung legen. Entwickelt für den professionellen Einsatz in Karate, Taekwondo, Kickboxen und anderen Kampfsportarten, bietet dieser Brustprotektor optimalen Schutz bei maximaler Bewegungsfreiheit. Das atmungsaktive Material sorgt für eine hervorragende Belüftung, ist leicht, angenehm zu tragen und einfach waschbar – ideal für intensive Trainingseinheiten oder Wettkämpfe. Die ergonomische Passform garantiert sicheren Halt, ohne einzuengen. Highlights: Für Damen – speziell für die weibliche Anatomie entwickelt Perfekt für Kampfsport: Karate, Taekwondo, Kickboxen, u.v.m. Leichtes, atmungsaktives Material für optimalen Tragekomfort Waschbar & pflegeleicht Verfügbar in der Farbe: Weiß Steigere deine Performance mit dem hochwertigen Damen Brustschutz von REWON – mehr Komfort, mehr Schutz, mehr Fokus im Training.', 16800, 14000,
  10100, ARRAY['https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-brustschutz-damen-weiss-atemungsaktiver-brustprotektor-karate-taekwondo-kickboxen.webp?v=1744464784','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-brustschutz-damen-weiss-kampfsport-boxing-kickboxen-taekwondo-schutz-atemaktiv.webp?v=1744464784','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-damen-brustschutz-weiss-kampfsport-protektor-breathable-elastic-boxen-taekwondo-karate-taekwondo.webp?v=1744460597','https://cdn.shopify.com/s/files/1/0680/2174/8016/files/rewon-brustschutz-damen-weiss-atemschutz-kampfsport-boxtraining-kickboxen-protektor-schutz-komfort-bewegungsfreiheit.webp?v=1744464784']::text[], false, '{"color":"S","material":"Chest Guard"}'::jsonb, false, 156
);

-- select count(*) from categories;
-- select count(*) from products;
