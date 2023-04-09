-- CHALLENGE 1 --
-- creating database for challenges --
CREATE DATABASE challenges;
USE challenges;

-- creating table --
CREATE TABLE persons (id INTEGER PRIMARY KEY AUTO_INCREMENT, name TEXT, age INTEGER);
	INSERT INTO persons (name, age) VALUES ("Bobby McBobbyFace", 12);
	INSERT INTO persons (name, age) VALUES ("Lucy BoBucie", 25);
	INSERT INTO persons (name, age) VALUES ("Banana FoFanna", 14);
	INSERT INTO persons (name, age) VALUES ("Shish Kabob", 20);
	INSERT INTO persons (name, age) VALUES ("Fluffy Sparkles", 8);
	INSERT INTO persons (name, age) VALUES ("Jerry Jay", 9);
CREATE table hobbies (id INTEGER PRIMARY KEY AUTO_INCREMENT, person_id INTEGER,
 name TEXT);
	INSERT INTO hobbies (person_id, name) VALUES (1, "drawing");
	INSERT INTO hobbies (person_id, name) VALUES (1, "coding");
	INSERT INTO hobbies (person_id, name) VALUES (2, "dancing");
	INSERT INTO hobbies (person_id, name) VALUES (2, "coding");
	INSERT INTO hobbies (person_id, name) VALUES (3, "skating");
    INSERT INTO hobbies (person_id, name) VALUES (3, "rowing");
	INSERT INTO hobbies (person_id, name) VALUES (3, "drawing");
	INSERT INTO hobbies (person_id, name) VALUES (4, "coding");
	INSERT INTO hobbies (person_id, name) VALUES (4, "dilly-dallying");
	INSERT INTO hobbies (person_id, name) VALUES (4, "meowing");
	INSERT INTO hobbies (person_id, name) VALUES (5, "hunting");
SELECT * FROM persons;
SELECT * FROM hobbies;

-- JOINS --
SELECT persons.name, hobbies.name AS hobby
	FROM persons
	JOIN hobbies
	ON persons.id = hobbies.person_id;
SELECT persons.name, hobbies.name AS hobby
	FROM persons
	JOIN hobbies
	ON persons.id = hobbies.person_id
    WHERE persons.name = "Bobby McBobbyFace";
    
    
-- CHALLENGE 2 --

-- creating table --
CREATE TABLE customers (id INTEGER PRIMARY KEY AUTO_INCREMENT, name TEXT, email
TEXT);
	INSERT INTO customers (name, email) VALUES ("Doctor Who", "doctorwho@timelords.com");
	INSERT INTO customers (name, email) VALUES ("Harry Potter", "harry@potter.com");
	INSERT INTO customers (name, email) VALUES ("Captain Awesome", "captain@awesome.com");
CREATE TABLE orders (id INTEGER PRIMARY KEY AUTO_INCREMENT,customer_id INTEGER,item
TEXT,price REAL);
	INSERT INTO orders (customer_id, item, price)
	 VALUES (1, "Sonic Screwdriver", 1000.00);
	INSERT INTO orders (customer_id, item, price)
	 VALUES (2, "High Quality Broomstick", 40.00);
	INSERT INTO orders (customer_id, item, price)
	 VALUES (1, "TARDIS", 1000000.00);
SELECT * FROM customers;
SELECT * FROM orders;
SELECT customers.name, orders.item, orders.price
	FROM customers
    JOIN orders
    ON customers.id = orders.customer_id
    WHERE price >= 100;
    
SELECT customers.name, customers.email, orders.item, orders.price
	FROM customers
	LEFT OUTER JOIN orders
	ON customers.id = orders.customer_id;
    
SELECT DISTINCT customers.name, customers.email, SUM(orders.price) AS "total_amount_spent"
	FROM customers
	LEFT OUTER JOIN orders
	ON customers.id = orders.customer_id
    GROUP BY customers.name, customers.email
    ORDER BY "total_amount_spent";
    
-- 	CHALLENGE 3 --
CREATE TABLE movies (id INTEGER PRIMARY KEY AUTO_INCREMENT,title TEXT,released
INTEGER,sequel_id INTEGER);
	INSERT INTO movies VALUES (1, "Harry Potter and the Philosopher's Stone", 2001, 2);
	INSERT INTO movies VALUES (2, "Harry Potter and the Chamber of Secrets", 2002, 3);
	INSERT INTO movies VALUES (3, "Harry Potter and the Prisoner of Azkaban", 2004, 4);
	INSERT INTO movies VALUES (4, "Harry Potter and the Goblet of Fire", 2005, 5);
	INSERT INTO movies VALUES (5, "Harry Potter and the Order of the Phoenix ", 2007, 6);
	INSERT INTO movies VALUES (6, "Harry Potter and the Half-Blood Prince", 2009, 7);
	INSERT INTO movies VALUES (7, "Harry Potter and the Deathly Hallows – Part 1", 2010, 8);
	INSERT INTO movies VALUES (8, "Harry Potter and the Deathly Hallows – Part 2", 2011, NULL);
SELECT * FROM movies;


-- COMBINE JOIN CHALLENGE --
CREATE DATABASE challenge2;
CREATE TABLE persons (id INTEGER PRIMARY KEY AUTO_INCREMENT, fullname TEXT, age
INTEGER);
INSERT INTO persons (fullname, age) VALUES ("Bobby McBobbyFace", "12");
INSERT INTO persons (fullname, age) VALUES ("Lucy BoBucie", "25");
INSERT INTO persons (fullname, age) VALUES ("Banana FoFanna", "14");
INSERT INTO persons (fullname, age) VALUES ("Shish Kabob", "20");
INSERT INTO persons (fullname, age) VALUES ("Fluffy Sparkles", "8");
CREATE table hobbies (id INTEGER PRIMARY KEY AUTO_INCREMENT, person_id INTEGER,
name TEXT);
INSERT INTO hobbies (person_id, name) VALUES (1, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (1, "coding");
INSERT INTO hobbies (person_id, name) VALUES (2, "dancing");
INSERT INTO hobbies (person_id, name) VALUES (2, "coding");
INSERT INTO hobbies (person_id, name) VALUES (3, "skating");
INSERT INTO hobbies (person_id, name) VALUES (3, "rowing");
INSERT INTO hobbies (person_id, name) VALUES (3, "drawing");
INSERT INTO hobbies (person_id, name) VALUES (4, "coding");
INSERT INTO hobbies (person_id, name) VALUES (4, "dilly-dallying");
INSERT INTO hobbies (person_id, name) VALUES (4, "meowing");

CREATE table friends (id INTEGER PRIMARY KEY AUTO_INCREMENT, person1_id INTEGER,
person2_id INTEGER);
INSERT INTO friends (person1_id, person2_id)
 VALUES (1, 4);
INSERT INTO friends (person1_id, person2_id)
 VALUES (2, 3);
SELECT * FROM persons;
SELECT * FROM hobbies;
SELECT * FROM friends;

-- COMBINE JOINS --
-- QUERY STEP 1 --
SELECT persons.fullname, hobbies.name AS hobby
FROM persons
JOIN hobbies
ON persons.id = hobbies.person_id;

SELECT persons.fullname, COUNT(hobbies.name) AS hobby
FROM persons
JOIN hobbies
ON persons.id = hobbies.person_id
GROUP BY persons.fullname
HAVING hobby = 3;


-- STEP 2 --
SELECT a.fullname AS person1_id, b.fullname AS person2_id
FROM friends
JOIN persons a
ON friends.person1_id = a.id
JOIN persons b
ON friends.person2_id = b.id;

-- DAY 3 --
CREATE TABLE users (id INTEGER PRIMARY KEY AUTO_INCREMENT, name TEXT);
CREATE TABLE diary_logs (id INTEGER PRIMARY KEY AUTO_INCREMENT, user_id INTEGER, date TEXT, content
TEXT);
/* After user submitted their new diary log */
INSERT INTO diary_logs (user_id, date, content) VALUES (1, "2015-04-01",
 "I had a horrible fight with OhNoesGuy and I buried my woes in 3 pounds of dark chocolate.");
INSERT INTO diary_logs (user_id, date, content) VALUES (1, "2015-04-02",
 "We made up and now we're best friends forever and we celebrated with a tub of ice cream.");

-- Querying our table --
SELECT * FROM diary_logs;

UPDATE diary_logs 
SET content = "I had a horrible fight with OhNoesGuy" 
WHERE id = 1 AND user_id = 1 AND date = "2015-04-01";


UPDATE diary_logs SET content = "I had a bad day" WHERE id = 1;
SELECT * FROM diary_logs;
DELETE FROM diary_logs WHERE id = 1;
SELECT * FROM diary_logs;

-- ALTERING TABLE --
ALTER TABLE diary_logs 
ADD emotion VARCHAR(255) default "unknown";
UPDATE diary_logs SET emotion = "😊" WHERE id = 1;
UPDATE diary_logs SET emotion = "😍" WHERE id = 2;