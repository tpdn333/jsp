USE test;
USE test_database;

SELECT * FROM Products;

-- min
SELECT min(Price) FROM Products;

SELECT * FROM Products
ORDER BY Price asc;

-- count
SELECT count(*) FROM Products;

-- avg
SELECT avg(Price) FROM Products;

-- sum
SELECT sum(Price) FROM Products;

-- exercise 02
SELECT 
    MAX(Price)
FROM
    Products;

-- exercise 03    
SELECT 
    COUNT(*)
FROM
    Products
WHERE
    Price = 18;

-- exercise 04
