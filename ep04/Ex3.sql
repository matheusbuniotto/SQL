
-- Qual o peso médio dos produtos vendidos por sellers de cada estado?
-- Considere apenas o ano de 2017 e pedidos entregues nesta análise.


SELECT 
        t3.seller_state as UF,
        avg(t2.product_weight_g) as peso_medio

FROM
    tb_order_items t1

LEFT JOIN tb_products t2
ON t1.product_id = t2.product_id

LEFT JOIN tb_sellers t3
ON t1.seller_id = t3.seller_id

LEFT JOIN tb_orders t4
ON t1.order_id = t4.order_id

WHERE t4.order_status = 'delivered'

GROUP BY t3.seller_state

HAVING t4.order_approved_at LIKE '2017%'

