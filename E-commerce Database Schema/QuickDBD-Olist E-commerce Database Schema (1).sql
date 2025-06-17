-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Gpy31k
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Olist E-commerce Database Schema Overview
-- This schema represents the data structure for Olist, an e-commerce marketplace in Brazil.
-- It captures key entities and their relationships including customers, sellers, orders, payments,
-- reviews, products, and geographical locations.
-- The design emphasizes referential integrity, data uniqueness, and traceability for analytics.
-- Primary keys (PK), foreign keys (FK), unique constraints, and NULL allowances are defined explicitly.

-- Table: olist_orders
-- Table: olist_orders
CREATE TABLE "olist_orders" (
    "order_id" varchar(50)   NOT NULL,
    "customer_id" varchar(50)   NOT NULL,
    "order_status" varchar(20)   NOT NULL,
    "order_purchase_timestamp" timestamp   NOT NULL,
    "order_approved_at" timestamp   NULL,
    "order_delivered_carrier_date" timestamp   NULL,
    "order_delivered_customer_date" timestamp   NULL,
    "order_estimated_delivery_date" timestamp   NOT NULL,
    CONSTRAINT "pk_olist_orders" PRIMARY KEY (
        "order_id"
     )
);

-- Table: olist_customers
CREATE TABLE "olist_customers" (
    "customer_id" varchar(50)   NOT NULL,
    "customer_unique_id" varchar(50)   NOT NULL,
    "customer_zip_code_prefix" int   NOT NULL,
    "customer_city" varchar(100)   NOT NULL,
    "customer_state" varchar(2)   NOT NULL,
    CONSTRAINT "pk_olist_customers" PRIMARY KEY (
        "customer_id"
     )
);

-- Table: olist_geolocation
CREATE TABLE "olist_geolocation" (
    "geolocation_zip_code_prefix" int   NOT NULL,
    "geolocation_lat" float   NOT NULL,
    "geolocation_lng" float   NOT NULL,
    "geolocation_city" varchar(100)   NOT NULL,
    "geolocation_state" varchar(2)   NOT NULL
);

-- Note: no primary key; used for zip-location mapping
-- Table: olist_order_items
CREATE TABLE "olist_order_items" (
    "order_id" varchar(50)   NOT NULL,
    "order_item_id" int   NOT NULL,
    "product_id" varchar(50)   NOT NULL,
    "seller_id" varchar(50)   NOT NULL,
    "shipping_limit_date" timestamp   NOT NULL,
    "price" float   NOT NULL,
    "freight_value" float   NOT NULL
);

-- Composite Primary Key: (order_id, order_item_id)
-- Table: olist_order_payments
CREATE TABLE "olist_order_payments" (
    "order_id" varchar(50)   NOT NULL,
    "payment_sequential" int   NOT NULL,
    "payment_type" varchar(20)   NOT NULL,
    "payment_installments" int   NOT NULL,
    "payment_value" float   NOT NULL
);

-- Composite Primary Key: (order_id, payment_sequential)
-- Table: olist_order_reviews
CREATE TABLE "olist_order_reviews" (
    "review_id" varchar(50)   NOT NULL,
    "order_id" varchar(50)   NOT NULL,
    "review_score" int   NULL,
    "review_comment_title" varchar(255)   NULL,
    "review_comment_message" text   NULL,
    "review_creation_date" timestamp   NOT NULL,
    "review_answer_timestamp" timestamp   NOT NULL,
    CONSTRAINT "pk_olist_order_reviews" PRIMARY KEY (
        "review_id"
     )
);

-- Table: olist_products
CREATE TABLE "olist_products" (
    "product_id" varchar(50)   NOT NULL,
    "product_category_name" varchar(100)   NOT NULL,
    "product_name_length" int   NOT NULL,
    "product_description_length" int   NOT NULL,
    "product_photos_qty" int   NOT NULL,
    "product_weight_g" int   NOT NULL,
    "product_length_cm" int   NOT NULL,
    "product_height_cm" int   NOT NULL,
    "product_width_cm" int   NOT NULL,
    CONSTRAINT "pk_olist_products" PRIMARY KEY (
        "product_id"
     )
);

-- Table: olist_sellers
CREATE TABLE "olist_sellers" (
    "seller_id" varchar(50)   NOT NULL,
    "seller_zip_code_prefix" int   NOT NULL,
    "seller_city" varchar(100)   NOT NULL,
    "seller_state" varchar(2)   NOT NULL,
    CONSTRAINT "pk_olist_sellers" PRIMARY KEY (
        "seller_id"
     )
);

-- Table: product_category_name_translation
CREATE TABLE "product_category_name_translation" (
    "product_category_name" varchar(100)   NOT NULL,
    "product_category_name_english" varchar(100)   NOT NULL,
    CONSTRAINT "pk_product_category_name_translation" PRIMARY KEY (
        "product_category_name"
     )
);

ALTER TABLE "olist_orders" ADD CONSTRAINT "fk_olist_orders_customer_id" FOREIGN KEY("customer_id")
REFERENCES "olist_customers" ("customer_id");

ALTER TABLE "olist_geolocation" ADD CONSTRAINT "fk_olist_geolocation_geolocation_zip_code_prefix" FOREIGN KEY("geolocation_zip_code_prefix")
REFERENCES "olist_customers" ("customer_zip_code_prefix");

ALTER TABLE "olist_order_items" ADD CONSTRAINT "fk_olist_order_items_order_id" FOREIGN KEY("order_id")
REFERENCES "olist_orders" ("order_id");

ALTER TABLE "olist_order_items" ADD CONSTRAINT "fk_olist_order_items_product_id" FOREIGN KEY("product_id")
REFERENCES "olist_products" ("product_id");

ALTER TABLE "olist_order_items" ADD CONSTRAINT "fk_olist_order_items_seller_id" FOREIGN KEY("seller_id")
REFERENCES "olist_sellers" ("seller_id");

ALTER TABLE "olist_order_payments" ADD CONSTRAINT "fk_olist_order_payments_order_id" FOREIGN KEY("order_id")
REFERENCES "olist_orders" ("order_id");

ALTER TABLE "olist_order_reviews" ADD CONSTRAINT "fk_olist_order_reviews_order_id" FOREIGN KEY("order_id")
REFERENCES "olist_orders" ("order_id");

ALTER TABLE "olist_products" ADD CONSTRAINT "fk_olist_products_product_category_name" FOREIGN KEY("product_category_name")
REFERENCES "product_category_name_translation" ("product_category_name");

ALTER TABLE "olist_sellers" ADD CONSTRAINT "fk_olist_sellers_seller_zip_code_prefix" FOREIGN KEY("seller_zip_code_prefix")
REFERENCES "olist_geolocation" ("geolocation_zip_code_prefix");

