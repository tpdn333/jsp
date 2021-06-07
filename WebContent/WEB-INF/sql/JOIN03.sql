USE test;
SELECT * FROM Customers;
SELECT * FROM Orders;

-- join 
SELECT * FROM Customers JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

SELECT o.OrderID, c.CustomerName
FROM Customers c JOIN Orders o
ON c.CustomerID = o.CustomeriD;

SELECT c.CustomerName FROM Customers c LEFT JOIN Orders o 
ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL;

-- 다수 Table 조회
-- 주문의 고객명
SELECT o.OrderID, c.CustomerName 
FROM Orders o JOIN Customers c
On o.CustomerID = c.CustomerID;

-- 주문의 고객명, 직원명
SELECT o.OrderID, c.CustomerName, e.LastName, e.FirstName
FROM Orders o 
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Employees e ON o.EmployeeID = e.EmployeeID;

-- 주문의 고객명, 직원명(LastName + FirstName)
-- column 묶기
SELECT o.OrderID, c.CustomerName, concat(e.LastName, ', ', e.FirstName) EmployeeName
FROM Orders o 
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Employees e ON o.EmployeeID = e.EmployeeID;
