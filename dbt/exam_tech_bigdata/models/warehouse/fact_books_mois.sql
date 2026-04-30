-- warehouse.fact_books_mois.sql --
-- {{config(schema="WAREHOUSE")}}

-- SELECT
--     b.intitule,
--     TO_CHAR(v.date_edit, 'Month') AS mois,
--     SUM(v.qte) AS total_qte
-- FROM {{ ref('stg_ventes') }} v
-- JOIN {{ ref('stg_books') }} b ON v.books_id = b.id
-- GROUP BY b.intitule, mois

-- {{config(schema="WAREHOUSE")}}

-- SELECT
--     b.intitule,
--     TO_CHAR(TO_DATE(v.date_edit, 'YYYY-MM-DD'), 'MMMM') AS mois, -- 'MMMM' pour le nom complet du mois
--     SUM(v.qte) AS total_qte
-- FROM {{ ref('stg_ventes') }} v
-- JOIN {{ ref('stg_books') }} b ON v.books_id = b.id
-- GROUP BY b.intitule, mois

-- {{ config(schema='WAREHOUSE') }}

-- SELECT
--     b.intitule,

--     CASE EXTRACT(MONTH FROM TRY_TO_DATE(v.date_edit, 'YYYY-MM-DD'))
--         WHEN 1 THEN 'janvier'
--         WHEN 2 THEN 'fevrier'
--         WHEN 3 THEN 'mars'
--         WHEN 4 THEN 'avril'
--         WHEN 5 THEN 'mai'
--         WHEN 6 THEN 'juin'
--         WHEN 7 THEN 'juillet'
--         WHEN 8 THEN 'aout'
--         WHEN 9 THEN 'septembre'
--         WHEN 10 THEN 'octobre'
--         WHEN 11 THEN 'novembre'
--         WHEN 12 THEN 'decembre'
--     END AS mois,

--     SUM(v.qte) AS total_qte

-- FROM {{ ref('stg_ventes') }} v
-- JOIN {{ ref('stg_books') }} b ON v.books_id = b.id
-- GROUP BY b.intitule, mois

-- {{ config(schema='WAREHOUSE') }}

-- SELECT
--     b.intitule,
--     CASE EXTRACT(MONTH FROM TRY_TO_DATE(v.date_edit, 'YYYY-MM-DD'))
--         WHEN 1 THEN 'janvier' WHEN 2 THEN 'fevrier' WHEN 3 THEN 'mars'
--         WHEN 4 THEN 'avril'   WHEN 5 THEN 'mai'     WHEN 6 THEN 'juin'
--         WHEN 7 THEN 'juillet' WHEN 8 THEN 'aout'    WHEN 9 THEN 'septembre'
--         WHEN 10 THEN 'octobre' WHEN 11 THEN 'novembre' WHEN 12 THEN 'decembre'
--     END AS mois,
--     SUM(v.qte) AS total_qte
-- FROM {{ ref('stg_ventes') }} v
-- JOIN {{ ref('stg_books') }} b ON v.books_id = b.id
-- GROUP BY b.intitule, mois

{{ config(schema='WAREHOUSE') }}

SELECT
    b.intitule,
    TRIM(TO_CHAR(TRY_TO_DATE(v.date_edit), 'Month')) AS mois,
    SUM(v.qte) AS total_qte

FROM {{ ref('stg_ventes') }} v
JOIN {{ ref('stg_books') }} b ON v.books_id = b.id

GROUP BY b.intitule, mois