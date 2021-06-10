USE test_database;

SELECT * FROM Board
ORDER BY id DESC;

SELECT * FROM Board b JOIN Comment c 
ON c.boardId = b.id
ORDER BY b.id DESC;

SELECT b.id 게시물번호, count(c.id) 댓글개수 FROM Board b LEFT JOIN Comment c 
ON c.boardId = b.id
GROUP BY b.id
ORDER BY b.id DESC;

SELECT 
    b.id boardId, b.title title, m.name name, count(c.id) numberOfComment, b.inserted
FROM Board b 
JOIN Member m ON b.memberId = m.id
LEFT JOIN Comment c ON b.id = c.boardId
GROUP BY b.id
ORDER BY boardId DESC;

SELECT m.*, count(DISTINCT b.id), count(c.id)
FROM Member m LEFT JOIN Board b ON m.id = b.memberId
RIGHT JOIN Comment c ON m.id = c.memberId
WHERE m.id = 'tpdn333';

SELECT * FROM Board WHERE memberId = 'tpdn333';
SELECT * FROM Comment WHERE memberId = 'tpdn333';

SELECT count(id) FROM Board;

SELECT CustomerID, CustomerName, City 
				FROM Customers 
				ORDER BY CustomerID 
				LIMIT 10, 10;
                
SELECT b.id boardId, 
							 b.title title,
				 m.name name, 
					 count(c.id) numberOfComment, 
			 b.inserted 
					 FROM Board b 
					 JOIN Member m ON b.memberId = m.id 
					 LEFT JOIN Comment c ON b.id = c.boardId  
					 GROUP BY b.id 
					 ORDER BY boardId DESC 
				   LIMIT   10 , 10 ;

