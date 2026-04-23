-- stg_books.sql
SELECT * FROM {{ source('raw_source', 'books') }}