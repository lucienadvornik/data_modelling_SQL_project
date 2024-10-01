------------- TEST QUERIES ---------------

-------- All orders and their info? (LEFT JOIN, ORDER BY)
SELECT *
FROM orders
LEFT JOIN users ON orders.user_id = users.user_id
FULL OUTER JOIN products ON orders.product_id = products.product_id
ORDER BY orders.order_id 
;

-------- Total list of all orders grouped by user_id (GROUP BY)
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

-------- Which customers spent the most? (SUM + OVER + PARTITION BY, GROUP BY, ORDER BY)
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

-------- Customers that managed to make their purchase from November to Christmas 2020? (HAVING + BETWEEN TO_DATE AND TO_DATE)
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


-------- Customers buying mascaras (INNER JOIN, WHERE LIKE + OR)
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

-------- Users that has already made a purchase in the e-shop in the past, what is the date of the user's previous purchase? + mark if it was in 2020
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


-------- Orders not paid, their ID and date (RIGHT JOIN, WHERE)
SELECT orders.order_id
     , payments.payment_method 
     , orders.date_of_order
FROM payments 
RIGHT JOIN orders ON orders.order_id = payments.order_id
WHERE payment_status = 'not paid'
;

