-- teste generico, pode ser aplicado para qualquer tabela e coluna

{%test nao_negativo(model,column_name)%}


SELECT
    *
FROM {{ model }}
WHERE {{ column_name }} < 0

{%% endtest}