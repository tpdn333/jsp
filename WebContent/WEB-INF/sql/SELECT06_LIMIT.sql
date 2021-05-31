SELECT * FROM Customers
LIMIT 5;

SELECT * FROM Customers
ORDER BY Country
LIMIT 10;

SELECT * FROM Customers
ORDER BY CustomerID
LIMIT 10; -- 위에서 부터 10개

SELECT * FROM Customers
ORDER BY CustomerID
LIMIT 10, 10; -- 10부터 10개

SELECT * FROM Customers
ORDER BY CustomerID
LIMIT 20, 10; -- 20부터 10개

SELECT * FROM Customers
ORDER BY CustomerID
LIMIT 10, 5; -- 30부터 10개
