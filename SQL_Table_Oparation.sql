CREATE DATABASE IT;
GO
DROP DATABASE IT;
GO


CREATE DATABASE IT
ON PRIMARY(
NAME='ON_IT',
FILENAME='D:\Arafat\IsDB\Study\SQL Home Practice\ON_IT.mdf',
SIZE=1MB,
MAXSIZE=10MB,
FILEGROWTH=1MB
)
LOG ON(
NAME='LOG_IT',
FILENAME='D:\Arafat\IsDB\Study\SQL Home Practice\lOG_IT.ldf',
SIZE=1MB,
MAXSIZE=10MB,
FILEGROWTH=1MB
)
GO
USE IT;
GO


CREATE TABLE T2(
Id INT PRIMARY KEY IDENTITY(6,2) NOT NULL,
Guid UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
Name  VARCHAR(30) DEFAULT 'No Name',
PName VARCHAR(30),
Price MONEY DEFAULT 0 NOT NULL,
Quantity INT DEFAULT 0 NOT NULL,
DisCount INT DEFAULT .05 NOT NULL,
SoldDate DATE DEFAULT GETDATE() NOT NULL
);
GO

--DROP TABLE
DROP TABLE T2;
GO
--COLUMN DATA TYPE CHANGE
ALTER TABLE T2
ALTER COLUMN DisCount FLOAT;
GO



ALTER TABLE T2
DROP CONSTRAINT DF__T2__DisCount__4D94879B;
GO
--UPDATE
UPDATE T2
SET DisCount=0.5;
GO
--AUTO INCRAMENT 
ALTER TABLE T2
ADD CONSTRAINT DF__T2__DisCount__3C69FB99 DEFAULT 0.05 FOR DisCount;
GO

EXEC sp_help T2;
GO

SELECT *
FROM T2;
GO

INSERT INTO T1
VALUES
(1,NEWID(),'ARAFAT','COKE',30,7,.5,2024-07-06),
(2,NEWID(),'TINA','PIZZA',40,6,.5,2023-07-06),
(3,NEWID(),'AAT','CHOMIN',50,5,.5,2022-07-06),
(4,NEWID(),'FAT','BATARFILAI',60,4,.5,2021-07-06),
(5,NEWID(),'AT','FUSKA',70,3,.5,2020-07-06);
 GO

 INSERT INTO T2(PName)
 VALUES
 ('ARA'),
 ('ARA'),
 ('ARAFAT');
 GO

 TRUNCATE TABLE T1;
 GO

 --ID CHANGE
 SET IDENTITY_INSERT T1 ON;
 GO
 --ID OFF
  --ID CHANGE
 SET IDENTITY_INSERT T1 OFF;
 GO
 --INSERT ID
 INSERT INTO T1(Id)
 VALUES (200);
 GO