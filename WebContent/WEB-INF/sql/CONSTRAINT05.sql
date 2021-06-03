CREATE TABLE MyTable13
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    body VARCHAR(255) NOT NULL,
    inserted TIMESTAMP
);

INSERT INTO MyTable13
(title, body, inserted)
VALUES
('title1', 'body1', NOW());

SELECT * FROM MyTable14;

CREATE TABLE MyTable14
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    body VARCHAR(255) NOT NULL,
    inserted TIMESTAMP DEFAULT NOW()
);

INSERT INTO MyTable14
(title, body)
VALUES
('title1', 'body1');