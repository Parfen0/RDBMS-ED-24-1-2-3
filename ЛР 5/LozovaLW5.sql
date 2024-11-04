USE WebStor;

-- Завдання 1 --

SELECT
    EMPL_NUM, 
	NAME, 
	AGE,
	TITLE 

FROM
    [dbo].[SALESREPS]

WHERE 
    Age > 45

ORDER BY 
    Age DESC;

-- Завдання 2 --

SELECT DISTINCT MFR, 
                PRODUCT 
				 
FROM 
    [dbo].[ORDERS] 

WHERE YEAR(ORDER_DATE) = 2008;

--Завдання 3 --

SELECT TOP 1 WITH TIES
    REP AS EmployeeID,
	COUNT(*) AS OrderCount 

FROM 
    [dbo].[ORDERS]

WHERE YEAR(ORDER_DATE) = 2008

GROUP BY REP

ORDER  BY COUNT(*) DESC;
