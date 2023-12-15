WITH sales AS (
    SELECT
        *
    FROM "dev"."public"."vw_sales"
),
compradores AS (
    SELECT
        (firstname ||''|| lastname) as nome_completo,
        userid
    FROM users
),
top_10_compradores AS (
    SELECT
        compradores.nome_completo AS nome_completo,
        SUM(sales.quantidade_vendida) AS vendas_totais,
        sales.comissao AS comissao
    FROM compradores
    INNER JOIN sales
        ON sales.id_comprador = compradores.userid
    GROUP BY compradores.userid, compradores.nome_completo, sales.comissao
    ORDER BY vendas_totais DESC
    LIMIT 10
)
SELECT
    *
FROM top_10_compradores