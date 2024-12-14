-- PRIMARY KEY
--1) В стовбці містяться тільки унікальні значення
--2) В стовбці не може бути значень NULL
--3) Таблиця може містити тільки один PK
--4) Може бути композитний PK (складатись з декількох стовбців
CREATE TABLE Groups (
GroupID INT NOT NULL,         --PRIMARY KEY
Title   NVARCHAR(20),
Curator NVARCHAR(100)
)
;

ALTER TABLE Groups ADD CONSTRAINT PK_GroupID PRIMARY KEY(GroupID);

 
  
  -- FOREIGN KEY 
  -- Не може бути значень, які відсутні в стовбці іншої таблиці, на який посилається FK
  -- Можуть бути значення NULL
  CREATE TABLE Students (
StudentID INT PRIMARY KEY,
[NAME] NVARCHAR(100),
GroupID INT,
               -- FOREIGN KEY (GroupID) REFERENCES [dbo].[Groups] (GroupID)
);
ALTER TABLE [dbo].[Students] ADD CONSTRAINT FK_GroupID
FOREIGN KEY (GroupID) REFERENCES [dbo].[Groups] (GroupID);
-- UNIQUE
ALTER TABLE [dbo].[Students] ADD [E-MAIL] NVARCHAR(50);

ALTER TABLE [dbo].[Students] ADD CONSTRAINT UQ_EMAIL UNIQUE([E-MAIL]);


-- CHECK  
ALTER TABLE [dbo].[STUDENTS] ADD AGE INT;
ALTER TABLE [dbo].[Students] ADD CONSTRAINT UQ_EMAIL UNIQUE([E-MAIL]);

INSERT INTO Groups([GroupID],[Title], [Curator])
VALUES (2, 'ЕД-24-3', 'ІРИНА');

INSERT INTO [dbo].[Students] ([StudentID], [NAME], [GroupID], [E-MAIL])
VALUES (2, 'Коваль Б.А.', 1, '124@mail.com');

SELECT*
FROM [dbo].[Groups];

SELECT*
FROM [dbo].[Students];
 
DROP TABLE Groups;
 
DROP TABLE [dbo].[Students];



