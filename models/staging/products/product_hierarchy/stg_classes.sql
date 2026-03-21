-- =============================================================================
-- stg_classes.sql
-- =============================================================================
-- Maps Olist product categories to RDP class staging contract.
-- For prototype purposes, classes mirror departments since Olist
-- has no class-level data.
--
-- Component:  Product Hierarchy
-- Owner:      Customer
-- Reads from: merchandising.olist_products_dataset
-- =============================================================================

WITH source AS (
    SELECT DISTINCT
        product_category_name
    FROM {{ source('merchandising', 'olist_products_dataset') }}
    WHERE product_category_name IS NOT NULL
),

renamed AS (
    SELECT
        product_category_name               AS class_id,
        product_category_name               AS department_id,
        product_category_name               AS class_number,
        product_category_name               AS class_name
    FROM source
)

SELECT * FROM renamed