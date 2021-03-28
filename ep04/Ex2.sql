
-- Qual o valor total de receita gerada por 
-- sellers de cada estado? Considere a base completa,
-- com apenas pedidos entregues


SELECT 

       sum(t1.price) as receita,
       t2.seller_state

FROM
    tb_order_items t1

LEFT JOIN tb_sellers t2
ON t1.seller_id = t2.seller_id

LEFT JOIN tb_orders t3
ON t1.order_id = t3.order_id

WHERE t3.order_status = "delivered"

GROUP BY t2.seller_state

ORDER BY sum(t1.price) DESC
