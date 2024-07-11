-- Getting started, do not update
DROP DATABASE IF EXISTS regifter;
CREATE DATABASE regifter;
\c regifter
-- End getting started code

--
-- Write your code below each prompt

--
\echo Create a table called gifts
-- with the following columns
-- id serial primary KEY
-- gift - string
-- giver - string
-- price - integer
-- previously_regifted boolean
CREATE TABLE gifts (id SERIAL PRIMARY KEY, gift VARCHAR(100), giver TEXT, price INT, previously BOOLEAN);


-- 
\echo See details of the table you created
-- 
\d gifts
-- SELECT * FROM  is showing a specific part of a table.
-- 
\echo Alter the table so that the column price is changed to value 
-- 
ALTER TABLE gifts RENAME  price TO value;

-- 
\echo Insert a peach candle, given by 'Santa' thats value is 9 and has been previously regifted
-- 
INSERT INTO 
    gifts ('Peach Candel', 'Santa', 9, True)

--
\echo Query for all the columns in your gifts table
-- 
SELECT * FROM gifts;

--
\echo Uncomment below to insert 5 more gifts
-- 

INSERT INTO gifts (gift, giver, value, previously_regifted)
VALUES
('peach candle', 'Santa', 9, TRUE),
('cinnamon candle', 'Nick', 19, TRUE),
('soap on a rope', 'Rudolf', 29, FALSE),
('potpurri', 'Elf on the Shelf', 39, TRUE),
('mango candle', 'The Boss', 49, FALSE)
;

-- 
\echo Insert 5 more gifts of your own choosing,  include 1 more candle
--
INSERT INTO gifts( gift, giver, value, previously_regifted)
('Lightsaber','Big J',20,000 ,TRUE)
('Mini gun','Fred',200 ,FALSE)
('Big Pot','Billy',50 , TRUE)
('Sword of Souls','BOB', 4500, FALSE)
('Hotdog candle','Trystan',3 , TRUE)

--
\echo Query for gifts with a value greater than or equal to 20
--
SELECT * FROM gifts;

--
\echo Query for every gift that has the word candle in it, only show the gift column
--
SELECT * FROM gifts WHERE gift = 'candle';

--
\echo Query for every gift whose giver is Santa OR value is greater than 30
--
SELECT * FROM gifts WHERE value > 30;

--
\echo Query for every gift whose giver is NOT Santa
--
SELECT * FROM gift WHERE giver != 'santa';

--
\echo Update the second gift to have a value of 2999
-- 
UPDATE gift SET value = 2999 WHERE id = 2;

--
\echo Query for the updated item
--
SELECT * FROM gift WHERE value = 2999;

--
\echo Delete all the gifts from Santa and return the 'value' and 'gift' of the gift you have deleted
--
DELETE FROM gifts WHERE giver = 'santa';
UPDATE gifts SET giver ='santa' RETURNING *;

--
\echo Query for all the columns in your gifts table one more time
--

SELECT * FROM gifts;

-- BONUSES

--
 \echo Count the total number of gifts that have the word candle in it
-- 

SELECT COUNT(gift_candle)
From gifts
--
\echo Get the AVEREAGE value from all the gifts
--
SELECT AVG(gift_value)
FROM gift

-- 
 \echo Limit to 3 gifts, offset by 2 and order by price descending
--
SELECT * FROM gifts
ORDER BY value DESC
OFFSET 2
LIMIT 3;
--
-- finish
--
DROP TABLE IF EXISTS gifts;
