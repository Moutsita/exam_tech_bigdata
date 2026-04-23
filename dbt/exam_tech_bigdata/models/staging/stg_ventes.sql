-- models/staging/stg_ventes.sql

SELECT
    id,
    code,
    TO_DATE(CAST(date_edit AS VARCHAR), 'YYYYMMDD') as date_edit,
    factures_id,
    books_id,
    pu,
    qte,
    created_at
FROM {{ source('raw_source', 'ventes') }}
