USE WebStor1;

SELECT OFFICE, CITY, MGR
FROM dbo.OFFICES
WHERE REGION = 'Ñõ³äíèé'
  AND TARGET <= 350000.00;

  
  SELECT *
FROM dbo.ORDERS
WHERE YEAR(ORDER_DATE) <> 2008
  AND (PRODUCT LIKE '_A%' OR PRODUCT LIKE '%0%');



  SELECT MFR, COUNT(DISTINCT ORDER_NUM) AS UniqueOrders, SUM(AMOUNT) AS TotalAmount
FROM dbo.ORDERS
WHERE YEAR(ORDER_DATE) <> 2008
  AND (PRODUCT LIKE '_A%' OR PRODUCT LIKE '%0%')
GROUP BY MFR
ORDER BY TotalAmount ASC;


SELECT TOP 1 WITH TIES MFR, SUM(AMOUNT) AS TotalAmount
FROM dbo.ORDERS
WHERE YEAR(ORDER_DATE) <> 2008
  AND (PRODUCT LIKE '_A%' OR PRODUCT LIKE '%0%')
GROUP BY MFR
ORDER BY TotalAmount DESC;

SELECT TOP 1 WITH TIES rep_office AS office_id, COUNT(empl_num) AS employee_count
FROM dbo.SALESREPS
WHERE title = 'Sales Rep' AND age IN (29, 45, 48)
GROUP BY rep_office
ORDER BY employee_count DESC;


SELECT TOP 1 WITH TIES mfr_id, product_id, description, LEN(description) AS description_length
FROM dbo.PRODUCTS
ORDER BY description_length DESC;


SELECT DISTINCT CONCAT_WS(' ', RTRIM(mfr_id), RTRIM(product_id), RTRIM(description)) AS concatenated_string,
LEN(CONCAT_WS(' ', RTRIM(mfr_id), RTRIM(product_id), RTRIM(description))) AS concatenated_length
FROM dbo.PRODUCTS
WHERE product_id NOT LIKE '%[^0-9]%'
ORDER BY concatenated_length DESC;

SELECT cust_num AS customer_id, 
       LEFT(company, 2) + REPLICATE('*', LEN(company) - 4) + RIGHT(company, 2) AS masked_name,
       credit_limit
FROM dbo.CUSTOMERS
WHERE credit_limit = (SELECT MIN(credit_limit) FROM dbo.CUSTOMERS);
