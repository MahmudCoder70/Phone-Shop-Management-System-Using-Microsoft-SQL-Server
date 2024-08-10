
/*
									SQL Project Name: Online Phone Shop Management System(OPS_MS)
												Traine Name : Md.MAhmud Hasan
												Traine ID   :  1280555
												Batch ID    : CS/PNTL-M/58/01

-----------------------------------------------------------------------------------------------------

Table of Contents: DDL
			=> SECTION 01: Created a Database [OPS_MS]
			=> SECTION 02: Created Appropriate Tables with column definition related to the project
			=> SECTION 03: ALTER, DROP AND MODIFY TABLES & COLUMNS
			=> SECTION 04: CREATE CLUSTERED AND NONCLUSTERED INDEX
			=> SECTION 05: CREATE SEQUENCE & ALTER SEQUENCE
			=> SECTION 06: CREATE A VIEW & ALTER VIEW
			=> SECTION 07: CREATE STORED PROCEDURE & ALTER STORED PROCEDURE
			=> SECTION 08: CREATE FUNCTION(SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED) & ALTER FUNCTION
			=> SECTION 09: CREATE TRIGGER (FOR/AFTER TRIGGER)
			=> SECTION 10: CREATE TRIGGER (INSTEAD OF TRIGGER)
*/



/*
==============================  SECTION 01  ==============================
	   CHECK DATABASE EXISTANCE & CREATE DATABASE WITH ATTRIBUTES
==========================================================================
*/

USE master
GO

IF DB_ID('OPS_MS') IS NOT NULL
DROP DATABASE OPS_MS
GO

CREATE DATABASE OPS_MS
ON
(
	Name='OPS_MS_data',
	FileName='C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\OPS_MS_data.mdf',
    size=5MB,
	maxsize=50MB,
	filegrowth=5%
)
LOG ON
(
	Name='OPS_MS_log',
	FileName='C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\OPS_MS_log.ldf',
    size=8MB,
	maxsize=40MB,
	filegrowth=5MB	
)
GO

USE OPS_MS
GO

/*
==============================  SECTION 02  ==============================
		          CREATE TABLES WITH COLUMN DEFINITION 
==========================================================================
*/

--============== Table with  PRIMARY KEY & nullability CONSTRAINT ============--


--*USE SCHEMA

--*table-1
 CREATE TABLE Ctegory
 (
	Cat_ID INT PRIMARY KEY NONCLUSTERED,
	Cat_Name VARCHAR (30) NOT NULL
 )
 GO

 --*table-2
 CREATE TABLE Brand
 (
	B_ID INT PRIMARY KEY ,
	Brand_Name VARCHAR(40) NOT NULL
 )
 GO


 --*table-3
  CREATE TABLE Vat
  (
	V_ID INT PRIMARY KEY,
	VatParcent FLOAT NOT NULL
  )
GO


 --** Table with IDENTITY,PRIMARY KEY,FOREIGN KEY,DEFAULT & CHECK CONSTRAINT & set CONSTRAINT name **--


 --*table-4
 CREATE TABLE Mob_Configuration
 (
	M_ID INT IDENTITY PRIMARY KEY,
	M_Model VARCHAR(50) NOT NULL,
	RAM VARCHAR (10)  NULL,
	Storage VARCHAR (10) NULL,
	Dislay_size VARCHAR(5)NOT NULL,	
	Camera VARCHAR (20) NULL,
	IMEI_No VARCHAR(50) DEFAULT NEWID()NOT NULL,
	Mobile_Price MONEY NOT NULL,
	Firstarrivaldate DATE NOT NULL,
	B_ID INT REFERENCES Brand (B_ID),
	Cat_ID INT REFERENCES Ctegory(Cat_ID)
 )
 GO

 --*table-5
 CREATE TABLE Customer
 (
	C_ID INT IDENTITY PRIMARY KEY,
	C_Name NVARCHAR (50) NOT NULL,
	E_Mail NVARCHAR (50) NULL,
	C_Address VARCHAR(100),
	City VARCHAR (30) NOT NULL DEFAULT ('N/A'),
	PhoneNo VARCHAR (20) NOT NULL CHECK (PhoneNo LIKE '01[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Cat_ID INT REFERENCES Ctegory (Cat_ID),
	B_ID INT REFERENCES Brand (B_ID)
 )
 GO

 --*table-6
 CREATE TABLE Bill_Pay
 (
	Bill_ID INT IDENTITY PRIMARY KEY,
	PaybleAmount MONEY NOT NULL,
	Purchase_DATE DATE DEFAULT GETDATE(),
	C_ID INT REFERENCES Customer (C_ID)
 )
 GO

 --*Table-7
 CREATE TABLE Pre_Booking
 (
	BookinID INT PRIMARY KEY IDENTITY(1,1),
	BookingMoney MONEY CONSTRAINT ck_MinimunAmount CHECK (BookingMoney>1000.00),
	C_ID INT REFERENCES Customer
 )
 GO
 
  --*table-8
 CREATE TABLE SalesPerson
 (	
	empID INT PRIMARY KEY,
	empName VARCHAR(50) NOT NULL,
 )
 GO

 --** Table With composite PRIMARY KEY **--

 --*table-9
 CREATE TABLE OrderDetails
 (	
	Cat_ID INT REFERENCES Ctegory(Cat_ID),
	B_ID INT REFERENCES Brand (B_ID),
	V_ID INT REFERENCES Vat (V_ID),
	C_ID INT REFERENCES Customer (C_ID),
	Bill_ID INT REFERENCES Bill_Pay(Bill_ID),
	BookinID INT REFERENCES Pre_Booking(BookinID),
	empID INT REFERENCES SalesPerson(empID),
	 PRIMARY KEY(Cat_ID,B_ID,V_ID,C_ID,Bill_ID,BookinID,empID)
 )
 GO
 
 --Table-10
 CREATE TABLE Review
 (
  RV_ID INT UNIQUE,
  RV_Comment NVARCHAR (100) NOT NULL
 )
 GO

 --** CREATE A SCHEMA **--

 CREATE SCHEMA rv
 GO
 --** USE SCHEMA IN A TABLE **--
 --TABLE-11
CREATE TABLE rv.Reply_Review
(
	RR_ID INT,
	ReplyComment NVARCHAR(100) NOT NULL
)
GO

 --**CREATE TABLE FOR FUNCTION**--
 --TABLE-12
 CREATE TABLE ITEM
 (
	ID INT ,
	[date] date  null,
	ItemSold VARCHAR(30) NULL,
	UnitePrice MONEY NOT NULL,
	SoldQuantity INT NOT NULL,
	DiscountParcent FLOAT DEFAULT 0.10
 )
 GO

/*==============================  SECTION 03  ==============================
		          ALTER, UPDATE,DROP AND MODIFY TABLES & COLUMNS
==========================================================================
*/


--** ALTER TABLE SCHEMA AND TRANSFER TO [DBO] **--
 ALTER SCHEMA dbo TRANSFER rv.Reply_Review
 GO

 --** Update column definition **--
 ALTER TABLE Review
 ALTER COLUMN RV_Comment NVARCHAR(150)NULL
 GO

 --** DROP COLUMN **--
 ALTER TABLE Review
 DROP COLUMN Review
 GO

 ALTER TABLE Customer
 DROP COLUMN AmtPaid
 GO

 --** ADD COLUMN **--
 ALTER TABLE Review
 ADD  Review VARCHAR(150) NULL
 GO

 --** ADD COLUMN WITH DEFAULT CONSTRAINT **--
 ALTER TABLE Customer
 ADD C_AnotherContact VARCHAR(20) DEFAULT ('N/A')
 GO

 --** DROP TABLE **--
 IF OBJECT_ID ('Review') IS NOT NULL
 DROP TABLE Review
 GO

 /*
==============================  SECTION 04  ==============================
		          CREATE CLUSTERED AND NONCLUSTERED INDEX
==========================================================================
*/

--**CLUSTERED INDEX**--

CREATE CLUSTERED INDEX ix_Categories
ON Ctegory(Cat_ID)
GO

--**NONCLUSTERED INDEX**--
 CREATE NONCLUSTERED INDEX ix_Categorie
 ON Ctegory (Cat_Name)
 GO

 /*
==============================  SECTION 05  ==============================
							 CREATE SEQUENCE
==========================================================================
*/

--** CREATE SEQUESCE**--
 CREATE SEQUENCE seqCreate
	 AS INT
	 START WITH 1001
	 INCREMENT BY 1
 GO


/*
==============================  SECTION 06  ==============================
			CREATE A VIEW  WITH ENCRYPTION & SCHEMABINDING 
==========================================================================
*/

CREATE VIEW vShopInfo
WITH ENCRYPTION,SCHEMABINDING
AS
SELECT c.C_ID,c.C_Name,c.C_Address,c.E_Mail,c.PhoneNo,c.City FROM dbo.Customer c
GO

/*
==============================  SECTION 07  ==============================
							 STORED PROCEDURE
==========================================================================
*/

--** STORED PROCEDURE for insert data using parameter **--

CREATE PROC spInsertDataC_table    @C_Name VARCHAR(50),
								   @E_Mail NVARCHAR (50),
								   @C_Address VARCHAR(100),
								   @City VARCHAR (30),
								   @PhoneNo VARCHAR (20)
								  
					   
AS
	INSERT INTO Customer (C_Name,E_Mail,C_Address,City,PhoneNo)
	VALUES (@C_Name,@E_Mail,@C_Address,@City,@PhoneNo)
GO

--** STORED PROCEDURE for insert data with OUTPUT parameter **--

CREATE PROC spInsertdatawithOutput   @C_Name VARCHAR(50),
									   @E_Mail NVARCHAR (50),
									   @C_Address VARCHAR(100),
									   @City VARCHAR (30),
									   @PhoneNo VARCHAR (20),								   
									   @ID INT OUTPUT 
AS
BEGIN
	INSERT INTO Customer (C_Name,E_Mail,C_Address,City,PhoneNo)
	VALUES (@C_Name,@E_Mail,
	        @C_Address,
			@City,
			@PhoneNo)			
	SELECT @ID = IDENT_CURRENT('Customer')
	RETURN @ID
END
GO

--** STORED PROCEDURE for UPDATE data **--

CREATE PROC spDataUpdate @M_ID INT,
						 @M_Model VARCHAR(50),
						 @RAM VARCHAR (10),
						 @Storage VARCHAR (10)
						 
AS
BEGIN
	UPDATE Mob_Configuration 
	SET M_Model=@M_Model,
	    RAM=@RAM,
	    Storage=@Storage
	WHERE M_ID=@M_ID
END
GO

--** STORED PROCEDURE for DELETE Table data **--

CREATE PROC spDeleteData @M_ID INT
AS
BEGIN
	DELETE FROM Mob_Configuration
	WHERE M_ID=@M_ID
END
GO

--** TRY CATCH IN A STORED PROCEDURE & RAISERROR **--

CREATE PROC spTryCatchWithRaiserror @BookinID INT,
								    @BookingMoney MONEY
AS
IF @BookingMoney>1000
	INSERT INTO Pre_Booking(BookingMoney) VALUES ( @BookingMoney)
ELSE
BEGIN
	BEGIN TRY
		UPDATE Pre_Booking SET BookingMoney= @BookingMoney
		WHERE BookinID=@BookinID
	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		RAISERROR ('Please pay the minimum amount',10,1)
	ROLLBACK TRANSACTION
	END CATCH
END
GO

--** ALTER STORED PROCEDURE **--

 ALTER PROC spDataUpdate @M_ID INT,
						 @M_Model VARCHAR(50),
						 @RAM VARCHAR (10),
						 @Storage VARCHAR (10)
						 
AS
BEGIN
	UPDATE Mob_Configuration 
	SET M_Model=@M_Model,
	    RAM=@RAM,
	    Storage=@Storage
	WHERE M_ID=@M_ID
END
GO


/*
==============================  SECTION 08  ==============================
								 FUNCTION
==========================================================================
*/


--** A SCALAR FUNCTION **--

CREATE FUNCTION fnDiscountCalculate (@UnitePrice MONEY,
									 @Quantity INT,
									 @Discount FLOAT
									 )
RETURNS MONEY
AS
BEGIN
	DECLARE @DiscountEarned MONEY
	 SET @DiscountEarned= @UnitePrice*@Quantity*@Discount
	RETURN @DiscountEarned
END
GO

--** SIMPLE TABLE VALUED FUNCTION**--

CREATE FUNCTION fnSimpleCalculation  (@YEAR INT,@MONTH INT)

RETURNS TABLE
AS 
RETURN
(

	SELECT 
	 SUM(UnitePrice*SoldQuantity)'Total Sales',
	 SUM(UnitePrice*SoldQuantity*DiscountParcent) 'Total Discount',
	 SUM(UnitePrice*SoldQuantity*(1-DiscountParcent)) 'Net Sales'
	FROM ITEM
	WHERE YEAR([DATE])=@YEAR AND MONTH([DATE])=@MONTH
)
GO

--**A MULTISTATEMENT TABLE VALUED FUNCTION**--

CREATE FUNCTION fnMultiStatement (@YEAR INT,@MONTH INT)

RETURNS @ItemDetails TABLE
(
	ItemSold VARCHAR(50),
	TotalSales MONEY,
	TotalDiscount MONEY,
	NetSales MONEY
)
AS
BEGIN
	INSERT INTO @ItemDetails
	SELECT 
	 ItemSold,
	 SUM(UnitePrice*SoldQuantity),
	 SUM(UnitePrice*SoldQuantity*DiscountParcent),
	 SUM(UnitePrice*SoldQuantity*(1-DiscountParcent))
	FROM ITEM
	WHERE YEAR([DATE])=@YEAR AND MONTH([DATE])=@MONTH
	GROUP BY ItemSold
    RETURN
END
GO

--**ALTER FUNCTION **--
ALTER FUNCTION fnSimpleCalculation  (@YEAR INT,@MONTH INT)

RETURNS TABLE
AS 
RETURN
(

	SELECT 
	 SUM(UnitePrice*SoldQuantity)'Total Sales',
	 SUM(UnitePrice*SoldQuantity*DiscountParcent) 'Total Discount',
	 SUM(UnitePrice*SoldQuantity*(1-DiscountParcent)) 'Net Sales'
	FROM ITEM
	WHERE YEAR([DATE])=@YEAR AND MONTH([DATE])=@MONTH
)
GO

/*
==============================  SECTION 09  ==============================
							   TRIGGER
==========================================================================
*/

--** FOR/AFTER TRIGGER**--

CREATE TRIGGER trUpdateDelete 
ON SalesPerson FOR UPDATE,DELETE
AS
BEGIN
	PRINT 'This Table is Restricted For Update And Delete'
	ROLLBACK TRANSACTION
END
GO

/*
==============================  SECTION 10  ==============================
							INSTEAD OF TRIGGER
==========================================================================
*/

CREATE TRIGGER InsteadOfInsertTrigger
ON ITEM
INSTEAD OF INSERT
AS 
BEGIN

    INSERT INTO ITEM (ID,ItemSold,SoldQuantity,UnitePrice,DiscountParcent)
    SELECT ID,ItemSold,SoldQuantity,UnitePrice,DiscountParcent
    FROM inserted
END
GO

----------------------------------- END ----------------------------------------