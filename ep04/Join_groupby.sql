-- JOINS

--- Qual o valor total de receita gerada por clientes de cada estado?
-- Considere a base completa, com apenas pedidos entregues

SELECT 
t2.product_category_name,
SUM(t1.price) AS receita,
COUNT(*) AS Total_de_vendas

FROM tb_order_items t1

LEFT JOIN tb_products t2
ON t1.product_id = t2.product_id

GROUP BY t2.product_category_name   
ORDER BY SUM(t1.price) DESC

LIMIT 10