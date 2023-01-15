USE pizzeria; 

INSERT INTO province (province_name) 
VALUES ('Barcelona'), 
	   ('Girona'), 
       ('Lleida'), 
       ('Tarragona'); 

INSERT INTO locality (locality_name, province_province_id) 
VALUES ('Barcelona', 1), 
	   ('Vic', 1), 
       ('Badalona', 1), 
       ('Mataró', 1), 
       ('Girona', 2), 
       ('Arbúcies', 2),
       ('Lleida', 3), 
       ('Guissona', 3), 
       ('Tarragona', 4), 
       ('Amposta', 4); 

INSERT INTO customer (customer_name, customer_surname1, customer_surname2, customer_phone, customer_address, customer_zip, locality_locality_id, province_province_id) 
VALUES ('Paula', 'Moral', 'Fernández', '629723573', 'C/ Palomar nº6, 3r, 2ª', '08030', 1, 1), 
	   ('Roger', 'Pérez', DEFAULT, '624449000', 'C/ Francesc Carbonell nº 23, 5è, 1ª', '08034', 1, 1), 
       ('Martí', 'Sanmartí', 'Solé', '622170369', 'C/ Verdi nº 56, 1r, 4ª', '08012', 1, 1), 
       ('Carla', 'Martínez', 'Varela', '635892551', 'C/ Sant Sebastià nº 4, 1r, 1ª', '25210', 8, 3), 
       ('Bruna', 'López', 'Ventura', '729582842', 'C/ Murillo nº 9, 1r, 2ª', '43870', 10, 4); 

INSERT INTO shop (shop_name, shop_address, shop_zip, locality_locality_id, province_province_id) 
VALUES ('Bacoa', 'Ronda Universitat nº 31', '08007', 1, 1), 
	   ('Pizzeria Pulvinar', 'Carrer dels Ferrers nº 20', '43003', 9, 4), 
       ('Pizzeria San Marino', 'Passeig Marítim nº5', '08912', 3, 1), 
       ('König Vic', 'C/ Camí de la Tolosa nº 16', '08500', 2, 1), 
       ('König Migdia', 'C/ Migdia nº 7', '17002', 5, 2), 
       ('Garage Beer Co', 'C/ del Consell de Cent nº 261', '08011', 1, 1), 
       ('La casa de les 3 àmfores', 'C/ Magí Morera nº 40', '25006', 7, 3), 
       ('Pizzeria el Niu', 'C/ Francesc Camprodon nº 67', '17401', 6, 2), 
       ('El celler de Guissona', 'Avinguda Generalitat de Catalunya nº 15', '25210', 8, 3), 
       ('Goiko', 'C/ de la Riera nº 89', '08301', 4, 1); 
       
INSERT INTO employee (employee_type, employee_name, employee_surname1, employee_surname2, employee_nif, employee_phone, shop_shop_id) 
VALUES ('C', 'Carles', 'Quintero', 'Roca', '56226467E', '612255094', 9),  
	   ('C', 'Pau', 'Molina', 'Ortega', '35523859Y', '626237057', 3), 
       ('C', 'Marta', 'Muntaner', 'Pascual', '54472490T', '658203853', 8), 
       ('D', 'Ricard', 'Roma', 'Boix', '97247473P', '685686385', 1), 
       ('D', 'Pilar', 'Closa', 'Romeu', '23562389E', '639594937', 10), 
       ('D', 'Miquel', 'Roig', 'Otero', '36286274J', '696040045', 4), 
       ('C', 'Alba', 'Garcia', 'Soriano', '26829576E', '724677875', 7), 
       ('D', 'Alex', 'Segura', 'Ferrando', '78367236W', '623698676', 6), 
       ('C', 'Jordi', 'Aranda', DEFAULT, '23487623K', '606382933', 2), 
       ('D', 'Ariadna', 'Clotet', 'Alejandres', '68353683E', '684284528', 5); 
       
INSERT INTO purchase (purchase_type, purchase_datetime, purchase_delivery_datetime, shop_shop_id, customer_customer_id) 
VALUES ('H', '2022-10-24 21:30:23', '2022-10-24 22:12:27', 1, 3), 
	   ('H', '2022-11-12 14:23:56', '2022-10-24 15:03:47', 10, 4), 
       ('S', '2022-10-24 19:57:29', DEFAULT, 6, 1), 
       ('S', '2023-01-05 15:21:34', DEFAULT, 5, 2), 
       ('H', '2022-04-30 13:14:24', '2022-04-30 13:39:56', 2, 4), 
       ('S', '2021-10-15 14:56:23', DEFAULT, 7, 5);

INSERT INTO categoryP (categoryP_name) 
VALUES ('Bàsica'), 
	   ('Premium'), 
       ('Especial'), 
       ('Supreme'); 
       
INSERT INTO product (product_type, product_name, product_description, product_picture, product_price, categoryP_categoryP_id) 
VALUES ('P', 'Margherita', 'Mozzarella, tomàquet i alfàbrega', 'https://barcelona.lecool.com/files/2017/10/4-IMG_6738.jpg', 11.50, 1), 
	   ('P', 'Mallorquina', 'Sobrassada picant de Mallorca, taleggio i farigola', 'https://media.cntraveler.com/photos/6201513e4b72c98031e0c6b8/16:9/w_2560%2Cc_limit/Parking%2520Pizza_4I5A4830.jpeg', 11.75, 3), 
       ('P', 'Trufada', 'Tòfona negra, fontina, ou i parmesà', 'https://barcelonandme.com/wp-content/uploads/2017/12/Parking-Pizza-9.jpg', 14.90, 2), 
       ('H', 'Número 2', 'Hamburguesa, ou, salsa brava i formatge', 'https://www.konig.cat/wp-content/uploads/2015/12/premium-girona.jpg', 4.50, DEFAULT), 
       ('H', 'Premium 1973', 'Hamburguesa de 200 grams, formatge de cabra, tomàquets baby, parmesà i salsa pitta', 'https://media-cdn.tripadvisor.com/media/photo-p/0f/96/3d/5a/hamburguesa-premium-1973.jpg', 5.35, DEFAULT), 
       ('H', 'Premium König', 'Hamburguesa de 200 grams, enciam, tomàquet, formatge, bacon i salsa barbacoa', 'https://www.konig.cat/wp-content/uploads/2015/12/1865.jpg', 5.25, DEFAULT), 
       ('B', 'Mad Pony', DEFAULT, 'https://garagebeer.co/wp-content/uploads/2022/12/mad-pony-Negro_Mockup-1.jpg', 5.50, DEFAULT), 
       ('B', 'Santako', DEFAULT, 'https://garagebeer.co/wp-content/uploads/2021/05/GBC_May21_23-768x768.jpg', 3.75, DEFAULT), 
       ('B', 'Zenon', DEFAULT, 'https://garagebeer.co/wp-content/uploads/2022/11/zenon-Negro_Mockup-1.jpg', 6.50, DEFAULT); 
       
INSERT INTO purchase_has_product (purchase_purchase_id, product_product_id, amount_product, purchase_total_price) 
VALUES (3, 1, 2, 23), 
	   (3, 4, 1, 4.50), 
       (5, 3, 2, 29.8), 
       (5, 8, 2, 7.5), 
       (6, 6, 1, 5.25), 
       (6, 5, 3, 16.05), 
       (6, 9, 2, 13), 
       (1, 2, 1, 11.75), 
       (1, 7, 2, 11); 

INSERT INTO purchase_has_product (purchase_purchase_id, product_product_id, amount_product, purchase_total_price) 
VALUES (6, 7, 3, 16.50), 
	   (6, 8, 1, 3.75);


 