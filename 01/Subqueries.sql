/*
Вкладені запити
 
 
 Скалярний
 Скалярний підзапит це підзапит, який повертає одне значення як результат. 
 Використовується в місцях, де значення однієї змінної може бути замінене на результат підзапиту.

   Скалярний автономний
   Скалярний автономний гарантований
   Скалярний кореляційний
   Скалярний кореляційний гарантований

 
 
 Табличний (Похідні таблиці / Узагальнений табличний вираз (CTE))
 Табличний підзапит повертає набір рядків, який можна використовувати 
 як проєкцію для зовнішнього запиту.

   Табличний автономний
   Табличний кореляційний

 */


/*
Скалярний
 Скалярний підзапит це підзапит, який повертає одне значення як результат. 
 Використовується в місцях, де значення однієї змінної може бути замінене на результат підзапиту.
 */

 SELECT sr.* -- Зовнішній запит
   FROM [dbo].[SALESREPS] sr
  WHERE sr.AGE = (SELECT MAX(s.AGE) -- Підзапит скалярний автономний гарантований
                    FROM [dbo].[SALESREPS] s)
 ;


 SELECT *
   FROM [dbo].[SALESREPS] s
  WHERE s.REP_OFFICE = (SELECT f.OFFICE -- Підзапит скалярний автономний не гарантований
                          FROM [dbo].[OFFICES] f
                         WHERE f.MGR = 108)
  ;

  SELECT *
  FROM [dbo].[OFFICES];
  

-- Скалярний автономний гарантований — підзапит, який завжди повертає значення (не повертає NULL)
-- Скалярний автономний не гарантований — підзапит, 
-- який не пов'язаний з зовнішнім запитом і може бути виконаний окремо.





/* Табличний вкладений запит (Похідні таблиці / Узагальнений табличний вираз (CTE))
 Табличний підзапит повертає набір рядків, який можна використовувати 
 як проєкцію для зовнішнього запиту.*/


 SELECT o.MFR,
        SUM(o.QTY) TOTAL_QTY
   FROM [dbo].[ORDERS] o
  GROUP BY o.MFR
HAVING SUM(o.QTY) > 100
;

-- Табличний автономний вкладений запит (похідна таблиця)
SELECT *
FROM (SELECT o.MFR,
         SUM(o.QTY) TOTAL_QTY
        FROM [dbo].[ORDERS] o
    GROUP BY o.MFR
 -- HAVING SUM(o.QTY) > 100
) q
WHERE q.TOTAL_QTY > 100
;


-- Узагальнений табличний вираз (CTE)

--1
SELECT TOP 1 WITH TIES 
       o1.REP,
COUNT (DISTINCT o1.ORDER_NUM) AS ORDER_QTY
FROM [dbo].[ORDERS] o1
GROUP BY o1.REP
ORDER BY ORDER_QTY DESC
;


--2 Необхідно отримати перелік всіх замовлень співробітника, 
--  який забезпечив максимальну кількість замовлень

SELECT *
  FROM [dbo].[ORDERS] o4
 WHERE o4.REP IN (SELECT o3.REP     
                    FROM [dbo].[ORDERS] o3
                   GROUP BY o3.REP
                  HAVING COUNT (DISTINCT o3.ORDER_NUM) = (SELECT MAX(o2.ORDER_QTY)
                                          FROM (SELECT o1.REP,
                                                       COUNT (DISTINCT o1.ORDER_NUM) AS ORDER_QTY
                                                  FROM [dbo].[ORDERS] o1
                                              GROUP BY o1.REP) o2))
;






WITH OrderSummary AS (
     SELECT o1.REP,
            COUNT (DISTINCT o1.ORDER_NUM) AS ORDER_QTY
       FROM [dbo].[ORDERS] o1
      GROUP BY o1.REP
),
MaxOrderQty AS (
     SELECT MAX(ORDER_QTY) AS MAX_QTY
       FROM OrderSummary
)
SELECT *
  FROM [dbo].[ORDERS] o4
 WHERE o4.REP IN (SELECT o3.REP
                    FROM OrderSummary o3
				   WHERE o3.ORDER_QTY = (SELECT MAX_QTY FROM MaxOrderQty) 
                  ) 
;
