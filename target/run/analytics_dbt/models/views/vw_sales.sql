

  create view "dev"."public"."vw_sales__dbt_tmp" as (
    with source_sales AS (
    SELECT
        *
    FROM sales
),
renamed AS (
    SELECT
        SALESID AS ID_VENDA,
        LISTID AS ID_LISTA,
        SELLERID AS ID_VENDEDOR,
        BUYERID AS ID_COMPRADOR,
        EVENTID AS ID_EVENTO,
        DATEID AS ID_DATE,
        QTYSOLD AS QUANTIDADE_VENDIDA,
        PRICEPAID AS VALOR_PAGO,
        COMMISSION AS COMISSAO,
        TO_CHAR(SALETIME, 'dd/mm/yyyy HH24:MI:SS') AS DATA_HORA_VENDA,
        CAST(SALETIME AS DATE) AS DATA_VENDA,
        TO_CHAR(SALETIME, 'HH24:MI:SS') AS HORA_VENDA
    FROM source_sales
)
SELECT 
    *
FROM renamed
  ) ;
