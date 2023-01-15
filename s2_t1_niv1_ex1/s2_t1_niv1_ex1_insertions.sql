USE optica;

INSERT INTO address (address_street, address_number, address_floor, address_door, address_city, address_zip, address_country) 
VALUES ('C/ Ganduxer', '80', '3', '2', 'Barcelona', '08021', 'Espanya'), 
	   ('C/ Llacuna', '114', '5', '2', 'Barcelona', '08018', 'Espanya'), 
       ('C/ de Guardiola i Feliu', '2', '1', '3', 'Barcelona', '08030', 'Espanya'), 
       ('C/ de Sant Ignasi', '28', DEFAULT, DEFAULT, 'Vilassar de Mar', '08340', 'Espanya'), 
       ('C/ Cruspinera', '35', DEFAULT, DEFAULT, 'Tiana', '08391', 'Espanya'), 
       ('C/ Gran de Gràcia', '88', DEFAULT, DEFAULT, 'Barcelona', '08012', 'Espanya'), 
       ('C/ Cardenal Cisneros', '52', DEFAULT, DEFAULT, 'Gandia', '46701', 'Espanya'), 
       ('Rietveldenweg', '47F', DEFAULT, DEFAULT, 'Hertogenbosch', '5222', 'Països Baixos'); 

INSERT INTO provider (provider_name, provider_phone, provider_fax, provider_nif, provider_address_id) 
VALUES ('Miller & Marc', '647968433', '912989398', 'B57552294', 6), 
	   ('Green Medical', '962965732', '962965733', 'B85587227', 7), 
       ('Solo Solis', '884263999', DEFAULT, 'A35777333', 8);        

INSERT INTO customer (customer_name, customer_phone, customer_email, 
customer_registration, customer_address_id) 
VALUES ('Marc Martínez', '645335589', 'marc.martinez89@gmail.com', '2021-01-24 16:21:45', 1), 
       ('Alba Esteve', '624490209', 'albita.es@hotmail.com', '2021-03-04 17:23:55', 2), 
       ('Mireia Català', '622561127', 'mireiac88@hotmail.es', '2021-06-28 16:43:21', 3), 
       ('Albert Rodríguez', '656664250', 'albert_rodriguez@gmail.com', '2022-03-14 18:28:47', 4), 
       ('Glòria López', '689946723', 'gloria1992@hotmail.com', '2023-01-04 12:14:17', 5);
       
INSERT INTO glasses (glasses_brand, glasses_graduation_R, glasses_graduation_L, glasses_frame, 
glasses_colour_frame, glasses_colour_glass_R, glasses_colour_glass_L, glasses_price, provider_provider_id) 
VALUES ('Vogue', 3.5, 3.0, 'P', 'vermell', 'transparent', 'transparent', 155.79, 2), 
	   ('Carolina Herrera', 1.25, 1.5, 'M', 'gris', 'transparent', 'transparent', 179.89, 1), 
       ('Tous', 2.0, 2.25, 'F', 'marró', 'transparent', 'transparent', 132.50, 2), 
       ('Arnette', 0, 0, 'P', 'negra', 'blau', 'blau', 115.35, 3), 
       ('Ray Ban', 1.5, 1.5, 'P', 'blau', 'marró', 'marró', 210.25, 1); 
       
INSERT INTO sale (sale_employee, sale_date, glasses_glasses_id, customer_customer_id) 
VALUES ('Clara Soler', '2021-03-13 16:34:55', 1, 1), 
	   ('Martí Vidal', '2021-11-14 11:38:25', 3, 2), 
       ('Clara Soler', '2021-12-28 16:12:33', 5, 3), 
       ('Clara Soler', '2022-10-06 10:36:28', 4, 4), 
       ('Martí Vidal', '2022-12-23 18:37:47', 2, 5); 
       
UPDATE customer 
SET customer_recommendation_id = '1' 
WHERE customer_id IN (3, 4); 

INSERT INTO sale (sale_employee, sale_date, glasses_glasses_id, customer_customer_id) 
VALUES ('Clara Soler', '2021-05-21 11:12:45', 5, 1), 
	   ('Martí Vidal', '2021-07-21 19:13:55', 2, 1);
       
INSERT INTO provider (provider_name, provider_phone, provider_fax, provider_nif, provider_address_id) 
VALUES ('Baloby', '687208194', '962279038', 'B27011174', 4); 
       