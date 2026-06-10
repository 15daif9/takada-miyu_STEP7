-- 1
SELECT * FROM `users`;
-- 2
SELECT * FROM `users` WHERE `created_at` LIKE '2024%';
-- 3
SELECT * FROM `users` WHERE `age` < 30 AND `gender` = 'female';
-- 4
SELECT * FROM `products`
-- 5
SELECT `users`.`name`, `orders`.`order_date` FROM `users` JOIN `orders`
-- 6
SELECT products.product_name AS `商品名`,
		order_items.quantity AS `数量`,
        products.price AS `単価`,
        products.price * order_items.quantity AS `金額`
FROM order_items JOIN products ON order_items.product_id = products.id;
-- 7
SELECT users.name AS `ユーザー名`, COUNT(orders.id) AS `注文件数`
FROM users LEFT JOIN orders ON users.id = orders.user_id GROUP BY users.id, users.name;
-- 8
SELECT users.name AS `名前`, `order_items`.quantity * products.price AS `合計金額` FROM `users` 
JOIN `order_items`ON users.id = order_items.order_id
JOIN `products` ON products.id = order_items.product_id;
-- 9
SELECT users.name, products.price, order_items.quantity
FROM `users` JOIN `products` ON products.id = order_items.product_id
JOIN `order_items` ON users.id = order_items.order_id
WHERE (products.price * order_items.quantity) 
= (SELECT MAX(products.price * order_items.quantity) FROM `users`);
    -- わかりませんでした
-- 10
SELECT products.product_name AS `商品名`, SUM(order_items.quantity) AS `売れた台数`
FROM `products` JOIN `order_items` ON products.id = order_items.order_id
GROUP BY products.id, products.product_name;
-- 11
SELECT users.name FROM `users`
JOIN `orders` ON users.id = orders.user_id
WHERE orders.id IS NULL;
-- 12
    -- わかりませんでした
-- 13
SELECT users.name FROM `users`
JOIN `order_items` ON `users`.id = `order_items`.order_id
JOIN `products` ON `products`.id = `order_items`.product_id
WHERE products.product_name LIKE '%テレビ%';
-- 14
    -- 注文日、ユーザー名、商品名、数量、合計金額
SELECT `orders`.order_date, users.name, products.product_name, order_items.quantity, (products.price * order_items.quantity)
FROM `orders`
JOIN `users` ON users.id = orders.user_id 
JOIN `order_items` ON order_items.order_id = users.id
JOIN `products` ON products.id = order_items.product_id;
-- 15
SELECT products.product_name FROM products
JOIN order_items ON products.product_name = order_items.product_id
WHERE products.product_name = (SELECT MAX(order_items.quantity) FROM products);
-- 16
    -- わかりませんでした
-- 17
SELECT order_items.product_id FROM order_items
WHERE order_items.product_id IN (1, 2, 3, 4, 5) IS NULL;
-- 18
ALTER TABLE order_items.product_id ADD INDEX (name);
-- 19
SELECT AVG (products.price * order_items.quantity) AS `平均値`
FROM `users`
JOIN `order_items` ON users.id = order_items.order_id
JOIN products ON products.id = order_items.order_id;
-- 20
    -- わかりませんでした
-- 21
INSERT INTO users (id,name,age,gender,created_at)VALUES
(6,'中村愛',25,'female','2025-06-01');
-- 22
INSERT INTO products(id,product_name,price)VALUES(6,'エアコン',60000);
-- 23
INSERT INTO orders(id,user_id,order_date)VALUES (10,1,'2025-06-10');
-- 24
INSERT INTO order_items(id,order_id,product_id,quantity) VALUES(10,1,6,1);
-- 25
UPDATE users SET age = 24 WHERE users.id = 4;
-- 26
UPDATE products SET price = price * 1.1;
-- 27
UPDATE orders SET order_date = '2024-05-01' WHERE order_date < '2024-05-01';
-- 28
DELETE FROM users WHERE id = 5;
-- 29
DELETE FROM order_items WHERE id = 5;
-- 30
DELETE FROM products WHERE -- わかりませんでした