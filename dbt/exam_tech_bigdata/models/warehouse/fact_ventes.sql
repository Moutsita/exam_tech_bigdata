-- -- warehouse.fact_ventes.sql --
-- {{config(schema='WAREHOUSE')}}

-- SELECT
--     id,
--     code,
--     pu,
--     qte,
--     date_edit,
--     EXTRACT(YEAR FROM date_edit) AS annees,
--     TO_CHAR(date_edit, 'Month') AS mois,
--     TO_CHAR(date_edit, 'Day') AS jour,
--     factures_id,
--     books_id
-- FROM {{ ref('stg_ventes') }}

-- {{ config(schema='WAREHOUSE') }}

-- SELECT
--     v.*,

--     EXTRACT(YEAR FROM TRY_TO_DATE(v.date_edit, 'YYYY-MM-DD')) AS annees,

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

--     CASE EXTRACT(DAYOFWEEK FROM TRY_TO_DATE(v.date_edit, 'YYYY-MM-DD'))
--         WHEN 1 THEN 'lundi'
--         WHEN 2 THEN 'mardi'
--         WHEN 3 THEN 'mercredi'
--         WHEN 4 THEN 'jeudi'
--         WHEN 5 THEN 'vendredi'
--         WHEN 6 THEN 'samedi'
--         WHEN 7 THEN 'dimanche'
--     END AS jour

-- FROM {{ ref('stg_ventes') }} v

{{ config(schema='WAREHOUSE') }}

SELECT
    v.*,

    EXTRACT(YEAR FROM TRY_TO_DATE(v.date_edit)) AS annees,

    TRIM(TO_CHAR(TRY_TO_DATE(v.date_edit), 'Month')) AS mois,

    TRIM(TO_CHAR(TRY_TO_DATE(v.date_edit), 'Day')) AS jour

FROM {{ ref('stg_ventes') }} v