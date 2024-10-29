-- Создание базы данных UniversityDB
CREATE DATABASE UniversityDB;

-- Использование базы данных UniversityDB
USE UniversityDB;

-- Создание таблицы Departments
CREATE TABLE Departments (
DepartmentID INT NOT NULL,
DepartmentName VARCHAR(100)
);

-- Создание таблицы Professors
CREATE TABLE Professors (
ProfessorID INT NOT NULL,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Age TINYINT,
DepartmentID INT,
Email VARCHAR(100)
);

-- Добавление первичного ключа для таблицы Departments
ALTER TABLE Departments ADD CONSTRAINT PK_Department PRIMARY KEY (DepartmentID);

-- Добавление первичного ключа для таблицы Professors
ALTER TABLE Professors ADD CONSTRAINT PK_Professor PRIMARY KEY (ProfessorID);

-- Добавление уникального ограничения на поле Email в таблице Professors
ALTER TABLE Professors ADD CONSTRAINT UQ_Professor_Email UNIQUE (Email);

-- Добавление внешнего ключа между таблицами Professors и Departments
ALTER TABLE Professors ADD CONSTRAINT FK_Professor_Department FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);

-- Добавление ограничения проверки возраста профессоров (возраст должен быть >= 20)
ALTER TABLE Professors ADD CONSTRAINT CK_Age CHECK (Age >= 20);

-- Изменение поля FirstName: теперь оно не может быть NULL
ALTER TABLE Professors ALTER COLUMN FirstName VARCHAR(50) NOT NULL;

-- Изменение поля LastName: теперь оно не может быть NULL
ALTER TABLE Professors ALTER COLUMN LastName VARCHAR(50) NOT NULL;

-- Добавление ограничения по умолчанию для поля DepartmentName в таблице Departments (значение по умолчанию — 'General')
ALTER TABLE Departments ADD CONSTRAINT DF_DepartmentName DEFAULT 'General' FOR DepartmentName;
 
-- Застосується DEFAULT значення 'General'
INSERT INTO Departments (DepartmentID) VALUES (1);

INSERT INTO Professors (ProfessorID, FirstName, LastName, Age, DepartmentID, Email) 
VALUES (1, 'John', 'Smith', 57, 1, 'john.smith@university.com');

INSERT INTO Professors (ProfessorID, FirstName, LastName, Age, DepartmentID, Email) 
VALUES (2, 'Jane', 'Doe', 35, 1, 'jane.doe@university.com');

-- Удаление таблицы Professors
DROP TABLE IF EXISTS Professors;

-- Удаление таблицы Departments
DROP TABLE IF EXISTS Departments;

-- Удаление базы данных UniversityDB
DROP DATABASE UniversityDB;

-- Создание базы данных CompanyDB
CREATE DATABASE CompanyDB;

-- Использование базы данных CompanyDB
USE CompanyDB;

CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY, 
FirstName VARCHAR(50) NOT NULL, 
LastName VARCHAR(50) NOT NULL, 
Email VARCHAR(100) UNIQUE, 
Position VARCHAR(50) DEFAULT 'Junior Developer'
);

CREATE TABLE Departments (
DepartmentID INT PRIMARY KEY, 
DepartmentName VARCHAR(100) NOT NULL CHECK (DepartmentName <> ''), 
Budget DECIMAL(10, 2) CHECK (Budget > 0), 
DefaultRoomNumber INT DEFAULT 101
);

CREATE TABLE Assignments (
AssignmentID INT PRIMARY KEY, 
EmployeeID INT NOT NULL, 
DepartmentID INT NOT NULL, 
AssignmentDate DATETIME DEFAULT GETDATE(), 
FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID), 
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Вставка відділу
INSERT INTO Departments (DepartmentID, DepartmentName, Budget) 
VALUES (1, 'Human Resources', 50000);

-- Вставка працівника
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email) 
VALUES (1, 'John', 'Smith', 'john.smith@company.com');

-- Вставка призначення
INSERT INTO Assignments (AssignmentID, EmployeeID, DepartmentID) 
VALUES (1, 1, 1);


SELECT * FROM Employees WHERE EmployeeID = 999;


INSERT INTO Employees (EmployeeID, FirstName, LastName, Email) 
VALUES (999, 'New', 'Employee', 'new.employee@company.com');

INSERT INTO Assignments (AssignmentID, EmployeeID, DepartmentID) 
VALUES (2, 999, 1);

DROP TABLE IF EXISTS Assignments;  
DROP TABLE IF EXISTS Employees;     
DROP TABLE IF EXISTS Departments;    

ALTER DATABASE CompanyDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE CompanyDB;



