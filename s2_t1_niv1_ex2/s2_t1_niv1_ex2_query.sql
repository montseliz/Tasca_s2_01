USE pizzeria; 
-- Llista quants productes de categoria 'Begudes' s'han venut en una determinada localitat:
SELECT l.locality_name AS 'Locality', 
	   p.product_name AS 'Product', 
       p.product_type AS 'Type', 
       s.shop_name AS 'Shop', 
       pu.purchase_datetime AS 'Sale', 
       pp.amount_product AS 'Quantity' 
FROM locality l 
JOIN shop s 
JOIN product p
JOIN purchase pu
JOIN purchase_has_product pp 
	ON l.locality_id = s.locality_locality_id AND s.shop_id = pu.shop_shop_id AND p.product_id = pp.product_product_id AND pu.purchase_id = pp.purchase_purchase_id 
WHERE p.product_type = 'B' AND l.locality_id = 7;

-- Llista quantes comandes ha efectuat un determinat empleat/da: 
SELECT e.employee_name AS 'Name', 
	   e.employee_surname1 AS 'Surname', 
       e.employee_surname2 AS 'Second surname', 
       s.shop_name AS 'Shop', 
       count(p.purchase_datetime) AS 'Total orders' 
FROM shop s  
JOIN employee e  
JOIN purchase p 
	ON s.shop_id = e.shop_shop_id AND s.shop_id = p.shop_shop_id 
WHERE e.employee_id = 10 
GROUP BY e.employee_name; 
       