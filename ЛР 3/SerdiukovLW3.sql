"USE University;
GO"

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    EnrollmentDate DATE
);
GO

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName NVARCHAR(100),
    CourseDescription TEXT,
    Credits INT
);
GO


INSERT INTO Students (StudentID, FirstName, LastName, EnrollmentDate)
VALUES
    (1, 'Олександр', 'Петров', '2020-09-01'),
    (2, 'Марія', 'Коваль', '2021-01-15'),
    (3, 'Іван', 'Шевченко', '2019-09-10');
GO


INSERT INTO Courses (CourseID, CourseName, CourseDescription, Credits)
VALUES
    (101, 'Програмування', 'Основи програмування', 3),
    (102, 'Бази даних', 'Вивчення реляційних баз даних', 4),
    (103, 'Алгоритми', 'Алгоритми та структури даних', 3);
GO


SELECT * FROM Students;
GO

SELECT * FROM Courses;
GO



ALTER TABLE Students ADD Email NVARCHAR(100);
GO



ALTER TABLE Courses ADD Department NVARCHAR(100);
GO



SELECT * FROM Students;
GO

SELECT * FROM Courses;
GO


DROP DATABASE University;
GO


CREATE DATABASE SHOP;
GO




"USE SHOP;
GO"

CREATE TABLE SALES (
    SALES_ORDER_ID BIGINT PRIMARY KEY,
    REVISION_NUMBER TINYINT,
    ORDER_DATE DATETIME,
    DUE_DATE DATE,
    SHIP_DATE DATE,
    ONLINE_ORDER_FLAG BIT,
    CUSTOMER_ID INT,
    SALES_PERSON_ID INT,
    TERRITORY_ID INT,
    SUB_TOTAL DECIMAL(18, 4),
    TAX_AMT DECIMAL(18, 4),
    FREIGHT DECIMAL(18, 4),
    MODIFIED_DATE DATETIME
);
GO


INSERT INTO SALES (SALES_ORDER_ID, REVISION_NUMBER, ORDER_DATE, DUE_DATE, SHIP_DATE, ONLINE_ORDER_FLAG, CUSTOMER_ID, SALES_PERSON_ID, TERRITORY_ID, SUB_TOTAL, TAX_AMT, FREIGHT, MODIFIED_DATE)
VALUES 
    (43659, 11, '1753-01-01 00:00:00.000', '2011-06-12', '2011-06-07', 0, 29825, 279, 5, 184590.1346, 1971.5149, 616.0984, '2011-06-07 00:00:00.000'),
    (43660, 8, '2011-05-31 00:00:00.000', '2011-06-12', '2011-06-07', 0, 29672, 279, 5, 1294.2529, 124.2483, 38.8276, '2011-06-07 00:00:00.000');
GO


SELECT * FROM SALES;
GO


DROP TABLE SALES;
GO


DROP DATABASE SHOP;
GO
