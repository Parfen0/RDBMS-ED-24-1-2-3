USE WebStor
--1 завдання--
SELECT
      EMPL_NUM,
       NAME, 
       AGE, 
       TITLE
 FROM [dbo]. [SALESREPS]
 WHERE Age > 45
 -- 2 завдання--
SELECT DISTINCT MFR,
PRODUCT
FROM

[dbo] . [ORDERS]
 WHERE YEAR(ORDER_DATE) = 2008;

--Завдання 3 --

SELECT TOP (10) WITH TIES 
    REP AS EmployeeID,
COUNT (*) AS OrderCount
FROM
    [dbo] . [ORDERS]
WHERE YEAR(ORDER_DATE) = 2008
GROUP BY REP 
ORDER BY COUNT(*) DESC; 