-- lista de todas as categorias distintas de produto

SELECT DISTINCT

CASE 
    WHEN product_category_name IS NULL THEN 'outros'
    
    WHEN product_category_name = 'alimentos' 
        OR product_category_name = 'alimentos_bebidas'
        THEN 'alimentos'

    WHEN product_category_name IN ('artes','artes_e_artesanato') 
        THEN 'artes'
    
    WHEN product_category_name LIKE '%artigos%' THEN 'artigos'
    WHEN product_category_name LIKE '%casa%' THEN 'casa'


    ELSE product_category_name 
END AS categorias_sem_na

FROM 
    tb_products

GROUP BY product_category_name
ORDER BY 1