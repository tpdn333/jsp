SELECT * FROM Customers
ORDER BY CustomerID DESC; -- 91번까지 있음

INSERT INTO Customers
(CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country)
VALUE
(92, 'Kim', 'Lee', 'Gangnam', 'Seoul', '0000', 'Korea');

INSERT INTO Customers
VALUE
(93, 'Choi', 'Hong', 'Gangnam', 'Seoul', '00001', 'Korea');
-- column값 안쓰고 value값 넣기