CREATE DATABASE STUDENTS;

USE STUDENTS;
-- створюємо та починаємо використовувати базу данних

CREATE TABLE PersonalInfo (
StudentID INT PRIMARY KEY,
FirstName NVARCHAR(50),
LastName NVARCHAR(50),
DateOfBirth DATE
);
-- створюємо таблицю в новіій базі данних для зберігання персональної інформації про студента


CREATE TABLE AcademicInfo (
RecordID INT PRIMARY KEY,
StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
Faculty NVARCHAR(100),
Curator NVARCHAR(100),
EnrollmentYear INT
);
-- створюємо таблицю в новіій базі данних для зберігання академічної інформації студента


CREATE TABLE ContactInfo (
ContactID INT PRIMARY KEY,
StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
Email NVARCHAR(100),
PhoneNumber NVARCHAR(15)
);
-- створюємо таблицю в новіій базі данних для зберігання контактних даних студента


ALTER TABLE ContactInfo ADD Address NVARCHAR(200);

ALTER TABLE ContactInfo DROP COLUMN PhoneNumber;
-- додаємо до таблиці з контактними даними стовпець адреси, та видаляємо стовпець номеру телефону


EXEC sp_rename 'ContactInfo.Email', 'EmailAddress', 'COLUMN';
-- змінюємо назву стовпця електронної адреси


ALTER TABLE AcademicInfo
ALTER COLUMN Faculty NVARCHAR(150);
-- змінюємо властивість розміру містимих даних в стовпця факультету

CREATE TABLE Extracurricular (
        ActivityID INT PRIMARY KEY,
        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
        ActivityName NVARCHAR(100),
        JoinDate DATE
    );
DROP TABLE Extracurricular;
-- створюємо та, після перевірки корректного створення, видаляємо таблицю

CREATE DATABASE TEACHER;
DROP DATABASE TEACHER;
-- створюємо та, після перевірки корректного створення, видаляємо базу даних

USE STUDENTS;
-- повертаємося до початкової бази даних

INSERT INTO PersonalInfo (StudentID, FirstName, LastName, DateOfBirth)
VALUES 
    (1, 'Олександр', 'Петров', '2000-05-15'),
    (2, 'Марія', 'Іваненко', '2001-03-22'),
    (3, 'Василь', 'Коваленко', '1999-10-10');

select * from PersonalInfo

-- додаємо інформацію до бази даних та перевіряємо її коректне додавання