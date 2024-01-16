create database goods;
use goods;

create table goods (
	id integer,
    title varchar(64),
    quantity integer
);

SELECT *
FROM goods;

INSERT INTO goods(id, title, quantity) VALUES (1, 'Headphones', 25),
											  (2, 'Microphones', 50),
											  (3, 'Keyboards', 30),
                                              (4, 'Monitors', 15);
                                              
ALTER TABLE goods
ADD price integer;

SET SQL_SAFE_UPDATES = 0;

UPDATE goods
SET price = 0;

DELETE FROM goods
WHERE price;

ALTER TABLE goods
MODIFY COLUMN price numeric;

ALTER TABLE goods
MODIFY COLUMN price integer;

ALTER TABLE goods
CHANGE price item_price integer;

ALTER TABLE goods
DROP COLUMN item_price;
