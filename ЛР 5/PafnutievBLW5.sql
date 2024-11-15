
USE WebStor1;


SELECT 
    EMPL_NUM,      
    NAME,       
    AGE,            
    TITLE           
FROM 
    [dbo].[SALESREPS]
WHERE 
    AGE > 45
ORDER BY 
    AGE DESC;


	SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'ORDERS';


SELECT DISTINCT 
    MFR AS manufacturer_id, 
    PRODUCT AS product_id
FROM 
    [dbo].[ORDERS]
WHERE 
    YEAR(ORDER_DATE) = 2008;



	SELECT TOP 1 WITH TIES 
    REP AS employee_id, 
    COUNT(*) AS order_count
FROM 
    [dbo].[ORDERS]
WHERE 
    YEAR(ORDER_DATE) = 2008
GROUP BY 
    REP
ORDER BY 
    COUNT(*) DESC;