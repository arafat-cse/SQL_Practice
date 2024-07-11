--------CLASS 12
DROP DATABASE Round61
GO
CREATE DATABASE Round61
GO
USE Round61
GO

--1. ONE TO ONE RELATIONSHIP
CREATE TABLE Users
(
	UserId INT PRIMARY KEY,
	UserName VARCHAR(30)
)
GO
CREATE TABLE UserProfile
(
	ProfileId INT PRIMARY KEY,
	ProfileData VARCHAR(30),
	UserId INT UNIQUE,
	FOREIGN KEY (UserId) REFERENCES Users(UserId)
);

--2. ONE TO MANY RELATIONSHIP
CREATE TABLE Departments
(
	DepartmentId INT PRIMARY KEY,
	DepartmentName VARCHAR(30)
)
GO
CREATE TABLE Employees
(
	EmployeeId INT PRIMARY KEY,
	EmployeeName VARCHAR(30),
	DepartmentId INT ,
	FOREIGN KEY (DepartmentId) REFERENCES Departments(DepartmentId)
);

--3. ONE TO MANY RELATIONSHIP
CREATE TABLE Students
(
	StudentId INT PRIMARY KEY,
	StudentName VARCHAR(30)
)
GO
CREATE TABLE Courses
(
	CoursesId INT PRIMARY KEY,
	CoursesName VARCHAR(30)
);

CREATE TABLE StudentCourse
(
	StudentId INT,
	CoursesId INT,
	PRIMARY KEY (StudentId,CoursesId),
	FOREIGN KEY (StudentId) REFERENCES Students(StudentId),
	FOREIGN KEY (CoursesId) REFERENCES Courses(CoursesId)
)
GO

--SELF REFFERENCING RELATIONSHIP
CREATE TABLE Employeess
(
	EmployeeId INT PRIMARY KEY,
	EmployeeName VARCHAR(30),
	ManagerId INT,
	FOREIGN KEY (ManagerId) REFERENCES Employeess(EmployeeId)
)
GO
