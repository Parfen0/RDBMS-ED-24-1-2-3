--DATA CONSTRAINTS

-- NOT NULL
-- PRIMARY KEY
-- FOREIGN KEY 
-- UNIQUE
-- CHECK  

  
CREATE DATABASE UNIVERSITY;



-- PRIMARY KEY
--1) В стовбці містяться тільки унікальні значення
--2) В стовбці не може бути значень NULL
--3) Таблиця може містити тільки один PK
--4) Може бути композитний PK (складатись з декількох стовбців
 
  
--1-й спосіб задати PK
 
CREATE TABLE Groups (
GroupID INT NOT NULL,         --PRIMARY KEY
Title   NVARCHAR(20),
Curator NVARCHAR(100)
)
;

--2-й спосіб задати PK

ALTER TABLE Groups ADD CONSTRAINT PK_GroupID PRIMARY KEY(GroupID);

 
  
  -- FOREIGN KEY 
  -- Не може бути значень, які відсутні в стовбці іншої таблиці, на який посилається FK
  -- Можуть бути значення NULL
   
--1-й спосіб задати FK
CREATE TABLE Students (
StudentID INT PRIMARY KEY,
[NAME] NVARCHAR(100),
GroupID INT,
               -- FOREIGN KEY (GroupID) REFERENCES [dbo].[Groups] (GroupID)
);
 
	 

 --2-й спосіб задати FK
ALTER TABLE [dbo].[Students] ADD CONSTRAINT FK_GroupID
FOREIGN KEY (GroupID) REFERENCES [dbo].[Groups] (GroupID);

  

-- UNIQUE
ALTER TABLE [dbo].[Students] ADD [E-MAIL] NVARCHAR(50);

ALTER TABLE [dbo].[Students] ADD CONSTRAINT UQ_EMAIL UNIQUE([E-MAIL]);


-- CHECK  
ALTER TABLE [dbo].[Students] ADD AGE INT;

ALTER TABLE [dbo].[Students] ADD CONSTRAINT UQ_EMAIL UNIQUE([E-MAIL]);




INSERT INTO Groups([GroupID],[Title], [Curator])
VALUES (2, 'ЕК-20-1', 'Огліх В.В.');

INSERT INTO [dbo].[Students] ([StudentID], [NAME], [GroupID], [E-MAIL])
VALUES (2, 'Сидоренко В.О.', 1, '124@mail.com');

  

SELECT*
FROM [dbo].[Groups];

SELECT*
FROM [dbo].[Students];
 
DROP TABLE Groups;
 
DROP TABLE [dbo].[Students];


