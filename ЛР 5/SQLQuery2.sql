USE WebStor

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

VALUES (1, 'John', 'Smith', '46', '1230'),
(2, 'Oleh', 'Skrypka', '60', '1800'),
(3, 'Olha', 'Kravchenko', '47', '1300'),
(4, 'Natalia', 'Rohachevska', '31', '1280'),
(5, 'Vasyl', 'Vasyliv', '19', '500'),
(6, 'Jane', 'Smith', '46', '1230'),
(7, 'John', 'Doe', '45', '1230'),
(8, 'Valentyna', 'Pavlychko', '44', '1240');


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

VALUES (1, 'John', 'Smith', '46', '1230', '17', '2007'),
(2, 'Oleh', 'Skrypka', '60', '1800', '20', '2005'),
(3, 'Olha', 'Kravchenko', '47', '1300', '13', '2008'),
(4, 'Natalia', 'Rohachevska', '31', '1280', '18', '2008'),
(5, 'Vasyl', 'Vasyliv', '19', '500', '21', '2009'),
(6, 'Jane', 'Smith', '46', '1230', '19', '2008'),
(7, 'John', 'Doe', '45', '1230', '12', '2007'),
(8, 'Valentyna', 'Pavlychko', '44', '1240', '10', '2008');





SELECT TOP 3 WITH TIES *,
COUNT(DISTINCT REP) AS [AMOUNT]
FROM dbo.ORDERS
WHERE ORDER_DATE = 2008
GROUP BY [ORDER_NUM], [ORDER_DATE], [CUST], [REP], [MFR], [PRODUCT], [QTY], [AMOUNT]
ORDER BY [ORDER_DATE] ASC;