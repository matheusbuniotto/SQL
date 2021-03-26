-- lista de todas as categorias distintas de produto

SELECT  

CASE 
    WHEN product_category_name IS NULL THEN 'outros'
    ELSE product_category_name END AS categorias_sem_na

FROM 
    tb_products

GROUP BY product_category_name
ORDER BY 1