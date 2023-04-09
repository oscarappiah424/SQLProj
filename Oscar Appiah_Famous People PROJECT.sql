-- CREATE DATABASE --
CREATE DATABASE project;

/* Create table about famous people and what they do here */
-- Table for the famous people --
CREATE TABLE people (id INTEGER PRIMARY KEY AUTO_INCREMENT, celebrity_name TEXT);
	INSERT INTO people (celebrity_name) VALUES ("Johnny West");
	INSERT INTO people (celebrity_name) VALUES ("Richard Lun");
	INSERT INTO people (celebrity_name) VALUES ("Asamoah Gyan");
	INSERT INTO people (celebrity_name) VALUES ("Jack Sparrow");
	INSERT INTO people (celebrity_name) VALUES ("Piper Ret");
	INSERT INTO people (celebrity_name) VALUES ("Adrien Paulie");
	INSERT INTO people (celebrity_name) VALUES ("Suzie Doo");
	INSERT INTO people (celebrity_name) VALUES ("Liz Borden");
SELECT * FROM people;

-- Table for movie list --
CREATE TABLE movies (id INTEGER PRIMARY KEY AUTO_INCREMENT, movie_name TEXT, star INTEGER);
	INSERT INTO movies (movie_name, star) VALUES ("The Rock", "1");
	INSERT INTO movies (movie_name, star) VALUES ("Cannibal", "2");
	INSERT INTO movies (movie_name, star) VALUES ("Eat", "3");
SELECT * FROM movies;

-- Table for songs --
CREATE TABLE songs (id INTEGER PRIMARY KEY AUTO_INCREMENT, author_name TEXT, author INTEGER);
	INSERT INTO songs (author_name, author) VALUES ("Going Down", "4");
	INSERT INTO songs (author_name, author) VALUES ("When", "5");
	INSERT INTO songs (author_name, author) VALUES ("Back on and on", "6");
SELECT * FROM songs;

-- Table for books --
CREATE TABLE books (id INTEGER PRIMARY KEY AUTO_INCREMENT, book_name TEXT, author INTEGER);
	INSERT INTO books (book_name, author) VALUES ("From Whence", "7");
	INSERT INTO books (book_name, author) VALUES ("Somme", "8");
	INSERT INTO books (book_name, author) VALUES ("How To", "1");
SELECT * FROM books;

-- Table for spouses --    
CREATE TABLE spouses (id INTEGER PRIMARY KEY AUTO_INCREMENT, spouse1 INTEGER, spouse2 INTEGER);
	INSERT INTO spouses (spouse1,spouse2) VALUES ("1","8");
	INSERT INTO spouses (spouse1,spouse2) VALUES ("2","7");
	INSERT INTO spouses (spouse1,spouse2) VALUES ("3","6");
	INSERT INTO spouses (spouse1,spouse2) VALUES ("4","5");

-- Showing all tables created -
SELECT * FROM people;
SELECT * FROM movies;
SELECT * FROM songs;
SELECT * FROM books;
SELECT * FROM spouses;

-- Querying data --
 

-- Table of famous people against their spouses --
SELECT a.celebrity_name, b.celebrity_name AS spouse_name
	FROM spouses 
    JOIN people a 
		ON spouse1=a.id 
	JOIN people b 
		ON spouse2=b.id;
        
-- Table of movies against their respective actors in the famous people list  --        
SELECT movies.movie_name AS Movie, people.celebrity_name AS Actor 
FROM movies 
JOIN people 
ON movies.id=people.id;

-- Table of books against their authors --
SELECT books.book_name AS Book,people.celebrity_name AS Author 
FROM books 
JOIN people 
ON books.id=people.id;

-- The singer who sang Back on and on --
SELECT songs.author_name AS Song,people.celebrity_name AS Singer 
FROM songs 
JOIN people 
ON songs.id=people.id
WHERE songs.author_name = "Back on and on";
