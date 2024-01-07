create database learn;

use learn;

create table products(
id integer primary key auto_increment,
title varchar(128),
price integer,
discount decimal(2,1)
);

insert into products (title, price, discount) values ('bike', 50000, 0.9);
insert into products (title, price, discount) values ('skates', 15000, 0.1);
insert into products (title, price, discount) values ('skys', 25000, null);
insert into products (title, price, discount) values ('board', 30000, 0.9);
insert into products (title, price, discount) values ('scooter', 10000, 0.8);

SELECT
*
FROM products;

SELECT
title,
price
FROM products;

SELECT
discount,
title,
price
FROM products;

SELECT
title
FROM products;

SELECT
*
FROM products
WHERE price > 20000;

SELECT
*
FROM products
WHERE title > 'skates';

SELECT
*
FROM products
WHERE title = 'skates';

-- AND, OR

SELECT
*
FROM products
WHERE title = 'skys' OR title = 'bike';

SELECT
*
FROM products
WHERE title = 'skys' OR price > 15000;

SELECT
*
FROM products
WHERE price > 35000 AND discount = 0.9;

-- between , not between

SELECT
*
FROM products
WHERE price between 10000 AND 25000;

SELECT
*
FROM products
WHERE price not between 10000 AND 25000;

-- IN, NOT IN -- в списке, не в списке

SELECT
*
FROM products
WHERE title = 'skys' OR title = 'bike' OR title = 'scooter';

SELECT
*
FROM products
WHERE title IN ('skys', 'bike', 'scooter');

SELECT
*
FROM products
WHERE title NOT IN ('skys', 'bike', 'scooter');

-- LIKE, NOT LIKE - % - любое кол-во символов, _ - один символ

SELECT
*
FROM products
WHERE title LIKE 'b%';

SELECT
*
FROM products
WHERE title LIKE '%s';

SELECT
*
FROM products
WHERE title NOT LIKE '%s';

SELECT
*
FROM products
WHERE title LIKE '%y_';

-- null, 0, 0.0, ''

-- null -- отсутствие какого-либо значения(не путать с 0 или пустой строкой)

-- IS NULL, IS NOT NULL

SELECT
*
FROM products
WHERE discount IS NULL;

SELECT
*
FROM products
WHERE discount IS NOT NULL;

insert into products (title, price, discount) values ('', 10000, 0.8);
insert into products (title, price, discount) values (null, 10000, 0.8);

SELECT 
*
FROM products;

SELECT
*
FROM products
WHERE title <> '';

SELECT
*
FROM products
WHERE title IS NULL;

SELECT
*
FROM products
WHERE title IS NOT NULL;



-- lesson 2


use learn;

SELECT
*
FROM products;

SELECT
id,
title
FROM products;

SELECT
id
,title
FROM products
WHERE title = 'skys' 
OR title = 'bike' 
OR title = 'scooter';

-- AS  -  добавляет альтернативное имя для поля

SELECT
id AS number,
title AS name_of_product,
price
FROM products;

SELECT
id number,
title name_of_product,
price
FROM products;

-- DISTINCT  -  выбирает только уникальные записи

SELECT DISTINCT
price
FROM products;

-- ORDER BY  -  сортировка таблицы по полю
-- DESC  -  сортировка по убыванию
-- ASK  -  (по умолчанию), сортировка по возрастанию

SELECT
id,
title,
price
FROM products
ORDER BY price DESC, title DESC;

-- ВЫЧИСЛЯЕМЫЕ ПОЛЯ

SELECT
id,
title,
price,
discount
FROM products;

SELECT
id,
title,
price,
price / 5 AS newprice,  -- +, -, *, /
discount,
price * discount AS sale_price
FROM products;

SELECT
title,
price,
price * 0.9 AS price_with_discount_10,
price * 0.8 AS price_with_discount_20,
price * 0.7 AS price_with_discount_30
FROM products;

SELECT
id,
title,
price,
discount,
5 AS category,
'Hello' AS greetings
FROM products;

SELECT -1; -- constant without source
SELECT ABS(-5); -- absolut value
SELECT POW(3,2); -- power of number
SELECT ROUND(3.5); -- round of number
SELECT SQRT(144); -- sqrt

SELECT
title,
POW(price, 2) AS price,
discount
FROM products;

-- СТРОКОВЫЕ ФУНКЦИИ

-- CONCAT  -  объединяет строки
SELECT
CONCAT('Hello', ' ', 'World!');

-- CONCAT_WS  -  соединяет несколько строк через разделитель
SELECT 
CONCAT_WS(' ', 'Hello', 'World', '!');

-- INSERT  -  заменяет значение внутри строки
-- с определённой позиции
SELECT
INSERT ('Hello World',7,5,'class');

-- LENGTH
SELECT
LENGTH('Hello');

SELECT
LENGTH('Привет') AS length, -- показывает длину строки
TRIM('   Hello    '),  -- обрезает пробелы слева и справа
LOCATE('e', 'Hello'), -- ищет входные позиции эл-та
LEFT('Hello', 2), -- берёт определённое кол-во символов слева
RIGHT('Hello', 4), -- берёт определённое кол-во символов справа
SUBSTRING('Hello World', 7, 5), -- берёт подстроку с определённой
-- позиции
REPLACE('9-0-0', '-', ' '), -- замена значений в строке
LOWER('HELLO'), -- приводит строку к нижнему регистру
UPPER('hello'); -- приводит строку к верхнему регистру

SELECT
UPPER(title) AS title,
price
FROM products;

-- CASE - единственный условный оператор в SQL
/*
 CASE
	WHEN something THEN something
    WHEN something THEN something
    WHEN something THEN something
    ELSE something
END AS new_name
*/

SELECT
title,
price,
discount,
CASE
	WHEN price < 11000
		THEN 1
	WHEN price < 20000
		THEN 2
	WHEN price < 30000
		THEN 3
	ELSE 4
END AS price_group
FROM products;

SELECT
title,
price AS old_price,
discount,
CASE
	WHEN discount IS NULL 
		THEN price * 1
	ELSE price * discount
END AS new_price
FROM products;

-- example

use airport;

SELECT
*
FROM airliners;

SELECT
model_name,
distance,
CASE
	WHEN distance > 1000 AND distance <= 2500
		THEN 'short'
	WHEN distance > 2500 AND distance <= 6000
		THEN 'medium'
	WHEN distance > 6000
		THEN 'long'
	ELSE 'mini'
END AS category
FROM airliners;

use airport;

/*
Простые выборки (перед началом посмотрите в каких таблицах что находится):
1) Выбрать всех клиентов, чей возраст больше чем 40;
2) Выбрать всех клиентов, у которых в фамилии есть вхождение 'Egor';
3) Выбрать все билеты, которые относятся к классу Economy или PremiumEconomy и цена больше 40000;
4) Выбрать все поездки, у которых статус был отменен или задержан, вывести только коды отправления и прибытия.
5) Выбрать всех клиентов и отсортировать их по фамилии в алфавитном порядке;
6) Выбрать всех клиентов и отсортировать их по возрасту в порядке убывания;
7) Вывести все билеты НЕ Economy класса и отсортировать их по стоимости в порядке убывания;

(Задачи далее на использование CASE)
8) Разделите самолеты на три класса по возрасту. Если самолет произведен раньше 2000 года, то отнесите его к классу 'Old'.
Если самолет произведен между 2000 и 2010 годами включительно, то отнесите его к классу 'Mid'. 
Более новые самолеты отнесите к классу 'New'. 
Исключите из выборки дальнемагистральные самолеты с максимальной дальностью полета больше 10000 км. 
Отсортируйте выборку по классу возраста в порядке возрастания.
В выборке должны присутствовать два атрибута — side_number, age.

9) Руководство авиакомпании снизило цены на билеты рейсов LL4S1G8PQW, 0SE4S0HRRU и JQF04Q8I9G. 
Скидка на билет экономкласса (Economy) составила 15%, 
на билет бизнес-класса (Business) — 10%, 
а на билет комфорт-класса (PremiumEconomy) — 20%. 
Определите цену билета в каждом сегменте с учетом скидки.
В выборке должны присутствовать три атрибута — id, trip_id, new_price.
*/

SELECT
*
FROM airliners;

SELECT
*
FROM clients;

SELECT
*
FROM tickets;

SELECT
*
FROM trips;

-- 1
SELECT
*
FROM Clients
WHERE age > 40;

-- 2
SELECT
*
FROM Clients
WHERE name LIKE '%Egor%';

-- 3
SELECT
*
FROM tickets
WHERE service_class = 'Economy' OR service_class = 'PremiumEconomy' OR price > 40000;

-- 4

SELECT
departure,
arrival
FROM trips
WHERE status = 'Delayed' OR status = 'Cancelled';

-- 5

SELECT
*
FROM clients
ORDER BY name;

-- 6

SELECT
*
FROM clients
ORDER BY age DESC;

-- 7

SELECT
*
FROM tickets
WHERE service_class NOT IN ('Economy')
ORDER BY price DESC;

-- 8
/*
Разделите самолеты на три класса по возрасту. Если самолет произведен раньше 2000 года, то отнесите его к классу 'Old'.
Если самолет произведен между 2000 и 2010 годами включительно, то отнесите его к классу 'Mid'. 
Более новые самолеты отнесите к классу 'New'. 
Исключите из выборки дальнемагистральные самолеты с максимальной дальностью полета больше 10000 км. 
Отсортируйте выборку по классу возраста в порядке возрастания.
В выборке должны присутствовать два атрибута — side_number, age.
*/

SELECT
side_number,
CASE
	WHEN production_year < 2000
		THEN 'Old'
	WHEN production_year >= 2000 AND production_year <= 2010
		THEN 'Mid'
	WHEN production_year > 2010
		THEN 'New'
END AS age
FROM airliners
WHERE distance < 10000
ORDER BY production_year DESC;

-- 9
/*
Руководство авиакомпании снизило цены на билеты рейсов LL4S1G8PQW, 0SE4S0HRRU и JQF04Q8I9G. 
Скидка на билет экономкласса (Economy) составила 15%, 
на билет бизнес-класса (Business) — 10%, 
а на билет комфорт-класса (PremiumEconomy) — 20%. 
Определите цену билета в каждом сегменте с учетом скидки.
В выборке должны присутствовать три атрибута — id, trip_id, new_price.
*/

SELECT
id,
trip_id,
CASE
	WHEN service_class = 'Economy'
		THEN price * 0.85
	WHEN service_class = 'Business'
		THEN price * 0.9
	WHEN service_class = 'PremiumEconomy'
		THEN price * 0.8
	ELSE price * 1
END AS new_price
FROM tickets
WHERE trip_id = 'LL4S1G8PQW' OR trip_id = '0SE4S0HRRU' OR trip_id = 'JQF04Q8I9G';


