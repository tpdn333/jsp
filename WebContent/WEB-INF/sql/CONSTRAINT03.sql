-- primary key

CREATE TABLE MyTable11 (
id INT PRIMARY KEY,
name VARCHAR(255)
);

DESC MyTable11;

INSERT INTO MyTable11
(id, name)
VALUES
(1, 'donald');

SELECT * FROM MyTable11;

INSERT INTO MyTable11
(name)
VALUES
('KIM'); -- 안됨

