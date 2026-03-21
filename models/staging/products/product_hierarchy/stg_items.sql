-- =============================================================================
-- stg_items.sql
-- =============================================================================
-- Maps Olist product data to RDP item staging contract.
-- Each Olist product maps to one RDP item.
--
-- Component:  Product Hierarchy
-- Owner:      Customer
-- Reads from: merchandising.olist_products_dataset
-- =============================================================================

WITH source AS (
    SELECT
        product_id,
        product_category_name
    FROM {{ source('merchandising', 'olist_products_dataset') }}
    WHERE product_id IS NOT NULL
),

renamed AS (
    SELECT
        product_id                          AS item_id,
        product_id                          AS style_id,
        product_id                          AS item_number,
        COALESCE(
            product_category_name,
            'Unknown'
        )                                   AS item_name
    FROM source
)

SELECT * FROM renamed