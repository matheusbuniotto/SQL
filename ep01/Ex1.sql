--- Ex1: Quantos produtos temos da categoria 'artes'?

SELECT 
    product_category_name AS categoria,
    count(product_category_name) as total
FROM
    tb_products
WHERE product_category_name = 'artes'
GROUP BY 
product_category_name


Ex2: Quantos produtos tem mais de 5 litros?

