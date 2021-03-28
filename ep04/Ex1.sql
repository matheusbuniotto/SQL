-- Qual o valor total de receita gerada por clientes de cada estado?
-- Considere a base completa, com apenas pedidos entregues


SELECT 
       t2.customer_id,
       sum(t1.price) as valor_vendas,
       t3.customer_state


FROM
    tb_order_items t1


LEFT JOIN tb_orders t2
ON t1.order_id = t2.order_id

LEFT JOIN tb_customers t3
ON t2.customer_id = t3.customer_id


WHERE t2.order_status = "delivered"

GROUP BY t3.customer_state

ORDER BY sum(t1.price) DESC