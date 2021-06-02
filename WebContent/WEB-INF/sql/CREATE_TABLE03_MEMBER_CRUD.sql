-- CREATE DATABASE test_database;
-- USE test_database;
CREATE TABLE Member (
	id VARCHAR(255),
    password VARCHAR(255),
    name VARCHAR(255),
    birth DATE,
    inserted TIMESTAMP
);

SELECT * FROM Member
