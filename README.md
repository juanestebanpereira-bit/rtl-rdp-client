# rtl_rdp_client — RDP Customer Implementation

This is the reference customer implementation for the Retail Data Platform.
It maps customer source data to the RDP staging contract defined in
`rtl_rdp/CONTRACT.md` and installs `rtl_rdp` as a dbt package.

Customer teams fork this repository and adapt the staging models to their
own source systems. The RDP product code in `rtl_rdp` is never modified
directly — all customisation happens here.

## This Repository

`rtl_rdp_client` is one of three git repositories in the `retail-analytics` monorepo.
See the root `README.md` for the full picture.

## Key Documents

- `rtl_rdp/CONTRACT.md` — staging contract to implement, including custom column documentation
- `rtl_rdp/STYLE_GUIDE.md` — SQL and dbt coding standards

## Getting Started

```bash
dbt deps      # Install rtl_rdp package — required before first run
dbt compile   # Verify the project compiles against your source definitions
dbt run       # Run all models
dbt test      # Run all data quality tests
```

## Adding Custom Columns

Custom columns use the `cust_` prefix and are passed through to downstream
RDP views automatically. See `rtl_rdp/CONTRACT.md` — "Documenting Customer
Columns" for how to document them in `schema.yml` and `docs.md`.
