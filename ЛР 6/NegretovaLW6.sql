USE WebStor1;


/*задача 1*/
CREATE TABLE [dbo].[OFFICES] (
    OfficeID INT PRIMARY KEY IDENTITY(1,1),
    City NVARCHAR(100) NOT NULL,
    Region NVARCHAR(50) NOT NULL,
    SalesTarget DECIMAL(12, 2) NOT NULL,
    ManagerID INT NULL
);


SELECT OfficeID, City, ManagerID
FROM [dbo].[OFFICES]
WHERE Region = 'East' AND SalesTarget <= 350000.00;

/*задача 2.1*/
SELECT *
FROM [dbo].[ORDERS]
WHERE OrderDate NOT BETWEEN '2008-01-01' AND '2008-12-31'
  AND (PRODUCT LIKE '_A%' OR PRODUCT LIKE '%0%');

  /*задача 2.2*/
SELECT MFR, COUNT(DISTINCT OrderID) AS OrderCount, SUM(TotalPrice) AS TotalSum
FROM [dbo].[ORDERS]
WHERE OrderDate NOT BETWEEN '2008-01-01' AND '2008-12-31'
  AND (PRODUCT LIKE '_A%' OR PRODUCT LIKE '%0%')
GROUP BY MFR
ORDER BY TotalSum ASC;




/*задача 2.3*/
SELECT TOP 1 WITH TIES MFR, SUM(TotalPrice) AS TotalSum
FROM [dbo].[ORDERS]
WHERE OrderDate NOT BETWEEN '2008-01-01' AND '2008-12-31'
  AND (PRODUCT LIKE '_A%' OR PRODUCT LIKE '%0%')
GROUP BY MFR
ORDER BY TotalSum DESC;

/*задача 3*/
SELECT TOP 1 WITH TIES REP_OFFICE, 
    COUNT(*) AS EmployeeCount
FROM [dbo].[SALESREPS]
WHERE TITLE = 'Sales Rep' AND 
    Age IN (29, 45, 48)
GROUP BY REP_OFFICE
ORDER BY EmployeeCount DESC;

/*задача 4*/
SELECT TOP 1 WITH TIES MFR_ID, Product_ID, [Description], 
    LEN([Description]) AS DescriptionLength
FROM [dbo].[PRODUCTS]
ORDER BY DescriptionLength DESC;

/*задача 5*/
SELECT DISTINCT CONCAT_WS(' ', RTRIM(MFR_ID), RTRIM(PRODUCT_ID), RTRIM(DESCRIPTION)) AS ConcatenatedString,
       LEN(CONCAT_WS(' ', RTRIM(MFR_ID), RTRIM(PRODUCT_ID), RTRIM(DESCRIPTION))) AS StringLength
FROM [dbo].[PRODUCTS]
WHERE PRODUCT_ID NOT LIKE '%[^0-9]%'
ORDER BY StringLength DESC;

/*задача 6*/
SELECT TOP 1 WITH TIES CustomerID, 
       CONCAT(SUBSTRING(CustomerName, 1, 2), REPLICATE('*', LEN(CustomerName) - 4), SUBSTRING(CustomerName, LEN(CustomerName) - 1, 2)) AS MaskedName, 
       CreditLimit
FROM [dbo].[CUSTOMERS]
ORDER BY CreditLimit ASC;









