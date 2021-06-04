CREATE TABLE Board
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(255) NOT NULL,
    body VARCHAR(2047) NOT NULL,
    memberId VARCHAR(255) NOT NULL,
    inserted TIMESTAMP DEFAULT NOW()
);

DESC Board;

SELECT * FROM Board;

USE test_database;


DELETE FROM Board
WHERE memberId NOT IN (
	SELECT id FROM Member
);
-- 테이블 Board memberId 중에 Member 테이블 id값이 없는것들 삭제
ALTER TABLE Board
ADD FOREIGN KEY (MemberId)
REFERENCES Member(id);

DELETE FROM Board
WHERE id = 3;

UPDATE Board
SET title = "제목1",
	body = "안녕"
WHERE id = 2;
