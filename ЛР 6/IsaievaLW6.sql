﻿USE WebStor;

/*Завдання 1*/
SELECT OFFICE, CITY, MGR
FROM dbo.OFFICES
WHERE REGION = 'East' 
AND TARGET <= 350000.00;

/*Завдання 2.1*/
SELECT *
FROM [dbo].[ORDERS]
WHERE YEAR(ORDER_DATE) NOT BETWEEN 2008 AND 2008 
AND(PRODUCT LIKE '_A%' OR PRODUCT LIKE '%0%');


/*Завдання 2.2*/

SELECT MFR,COUNT(DISTINCT ORDER_NUM) AS UNIQUE_ORDERS,
    SUM(AMOUNT) AS TOTAL_SUM
FROM [dbo].[ORDERS]
WHERE  YEAR(ORDER_DATE) NOT BETWEEN 2008 AND 2008 AND
         (PRODUCT LIKE '_A%' OR PRODUCT LIKE '%0%')
GROUP BY MFR
ORDER BY TOTAL_SUM ASC;


/*Завдання 2.3*/

WITH TotalSums AS (
SELECT MFR, SUM(AMOUNT) AS TOTAL_SUM
FROM  [dbo].[ORDERS]
WHERE YEAR(ORDER_DATE) NOT BETWEEN 2008 AND 2008 AND
        (PRODUCT LIKE '_A%' OR PRODUCT LIKE '%0%')
GROUP BY  MFR
)
SELECT TOP 1 WITH TIES MFR, TOTAL_SUM
FROM TotalSums
ORDER BY TOTAL_SUM DESC;


/*Завдання 3*/

SELECT TOP 1 WITH TIES  REP_OFFICE AS OFFICE_ID,
    COUNT(EMPL_NUM) AS EMPLOYEE_COUNT
FROM [dbo].[SALESREPS]
WHERE TITLE = 'Sales Rep' AND AGE IN (29, 45, 48)
GROUP BY REP_OFFICE
ORDER BY EMPLOYEE_COUNT DESC;


/*Завдання 4*/

SELECT TOP 1 WITH TIES MFR_ID, PRODUCT_ID, [DESCRIPTION], LEN([DESCRIPTION]) AS DESCRIPTION_LENGTH
FROM [dbo].[PRODUCTS]
ORDER BY DESCRIPTION_LENGTH DESC;


/*Завдання 5*/

SELECT DISTINCT RTRIM(CONCAT_WS(' ', UPPER(MFR_ID), PRODUCT_ID, [DESCRIPTION])) AS CONCAT_STR,
    LEN(RTRIM(CONCAT_WS(' ', UPPER(MFR_ID), PRODUCT_ID, [DESCRIPTION]))) AS CONCAT_LEN
FROM [dbo].[PRODUCTS]
WHERE PRODUCT_ID NOT LIKE '%[^0-9]%'
ORDER BY CONCAT_LEN DESC;


/*Завдання 6*/

SELECT CUST_NUM AS CUSTOMER_ID, 
       LEFT(COMPANY, 2) + REPLICATE('*', LEN(COMPANY) - 4) + RIGHT(COMPANY, 2) AS MASKED_NAME,
       CREDIT_LIMIT
FROM  [dbo].[CUSTOMERS]
WHERE CREDIT_LIMIT = (SELECT MIN(CREDIT_LIMIT) FROM DBO.CUSTOMERS);