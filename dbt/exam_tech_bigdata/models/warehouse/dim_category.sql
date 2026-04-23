-- warehouse/dim_category.sql
{{config(schema='WAREHOUSE')}}

SELECT * FROM {{ ref('stg_category') }}