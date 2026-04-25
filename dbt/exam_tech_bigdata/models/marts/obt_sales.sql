-- marts.obt_sales.sql

{{ config(materialized='table', schema='MARTS') }}

SELECT
    -- fv (fact_ventes) : Table de faits centrale contenant les transactions
    fv.id AS vente_id,
    fv.annees,
    fv.mois,
    fv.jour,
    fv.pu,
    fv.qte,

    -- ff (fact_factures) : Table de faits liée regroupant les informations de paiement
    ff.id AS facture_id,
    ff.code AS facture_code,
    ff.qte_totale,
    ff.total_amount,
    ff.total_paid,

    -- b (dim_books) : Dimension contenant les détails des livres
    b.code AS book_code,
    b.intitule AS book_name,
    b.isbn_10,
    b.isbn_13,

    -- c (dim_category) : Dimension pour la classification des ouvrages
    c.intitule AS category_name,

    -- cu (dim_customers) : Dimension contenant les informations d'identité des clients
    cu.code AS customer_code,
    cu.nom

FROM {{ ref('fact_ventes') }} fv
LEFT JOIN {{ ref('fact_factures') }} ff ON fv.factures_id = ff.id
LEFT JOIN {{ ref('dim_books') }} b ON fv.books_id = b.id
LEFT JOIN {{ ref('dim_category') }} c ON b.category_id = c.id
LEFT JOIN {{ ref('dim_customers') }} cu ON ff.customers_id = cu.id
