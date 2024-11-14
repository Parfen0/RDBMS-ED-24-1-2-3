SELECT 
    EmployeeID,       -- Ідентифікатор працівника
    EmployeeName,     -- Ім'я працівника
    Age,              -- Вік працівника
    Position          -- Посада працівника



FROM 
    [dbo].[SALESREPS]


WHERE 
    Age > 45


ORDER BY 

    Age DESC;






	SELECT DISTINCT 
    MFR,             -- Ідентифікатор виробника
    PRODUCT          -- Ідентифікатор товару



FROM 
    [dbo].[ORDERS]


WHERE 
    YEAR(OrderDate) = 2008;





	SELECT TOP 1 WITH TIES
    REP AS EmployeeID,      -- Ідентифікатор працівника
    COUNT(*) AS OrderCount  -- Кількість проведених замовлень


FROM 
    [dbo].[ORDERS]


WHERE 
    YEAR(OrderDate) = 2008  -- Тільки замовлення за 2008 рік


GROUP BY 
    REP


ORDER BY 
    OrderCount DESC;        -- Сортування за кількістю замовлень у порядку спадання



