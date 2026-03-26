-- =============================================================================
-- stg_departments.sql
-- =============================================================================
-- Maps Olist product categories to RDP department staging contract.
-- Since Olist does not have a dedicated departments table, departments
-- are derived from distinct product category names in the products table.
--
-- Prototype mapping:
--   product_category_name → department_id, department_number, department_name
--
-- Component:  Product Hierarchy
-- Owner:      Customer
-- Reads from: merchandising.olist_products_dataset
-- =============================================================================

WITH source AS (
    -- Pull distinct categories from products table
    SELECT DISTINCT
        product_category_name
    FROM {{ source('merchandising', 'olist_products_dataset') }}
    WHERE product_category_name IS NOT NULL
),

renamed AS (
    SELECT
        -- Use category name as id since no natural key exists
        product_category_name               AS department_id,

        -- Use category name as number for prototype
        -- In production this would be a real department number
        product_category_name               AS department_number,

        -- Use category name as display name
        product_category_name               AS department_name,

        'Jack Smith'                        AS cust_department_manager,

        'olist'                             AS rdp_source_system

    FROM source
)

SELECT * FROM renamed