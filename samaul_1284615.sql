
--1. create an database
CREATE DATABASE Tsql
ON PRIMARY (
NAME ='Tsql',
FILENAME='E:\samaul\SQL\mexam\tsql.mdf',
SIZE =10MB,
MAXSIZE=100MB,
FILEGROWTH=10%
)
LOG ON(
NAME ='Tsql_Log',
FILENAME='E:\samaul\SQL\mexam\tsql_log.ldf',
SIZE =10MB,
MAXSIZE=100MB,
FILEGROWTH=10%
);
GO
--USE DATABASE
USE Tsql;
GO
--2. change the size on datafile
ALTER DATABASE Tsql 
MODIFY FILE(
NAME ='Tsql',
SIZE =20MB
);
GO

--3. add tarafile
ALTER DATABASE Tsql 
ADD FILE 
(
	NAME = WADA_data1,
    FILENAME ='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\WADA_data1fg.mdf',
	SIZE = 5MB   
)
GO

--4. RENAME THE DATABASE 
EXEC sp_renamedb 'Tsql', 'TraineeDB';
GO

--5. show  all database server
EXEC sp_helpdb TraineeDB;
go

--6. show the files 

EXEC sp_helpfile WADA_data1;
GO


--USING Northwind DATABASE
USE Northwind;
GO
--7. DROP THE DATABASE
DROP DATABASE TraineeDB;
GO

----------------------
--CREATE AN A DATABASE 
CREATE DATABASE Exam1;
GO

USE Exam1;
GO


--8. CREATE AN A TABLE 

CREATE TABLE Trainees(
TraineeID INT PRIMARY KEY,
TraineeName VARCHAR(40),
Batch VARCHAR(20)
);
GO
/*
EXEC sp_help Trainees;
GO

*/



--9. SHOW THE CONSTRANIT TABLE

EXEC sp_helpconstraint Trainees;
GO

--10. insert into value on a table

INSERT INTO Trainees
VALUES
(1,'Rina','B-16'),
(2,'Bina','B-18'),
(3,'Tina','B-17'),
(4,'Mina','B-16'),
(5,'Kina','B-18');
GO

--11. CREATE AN A TABLE TSPS
CREATE TABLE tsps
(
	tspId INT PRIMARY KEY,
	Name VARCHAR(30),
	Batch VARCHAR(30)
);
GO


--create an a table Studeent
CREATE TABLE Studeent
(
	stId INT PRIMARY KEY,
	Name VARCHAR(30),
	tspId INT REFERENCES tsps(tspId),
	Batch VARCHAR(30)
);
GO

--12. INSERT INTO tsps
INSERT INTO tsps
VALUES
(1,'Rina','B-16'),
(2,'Bina','B-18'),
(3,'Tina','B-17'),
(4,'Mina','B-16'),
(5,'Kina','B-18');
GO
--INSERT INTO student
INSERT INTO Studeent
VALUES
(1,'Samaul',2,'B-16'),
(2,'Arafat',1,'B-18'),
(3,'Shihan',2,'B-17'),
(4,'Mimma',3,'B-16'),
(5,'Rita',  4,'B-18');
GO

--13. create person table
CREATE TABLE PERSON1(
 Pid  INT IDENTITY(100,5),
 PName VARCHAR(30)
);
GO


--14. TNSERT THE VALUE
INSERT INTO PERSON1
VALUES
('Tusar'),
('Kabbo'),
('Samiul');
GO

--15. SHOW THE DATA PARSON TABLE

SELECT *
FROM PERSON1;
GO

--16. CREATE AN A TABLE 

CREATE TABLE Ag(
AgId INT IDENTITY,
Aguid UNIQUEIDENTIFIER DEFAULT NEWID()
);
GO

--17. INSERT AG TABLE

INSERT INTO Ag
VALUES
(NEWID()),
(NEWID()),
(NEWID()),
(NEWID()),
(NEWID());
GO


--18. FIND OUT THE LAST VALUE

SELECT @@IDENTITY
FROM Ag;
GO

--19. INSERT ROW 250

SET IDENTITY_INSERT  Ag ON;

INSERT INTO Ag(AgId)
VALUES
(250)
GO

SET IDENTITY_INSERT  Ag OFF;
--20. SHOW THE TABLE
SELECT * 
FROM Ag;
GO

--21. CREATE AN CONTACTS
CREATE TABLE Contacts(
	ContactId INT NOT NULL,
	ContactName VARCHAR(30)
);
GO

--22. CHANGE SIZE CONTACT NAME COLUMN

ALTER TABLE Contacts
ALTER COLUMN ContactName VARCHAR(50);
GO

--23. ADD THE COLUMN IN Contacts table
ALTER TABLE Contacts
ADD  ContactTel VARCHAR(16) NOT NULL,
	ContactCell VARCHAR(16) NOT NULL;
GO

SELECT *
FROM Contacts;
GO

--24. INSERT INTO ContactS
INSERT INTO ContactS
VALUES
(1,'Quazi Ashique','01794272915',''),
(2,'Hasinur Shadid','01794272915','01981154493'),
(3,'Mir Mosharaf','01794272915',''),
(4,'Shaheen Akter','','');
GO


--25 add column 
ALTER TABLE Contacts
ADD ContactsAddress VARCHAR(100);
GO

--26 SHOW THE TABLE
SELECT *
FROM Contacts;
GO

--27 CREATE BOOKS
CREATE TABLE Books
(
Name CHAR(30) NOT NULL,
Publisher VARCHAR(30) NOT NULL DEFAULT 'N/A',
Price MONEY ,
Publish SMALLDATETIME,
CurrentEdition INT NOT NULL,
Available BIT 
);
GO


--28 INSERT VALUES Books
INSERT INTO Books
VALUES
('Programming Practice','Show & Tell Consulting',600.00,2004-01-01,3,1),
('Introduction C#','Show & Tell Consulting',700.00,2003-03-03,4,0),
('SQL Server 2000','BPB',1000.00,2002-01-01,2,1),
('XML','',700.00,ISNULL,0,0);
GO

--SEE THE Books
SELECT * 
FROM Books;
GO

TRUNCATE TABLE Books;
GO

--29 SUBQUERY 





--create an a table Studeent
CREATE TABLE Employees
(
	emid INT PRIMARY KEY,
	Name VARCHAR(30),
	EmBatch VARCHAR(30)
);
GO

--INSERT INTO tsps
INSERT INTO Employees
VALUES
(1,'Rina','B-16'),
(2,'Bina','B-18'),
(3,'Tina','B-17'),
(4,'Mina','B-16'),
(5,'Kina','B-18');
GO

--CREATE AN A TABLE TSPS
CREATE TABLE Salse
(
	salseId INT PRIMARY KEY,
	salarName VARCHAR(30),
	Batch VARCHAR(30)
);
GO

--DEPARTMENT
CREATE TABLE Department
(
	salseId INT PRIMARY KEY,
	dName VARCHAR(30),

);
GO

--insert into 
INSERT INTO Department
VALUES 
(1,'HR'),
(2,'IT');
GO


--INSERT INTO student
INSERT INTO Salse
VALUES
(1,'Samaul','B-16'),
(2,'Arafat','B-28'),
(3,'Shihan','B-17'),
(4,'Mimma','B-26'),
(5,'Rita', 'B-28');
GO
--SUB QUERY where department is it
SELECT salarName
FROM Salse
WHERE salseId=(
SELECT salseId did
FROM Department
WHERE dName='IT'
);
GO





SELECT *
FROM Employees 
GO


--RIGHT join
SELECT *
FROM Employees E
RIGHT JOIN Salse S
ON E.EmBatch=S.Batch;
GO
--JOIN
SELECT *
FROM Employees E
JOIN Salse S
ON E.EmBatch=S.Batch;
GO