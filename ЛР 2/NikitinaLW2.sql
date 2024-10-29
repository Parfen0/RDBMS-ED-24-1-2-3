* 1. Создание базы данных "STUDENTS" */
CREATE DATABASE STUDENTS5

/* Переход к базе данных "STUDENTS" */
USE STUDENTS;

/* 2. Создание таблиц */


/* a. Создание таблицы "PersonalInfo" */
CREATE TABLE PersonalInfo (
  StudentID INT PRIMARY KEY,
  FirstName NVARCHAR(50),
  LastName NVARCHAR(50),
  DateOfBirth DATE
);


* b. Создание таблицы "AcademicInfo" */
CREATE TABLE AcademicInfo5 (
  RecordID INT PRIMARY KEY,
  StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
  Faculty NVARCHAR(100),
  Curator NVARCHAR(100),
  EnrollmentYear INT
);


/* c. Создание таблицы "ContactInfo" */
CREATE TABLE ContactInfo6 (
  ContactID INT PRIMARY KEY,
  StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
  Email NVARCHAR(100),
  PhoneNumber NVARCHAR(15) 
);

/* 3. Операции с таблицей "ContactInfo" */


/* a. Добавление столбца "Address" */
ALTER TABLE ContactInfo ADD Address NVARCHAR(200);

/* b. Удаление столбца "PhoneNumber" */
ALTER TABLE ContactInfo DROP COLUMN PhoneNumber;

/* c. Переименование столбца "Email" в "EmailAddress" */
EXEC sp_rename 'ContactInfo.Email', 'EmailAddress', 'COLUMN';

/* 4. Изменение типа данных столбца "Faculty" в таблице "AcademicInfo" */
ALTER TABLE AcademicInfo
ALTER COLUMN Faculty NVARCHAR(150)

/* 5. Создание и удаление таблицы "Extracurricular" */
CREATE TABLE Extracurricular (
 ActivityID INT PRIMARY KEY,
 StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
 ActivityName NVARCHAR(100),
 JoinDate DATE
);

/* Удаление таблицы "Extracurricular" */
DROP TABLE Extracurricular;

/* 6. Создание и удаление базы данных "TEACHER" */
CREATE DATABASE TEACHER;
 DROP DATABASE TEACHER;

 /* 7. Добавление данных в таблицу "PersonalInfo" */
INSERT INTO PersonalInfo (StudentID, FirstName, LastName, DateOfBirth)
VALUES 
(1, 'Олександр', 'Петров', '2000-05-15'),
(2, 'Марія', 'Іваненко', '2001-03-22'),
(3, 'Василь', 'Коваленко', '1999-10-10');