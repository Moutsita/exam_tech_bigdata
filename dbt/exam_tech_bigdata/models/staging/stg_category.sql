-- stg_category.sql
SELECT * FROM {{ source('raw_source', 'category') }}