USE optica;
-- Llista el total de factures d'un client/a en un període determinat:
SELECT c.customer_name AS 'Client',  
	   s.sale_date AS 'Date', 
       g.glasses_price AS 'Price'  
FROM glasses g 
JOIN sale s 
	ON s.glasses_glasses_id = g.glasses_id 
JOIN customer c 
	ON c.customer_id = s.customer_customer_id 
WHERE c.customer_id = 1 AND s.sale_date <= '2021-05-31' 
ORDER BY g.glasses_price DESC; 

-- Llista els diferents models d'ulleres que ha venut un empleat/da durant un any:
SELECT s.sale_employee AS 'Seller', 
	   s.sale_date AS 'Date', 
       g.glasses_brand AS 'Brand', 
       g.glasses_price AS 'Price' 
FROM glasses g 
JOIN sale s 
	ON g.glasses_id = s.glasses_glasses_id 
WHERE s.sale_employee = 'Clara Soler' 
AND s.sale_date BETWEEN '2021-01-01' AND '2021-12-31' 
ORDER BY s.sale_date; 

-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica:
SELECT p.provider_name AS 'Provider', 
	   g.glasses_brand AS 'Brand', 
       s.sale_date AS 'Date' 
FROM sale s 
JOIN glasses g 
	ON s.glasses_glasses_id = g.glasses_id 
JOIN provider p 
	ON p.provider_id = g.provider_provider_id 
ORDER BY p.provider_name;
       
