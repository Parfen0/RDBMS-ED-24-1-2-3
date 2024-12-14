USE WebStor; 
 
DROP TABLE Employees
 
CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
AGE INT,
Salary INT
);
INSERT INTO Employees (EmployeeID, FirstName, LastName, AGE,
Salary)

VALUES (1, 'Barbara', 'Smith', '43', '1230'),
(2, 'Oleh', 'Shevchenko', '50', '1800'),
(3, 'Olha', 'Bondarchuk', '45', '1300'),
(4, 'Natalia', 'Khmil', '35', '1280'),
(5, 'Dmytro', 'Romnanov', '21', '500'),
(6, 'Kate', 'Wiliams', '49', '1230'),
(7, 'Amanda', 'Taylor', '29', '1230'),
(8, 'Valentyna', 'Pavelko', '44', '1240');
 
  
SELECT FirstName, LastName, Age 
FROM Employees
WHERE Age > 45
ORDER BY [Age] DESC;
 
  
SELECT DISTINCT MFR, PRODUCT

FROM dbo.ORDERS
WHERE ORDER_DATE = 2008; 
 
  
DROP TABLE Employees 
 
 
CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
AGE INT,
Salary INT,
TheNumberOfCompletedOrders INT,
DateOfTheOrder DATE);
 
  
INSERT INTO Employees (EmployeeID, FirstName, LastName, AGE,

Salary, TheNumberOfCompletedOrders, DateOfTheOrder)

VALUES (1, 'Barbara', 'Smith', '43', '1230', '15', '2009'),
(2, 'Oleh', 'Shevchenko', '50', '1800', '16', '2008'),
(3, 'Olha', 'Bondarchuk', '45', '1300', '18', '2006'),
(4, 'Natalia', 'Khmil', '35', '1280', '15', '2009'),
(5, 'Dmytro', 'Romnanov', '21', '500', '16', '2008'),
(6, 'Kate', 'Wiliams', '49', '1230', '17', '2007'),
(7, 'Amanda', 'Taylor', '29', '1230', '16', '2008'),
(8, 'Valentyna', 'Pavelko', '44', '1240', '16', '2008');
 
  
SELECT TOP 3 WITH TIES *,
COUNT(DISTINCT REP) AS [AMOUNT]
FROM dbo.ORDERS
WHERE ORDER_DATE = 2008
GROUP BY [ORDER_NUM], [ORDER_DATE], [CUST], [REP], [MFR], [PRODUCT], [QTY], [AMOUNT]
ORDER BY [ORDER_DATE] ASC;


