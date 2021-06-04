USE test;

-- member
-- 입력은 17먼저
CREATE TABLE MyTable17
(
	id VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
SELECT * FROM MyTable17;

-- board
-- 삭제는 18먼저
DROP TABLE MyTable18;
SELECT * FROM MyTable18;

CREATE TABLE MyTable18
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    t17Id VARCHAR(255) NOT NULL,
    FOREIGN KEY(t17Id) REFERENCES MyTable17(id)
);

INSERT INTO MyTable17
(id, name)
VALUES
('donald', 'trump');

INSERT INTO MyTable18
(title, t17Id)
VALUES
('title1', 'donald');

INSERT INTO MyTable18
(title, t17Id)
VALUES
('title2', 'kim');

DELETE FROM MyTable17
WHERE id = 'donald';

-- 삭제 먼저 1
DELETE FROM MyTable18
WHERE t17Id = 'donald';
