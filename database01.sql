------------- ZAKLÁDACÍ SKRIPTY ---------------

DROP TABLE payments;
DROP TABLE delivery;
DROP TABLE orders;
DROP TABLE users;
DROP TABLE prices;
DROP TABLE products;

-- CREATING TABLES
-------- users
CREATE TABLE users (
    user_id             NUMBER(22)                     NOT NULL,
    first_name          VARCHAR2(500)          		   NOT NULL,
    surname             VARCHAR2(500)                  NOT NULL,
    email               VARCHAR2(500)                  NOT NULL,
    phone_number        NUMBER(9)                      NOT NULL,
    address             VARCHAR2(500)                  NOT NULL,
    
    CONSTRAINT users_pk PRIMARY KEY (user_id)

);

-------- products
CREATE TABLE products (
    product_id           NUMBER(22)                    NOT NULL,
    product_name         VARCHAR2(500)          	   NOT NULL,
    product_brand        VARCHAR2(200)                 NOT NULL,
    product_info         VARCHAR2(500)                 NOT NULL,
    product_category     VARCHAR2(500)                 NOT NULL,

    CONSTRAINT products_pk PRIMARY KEY (product_id)
);

-------- orders
CREATE TABLE orders (
    order_id             NUMBER(22)                    NOT NULL,
    user_id              NUMBER(22)                    NOT NULL,
    product_id           NUMBER(22)                    NOT NULL,
    date_of_order        DATE                          NOT NULL,
    time_of_order        TIMESTAMP ,
    
    CONSTRAINT order_pk PRIMARY KEY (order_id),
    CONSTRAINT fk_users 
      FOREIGN KEY (user_id) 
      REFERENCES users(user_id),
      
    CONSTRAINT fk_products
      FOREIGN KEY (product_id) 
      REFERENCES products(product_id)
);

-------- payments
CREATE TABLE payments (
    payment_id           NUMBER(22)                    NOT NULL,
    order_id             NUMBER(22)                    NOT NULL,
    payment_method       VARCHAR(50)                   NOT NULL,
    payment_status       VARCHAR(50)                   NOT NULL,
    
    CONSTRAINT payments_pk PRIMARY KEY (payment_id),
    CONSTRAINT fk_orders
      FOREIGN KEY (order_id) 
      REFERENCES orders(order_id)
);


-------- delivery
CREATE TABLE delivery (
    delivery_id           NUMBER(22)                    NOT NULL,
    order_id              NUMBER(22)                    NOT NULL,
    delivery_status       VARCHAR(50)                   NOT NULL,
    
    CONSTRAINT delivery_pk PRIMARY KEY (delivery_id) ,
    CONSTRAINT fk_orders2
      FOREIGN KEY (order_id) 
      REFERENCES orders(order_id) 
);

-------- prices
CREATE TABLE prices (
    product_id           NUMBER(22)                    NOT NULL,
    product_price        NUMBER(22)                    NOT NULL,

    CONSTRAINT prices_pk PRIMARY KEY (product_id) ,
    CONSTRAINT fk_prices
      FOREIGN KEY (product_id) 
      REFERENCES products(product_id) 
);


-- ADDING DATA
-------- users
INSERT INTO users (user_id, first_name, surname, email, phone_number, address) VALUES (1, 'Anna', 'Smith', 'anna@gmail.com', 293840586, 'Trafalgar Square 38, London');
INSERT INTO users (user_id, first_name, surname, email, phone_number, address) VALUES (2, 'Becky', 'Sam', 'beckysam@yahoo.com', 682589056, 'Cloudy street 109/16, Swansea');
INSERT INTO users (user_id, first_name, surname, email, phone_number, address) VALUES (3, 'Cornelia', 'Black', 'cblack@gmail.com', 552790568, 'No Name 490, Cambridge');
INSERT INTO users (user_id, first_name, surname, email, phone_number, address) VALUES (4, 'Danielle', 'Seven', 'danielle@gmail.com', 183740289, 'Notgonnasay 103, Birmingham');
INSERT INTO users (user_id, first_name, surname, email, phone_number, address) VALUES (5, 'Eve', 'Unforgettable', 'eveun@gmail.com', 837402839, 'Queens st. 82, Manchester');

-------- products
INSERT INTO products (product_id, product_name, product_brand, product_info, product_category) VALUES (1000, 'Make-up Perfection', 'Essence', 'Make up for effect of perfect skin', 'Make-up');
INSERT INTO products (product_id, product_name, product_brand, product_info, product_category) VALUES (1001, 'Easy Black Liner', 'Catrice', 'Eyeliner, color: black', 'Eyeliners');
INSERT INTO products (product_id, product_name, product_brand, product_info, product_category) VALUES (1002, 'Great Lash - black', 'Maybelline', 'Black mascara for every day wear', 'Mascaras');
INSERT INTO products (product_id, product_name, product_brand, product_info, product_category) VALUES (1003, 'Great Lash - brown', 'Maybelline', 'Black mascara for every day wear', 'Mascaras');
INSERT INTO products (product_id, product_name, product_brand, product_info, product_category) VALUES (1004, 'Great Lash - blue', 'Maybelline', 'Black mascara for every day wear', 'Mascaras');

-------- orders
INSERT INTO orders (order_id, user_id, product_id, date_of_order, time_of_order) VALUES (1, 4, 1002, DATE '2019-11-29', TIMESTAMP '2019-11-29 07:00:01');
INSERT INTO orders (order_id, user_id, product_id, date_of_order, time_of_order) VALUES (2, 1, 1000, DATE '2020-04-02', TIMESTAMP '2020-04-02 03:05:27');
INSERT INTO orders (order_id, user_id, product_id, date_of_order, time_of_order) VALUES (3, 3, 1002, DATE '2020-08-06', TIMESTAMP '2020-08-06 07:11:11');
INSERT INTO orders (order_id, user_id, product_id, date_of_order, time_of_order) VALUES (4, 2, 1004, DATE '2020-10-17', TIMESTAMP '2020-10-17 17:00:56');
INSERT INTO orders (order_id, user_id, product_id, date_of_order, time_of_order) VALUES (5, 2, 1001, DATE '2020-11-19', TIMESTAMP '2020-11-19 21:08:03');
INSERT INTO orders (order_id, user_id, product_id, date_of_order, time_of_order) VALUES (6, 5, 1003, DATE '2020-12-01', TIMESTAMP '2020-12-01 20:00:41');
INSERT INTO orders (order_id, user_id, product_id, date_of_order, time_of_order) VALUES (7, 5, 1004, DATE '2020-12-08', TIMESTAMP '2020-12-08 23:36:23');
INSERT INTO orders (order_id, user_id, product_id, date_of_order, time_of_order) VALUES (8, 4, 1003, DATE '2021-01-14', TIMESTAMP '2021-01-14 21:52:17');
INSERT INTO orders (order_id, user_id, product_id, date_of_order, time_of_order) VALUES (9, 2, 1000, DATE '2021-03-30', TIMESTAMP '2021-03-30 23:12:45');
INSERT INTO orders (order_id, user_id, product_id, date_of_order, time_of_order) VALUES (10, 2, 1000, DATE '2021-04-18', TIMESTAMP '2021-04-18 00:10:41');

-------- payments
INSERT INTO payments (payment_id, order_id, payment_method, payment_status) VALUES (1, 1, 'card','paid');
INSERT INTO payments (payment_id, order_id, payment_method, payment_status) VALUES (2, 7, 'card','paid');
INSERT INTO payments (payment_id, order_id, payment_method, payment_status) VALUES (3, 2, 'cash','paid');
INSERT INTO payments (payment_id, order_id, payment_method, payment_status) VALUES (4, 3, 'cash','paid');
INSERT INTO payments (payment_id, order_id, payment_method, payment_status) VALUES (5, 4, 'bitcoin','paid');
INSERT INTO payments (payment_id, order_id, payment_method, payment_status) VALUES (6, 5, 'card','paid');
INSERT INTO payments (payment_id, order_id, payment_method, payment_status) VALUES (7, 6, 'card','not paid');
INSERT INTO payments (payment_id, order_id, payment_method, payment_status) VALUES (8, 8, 'cash','paid');
INSERT INTO payments (payment_id, order_id, payment_method, payment_status) VALUES (9, 10, 'bitcoin','paid');
INSERT INTO payments (payment_id, order_id, payment_method, payment_status) VALUES (10, 9, 'card','paid');

-------- delivery
INSERT INTO delivery (delivery_id, order_id, delivery_status) VALUES (1, 1, 'delivered');
INSERT INTO delivery (delivery_id, order_id, delivery_status) VALUES (2, 3, 'delivered');
INSERT INTO delivery (delivery_id, order_id, delivery_status) VALUES (3, 2, 'delivered');
INSERT INTO delivery (delivery_id, order_id, delivery_status) VALUES (4, 4, 'delivered');
INSERT INTO delivery (delivery_id, order_id, delivery_status) VALUES (5, 5, 'delivered');
INSERT INTO delivery (delivery_id, order_id, delivery_status) VALUES (6, 6, 'not delivered');
INSERT INTO delivery (delivery_id, order_id, delivery_status) VALUES (7, 7, 'delivered');
INSERT INTO delivery (delivery_id, order_id, delivery_status) VALUES (8, 8, 'delivered');
INSERT INTO delivery (delivery_id, order_id, delivery_status) VALUES (9, 9, 'delivered');
INSERT INTO delivery (delivery_id, order_id, delivery_status) VALUES (10, 10, 'delivered');

-------- prices
INSERT INTO prices (product_id, product_price) VALUES (1000, 300);
INSERT INTO prices (product_id, product_price) VALUES (1001, 120);
INSERT INTO prices (product_id, product_price)  VALUES (1002, 180);
INSERT INTO prices (product_id, product_price)  VALUES (1003, 180);
INSERT INTO prices (product_id, product_price)  VALUES (1004, 180);


-- TESTING QUERY
SELECT * FROM users;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM payments;
SELECT * FROM delivery;



------------- DOTAZY ---------------



-------- Všechny objednávky a jejich info? (LEFT JOIN, ORDER BY)
SELECT *
FROM orders
LEFT JOIN users ON orders.user_id = users.user_id
FULL OUTER JOIN products ON orders.product_id = products.product_id
ORDER BY orders.order_id 
;

-------- Celkový výpis všech objednávek shluknutý dle user_id (GROUP BY)
SELECT DISTINCT users.user_id
              , users.first_name
              , users.surname
              , orders.order_id
              , products.product_name
              , prices.product_price
FROM orders
LEFT JOIN users ON orders.user_id = users.user_id
JOIN products ON orders.product_id = products.product_id
JOIN prices ON products.product_id = prices.product_id
GROUP BY users.user_id, users.first_name, users.surname, orders.order_id, products.product_name, prices.product_price
ORDER BY users.user_id
;

-------- Kteří zákazníci utratili nejvíce? (SUM + OVER + PARTITION BY, GROUP BY, ORDER BY)
SELECT DISTINCT users.user_id
              , users.first_name
              , users.surname
              , SUM(prices.product_price) OVER(PARTITION BY users.user_id) AS money_spent
FROM orders
LEFT JOIN users ON orders.user_id = users.user_id
JOIN products ON orders.product_id = products.product_id
JOIN prices ON products.product_id = prices.product_id
GROUP BY users.user_id, users.first_name, users.surname, orders.order_id, products.product_name, prices.product_price
ORDER BY money_spent DESC
;

-------- Kteří zákazníci stihli uskutečnit svůj nákup od listopadu do Vánoc 2020? (HAVING + BETWEEN TO_DATE AND TO_DATE)
SELECT DISTINCT users.user_id
              , users.first_name
              , users.surname
              , orders.order_id
              , products.product_name
              , orders.date_of_order
FROM orders
LEFT JOIN users ON orders.user_id = users.user_id
JOIN products ON orders.product_id = products.product_id
GROUP BY users.user_id, users.first_name, users.surname, orders.order_id, products.product_name, orders.date_of_order
HAVING orders.date_of_order BETWEEN TO_DATE('01/11/2020', 'DD/MM/YYYY') AND TO_DATE('23/12/2020', 'DD/MM/YYYY')
;


-------- Výpis uživatelů, kteří zakoupili řasenky (INNER JOIN, WHERE LIKE + OR)
SELECT DISTINCT users.user_id
              , users.first_name
              , users.surname
              , orders.order_id
              , products.product_name
              , products.product_category
              , prices.product_price
FROM orders
LEFT JOIN users ON orders.user_id = users.user_id
JOIN products ON orders.product_id = products.product_id
JOIN prices ON products.product_id = prices.product_id
WHERE products.product_name LIKE '%lash%' OR product_category LIKE '%Mascara%'
GROUP BY users.user_id
       , users.first_name
       , users.surname
       , orders.order_id
       , products.product_name
       , products.product_category
       , prices.product_price
ORDER BY users.user_id
;

-------- Pokud v minulosti uživatel na eshopu už nakoupil, jaké je datum předchozího nákupu uživatele? + označení, pokud to bylo v roce 2020
SELECT DISTINCT users.user_id
              , orders.order_id
              , orders.date_of_order
              , LAG(orders.date_of_order) OVER(PARTITION BY users.user_id ORDER BY orders.date_of_order) AS historical_purchase
              , CASE EXTRACT(year FROM LAG(orders.date_of_order) OVER(PARTITION BY users.user_id ORDER BY orders.date_of_order))  WHEN 2020 THEN 'Yes' ELSE 'No' END AS last_purchase_in_2020
FROM orders
LEFT JOIN users ON orders.user_id = users.user_id
JOIN products ON orders.product_id = products.product_id
JOIN prices ON products.product_id = prices.product_id
GROUP BY users.user_id, users.first_name, users.surname, orders.order_id, orders.date_of_order
ORDER BY users.user_id
;


-------- Objednávky, které nebyly zaplaceny a jejich ID a datum (RIGHT JOIN, WHERE)
SELECT orders.order_id
     , payments.payment_method 
     , orders.date_of_order
FROM payments 
RIGHT JOIN orders ON orders.order_id = payments.order_id
WHERE payment_status = 'not paid'
;







