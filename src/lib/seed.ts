import { sportImages } from "./sport-images";
import { rewonProducts } from "./rewon-products";
import type { Category, Product } from "./types";

const R1 = "cccccccc-cccc-cccc-cccc-cccccccccc01";
const R2 = "cccccccc-cccc-cccc-cccc-cccccccccc02";
const R3 = "cccccccc-cccc-cccc-cccc-cccccccccc03";
const R4 = "cccccccc-cccc-cccc-cccc-cccccccccc04";

const S1 = "dddddddd-dddd-dddd-dddd-dddddddddd01";
const S2 = "dddddddd-dddd-dddd-dddd-dddddddddd02";
const S3 = "dddddddd-dddd-dddd-dddd-dddddddddd03";
const S4 = "dddddddd-dddd-dddd-dddd-dddddddddd04";
const S5 = "dddddddd-dddd-dddd-dddd-dddddddddd05";
const S6 = "dddddddd-dddd-dddd-dddd-dddddddddd06";
const S7 = "dddddddd-dddd-dddd-dddd-dddddddddd07";
const S8 = "dddddddd-dddd-dddd-dddd-dddddddddd08";
const S9 = "dddddddd-dddd-dddd-dddd-dddddddddd09";

export const categories: Category[] = [
  {
    id: R1,
    parent_id: null,
    name: "Mix Martial Arts",
    slug: "mix-martial-arts",
    description: "Gloves, shin guards, headgear — fight-ready MMA & boxing kit.",
    image_url: sportImages.catMma,
    sort_order: 1,
  },
  {
    id: S1,
    parent_id: R1,
    name: "Boxing & MMA Gloves",
    slug: "boxing-mma-gloves",
    description: "Training and competition gloves.",
    image_url: sportImages.boxingGloves,
    sort_order: 1,
  },
  {
    id: S2,
    parent_id: R1,
    name: "Shin Guards & Headgear",
    slug: "shin-guards-headgear",
    description: "Protection for sparring and competition.",
    image_url: sportImages.shinGuards,
    sort_order: 2,
  },
  {
    id: S9,
    parent_id: R1,
    name: "Martial Arts Uniforms",
    slug: "martial-arts-uniforms",
    description: "BJJ gis, karate, judo, and taekwondo suits.",
    image_url: sportImages.catSports,
    sort_order: 3,
  },
  {
    id: R2,
    parent_id: null,
    name: "Sports Wear",
    slug: "sports-wear",
    description: "Performance fabrics for training and competition.",
    image_url: sportImages.catSports,
    sort_order: 2,
  },
  {
    id: S3,
    parent_id: R2,
    name: "Rash Guards & Tees",
    slug: "rash-guards-tees",
    description: "Moisture-wicking tops for grappling and gym.",
    image_url: sportImages.rashGuard,
    sort_order: 1,
  },
  {
    id: S4,
    parent_id: R2,
    name: "Training Shorts",
    slug: "training-shorts",
    description: "Flexible fight shorts and compression cuts.",
    image_url: sportImages.shorts,
    sort_order: 2,
  },
  {
    id: R3,
    parent_id: null,
    name: "Clothing Apparel & Accessories",
    slug: "clothing-apparel-accessories",
    description: "Street-to-gym layers, bags, wraps, and caps.",
    image_url: sportImages.catApparel,
    sort_order: 3,
  },
  {
    id: S5,
    parent_id: R3,
    name: "Hoodies & Layers",
    slug: "hoodies-layers",
    description: "Warm-up and lifestyle pieces.",
    image_url: sportImages.hoodie,
    sort_order: 1,
  },
  {
    id: S6,
    parent_id: R3,
    name: "Bags & Accessories",
    slug: "bags-accessories",
    description: "Duffels, wraps, and training essentials.",
    image_url: sportImages.gymBag,
    sort_order: 2,
  },
  {
    id: R4,
    parent_id: null,
    name: "Training Equipment",
    slug: "training-equipment",
    description: "Heavy bags, pads, and gym floor essentials.",
    image_url: sportImages.catTraining,
    sort_order: 4,
  },
  {
    id: S7,
    parent_id: R4,
    name: "Bags & Pads",
    slug: "bags-pads",
    description: "Heavy bags and focus mitts.",
    image_url: sportImages.bag,
    sort_order: 1,
  },
  {
    id: S8,
    parent_id: R4,
    name: "Training Aids",
    slug: "training-aids",
    description: "Pads, straps, and sparring tools.",
    image_url: sportImages.pads,
    sort_order: 2,
  },
];

export const products: Product[] = rewonProducts;
