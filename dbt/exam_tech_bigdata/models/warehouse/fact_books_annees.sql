-- warehouse.fact_books_annees.sql --
-- {{config(schema='WAREHOUSE')}}

-- SELECT
--     b.intitule,
--     EXTRACT(YEAR FROM v.date_edit) AS annees,
--     SUM(v.qte) AS total_qte
-- FROM {{ ref('stg_ventes') }} v
-- JOIN {{ ref('stg_books') }} b ON v.books_id = b.id
-- GROUP BY b.intitule, annees

-- {{config(schema='WAREHOUSE')}}

-- SELECT
--     b.intitule,
--     EXTRACT(YEAR FROM TO_DATE(v.date_edit, 'YYYY-MM-DD')) AS annees, -- Conversion explicite
--     SUM(v.qte) AS total_qte
-- FROM {{ ref('stg_ventes') }} v
-- JOIN {{ ref('stg_books') }} b ON v.books_id = b.id
-- GROUP BY b.intitule, annees

-- {{ config(schema='WAREHOUSE') }}

-- SELECT
--     b.intitule,
--     EXTRACT(YEAR FROM TRY_TO_DATE(v.date_edit, 'YYYY-MM-DD')) AS annees,
--     SUM(v.qte) AS total_qte
-- FROM {{ ref('stg_ventes') }} v
-- JOIN {{ ref('stg_books') }} b ON v.books_id = b.id
-- GROUP BY b.intitule, annees

-- {{ config(schema='WAREHOUSE') }}

-- SELECT
--     b.intitule,
--     EXTRACT(YEAR FROM TRY_TO_DATE(v.date_edit, 'YYYY-MM-DD'))::INT AS annees,
--     SUM(v.qte) AS total_qte
-- FROM {{ ref('stg_ventes') }} v
-- JOIN {{ ref('stg_books') }} b ON v.books_id = b.id
-- GROUP BY b.intitule, annees

-- {{ config(schema='WAREHOUSE') }}

-- SELECT
--     b.intitule,
--     EXTRACT(YEAR FROM TRY_TO_DATE(v.date_edit)) AS annees,
--     SUM(v.qte) AS total_qte

-- FROM {{ ref('stg_ventes') }} v
-- JOIN {{ ref('stg_books') }} b ON v.books_id = b.id

-- GROUP BY b.intitule, annees

{{ config(schema='WAREHOUSE') }}

SELECT
    b.intitule,
    EXTRACT(YEAR FROM TRY_TO_DATE(v.date_edit)) AS annees,
    SUM(v.qte) AS total_qte

FROM {{ ref('stg_ventes') }} v
JOIN {{ ref('stg_books') }} b ON v.books_id = b.id

GROUP BY b.intitule, annees