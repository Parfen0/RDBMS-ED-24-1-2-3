/* 1. Створення бази даних "STUDENTS" */
CREATE DATABASE STUDENTS;
GO

/* Перейдіть до бази даних "STUDENTS" */
USE STUDENTS;
GO

/* 2. Створення таблиць */
/* a. Створення таблиці "PersonalInfo" */
CREATE TABLE PersonalInfo (
    StudentID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DateOfBirth DATE
);
GO

/* b. Створення таблиці "AcademicInfo" */
CREATE TABLE AcademicInfo (
    RecordID INT PRIMARY KEY,
    StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
    Faculty NVARCHAR(100),
    Curator NVARCHAR(100),
    EnrollmentYear INT
);
GO

/* c. Створення таблиці "ContactInfo" */
CREATE TABLE ContactInfo (
    ContactID INT PRIMARY KEY,
    StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
    Email NVARCHAR(100),
    PhoneNumber NVARCHAR(15)
);
GO

/* 3. Операції зі структурою таблиці "ContactInfo" */
/* a. Додайте стовбець "Address" */
ALTER TABLE ContactInfo ADD Address NVARCHAR(200);
GO

/* b. Видаліть стовбець "PhoneNumber" */
ALTER TABLE ContactInfo DROP COLUMN PhoneNumber;
GO

/* c. Змініть ім'я стовпця "Email" на "EmailAddress" */
EXEC sp_rename 'ContactInfo.Email', 'EmailAddress', 'COLUMN';
GO

/* 4. Змінення типу даних стовпця "Faculty" у таблиці "AcademicInfo" на NVARCHAR(150) */
ALTER TABLE AcademicInfo ALTER COLUMN Faculty NVARCHAR(150);
GO

/* 5. Додайте нову таблицю "Extracurricular" */
CREATE TABLE Extracurricular (
    ActivityID INT PRIMARY KEY,
    StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
    ActivityName NVARCHAR(100),
    JoinDate DATE
);
GO

/* Видаліть таблицю "Extracurricular" */
DROP TABLE Extracurricular;
GO

/* 6. Створення бази даних "TEACHER" */
CREATE DATABASE TEACHER;
GO

/* Переконайтесь, що база даних була створена, а потім видаліть її */
DROP DATABASE TEACHER;
GO

/* 7. Переключення на потрібну базу даних "STUDENTS" */
USE STUDENTS;
GO

/* Додати три рядки даних до таблиці "PersonalInfo" */
INSERT INTO PersonalInfo (StudentID, FirstName, LastName, DateOfBirth)
VALUES
(1, 'Олександр', 'Петров', '2000-05-15'),
(2, 'Марія', 'Іваненко', '2001-03-22'),
(3, 'Василь