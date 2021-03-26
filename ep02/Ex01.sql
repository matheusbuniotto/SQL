-- Ex1. Faça uma query que apresente o 
-- tamanho médio, máximo e mínimo da descrição do objeto por categoria

SELECT product_category_name AS categoria,
AVG(product_description_lenght) AS Tam_med,
MIN(product_description_lenght) AS Tam_min,
MAX(product_description_lenght) AS Tam_max
FROM 
tb_products

WHERE categoria IS NOT NULL 
GROUP BY categoria
ORDER BY Tam_med DESC
