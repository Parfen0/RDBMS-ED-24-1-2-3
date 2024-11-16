USE WebStor

--задача 1--
SELECT Office, City, MGR
FROM [dbo].[OFFICES]
WHERE Region = 'Eastern' AND 
 TARGET <= 350000.00;

--задача 2.1--
SELECT ORDER_NUM, ORDER_DATE, CUST, REP, MFR, PRODUCT, QTY, AMOUNT 
FROM [dbo].[ORDERS]
WHERE YEAR(ORDER_DATE) NOT BETWEEN 2008 AND 2008
    AND (Product LIKE '_A%' OR Product LIKE '%0%');

--задача 2.2--
SELECT MFR, 
    COUNT(DISTINCT ORDER_NUM) AS UniqueOrders,
    SUM(Amount) AS TotalAmount
FROM [dbo].[ORDERS]
WHERE YEAR(ORDER_DATE) NOT BETWEEN 2008 AND 2008
    AND (Product LIKE '_A%' OR Product LIKE '%0%')
GROUP BY MFR
ORDER BY TotalAmount ASC;

--задача 2.3--
SELECT TOP 1 WITH TIES MFR, 
    SUM(Amount) AS TotalAmount
FROM [dbo].[ORDERS]
WHERE YEAR(ORDER_DATE) NOT BETWEEN 2008 AND 2008
    AND (Product LIKE '_A%' OR Product LIKE '%0%')
GROUP BY MFR
ORDER BY TotalAmount DESC;

--задача 3--
SELECT TOP 1 WITH TIES REP_OFFICE, 
    COUNT(*) AS EmployeeCount
FROM [dbo].[SALESREPS]
WHERE TITLE = 'Sales Rep' AND 
Age IN (29, 45, 48)
GROUP BY REP_OFFICE
ORDER BY EmployeeCount DESC;

--задача 4--
SELECT TOP 1 WITH TIES MFR_ID, Product_ID, [Description], 
    LEN([Description]) AS DescriptionLength
FROM [dbo].[PRODUCTS]
ORDER BY DescriptionLength DESC;

--задача 5--
SELECT DISTINCT 
    CONCAT_WS(' ', RTRIM(MFR_ID), RTRIM(PRODUCT_ID), RTRIM([Description])) AS ConcatenatedString,
    LEN(RTRIM(CONCAT_WS(' ', MFR_ID, PRODUCT_ID, [Description]))) AS StringLength
FROM [dbo].[PRODUCTS]
WHERE PRODUCT_ID NOT LIKE '%[^0-9]%'
ORDER BY StringLength DESC;

--задача 6--
SELECT TOP 1 WITH TIES CUST_NUM, 
    CONCAT(LEFT(COMPANY, 2), 
    REPLICATE('*', LEN(COMPANY) - 4), 
    RIGHT(COMPANY, 2)) AS MaskedName,
    CREDIT_LIMIT
FROM [dbo].[CUSTOMERS]
ORDER BY CREDIT_LIMIT ASC;