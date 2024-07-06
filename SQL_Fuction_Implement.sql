DROP DATABASE Round61;
GO



USE master;
GO
CREATE DATABASE Round61;
GO
USE Round61;
GO
--Syntex
/* 
CREATE FUNCTION FunctionName
(
Parameter1,
Parameter1,
Parameter1

)
RETURNS DataType
AS
BEGIN
SQL Statement..........
END
*/

CREATE TABLE HomeSales
(
Data DATETIME DEFAULT GETDATE(),
ItemSold VARCHAR(30) NOT NULL,
UnitPrice MONEY NOT NULL,
Quantity VARCHAR(30) NOT NULL,
DiscountPercent FLOAT DEFAULT .05
)
GO

INSERT INTO HomeSales
VALUES
('2024-07-06','Rice',50.00,5,.05),
('2021-07-06','Cake',40.00,4,.05),
('2023-07-06','Chawmin',30.00,3,.05),
('2022-07-06','Noodles',20.00,2,.05),
('2020-07-06','Pizza',10.00,1,.05);
GO
SELECT *
FROM HomeSales;
GO
--SCALAR VALUES FUNCTION
CREATE FUNCTION ScalarCalculaterFunction
(
@UnitPrice MONEY,
@QuantitySold INT,
@DiscountPercent FLOAT
)
RETURNS MONEY
AS
BEGIN
	DECLARE @discountEarned MONEY
	SET  @discountEarned = @UnitPrice * @QuantitySold * @DiscountPercent
	RETURN @discountEarned
END
GO
 SELECT dbo.ScalarCalculaterFunction (1500.00,5,.10) AS 'Discount';
 GO

 SELECT dbo.ScalarCalculaterFunction (200.00,5,.5) AS 'Discount';
 GO
 --

 DECLARE @P MONEY
 SELECT @P = UnitPrice FROM HomeSales WHERE Data= '2021-07-06'
DECLARE @Q INT
 SELECT @Q = Quantity FROM HomeSales WHERE Data= '2021-07-06'
DECLARE @D FLOAT
 SELECT @D = DiscountPercent FROM HomeSales WHERE Data= '2021-07-06'
 SELECT dbo.ScalarCalculaterFunction(@P,@Q,@D);
 GO
 
 SELECT  ItemSold, dbo.ScalarCalculaterFunction(HS.UnitPrice,HS.Quantity,HS.DiscountPercent) 
FROM HomeSales AS HS
WHERE HS.Data= '2023-07-06';
GO
 
 
 --2.-----------------
 CREATE FUNCTION ScalarCalculaterFunction1
(
@Year MONEY,
@Month INT
)
RETURNS MONEY
AS
BEGIN
	DECLARE @TotalSales MONEY
	SELECT  @TotalSales=SUM(UnitPrice * Quantity*(1- DiscountPercent))
	FROM HomeSales
	WHERE YEAR(Data)=@Year AND MONTH(Data)=@Month
	RETURN @TotalSales
	END
GO

SELECT dbo.ScalarCalculaterFunction1(2022,07);
GO
----
CREATE FUNCTION ScalarCalculaterFunction1
(
@Year MONEY,
@Month INT
)
RETURNS MONEY
AS
BEGIN
	DECLARE @TotalSales MONEY
	SELECT  @TotalSales=SUM(UnitPrice * Quantity*(1- DiscountPercent))
	FROM HomeSales
	WHERE YEAR(Data)=@Year AND MONTH(Data)=@Month
	RETURN @TotalSales
	END
GO

ALTER FUNCTION ScalarCalculaterFunction1
(
@Year INT,
@Month INT
)
RETURNS MONEY
AS
BEGIN
	DECLARE @TotalSales MONEY
	SELECT  @TotalSales=SUM(UnitPrice * Quantity*(1- DiscountPercent))
	FROM HomeSales
	WHERE YEAR(Data)=@Year AND MONTH(Data)=@Month
	RETURN @TotalSales
	END
GO


--TABLE VALUES FUCTION
CREATE FUNCTION TableSaleyFunction2(
@Year INT,
@Month INT
)
RETURNS TABLE
AS
RETURN (
	SELECT 
	SUM(UnitPrice * Quantity) AS 'Total Sales',
	 SUM(UnitPrice * Quantity*DiscountPercent) 'Total Discount',
	 SUM(UnitPrice * Quantity*(1-DiscountPercent)) 'Not Amount'
	 FROM HomeSales
	 WHERE YEAR(DATA) = @Year AND MONTH(DATA) = @Month
	 )
GO
SELECT*
FROM dbo.TableSaleyFunction2(2024,07);
GO