-- Creating an app that contains the user's name and their respective scores.

-- Creating Table --

CREATE TABLE appscore (id INTEGER PRIMARY KEY AUTO_INCREMENT, username TEXT, score INTEGER);

-- Inserting rows
INSERT INTO appscore (username, score) VALUES ('Oscar', 50);
INSERT INTO appscore (username, score) VALUES ('Adjei', 75);
INSERT INTO appscore (username, score) VALUES ('Boadi', 100);

-- Calling out the table
SELECT * FROM appscore;

-- Updating the user score
UPDATE appscore SET score = 90 WHERE username = 'Oscar';

-- Calling the table again to check if it has been updated
SELECT * FROM appscore;

-- DELETE user score
DELETE FROM appscore WHERE username = 'Oscar';

-- Checking to see if delete worked
SELECT * FROM appscore;


