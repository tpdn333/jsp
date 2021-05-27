-- WHERE

SELECT 
    *
FROM
    Customers
WHERE
    CustomerID = '1';
    
SELECT 
    *
FROM
    Products
WHERE
    Price = 18;
    
SELECT 
    *
FROM
    Products
WHERE
    Price > 30;
    
SELECT 
    *
FROM
    Products
WHERE
    Price < 30;
    
-- LIKEs
-- 대소문자 구분 안함!
SELECT * FROM CuSTOMERs
WHERE City LIKE 'S%'; -- s로 시작하는 것 

SELECT * FROM Customers
WHERE CITY LIKE '%g'; -- g로 끝나는 것

SELECT * FROM Customers
WHERE City LIKE '%Z%'; -- 중간에 z라는 알파벳이 있기만 하면

SELECT * FROM Customers
WHERE Country LIKE '%us%'; -- 중간 us라는 문자가 있기만 하면

SELECT * FROM CuSTOMErs
WHERE COUNtry = 'Germany' AND Country = 'Berlin';

SELECT * FROM CUSTOMErS
WHERE City = 'BERLIN' OR City = 'München';

SELECT * FROM CustomerS
WHERE COUNTry = 'GermaNY' OR (CusTomerName LIKE '%s%' AND City LIKE '%CH%');


SELECT 
    *
FROM
    CusTomers
WHERE
    City = 'BerlIN' OR City = 'LondoN';

