-- =====================================================================
-- Software Engineering - Lab 7 - FIT - TDTU (ASP.NET Core - DB First / Razor Pages)
-- Student Name: Le Hoang Tri
-- Student ID: 524H0199
-- =====================================================================

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'SchoolDB')
BEGIN
    CREATE DATABASE SchoolDB;
END
GO

USE SchoolDB;
GO

IF OBJECT_ID('dbo.Enrollments', 'U') IS NOT NULL DROP TABLE dbo.Enrollments;
IF OBJECT_ID('dbo.Courses', 'U') IS NOT NULL DROP TABLE dbo.Courses;
IF OBJECT_ID('dbo.Instructors', 'U') IS NOT NULL DROP TABLE dbo.Instructors;
IF OBJECT_ID('dbo.Students', 'U') IS NOT NULL DROP TABLE dbo.Students;
IF OBJECT_ID('dbo.Departments', 'U') IS NOT NULL DROP TABLE dbo.Departments;
GO

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL,
    Budget DECIMAL(18, 2) NOT NULL,
    StartDate DATE NOT NULL
);

CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    HireDate DATE NOT NULL
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(100) NOT NULL,
    Credits INT NOT NULL,
    DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID)
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    EnrollmentDate DATE NOT NULL
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY IDENTITY(1,1),
    CourseID INT FOREIGN KEY REFERENCES Courses(CourseID),
    StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
    Grade DECIMAL(3, 2)
);
GO

INSERT INTO Departments (Name, Budget, StartDate) VALUES
('Computer Science', 120000.00, '2023-01-01'),
('Software Engineering', 150000.00, '2023-02-15'),
('Information Systems', 95000.00, '2023-03-10');

INSERT INTO Instructors (FirstName, LastName, HireDate) VALUES
('John', 'Doe', '2020-08-15'),
('Ky-Trung', 'Pham', '2018-09-01'),
('Alice', 'Brown', '2021-01-20');

INSERT INTO Courses (Title, Credits, DepartmentID) VALUES
('Introduction to Programming', 3, 1),
('Software Engineering', 4, 2),
('Database Management Systems', 3, 3);

INSERT INTO Students (FirstName, LastName, EnrollmentDate) VALUES
('Jane', 'Smith', '2023-09-01'),
('Hoang Tri', 'Le (524H0199)', '2024-09-01'),
('Alice', 'Johnson', '2023-09-01');

INSERT INTO Enrollments (CourseID, StudentID, Grade) VALUES
(1, 1, 3.50),
(2, 2, 3.90),
(3, 3, 3.70);
GO
