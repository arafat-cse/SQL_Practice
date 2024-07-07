
CREATE DATABASE eXAM
ON(
NAME='On_Exam',
FILENAME='E:\Isdb61\Md Arafat Rahman\On_Exam.mdf',
SIZE=10MB,
MAXSIZE=100MB,
FILEGROWTH=1MB
)
LOG ON(
NAME='Log_Exam',
FILENAME='E:\Isdb61\Md Arafat Rahman\Log_Exam.ldf',
SIZE=10MB,
MAXSIZE=100MB,
FILEGROWTH=1MB
);
GO
USE eXAM;
GO



EXEC sp_helpdb eXAM;
GO

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);
GO

EXEC sp_help Customers;
GO

INSERT INTO Customers
VALUES
(1,'ARAFAT','arafat@gmail.com'),
(2,'SAMAUL','samaul@gmail.com'),
(3,'TINA','tina@gmail.com');
GO


SELECT *
FROM Customers;
GO

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
	Name VARCHAR(30),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
GO

INSERT INTO Orders
VALUES
(1,'ARAFAT',3),
(2,'TUFAN',1),
(3,'TINA',2);
GO

SELECT * FROM Customers;
SELECT * FROM Orders;
GO
