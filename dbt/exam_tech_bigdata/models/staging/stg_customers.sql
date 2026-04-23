-- stg_customers.sql
SELECT * FROM {{ source('raw_source', 'customers') }}