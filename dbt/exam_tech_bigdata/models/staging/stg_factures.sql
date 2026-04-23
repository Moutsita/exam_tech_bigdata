-- models/staging/stg_factures.sql

SELECT
    id,
    code,
    TO_DATE(CAST(date_edit AS VARCHAR), 'YYYYMMDD') as date_edit,
    customers_id,
    qte_totale,
    total_amount,
    total_paid,
    created_at
FROM {{ source('raw_source', 'factures') }}
