-- Створення бази даних
CREATE DATABASE UniversityDB;
USE UniversityDB;

-- Створення таблиці Departments
CREATE TABLE Departments (
    DepartmentID INT NOT NULL,
    DepartmentName VARCHAR(100)
);

-- Створення таблиці Professors
CREATE TABLE Professors (
    ProfessorID INT NOT NULL,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age TINYINT,
    DepartmentID INT,
    Email VARCHAR(100)
);

-- PRIMARY KEY для Departments
ALTER TABLE Departments ADD CONSTRAINT PK_Department PRIMARY KEY (DepartmentID);

-- PRIMARY KEY для Professors
ALTER TABLE Professors ADD CONSTRAINT PK_Professor PRIMARY KEY (ProfessorID);

-- UNIQUE обмеження на Email
ALTER TABLE Professors ADD CONSTRAINT UQ_Professor_Email UNIQUE (Email);

-- FOREIGN KEY для DepartmentID
ALTER TABLE Professors ADD CONSTRAINT FK_Professor_Department FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);

-- CHECK обмеження на Age
ALTER TABLE Professors ADD CONSTRAINT CK_Age CHECK (Age >= 20);

-- NOT NULL обмеження для FirstName і LastName
ALTER TABLE Professors ALTER COLUMN FirstName VARCHAR(50) NOT NULL;
ALTER TABLE Professors ALTER COLUMN LastName VARCHAR(50) NOT NULL;

-- DEFAULT значення для DepartmentName
ALTER TABLE Departments ADD CONSTRAINT DF_DepartmentName DEFAULT 'General' FOR DepartmentName;



-- Вставка даних до Departments
INSERT INTO Departments (DepartmentID) VALUES (1); -- Використає DEFAULT значення

select * from Departments

-- Вставка даних до Professors
INSERT INTO Professors (ProfessorID, FirstName, LastName, Age, DepartmentID, Email) 
VALUES (1, 'John', 'Smith', 57, 1, 'john.smith@university.com');

select * from Professors

-- Перевірка обмеження UNIQUE
INSERT INTO Professors (ProfessorID, FirstName, LastName, Age, DepartmentID, Email) 
VALUES (2, 'Jane', 'Doe', 35, 1, 'john.smith@university.com'); -- Викличе помилку

-- Перевірка обмеження CHECK
INSERT INTO Professors (ProfessorID, FirstName, LastName, Age, DepartmentID, Email) 
VALUES (3, 'Bob', 'Doe', 17, 1, 'bob.doe@university.com'); -- Викличе помилку


-- Видалення таблиць
DROP TABLE Professors;
DROP TABLE Departments;

-- Видалення бази даних
USE MASTER
DROP DATABASE UniversityDB;

-- Створення бази даних
CREATE DATABASE CompanyDB;
USE CompanyDB;

-- Створення таблиці Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Position VARCHAR(50) DEFAULT 'Junior Developer'
);

-- Створення таблиці Departments
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL CHECK (DepartmentName <> ''),
    Budget DECIMAL(10, 2) CHECK (Budget > 0),
    DefaultRoomNumber INT DEFAULT 101
);

-- Створення таблиці Assignments
CREATE TABLE Assignments (
    AssignmentID INT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    DepartmentID INT NOT NULL,
    AssignmentDate DATE DEFAULT GETDATE(),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Вставка даних до Departments
INSERT INTO Departments (DepartmentID, DepartmentName, Budget) 
VALUES (1, 'Human Resources', 50000);

-- Вставка даних до Employees
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email) 
VALUES (1, 'John', 'Smith', 'john.smith@company.com');

-- Вставка даних до Assignments
INSERT INTO Assignments (AssignmentID, EmployeeID, DepartmentID) 
VALUES (1, 1, 1);

-- Перевірка FOREIGN KEY обмеження
INSERT INTO Assignments (AssignmentID, EmployeeID, DepartmentID) 
VALUES (2, 999, 1); -- Викличе помилку

-- Видалення таблиць
DROP TABLE Assignments;
DROP TABLE Employees;
DROP TABLE Departments;

-- Видалення бази даних
USE MASTER;
DROP DATABASE CompanyDB;
