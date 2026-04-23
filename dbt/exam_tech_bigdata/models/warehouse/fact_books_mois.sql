-- warehouse.fact_books_mois.sql --
{{config(schema="WAREHOUSE")}}

SELECT
    b.intitule,
    TO_CHAR(v.date_edit, 'Month') AS mois,
    SUM(v.qte) AS total_qte
FROM {{ ref('stg_ventes') }} v
JOIN {{ ref('stg_books') }} b ON v.books_id = b.id
GROUP BY b.intitule, mois