USE test_database;
DESC Member;

SELECT * FROM Member;

ALTER TABLE Member
ADD PRIMARY KEY(id);

ALTER TABLE Member
MODIFY inserted TIMESTAMP NOT NULL;

INSERT INTO Member
(id, password, name, birth)
VALUES
('donald', '1234', 'trump', '2011-01-01');