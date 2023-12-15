-- define as variaveis meses e ano

{% set meses = ("JAN","FEV","MAR")%}
{% set ano = 2008 %}

-- cria a fonte com os dados de data e converte o nome das colunas

WITH source_date AS (
    SELECT
        dateid AS id_date,
        month AS mes,
        year AS ano
    FROM date
),
sales_date AS (
    SELECT
        source_date.mes,
        SUM(quantidade_vendida)
    FROM {{ ref('vw_sales') }} sales
    INNER JOIN source_date
        ON sales.id_date = source_date.id_date
    WHERE source_date.mes IN {{meses}}
        AND source_date.ano = '{{ano}}'
    GROUP BY source_date.mes
)
SELECT
    *
FROM sales_date