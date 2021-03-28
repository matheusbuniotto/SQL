-- Função WITH

-- A receita por estado do seller, por produto da categoria mais vendida
-- use apenas vendas entregues

WITH tb_melhor_categoria AS ( 

    /* RETORNA AS 3 CATEGORIA COM MAIS VENDAS */ 

        SELECT t2.product_category_name

        FROM tb_order_items t1

        LEFT JOIN tb_products t2
        ON t1.product_id = t2.product_id

        GROUP BY t2.product_category_name
        ORDER BY count(*) DESC
        LIMIT 3

),
    tb_vendas AS (
    /* RETORNA AS VENDAS COM STATUS "DELIVERED" */ 
        SELECT * 
        FROM tb_orders t1
        WHERE t1.order_status = 'delivered'
),
    tb_receita_estado_produto AS (
    /* RETORNA O ESTADO E RECEITA DAS VENDAS DOS PRODUTOS" */ 

        SELECT 
        t2.seller_state,
        t1.product_id,
        t3.product_category_name,
        sum(t1.price) AS receita_vendas
        
        FROM
        tb_order_items t1

        LEFT JOIN tb_sellers t2
        ON t1.seller_id = t2.seller_id
        
        LEFT JOIN tb_products t3
        ON t1.product_id = t3.product_id

        INNER JOIN tb_vendas as t4
        ON t1.order_id = t4.order_id

        GROUP BY 
        t2.seller_state,
        t1.product_id,
        t3.product_category_name

)


    /* INNER JOIN DA CATEGORIA MAIS VENDIDA E A
     TABELA COM RECEITA POR ESTADO DO SELLER E PRODUTO */ 

SELECT t1.* 

FROM tb_receita_estado_produto t1

INNER JOIN tb_melhor_categoria t2
ON t1.product_category_name = t2.product_category_name

ORDER BY receita_vendas DESC

