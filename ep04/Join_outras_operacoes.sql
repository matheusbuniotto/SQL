-- JOINS

--- Qual o peso médio dos produtos vendidos por sellers de cada estado? 
--- Considere apenas o ano de 2017 e pedidos entregues nesta análise.




SELECT 
t3.order_approved_at,
t2.product_category_name,
SUM(t1.price) AS receita,
COUNT(*) AS Total_de_vendas,
COUNT(DISTINCT t1.order_id) AS Qtd_pedidos,
COUNT(*)/CAST(COUNT(DISTINCT t1.order_id) AS FLOAT) AS Media_itens_por_compra



FROM tb_order_items t1

LEFT JOIN tb_products t2
ON t1.product_id = t2.product_id

LEFT JOIN tb_orders t3
ON t1.order_id = t3.order_id

WHERE t3.order_status = "delivered" 
AND strftime('%Y',t3.order_approved_at) = '2017'

GROUP BY t2.product_category_name   
ORDER BY COUNT(*)/CAST(COUNT(DISTINCT t1.order_id) AS FLOAT) DESC


LIMIT 10