-- Ex4. Faça uma query que apresente o 
-- tamanho médio, máximo e mínimo do nome do objeto por categoria.
-- Considere apenas os objetos que tenham a descrição maior que 100. 
-- Exiba apenas as categorias com tamanho médio de descrição do
-- objeto maior que 500 caracteres.

SELECT  
product_category_name as categoria,
product_description_lenght,
AVG(product_name_lenght) AS med_tam_nome,
MAX(product_name_lenght) AS max_tam_nome,
MIN(product_name_lenght) AS min_tam_nome

FROM 
tb_products

WHERE product_description_lenght > 100

GROUP BY categoria
ORDER BY med_tam_nome DESC