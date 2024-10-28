CREATE DATABASE University;

USE University;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    EnrollmentDate DATE
);


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    CourseDescription TEXT,
    Credits INT
);


INSERT INTO Students (StudentID, FirstName, LastName, EnrollmentDate) VALUES
(1, 'Іван', 'Авраменко', '2023-09-01'),
(2, 'Інна', 'Кудря', '2022-09-01'),
(3, 'Гриша', 'Бутенко', '2023-09-01');

INSERT INTO Courses (CourseID, CourseName, CourseDescription, Credits) VALUES
(1, 'Алгоритми', 'Вивчення основ алгоритмічного мислення', 2),
(2, 'Бази даних', 'Основи баз даних та SQL', 3),
(3, 'Програмування', 'Введення в програмування на Python', 4);

ALTER TABLE Students ADD Email VARCHAR(100);

ALTER TABLE Courses ADD Department VARCHAR(100);

SELECT * FROM Students;
SELECT * FROM Courses;


DROP DATABASE University;


