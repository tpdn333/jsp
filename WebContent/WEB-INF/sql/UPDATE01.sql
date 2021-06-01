SELECT * FROM Customers;


UPDATE Customers
SET CustomerName = '스파이더걸',
ContactName = '아이언맨'
WHERE CustomerID = 91; 

SELECT * FROM Customers 
INTO OUTFILE '\home\bitnami\Customers.csv' 
CHARACTER SET utf8 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n';