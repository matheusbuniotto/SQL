-- JOINS

--- Qual o valor total de receita gerada por clientes de cada estado?
-- Considere a base completa, com apenas pedidos entregues

SELECT 

t1.order_id,
t1.order_item_id,
t1.product_id,
t2.product_category_name,
t1.price

FROM tb_order_items t1

LEFT JOIN tb_products t2

ON t1.product_id = t2.product_id

