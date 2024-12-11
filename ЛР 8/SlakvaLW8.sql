?/*TASK 1*/
SELECT CUST_NUM
FROM [dbo].[CUSTOMERS]
WHERE CREDIT_LIMIT = (
    SELECT MAX(CREDIT_LIMIT)
    FROM [dbo].[CUSTOMERS]
)
;
/*TASK 2*/
SELECT C.CUST_NUM, O.ORDER_NUM, O.[PRODUCT], O.QTY /*У завданні треба було повернути список замовлень клієнта, тому я додав інформацію про номер, продукт і кількість */
FROM [dbo].[ORDERS] O
JOIN [dbo].[CUSTOMERS] C ON O.CUST = C.CUST_NUM
WHERE C.CREDIT_LIMIT = (
    SELECT MAX(CREDIT_LIMIT)
    FROM [dbo].[CUSTOMERS]
)
;
/*TASK 3*/
SELECT c.CUST_NUM
FROM [dbo].[CUSTOMERS] c
JOIN [dbo].[ORDERS] o ON c.CUST_NUM = o.CUST
WHERE 
    c.CREDIT_LIMIT = (SELECT MAX(CREDIT_LIMIT) FROM [dbo].[CUSTOMERS])
    AND o.ORDER_DATE = (
        SELECT MAX(ORDER_DATE)
        FROM [dbo].[ORDERS] o
        WHERE o.CUST = c.CUST_NUM
    )
	;

SELECT *
FROM [dbo].[CUSTOMERS]
SELECT *
FROM [dbo].[ORDERS]