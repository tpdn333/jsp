USE test_database;

DROP TABLE IF EXISTS Comment;

CREATE TABLE Comment
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    comment VARCHAR(2047) NOT NULL,
    memberId VARCHAR(255) NOT NULL,
    boardId INT NOT NULL,
    inserted TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (memberId) REFERENCES Member(id),
    FOREIGN KEY (boardId) REFERENCES Board(id)
);

SELECT * FROM Member;
SELECT * FROM Comment;
SELECT * FROM Board;

SELECT c.id commentId, m.id, m.name, c.inserted, c.comment, c.boardId
FROM Comment c JOIN Member m 
ON c.memberId = m.id
WHERE c.boardId = 2
ORDER BY commentId DESC;