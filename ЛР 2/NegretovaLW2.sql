
   CREATE DATABASE STUDENTS;

   /* Перехід до бази даних "STUDENTS" */
   USE STUDENTS;

   /* Створення таблицю "c" */
   
    CREATE TABLE PersonalInfo (
        StudentID INT PRIMARY KEY,
        FirstName NVARCHAR(50),
        LastName NVARCHAR(50),
        DateOfBirth DATE
    );

	/* Створення таблицю "AcademicInfo" */
	
      CREATE TABLE AcademicInfo (
        RecordID INT PRIMARY KEY,
        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
        Faculty NVARCHAR(100),
        Curator NVARCHAR(100),
        EnrollmentYear INT
    );

	/* Створення таблицю "ContactInfo" */
	    CREATE TABLE ContactInfo (
        ContactID INT PRIMARY KEY,
        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
        Email NVARCHAR(100),
        PhoneNumber NVARCHAR(15)
    );

	/* Додавання стовбця "Address" */
	
        ALTER TABLE ContactInfo ADD Address NVARCHAR(200);

		 /* Видалення стовбець "PhoneNumber" */
		 ALTER TABLE ContactInfo DROP COLUMN PhoneNumber;

		 /* Зміна імені стовбця "Email" на "EmailAddress" */
		 EXEC sp_rename 'ContactInfo.Email', 'EmailAddress', 'COLUMN';

		 /* Зміна тип даних для стовбця "Faculty" у таблиці "AcademicInfo" на NVARCHAR(150) */
		 ALTER TABLE AcademicInfo
   ALTER COLUMN Faculty NVARCHAR(150);

   /* Додавання нової таблиці "Extracurricular" */
   
        CREATE TABLE Extracurricular (
        ActivityID INT PRIMARY KEY,
        StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),
        ActivityName NVARCHAR(100),
        JoinDate DATE
    );
	/* Видалення таблиці */
	DROP TABLE Extracurricular;

	USE STUDENTS;

	CREATE DATABASE TEACHER;

	DROP DATABASE TEACHER;


	USE STUDENTS;

	INSERT INTO PersonalInfo (StudentID, FirstName, LastName, DateOfBirth)
VALUES 
    (1, 'Олександр', 'Петров', '2000-05-15'),
    (2, 'Марія', 'Іваненко', '2001-03-22'),
    (3, 'Василь', 'Коваленко', '1999-10-10');









