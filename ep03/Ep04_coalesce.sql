-- lista de todas as categorias distintas de produto


SELECT DISTINCT 
COALESCE(product_category_name, 'outros') AS categoria_sem_na

FROM tb_products
