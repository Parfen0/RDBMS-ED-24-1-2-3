-- ЗАВДАННЯ 1 --

-- 1. Створення нової бази даних University
CREATE DATABASE University;

-- Використання бази даних
USE University;

-- 2. Створення таблиць

-- Таблиця Students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    EnrollmentDate DATE
);

-- Таблиця Courses
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    CourseDescription TEXT,
    Credits INT
);

-- 3. Заповнення таблиць даними

-- Додавання записів у Students
INSERT INTO Students (StudentID, FirstName, LastName, EnrollmentDate)
VALUES
(1, 'John', 'Doe', '2022-09-01'),
(2, 'Jane', 'Smith', '2023-01-15'),
(3, 'Mark', 'Johnson', '2023-03-20');

-- Додавання записів у Courses
INSERT INTO Courses (CourseID, CourseName, CourseDescription, Credits)
VALUES
(101, 'Mathematics', 'Advanced mathematics course.', 3),
(102, 'Physics', 'Introduction to physics.', 4),
(103, 'Literature', 'Study of classic literature.', 2);

-- 4. Вибірка даних
SELECT * FROM Students;
SELECT * FROM Courses;

-- 5. Модифікація таблиць

-- Додавання стовпця Email до Students
ALTER TABLE Students ADD Email VARCHAR(100);

-- Додавання стовпця Department до Courses
ALTER TABLE Courses ADD Department VARCHAR(100);
-- заповнення стовпця з адресами у таблиці Students
UPDATE Students
SET Email = CASE 
    WHEN StudentID = 1 THEN 'john.doe@example.com'
    WHEN StudentID = 2 THEN 'jane.smith@example.com'
    WHEN StudentID = 3 THEN 'mark.johnson@example.com'
    ELSE NULL
END;

-- Заповнення стовпця Department у таблиці Courses
UPDATE Courses
SET Department = CASE 
    WHEN CourseID = 101 THEN 'Mathematics Department'
    WHEN CourseID = 102 THEN 'Physics Department'
    WHEN CourseID = 103 THEN 'Literature Department'
    ELSE NULL
END;

-- 6. Вибірка даних після модифікації
SELECT * FROM Students;
SELECT * FROM Courses;

-- 7. Видалення бази даних University
Use master;
DROP DATABASE University;

-- ЗАВДАННЯ 2 --

-- 1. Створення нової бази даних SHOP
CREATE DATABASE SHOP;

-- Використання бази даних
USE SHOP;

-- 2. Створення таблиці SALES
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
    SUB_TOTAL DECIMAL(19,4),
    TAX_AMT DECIMAL(10,4),
    FREIGHT DECIMAL(10,4),
    MODIFIED_DATE DATETIME
);

-- 3. Внесення даних до таблиці SALES
INSERT INTO SALES (SALES_ORDER_ID, REVISION_NUMBER, ORDER_DATE, DUE_DATE, SHIP_DATE, ONLINE_ORDER_FLAG,
                   CUSTOMER_ID, SALES_PERSON_ID, TERRITORY_ID, SUB_TOTAL, TAX_AMT, FREIGHT, MODIFIED_DATE)
VALUES
(43659, 11, '1753-01-01 00:00:00.000', '2011-06-12', '2011-06-07', 0, 29825, 279, 5, 184590.1346, 1971.5149, 616.0984, '2011-06-07 00:00:00.000'),
(43660,  8, '2011-05-31 00:00:00.000', '2011-06-12', '2011-06-07', 0, 29672, 279, 5, 1294.2529, 124.2483, 38.8276, '2011-06-07 00:00:00.000'),
(43661,  8, '2011-05-31 00:00:00.000', '2011-06-12', '2011-06-07', 0, 29734, 282, 6, 32726.4786, 3153.7696, 985.553, '2011-06-07 00:00:00.000'),
(43662,  8, '2011-05-31 00:00:00.000', '2011-06-12', '2011-06-07', 0, 29994, 282, 6, 28832.5289, 2775.1646, 867.2389, '2011-06-07 00:00:00.000'),
(43663,  8, '2011-05-31 00:00:00.000', '2011-06-12', '2011-06-07', 0, 29565, 276, 4, 419.4589, 40.2681, 12.5838, '2011-06-07 00:00:00.000');

-- 4. Вибірка даних
SELECT * FROM SALES;

-- 5. Видалення таблиці SALES
DROP TABLE SALES;

-- 6. Видалення бази даних SHOP
Use master;
DROP DATABASE SHOP;
