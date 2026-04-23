-- warehouse.fact_factures.sql --
{{config(schema='WAREHOUSE')}}

SELECT
    id,
    code,
    date_edit,
    customers_id,
    qte_totale,
    total_amount,
    total_paid,
    EXTRACT(YEAR FROM date_edit) AS annees,
    TO_CHAR(date_edit, 'Month') AS mois,
    TO_CHAR(date_edit, 'Day') AS jour
FROM {{ ref('stg_factures') }}