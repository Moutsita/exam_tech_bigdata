-- warehouse/dim_books.sql
{{config(schema='WAREHOUSE')}}

SELECT * FROM {{ ref('stg_books') }}