/*

Довільний коментар

*/

CREATE DATABASE STUDENTS;

USE STUDENTS;

CREATE TABLE PersonalInfo (

StudentID INT PRIMARY KEY,

FirstName NVARCHAR(50),

LastName NVARCHAR(50),

DateOfBirth DATE

);

﻿/*

Довільний коментар

*/

CREATE TABLE AcademicInfo (

RecordID INT PRIMARY KEY,

StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),

Faculty NVARCHAR(100),

Curator NVARCHAR(100),

EnrollmentYear INT

);

﻿/*

Довільний коментар

*/

CREATE TABLE ContactInfo (

ContactID INT PRIMARY KEY,

StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),

Email NVARCHAR(100),

PhoneNumber NVARCHAR(15)

);

﻿/*

Довільний коментар

*/

ALTER TABLE ContactInfo ADD Address NVARCHAR(200);
﻿/*

Довільний коментар

*/
ALTER TABLE ContactInfo DROP COLUMN PhoneNumber;
﻿/*

Довільний коментар

*/
EXEC sp_rename 'ContactInfo.Email', 'EmailAddress', 'COLUMN';

﻿/*

Довільний коментар

*/

ALTER TABLE AcademicInfo
﻿/*

Довільний коментар

*/
ALTER COLUMN Faculty NVARCHAR(150);

﻿/*

Довільний коментар

*/

CREATE TABLE Extracurricular (
﻿/*

Довільний коментар

*/
ActivityID INT PRIMARY KEY,

StudentID INT FOREIGN KEY REFERENCES PersonalInfo(StudentID),

ActivityName NVARCHAR(100),

JoinDate DATE

);
﻿/*

Довільний коментар

*/
DROP TABLE Extracurricular;

﻿/*

Довільний коментар

*/
CREATE DATABASE TEACHER
﻿/*

Довільний коментар

*/
DROP DATABASE TEACHER;
﻿/*

Довільний коментар

*/
USE STUDENTS;

﻿/*

Довільний коментар

*/

INSERT INTO PersonalInfo (StudentID, FirstName, LastName, DateOfBirth)

VALUES

(1, 'Олександр', 'Петров', '2000-05-15'),

(2, 'Марія', 'Іваненко', '2001-03-22'),

(3, 'Василь', 'Коваленко', '1999-10-10');

﻿/*

Довільний коментар

*/
