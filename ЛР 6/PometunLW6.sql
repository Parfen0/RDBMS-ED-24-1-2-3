Use WebStor; 
SELECT OFFICE, CITY, MGR
FROM [dbo].[OFFICES]
WHERE Region = 'Eastern' AND 
TARGET <= 350000.00;  
SELECT *
FROM [dbo].[ORDERS]
WHERE YEAR(ORDER_DATE) NOT BETWEEN 2008 AND 2008 
AND (PRODUCT LIKE '_A%' OR PRODUCT LIKE '%0%')
SELECT MFR, COUNT(DISTINCT ORDER_NUM) AS UniqueOrders, SUM(AMOUNT) AS TotalSUM                    
FROM [dbo].[ORDERS]
WHERE YEAR(ORDER_DATE) NOT BETWEEN 2008 AND 2008 
AND (PRODUCT LIKE '_A%' OR PRODUCT LIKE '%0%')
GROUP BY MFR                                  
ORDER BY TotalSUM ASC;  
SELECT TOP 1 WITH TIES MFR, SUM(AMOUNT) AS TotalSUM
FROM [dbo].[ORDERS]               
WHERE YEAR(ORDER_DATE) NOT BETWEEN 2008 AND 2008 
AND (PRODUCT LIKE '_A%' OR PRODUCT LIKE '%0%') 
GROUP BY MFR                                  
ORDER BY TotalSUM DESC;  
SELECT TOP 1 WITH TIES REP_OFFICE, COUNT(EMPL_NUM) AS EmployeeCount
FROM [dbo].[SALESREPS]
WHERE TITLE = 'Sales Rep'  
AND AGE IN (29, 45, 48)    
GROUP BY REP_OFFICE            
ORDER BY EmployeeCount DESC; 
SELECT TOP 1 WITH TIES MFR_ID, PRODUCT_ID, [DESCRIPTION],
LEN([DESCRIPTION]) AS DescriptionLenght 
FROM [dbo].[PRODUCTS]
ORDER BY LEN (DescriptionLenght) DESC;   
SELECT DISTINCT RTRIM(CONCAT_WS(' ', MFR_ID, PRODUCT_ID, [DESCRIPTION])) AS ConcatenatedString, 
LEN(RTRIM(CONCAT_WS(' ', MFR_ID, PRODUCT_ID, [DESCRIPTION]))) AS StringLength  
FROM [dbo].[PRODUCTS]
WHERE PRODUCT_ID NOT LIKE '%[^0-9]%' 
ORDER BY LEN(RTRIM(CONCAT_WS(' ', MFR_ID, PRODUCT_ID, [DESCRIPTION]))) DESC;  
SELECT CUST_NUM AS CUSTOMER_ID,
CONCAT(LEFT(COMPANY, 2), REPLICATE('*', LEN(COMPANY) - 4), RIGHT(COMPANY, 2)) AS Masked_Name
FROM [dbo].[CUSTOMERS]    
WHERE CREDIT_LIMIT = (SELECT MIN(CREDIT_LIMIT) FROM [dbo].[CUSTOMERS]);







