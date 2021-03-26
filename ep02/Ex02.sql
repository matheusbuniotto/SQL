-- Ex1. 2. Faça uma query que apresente o 
-- tamanho médio, máximo e mínimo do nome do objeto por categoria

SELECT  
product_category_name as categoria,
AVG(product_name_lenght) AS med_tam_nome,
MAX(product_name_lenght) AS max_tam_nome,
MIN(product_name_lenght) AS min_tam_nome

FROM 
tb_products

WHERE categoria IS NOT NULL
GROUP BY categoria
ORDER BY med_tam_nome DESC