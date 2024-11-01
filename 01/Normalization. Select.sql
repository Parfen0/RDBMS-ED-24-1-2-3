-- НОРМАЛІЗАЦІЯ ТА ДЕНОРМАЛІЗАЦІЯ ДАНИХ. КОНСТРУКЦІЯ SELECT

SELECT * FROM [dbo].[CUSTOMERS];
SELECT * FROM [dbo].[OFFICES];
SELECT * FROM [dbo].[ORDERS];
SELECT * FROM [dbo].[PRODUCTS];
SELECT * FROM [dbo].[SALESREPS];

SELECT * FROM [dbo].[CUSTOMERS];
SELECT * FROM [dbo].[SALESREPS];


SELECT * FROM [dbo].[ORDERS];
SELECT * FROM [dbo].[CUSTOMERS];
SELECT * FROM [dbo].[SALESREPS];



SELECT F.*,
       S.*,
	   O.*,
	   C.*,
	   P.*
FROM [dbo].[OFFICES] F
FULL JOIN [dbo].[SALESREPS] S ON S.REP_OFFICE = F.OFFICE
FULL JOIN [dbo].[ORDERS] O ON O.REP = S.EMPL_NUM
FULL JOIN [dbo].[CUSTOMERS] C ON C.CUST_NUM = O.CUST
FULL JOIN [dbo].[PRODUCTS] P ON P.MFR_ID = O.MFR
                             AND P.PRODUCT_ID = O.[PRODUCT]
;


-- ОСНОВНІ НОРМАЛЬНІ ФОРМИ

-- 1NF
/*
1. Усі рядки унікальні -> Кожний рядок зберігає унікальну комбінацію атрибутів
2. Комірки зберігають тільки атомарні значення (неподільні за сенсом)
3. Комірки зберігають однотипні дані
*/


-- 2NF
/*
1. Таблиця відповідає 1NF
2. Якщо таблиця не містить композитний первинний ключ -таблиця знаходиться в 2NF
3. В таблиці відсутні неповні функціональні залежності (всі некючові атрибути повинні 
   залежити від усього первинного ключа)
*/





-- 3NF
/*
1. Таблиця відповідає 2NF
2. Відсутні транзитивні залежності 
*/


-- КОНСТРУКЦІЯ SELECT
-- Вироджений варіант конструкції SELECT

SELECT 'Приклад простого текстового повідомлення' AS [String], -- строкове значення
        10020                                     AS [Number],
		455.50                                    AS [Finantial],
		SYSDATETIME()                             AS [DateTime]



-- КОМПОНЕНТИ КОНСТРУКЦІЇ SELECT 

/*

1 SELECT    5
2 FROM      1
3 WHERE     2 
4 GROUP BY  3
5 HAVING    4
6 ORDER BY  6

*/


SELECT [CUST_REP],
   SUM ([CREDIT_LIMIT]) AS [Загальний кредитний ліміт клієнтів]
FROM [dbo].[CUSTOMERS]
--WHERE [CREDIT_LIMIT] > 50000
GROUP BY [CUST_REP]
ORDER BY [CUST_REP] DESC
;