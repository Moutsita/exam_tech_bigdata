-- warehouse.fact_books_jour.sql --
-- {{config(schema='WAREHOUSE')}}

-- SELECT
--     b.intitule,
--     TO_CHAR(v.date_edit, 'Day') AS jour,
--     SUM(v.qte) AS total_qte
-- FROM {{ ref('stg_ventes') }} v
-- JOIN {{ ref('stg_books') }} b ON v.books_id = b.id
-- GROUP BY b.intitule, jour

-- {{config(schema='WAREHOUSE')}}

-- SELECT
--     b.intitule,
--     TO_CHAR(TO_DATE(v.date_edit, 'YYYY-MM-DD'), 'DY') AS jour, -- 'DY' pour Lun, Mar, etc.
--     SUM(v.qte) AS total_qte
-- FROM {{ ref('stg_ventes') }} v
-- JOIN {{ ref('stg_books') }} b ON v.books_id = b.id
-- GROUP BY b.intitule, jour

-- {{ config(schema='WAREHOUSE') }}

-- SELECT
--     b.intitule,
--     TO_CHAR(TRY_TO_DATE(v.date_edit, 'YYYY-MM-DD'), 'DY') AS jour,
--     SUM(v.qte) AS total_qte
-- FROM {{ ref('stg_ventes') }} v
-- JOIN {{ ref('stg_books') }} b ON v.books_id = b.id
-- GROUP BY b.intitule, jour

-- {{ config(schema='WAREHOUSE') }}

-- SELECT
--     b.intitule,

--     CASE EXTRACT(DAYOFWEEK FROM TRY_TO_DATE(v.date_edit, 'YYYY-MM-DD'))
--         WHEN 1 THEN 'lundi'
--         WHEN 2 THEN 'mardi'
--         WHEN 3 THEN 'mercredi'
--         WHEN 4 THEN 'jeudi'
--         WHEN 5 THEN 'vendredi'
--         WHEN 6 THEN 'samedi'
--         WHEN 7 THEN 'dimanche'
--     END AS jour,

--     SUM(v.qte) AS total_qte

-- FROM {{ ref('stg_ventes') }} v
-- JOIN {{ ref('stg_books') }} b ON v.books_id = b.id
-- GROUP BY b.intitule, jour

-- {{ config(schema='WAREHOUSE') }}

-- SELECT
--     b.intitule,
--     CASE DAYNAME(TRY_TO_DATE(v.date_edit, 'YYYY-MM-DD'))
--         WHEN 'Mon' THEN 'lundi'    WHEN 'Tue' THEN 'mardi'
--         WHEN 'Wed' THEN 'mercredi' WHEN 'Thu' THEN 'jeudi'
--         WHEN 'Fri' THEN 'vendredi' WHEN 'Sat' THEN 'samedi'
--         WHEN 'Sun' THEN 'dimanche'
--     END AS jour,
--     SUM(v.qte) AS total_qte
-- FROM {{ ref('stg_ventes') }} v
-- JOIN {{ ref('stg_books') }} b ON v.books_id = b.id
-- GROUP BY b.intitule, jour

-- {{ config(schema='WAREHOUSE') }}

-- SELECT
--     b.intitule,
--     CASE DAYNAME(TRY_TO_DATE(v.date_edit, 'YYYY-MM-DD'))
--         WHEN 'Mon' THEN 'lundi'    WHEN 'Tue' THEN 'mardi'
--         WHEN 'Wed' THEN 'mercredi' WHEN 'Thu' THEN 'jeudi'
--         WHEN 'Fri' THEN 'vendredi' WHEN 'Sat' THEN 'samedi'
--         WHEN 'Sun' THEN 'dimanche'
--     END AS jour,
--     SUM(v.qte) AS total_qte
-- FROM {{ ref('stg_ventes') }} v
-- JOIN {{ ref('stg_books') }} b ON v.books_id = b.id
-- GROUP BY b.intitule, jour

{{ config(schema='WAREHOUSE') }}

SELECT
    b.intitule,
    TRIM(TO_CHAR(TRY_TO_DATE(v.date_edit), 'Day')) AS jour,
    SUM(v.qte) AS total_qte

FROM {{ ref('stg_ventes') }} v
JOIN {{ ref('stg_books') }} b ON v.books_id = b.id

GROUP BY b.intitule, jour