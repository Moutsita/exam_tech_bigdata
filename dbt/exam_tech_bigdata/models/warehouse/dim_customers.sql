-- dim_customers.sql
{{ config(schema='WAREHOUSE') }}

SELECT
    id,
    code,
    first_name,
    last_name,
    CONCAT(first_name, ' ', last_name) as nom,
    created_at
FROM {{ ref('stg_customers') }}