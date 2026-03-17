-- =============================================================================
-- generate_schema_name.sql — rtl_staging (Retail Data Platform - Staging)
-- =============================================================================
-- Overrides dbt's default schema naming behavior to prepend the environment
-- prefix (dev/tst/prd) to all dataset names. This ensures staging views land
-- in the correct BigQuery dataset for each environment without hardcoding
-- environment names in model files.
--
-- Examples:
--   dev  + rdp_staging → dev_rdp_staging
--   tst  + rdp_staging → tst_rdp_staging
--   prd  + rdp_staging → prd_rdp_staging
-- =============================================================================

{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- if custom_schema_name is none -%}
        -- No schema override defined — use target dataset as-is.
        -- This should only apply to the default dataset (dev_rdp_client).
        {{ target.schema }}

    {%- else -%}
        -- Prepend environment prefix from target name to custom schema name.
        -- target.name is set in profiles.yml (dev, tst, or prd).
        {{ target.name }}_{{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}