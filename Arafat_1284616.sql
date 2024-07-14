--1.CREATE DATABASE
CREATE DATABASE T_SQL
ON PRIMARY(
NAME='WADA_1',
FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\WADA_1.mdf',
SIZE=10MB,
MAXSIZE=100MB,
FILEGROWTH=10%

)
LOG ON(
NAME='LOG_WADA_1',
FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LOG_WADA_1.ldf',
SIZE=10MB,
MAXSIZE=100MB,
FILEGROWTH=10%
);
GO
--SUE DATABASE USE
USE T_SQL;
GO
--2.CHANGE SIZE DATA FILE

ALTER DATABASE T_SQL
MODIFY FILE (  SIZE= 'SIZE',SIZE= 20MB);
GO
--3. FILE RENAME


--4. RENAME THE DATABASE
EXEC sp_renamedb 'T_SQL' , 'TraineeDB';

--5
EXEC sp_helpdb  T_SQL;
GO
--6
EXEC sp_helpdb  T_SQL;
GO
--7 DROP DATABASE
DROP DATABASE T_SQL;
GO
--8 CREATE TABLE
CREATE TABLE Trainees
(
TraineeID INT PRIMARY KEY,
TraineeName VARCHAR(40),
Batch VARCHAR(20)
);
GO
--9. Show  Database location, size
EXEC sp_helpconstraint 'Trainees';
GO

--10 INSERT DATA
INSERT INTO Trainees
VALUES
 (1,'ARAFAT',16),
 (2,'SAMAUL',15),
 (3,'TUHIN',14);
 GO

 --11 CRATE TABLE 
 CREATE TABLE tsps
(
StudentID INT PRIMARY KEY,
StudentName VARCHAR(40),
Batch VARCHAR(20)
);
GO
--12 INSERT DATA
INSERT INTO tsps
VALUES
 (1,'ARAFAT',16),
 (2,'SAMAUL',15),
 (3,'TUHIN',14);
 GO
 --13 CREATE PERSON TABLE 
 CREATE TABLE Person
(
PersonID INT PRIMARY KEY IDENTITY(5,100),
PersonName VARCHAR(30),
);
GO
--14 INSERT DATA
INSERT INTO Person
VALUES
 ('Tusar'),
 ('Kabbo'),
 ('samaul');
 GO
 --15 Show Person Table
 SELECT *
 FROM Person;
 GO
  --16 CREATE PERSON TABLE 
  CREATE TABLE GUIT
(
Column1 INT PRIMARY KEY IDENTITY,
Column2 UNIQUEIDENTIFIER
);
GO

--17  Inserting a single row

INSERT INTO GUIT (Column2) 
VALUES 
(NEWID()), 
(NEWID()), 
(NEWID()),
(NEWID()), 
(NEWID());
GO


 --18 FINE THE LAST VALUES
SELECT Column1,Column2
FROM GUIT
WHERE Column1=5
GO
--19 Preson Table row insert
SET IDENTITY_INSERT GUIT ON;
GO
INSERT INTO GUIT (Column1,Column2)
VALUES 
(250,NEWID());
GO
--20. Show me all
 SELECT *
FROM GUIT
GO

 --21.CRATE TABLE 
 CREATE TABLE Contacts
 ( 
 ContactID INT,
 ContactName VARCHAR(30)
 );
 GO

 --22 CHANGE COLUMN LENGTH
 ALTER TABLE Contacts
ALTER COLUMN ContactName VARCHAR(50);

EXEC sp_help Contacts
--23 ADD NEW COLUMN
ALTER TABLE Contacts
ADD ContactTel VARCHAR(16),
ContactCell VARCHAR(16) 
GO


SELECT *
FROM Contacts;
GO
--25. INSERT TABLE 
INSERT INTO Contacts 
VALUES
(1,'Quazi Ashique','0172889933','NULL '),
(2,'Hasinur Shahid','805098','0152980890'),
(3,'Mir Mosharaf','0172889933','NULL '),
(3,'Shaheen Akter','0172889933','NULL ');
GO

--26 ADD NEW COLUMN
ALTER TABLE Contacts
ADD ContactAddress VARCHAR(100)
GO
--27 SHOW TABLE

SELECT *
FROM Contacts;
GO

--29 CREATE TABLE BOOK
CREATE TABLE Books
(
Name CHAR(30),
Publisher VARCHAR(30) DEFAULT ('M/A'),
Price MONEY,
Publish SMALLDATETIME,
CurrentEdition INT,
Available BIT
);
GO

SELECT *
FROM Books;
GO

--29 INSERT TABLE
INSERT INTO Books
VALUES
('Programming Practice','Show & Tell Consulting',600,2004-01-01,3,1),
('Introducing C#','Show & Tell Consulting',700,2003-01-01,4,0),
('SQL Server2000','BPB',1000,2001-01-01,2,1),
('XML','N/A',700,1,0,Null);
GO
SELECT *
FROM Trainees

--30 SubQuery 
SELECT ContactID,ContactName
FROM Contacts 
WHERE ContactID=
(SELECT TraineeID
FROM Trainees WHERE TraineeName='ARAFAT'
)

