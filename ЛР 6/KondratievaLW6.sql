

SELECT OfficeID, City, ManagerID
FROM [dbo].[OFFICES]
WHERE Region = 'East' AND SalesTarget <= 350000.00;




SELECT *
FROM [dbo].[ORDERS]
WHERE YEAR(OrderDate) NOT BETWEEN 2008 AND 2008
  AND (ProductID LIKE '_A%' OR ProductID LIKE '%0%');




  SELECT MFR_ID, COUNT(DISTINCT OrderID) AS UniqueOrders, SUM(TotalAmount) AS TotalSales
FROM [dbo].[ORDERS]
WHERE YEAR(OrderDate) NOT BETWEEN 2008 AND 2008
  AND (ProductID LIKE '_A%' OR ProductID LIKE '%0%')
GROUP BY MFR_ID
ORDER BY SUM(TotalAmount) ASC;




SELECT TOP 1 WITH TIES MFR_ID, SUM(TotalAmount) AS TotalSales
FROM [dbo].[ORDERS]
WHERE YEAR(OrderDate) NOT BETWEEN 2008 AND 2008
  AND (ProductID LIKE '_A%' OR ProductID LIKE '%0%')
GROUP BY MFR_ID
ORDER BY SUM(TotalAmount) DESC;



SELECT TOP 1 WITH TIES OfficeID, COUNT(EmployeeID) AS EmployeeCount
FROM [dbo].[SALESREPS]
WHERE Position = 'Sales Rep' AND Age IN (29, 45, 48)
GROUP BY OfficeID
ORDER BY COUNT(EmployeeID) DESC;



SELECT TOP 1 WITH TIES MFR_ID, ProductID, Description, LEN(Description) AS DescriptionLength
FROM [dbo].[PRODUCTS]
ORDER BY LEN(Description) DESC;



SELECT DISTINCT CONCAT_WS(' ', RTRIM(MFR_ID), RTRIM(PRODUCT_ID), RTRIM([DESCRIPTION])) AS ConcatenatedString,
       LEN(RTRIM(CONCAT_WS(' ', MFR_ID, PRODUCT_ID, [DESCRIPTION]))) AS StringLength
FROM [dbo].[PRODUCTS]
WHERE PRODUCT_ID NOT LIKE '%[^0-9]%'
ORDER BY StringLength DESC;



SELECT CustomerID, 
       CONCAT(LEFT(CustomerName, 2), REPLICATE('*', LEN(CustomerName) - 4), RIGHT(CustomerName, 2)) AS MaskedName,
       CreditLimit
FROM [dbo].[CUSTOMERS]
WHERE CreditLimit = (SELECT MIN(CreditLimit) FROM [dbo].[CUSTOMERS]);











