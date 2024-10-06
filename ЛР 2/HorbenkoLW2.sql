CREATE DATABASE STUDENTS

CREATE TABLE PersonalInfo 
        (StudentID INT PRIMARY KEY,
        FirstName NVARCHAR(50),
        LastName NVARCHAR(50),
        DateOfBirth DATE);

		/*створюю базу даних students, таблицю з рядками, в яких персональні дані*/

       CREATE TABLE AcademicInfo (
        RecordID INT PRIMARY KEY,
        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
        Faculty NVARCHAR(100),
        Curator NVARCHAR(100),
        EnrollmentYear INT);


		/*cтворюю таблицю з академічною інформацією*/


   CREATE TABLE ContactInfo (
        ContactID INT PRIMARY KEY,
        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
        Email NVARCHAR(100),
        PhoneNumber NVARCHAR(15)
    );

		
		/*створюю таблицю з контактною інформацією*/

ALTER TABLE ContactInfo ADD Address NVARCHAR(200);
ALTER TABLE ContactInfo DROP COLUMN PhoneNumber;
EXEC sp_rename 'ContactInfo.Email', 'EmailAddress', 'COLUMN';

   /*роблю операції зі структурою таблиці ContactInfo*/

  ALTER TABLE AcademicInfo
  ALTER COLUMN Faculty NVARCHAR(150);

   /*Змінюю тип даних для стовбця "Faculty" у таблиці "AcademicInfo"*/

           

		/*Додаю нову таблицю "Extracurricular"*/

 DROP TABLE Extracurricular;

 /*Після перевірки таблиці видаляю її*/

 	

	/*Створюю базу даних "TEACHER"*/

	DROP DATABASE TEACHER;

	/*Після перевірки видаляю базу даних*/

	USE STUDENTS;

	/*Переключаюся на потрібну базу даних*/

	INSERT INTO PersonalInfo (StudentID, FirstName, LastName, DateOfBirth)
VALUES 
    (1, 'Олександр', 'Петров', '2000-05-15'),
    (2, 'Марія', 'Іваненко', '2001-03-22'),
    (3, 'Василь', 'Коваленко', '1999-10-10');

	/*Додаю три рядки даних до таблиці "PersonalInfo"*/















