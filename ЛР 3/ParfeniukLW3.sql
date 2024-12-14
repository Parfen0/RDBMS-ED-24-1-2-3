-- PRIMARY KEY
--1) � ������� �������� ����� ������� ��������
--2) � ������� �� ���� ���� ������� NULL
--3) ������� ���� ������ ����� ���� PK
--4) ���� ���� ����������� PK (���������� � �������� ��������
CREATE TABLE Groups (
GroupID INT NOT NULL,         --PRIMARY KEY
Title   NVARCHAR(20),
Curator NVARCHAR(100)
)
;

ALTER TABLE Groups ADD CONSTRAINT PK_GroupID PRIMARY KEY(GroupID);

 
  
  -- FOREIGN KEY 
  -- �� ���� ���� �������, �� ������ � ������� ���� �������, �� ���� ���������� FK
  -- ������ ���� �������� NULL
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
VALUES (2, '��-24-3', '�����');

INSERT INTO [dbo].[Students] ([StudentID], [NAME], [GroupID], [E-MAIL])
VALUES (2, '������ �.�.', 1, '124@mail.com');

SELECT*
FROM [dbo].[Groups];

SELECT*
FROM [dbo].[Students];
 
DROP TABLE Groups;
 
DROP TABLE [dbo].[Students];



