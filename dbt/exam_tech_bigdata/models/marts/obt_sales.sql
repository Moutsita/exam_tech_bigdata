-- marts.obt_sales.sql
{{config(materialized = 'table', schema='MARTS')}}

{{ config(materialized='table', schema='MARTS') }}

SELECT
    fv.id AS vente_id,

    fv.annees,
    fv.mois,
    fv.jour,
    fv.pu,
    fv.qte,

    ff.id AS facture_id,
    ff.code AS facture_code,
    ff.qte_totale,
    ff.total_amount,
    ff.total_paid,

    b.code AS book_code,
    b.intitule AS book_name,
    b.isbn_10,
    b.isbn_13,

    c.intitule AS category_name,

    cu.code AS customer_code,
    cu.nom

FROM {{ ref('fact_ventes') }} fv
LEFT JOIN {{ ref('fact_factures') }} ff ON fv.factures_id = ff.id
LEFT JOIN {{ ref('dim_books') }} b ON fv.books_id = b.id
LEFT JOIN {{ ref('dim_category') }} c ON b.category_id = c.id
LEFT JOIN {{ ref('dim_customers') }} cu ON ff.customers_id = cu.id


-- SELECT
--     v.id,
--     v.annees,
--     v.mois,
--     v.jour,
--     v.pu,
--     v.qte,
--     f.code,
--     f.qte_totale,
--     f.total_amount,
--     f.total_paid,
--     b.code AS book_code,
--     b.intitule AS book_name,
--     c.intitule AS category_name,
--     cu.code AS customer_code,
--     cu.nom
-- FROM {{ ref('fact_ventes') }} v
-- JOIN {{ ref('fact_factures') }} f ON v.id = f.id
-- JOIN {{ ref('dim_books') }} b ON v.id = b.id
-- JOIN {{ ref('dim_category') }} c ON b.category_id = c.id
-- JOIN {{ ref('dim_customers') }} cu ON f.customers_id = cu.id
