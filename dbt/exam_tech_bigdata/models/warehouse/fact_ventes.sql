-- warehouse.fact_ventes.sql --
{{config(schema='WAREHOUSE')}}

SELECT
    id,
    code,
    pu,
    qte,
    date_edit,
    EXTRACT(YEAR FROM date_edit) AS annees,
    TO_CHAR(date_edit, 'Month') AS mois,
    TO_CHAR(date_edit, 'Day') AS jour,
    factures_id,
    books_id
FROM {{ ref('stg_ventes') }}