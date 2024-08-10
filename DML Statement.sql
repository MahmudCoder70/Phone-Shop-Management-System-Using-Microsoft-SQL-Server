
 /*				
 
					        SQL Project Name: Online Phone Shop Management System(OPS_MS)
							    Traine Name : Md.MAhmud Hasan
								Traine ID   :  1280555
								Batch ID    : CS/PNTL-M/58/01/

------------------------------------------------------------------------------------------------------------------------
   Table of Contents: DML
			=> SECTION 01: INSERT DATA USING INSERT INTO KEYWORD
			=> SECTION 02: INSERT DATA THROUGH STORED PROCEDURE
				SUB SECTION => 2.1 : INSERT DATA THROUGH STORED PROCEDURE WITH AN OUTPUT PARAMETER 
				SUB SECTION => 2.2 : INSERT DATA USING SEQUENCE VALUE
			=> SECTION 03: UPDATE DELETE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.1 : UPDATE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.2 : DELETE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.3 : STORED PROCEDURE WITH TRY CATCH AND RAISE ERROR
			=> SECTION 04: INSERT UPDATE DELETE DATA THROUGH VIEW
				SUB SECTION => 4.1 : INSERT DATA through view
				SUB SECTION => 4.2 : UPDATE DATA through view
				SUB SECTION => 4.3 : DELETE DATA through view
			=> SECTION 05: RETREIVE DATA USING FUNCTION(SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED)
			=> SECTION 06: TEST TRIGGER (FOR/AFTER TRIGGER ON TABLE, INSTEAD OF TRIGGER ON TABLE & VIEW)
			=> SECTION 07: QUERY
				SUB SECTION => 7.01 : SELECT FROM TABLE
				SUB SECTION => 7.02 : SELECT FROM VIEW
				SUB SECTION => 7.03 : SELECT INTO
				SUB SECTION => 7.04 : IMPLICIT JOIN WITH WHERE BY CLAUSE, ORDER BY CLAUSE
				SUB SECTION => 7.05 : INNER JOIN WITH GROUP BY CLAUSE
				SUB SECTION => 7.06 : OUTER JOIN
				SUB SECTION => 7.07 : CROSS JOIN
				SUB SECTION => 7.08 : TOP CLAUSE WITH TIES
				SUB SECTION => 7.09 : DISTINCT
				SUB SECTION => 7.10 COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR 
				SUB SECTION => 7.11 : COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR
				SUB SECTION => 7.12 : LIKE, IN, NOT IN, OPERATOR & IS NULL CLAUSE
				SUB SECTION => 7.13 : OFFSET FETCH
				SUB SECTION => 7.14 : UNION
				SUB SECTION => 7.15 : EXCEPT INTERSECT
				SUB SECTION => 7.16 : AGGREGATE FUNCTIONS
				SUB SECTION => 7.17 : GROUP BY & HAVING CLAUSE
				SUB SECTION => 7.18 : ROLLUP & CUBE OPERATOR
				SUB SECTION => 7.19 : GROUPING SETS
				SUB SECTION => 7.20 : SUB-QUERIES (INNER, CORRELATED)
				SUB SECTION => 7.21 : EXISTS
				SUB SECTION => 7.22 : CTE
				SUB SECTION => 7.23 : MERGE
				SUB SECTION => 7.24 : BUILT IN FUNCTION
				SUB SECTION => 7.25 : CASE
				SUB SECTION => 7.26 : IIF
				SUB SECTION => 7.27 : COALESCE & ISNULL
				SUB SECTION => 7.28 : GROPING FUNCTION
				SUB SECTION => 7.29 : RANKING FUNCTION
				SUB SECTION => 7.30 : IF ELSE & PRINT
				SUB SECTION => 7.31 : TRANSACTION TRY CATCH
				SUB SECTION => 7.32 : ANY,ALL SOME
*/

/*
==============================  SECTION 01  ==============================
					INSERT DATA USING INSERT INTO KEYWORD
==========================================================================
*/

USE [OPS_MS]
GO
--TABLE-1
INSERT INTO Ctegory VALUES (1,'Button Phone'),(2,'Smart Phone')
GO

SELECT * FROM Ctegory
GO
--TABLE-2
INSERT INTO Brand VALUES (1,'Samsung'),(2,'Apple'),(3,'Google Pixel')
GO

--TABLE-3
INSERT INTO Vat VALUES (1,0.10),(2,0.15)
GO

SELECT * FROM Vat
GO
--TABLE-4
INSERT INTO Mob_Configuration VALUES 
('S-Doc','0.5gb','512kb','3.2"','2mp','126377sm1626sg17',2000.00,'2018/05/05',1,1),
('S22 ULTRA','8GB','256GB','6.7"','120 MP','09S89A13M78S23U32N34G',120000.00,'2023/9/10',2,2),
('S21 ULTRA','6GB','128GB','6.2"','82 MP','09S79A13M76S23U12N34G',80000.00,'2022/1/10',2,2),
('13 ProMax','8GB','256GB','6.7"','52 MP','098A789P123P76L123E',120000.00,'2023/10/10',1,2),
('Pixel 7','8GB','256GB','6.7"','40 MP','098P789I123X7126E19823L',80000.00,'2023/9/10',3,2),
('12 ProMax','6GB','182GB','6.2"','34 MP','0977A789P123P76L321E',90000.00,'2022/10/10',2,2),
('12 Pro','4GB','128GB','6.2"','25 MP','0977A789P123P76L321M',80000.00,'2021/10/10',2,2)

GO

SELECT * FROM Mob_Configuration

--TABLE-5
INSERT INTO Customer VALUES
('Mahmud','mahmud12@gmail.com','H#12/6,Manikdi,Dhaka-1000','DK','017821728432',2,1,'01827635648'),
('Hasan','hasan52@gmail.com','H#12/6,Manikdi,Dhaka-1000','BSL','017821728432',1,1,'01827635648'),
('Mahir','mahir62@gmail.com','H#12/6,Manikdi,Dhaka-1000','ECB','017821728672',2,2,'01827635648'),
('Rfique','mahmud12@gmail.com','H#12/6,Manikdi,Dhaka-1000','BSL','017821728432',2,1,'01827635648'),
('Sabbir','hasan52@gmail.com','H#12/6,Manikdi,Dhaka-1000','TSC','017821728432',1,1,'01827635648'),
('Mahtab','mahir62@gmail.com','H#12/6,Manikdi,Dhaka-1000','ECB','017821728672',2,2,'01827635648')
GO

SELECT * FROM Customer
GO

--TABLE-6
INSERT INTO Bill_Pay VALUES 
(120000, DATEADD(MONTH, -3,GETDATE()),1),
(120000.00, GETDATE(),1),
(2000.00, GETDATE(),2),
(90000, GETDATE(),3)
GO

SELECT * FROM Bill_Pay
GO

--TABLE-7
INSERT INTO Pre_Booking VALUES (20000.00,1),(5000.00,3),(20000.00,4),(10000.00,5)
GO

SELECT * FROM Pre_Booking
GO
--TABLE-8
INSERT INTO SalesPerson VALUES 
	(1,'Mahmud'),
	(2,'Shahid'),
	(3,'Shamin')
GO
 
SELECT * FROM SalesPerson
GO
--TABLE-9 *PROBLEM*

INSERT INTO OrderDetails VALUES 
	 (1,1,1,1,3,3,2),
	 (2,3,2,3,2,2,1),
	 (2,2,2,2,3,1,3),
	 (2,2,2,5,1,2,3),
	 (2,1,2,2,3,3,2)
GO
 SELECT * FROM OrderDetails

 --TABLE-10
 INSERT INTO Review VALUES (1,'The Product is good'),(2,'The Product is very good')
 go
 SELECT * FROM Review
 GO

 --TABLE-12
 INSERT INTO ITEM VALUES
 (5,'2022-11-12','5PCS',200.00,10,0.5)
 GO

 UPDATE ITEM SET [date]='2020/9/20'
 WHERE ID=6
 GO
 SELECT * FROM ITEM
 GO

/*
==============================  SECTION 02  ==============================
					INSERT DATA THROUGH STORED PROCEDURE
==========================================================================
*/

EXEC spInsertDataC_table 'Abraf','abraf@gmail.com','570/A,Middle Paikpara,Mirpur-1','Dhaka','016785606592'
EXEC spInsertDataC_table 'Ahnaf','ahnaf@gmail.com','570/A,Middle Paikpara,Mirpur-1','Dhaka','016785606660'
Go
 SELECT * FROM Customer
 GO

 --** INSERT DATA THROUGH STORED PROCEDURE WITH AN OUTPUT PARAMETER **--
 DECLARE @CID INT
EXEC spInsertdatawithOutput 'Rafi','rafi@gmail.com','2019,Manikdi,Cant','Dhaka','019785606591',@CID OUTPUT
SELECT @CID 'New id'
GO

-- INSERT DATA USING SEQUENCE VALUE --

INSERT INTO Review VALUES( (NEXT VALUE FOR seqCreate),'GOOD')
GO
SELECT * FROM Review
GO

/*
==============================  SECTION 03  ==============================
			UPDATE DELETE DATA THROUGH STORED PROCEDURE
==========================================================================
*/

--** UPDATE DATA THROUGH STORED PROCEDURE **--

-- Update Moile Congiguration

SELECT * FROM Mob_Configuration
GO
EXEC spDataUpdate 3,'14 Max','8.5GB','512GB'
GO

--** DELETE DATA THROUGH STORED PROCEDURE **--
-- Delete Moile Congiguration

EXEC spDeleteData 5
GO

SELECT * FROM Mob_Configuration

--** STORED PROCEDURE WITH TRY CATCH AND RAISE ERROR **--

EXEC spTryCatchWithRaiserror 1,800.00
GO

/*
==============================  SECTION 04  ==============================
					INSERT UPDATE DELETE DATA THROUGH VIEW
==========================================================================
*/

--** INSERT DATA through view **--

SELECT * FROM  vShopInfo
GO

INSERT INTO vShopInfo(C_Name,C_Address,E_Mail,PhoneNo,City)
VALUES ('Shofiq','12/3,Mirpur','shofiq@gmail.com','019785665932','DK')
GO

--** UPDATE DATA through view **--

UPDATE vShopInfo
SET City='ECB'
WHERE C_ID=7
GO

SELECT * FROM vShopInfo
GO

--** DELETE DATA through view**--

DELETE FROM vShopInfo
WHERE C_ID=13
GO

SELECT * FROM vShopInfo
GO

/*
==============================  SECTION 05  ==============================
						RETREIVE DATA USING FUNCTION
==========================================================================
*/

--** MONTHLY NET SALES**--
SELECT * FROM dbo.fnMultiStatement (2020,9)
GO

/*
==============================  SECTION 06  ==============================
							   TEST TRIGGER
==========================================================================
*/

--**FOR/AFTER TRIGGER**--

UPDATE SalesPerson SET empName='Porag' 
WHERE empID=3
GO

SELECT * FROM SalesPerson
GO

/*
==============================  SECTION 07  ==============================
								  QUERY
==========================================================================
*/

--** 7.01 A SELECT STATEMENT TO GET RESULT SET FROM A TABLE **--

SELECT * FROM Customer
GO

--** 7.02 A SELECT STATEMENT TO GET today course sales information FROM A VIEW **--

SELECT * FROM vShopInfo
GO

--** 7.03 SELECT INTO > SAVE RESULT SET TO A NEW TEMPORARY TABLE **--

--**
SELECT * INTO CustomersCopy
FROM Customer
GO

SELECT * FROM CustomersCopy
GO

--**
SELECT * INTO SalesPersonInfo
FROM SalesPerson
GO

--** 7.04 IMPLICIT JOIN WITH WHERE BY CLAUSE, ORDER BY CLAUSE **--

SELECT C_ID,C_Name,E_Mail,City FROM CustomersCopy
WHERE C_ID BETWEEN (1) AND (10)
ORDER BY C_ID ASC, C_Name DESC
GO

--** 7.05 INNER JOIN WITH GROUP BY CLAUSE **--

SELECT C.C_ID,C.C_Name,BP.Purchase_DATE,SUM(PB.BookingMoney)AS'Total Earn' FROM Customer C
INNER JOIN Bill_Pay BP
ON C.C_ID=BP.C_ID
INNER JOIN Pre_Booking PB
ON C.C_ID=PB.C_ID
GROUP BY C.C_ID,C.C_Name,BP.Purchase_DATE
GO

--** 7.06 OUTER JOIN **--
SELECT C.C_ID,C.C_Name,BP.Purchase_DATE,PB.BookingMoney,br.Brand_Name FROM Brand br
LEFT JOIN Customer C
ON br.B_ID=C.B_ID
RIGHT JOIN Bill_Pay BP
ON C.C_ID=BP.C_ID
FULL JOIN Pre_Booking PB
ON C.C_ID=PB.C_ID
GO

--** 7.07 CROSS JOIN **--

SELECT * FROM Brand 
CROSS JOIN Customer
GO

--** 7.08 TOP CLAUSE  **--

SELECT TOP 10 C_ID,C_Name,C_Address,E_Mail FROM CustomersCopy
ORDER BY C_ID
GO

--** 7.09 DISTINCT **--

SELECT DISTINCT c.C_ID,c.C_Name,ord.empID FROM Customer c
INNER JOIN OrderDetails ord
ON c.C_ID=ord.C_ID
ORDER BY C.C_ID
GO

--** 7.10 COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR **--

SELECT * FROM CustomersCopy
WHERE C_ID  BETWEEN 1 AND 17
AND NOT City='ECB'
OR C_Name='Rafi'
GO

--** 7.11 LIKE, IN, NOT IN, OPERATOR & IS NULL CLAUSE **--
 
 SELECT * FROM Customer
 WHERE C_Name LIKE ('%A%')
 AND C_ID NOT IN ('1','12')
 AND Cat_ID IS NULL
 GO

 --** 7.12 OFFSET FETCH **--

 SELECT C_ID,C_Name,E_Mail FROM CustomersCopy
 ORDER BY C_ID
 OFFSET 5 ROWS
 FETCH FIRST 5 ROWS ONLY
 GO

 --** 7.13 UNION **--
SELECT * FROM Customer
 WHERE C_ID IN('1','4','8')
UNION
SELECT * FROM Customer
 WHERE C_ID NOT IN ('10','17')
GO

--============== 7.14 EXCEPT INTERSECT ============--

--** EXCEPT
SELECT * FROM Customer

EXCEPT

SELECT * FROM Customer
WHERE City = 'ECB'
GO

--** INTERSECT
SELECT * FROM Customer
WHERE C_ID>5

INTERSECT

SELECT * FROM Customer
WHERE C_ID<10
GO

--** 7.15 AGGREGATE FUNCTION **--
SELECT  
	SUM(UnitePrice)'Total Amount',
	COUNT(ItemSold)'Total Sold Item',
	MIN(UnitePrice) 'Minimun Price'
FROM ITEM
GO

--** 7.16 AGGREGATE FUNCTION WITH GROUP BY & HAVING CLAUSE **--
SELECT ID,
	SUM(UnitePrice)'Total Amount',
	COUNT(ItemSold)'Total Sold Item'	
FROM ITEM
	GROUP BY ID
	HAVING ID IN('1','2','3','4')
GO

--** 7.17 ROLLUP & CUBE OPERATOR **--

--**ROLLUP

SELECT C_Name,SUM(pb.BookingMoney)'Total B.Money' FROM Customer C
INNER JOIN Pre_Booking pb
ON C.C_ID= pb.C_ID
GROUP BY ROLLUP (C.C_ID,C_Name)
GO

--CUBE
SELECT C_Name,SUM(pb.BookingMoney)'Total B.Money' FROM Customer C
INNER JOIN Pre_Booking pb
ON C.C_ID= pb.C_ID
GROUP BY CUBE (C.C_ID,C_Name)
GO

--** 7.18 GROUPING SETS **--
SELECT c.C_Name,c.City,SUM(bp.PaybleAmount) AS 'bp.PaybleAmount'  FROM Customer c
inner join Bill_Pay bp
ON c.C_ID=bp.C_ID
 GROUP BY GROUPING SETS (c.C_Name,C.City)
 GO

 --** 7.19 SUB-QUERIES **--

 --**NESTED/INNER SUB-QUERY

 SELECT B_ID,Brand_Name FROM Brand 
 WHERE B_ID IN  (SELECT B_ID FROM Customer )
 GO

 --** correlated subquery
 SELECT C.C_ID,C.C_Name,C.City FROM Customer C
 WHERE exists (SELECT * FROM Bill_Pay WHERE B_ID=C_ID)
 GO


 --** 7.20 EXISTS **--

 SELECT B_ID,Brand_Name FROM Brand 
 WHERE  EXISTS (SELECT B_ID,C_Name FROM Customer )
 GO

 --** 7.21 CTE **--
 WITH CustomerInfo AS
 (
	SELECT C.C_ID,C.C_Name,C.E_Mail FROM Customer C
 ),

 BillInfo AS
 (
	SELECT bp.C_ID,bp.PaybleAmount,bp.Purchase_DATE FROM Bill_Pay bp
 )
 SELECT cf.C_ID,cf.C_Name,cf.E_Mail,bf.PaybleAmount,bf.Purchase_DATE FROM CustomerInfo cf
 INNER JOIN BillInfo bf
 ON cf.C_ID=bf.C_ID
 GO

 --** 7.23
 --** MERGE **--

 MERGE SalesPersonInfo AS SOURCE
USING SalesPerson AS TARGET
ON SOURCE.empID = TARGET.empID
WHEN MATCHED THEN
				UPDATE SET
				empID = SOURCE.empID,
				empName= SOURCE.empName;
GO

--** 7.23 BUILT IN FUNCTION **---
--1
SELECT GETDATE() 'Current Date'
GO
--2
SELECT DATEDIFF(YEAR,'1994/11/23',GETDATE())
GO
--3
 SELECT DATEADD(MONTH,-12,GETDATE())
 GO
 --4
 SELECT Bill_ID,PaybleAmount,
    CAST(Purchase_DATE AS VARCHAR) 'Cast Date',
	CONVERT( VARCHAR (20),Purchase_DATE,107) 'CONVERT DATE',
	TRY_CONVERT(VARCHAR ,Purchase_DATE,109)
 FROM Bill_Pay
 GO
 --5
 SELECT ROW_NUMBER() OVER (ORDER BY C_Name) AS 'ROW_NUMBER', C_ID,C_Name FROM Customer
 GO

 --** 7.24 CASE **--

 SELECT C_ID,C_Name,City,
	CASE City
	  WHEN 'BSL' THEN 'BARISAL'
	  WHEN 'DK'  THEN 'DHAKA'
	END AS 'Full Name'
 FROM CustomersCopy
 GO
 --** 7.25 IIF **--

 SELECT BookinID,BookingMoney,
	IIF ((BookingMoney<10000), 'LOW','HIGH') 'Status'
 FROM Pre_Booking
 GO

 --** 7.26 COALESCE & ISNULL **--

 SELECT COALESCE(C_Name,'N/A')'C_Name',SUM(pb.BookingMoney)'Total B.Money' FROM Customer C
	INNER JOIN Pre_Booking pb
	ON C.C_ID= pb.C_ID
GROUP BY ROLLUP (C.C_ID,C_Name)
GO

--**ISNULL
SELECT ISNULL(C_Name,'Total')'C_Name',SUM(pb.BookingMoney)'Total B.Money' FROM Customer C
	INNER JOIN Pre_Booking pb
	ON C.C_ID= pb.C_ID
GROUP BY ROLLUP (C.C_ID,C_Name)
GO

--** 7.27 WHILE LOOP **--

DECLARE @COUNT int
 SET @COUNT = 1
 WHILE (@COUNT < 10)
   BEGIN
	  PRINT @COUNT;
	  SET @COUNT=@COUNT+1
	END
GO

--** 7.28 GROPING FUNCTION **--

SELECT 
	CASE
		WHEN GROUPING (B.Brand_Name)=1 THEN 'All B_Name'
		ELSE (B.Brand_Name)
	END AS All_BName,

	CASE
		WHEN GROUPING(C.C_Name)=1 THEN 'All Customer Name'
		ELSE C.C_Name
	END AS AllCustomerName,
	COUNT(b.B_ID) 'Total Brand'
FROM Brand b
INNER JOIN Customer C ON b.B_ID=C.B_ID
GROUP BY ROLLUP (B.Brand_Name,C.C_Name)
GO

--** 7.29 RANKING FUNCTION **--

SELECT 
RANK() OVER (ORDER BY C_ID) AS 'Rank',
DENSE_RANK() OVER (ORDER BY C_Name) AS 'DENSE_RANK',
NTILE(2) OVER (ORDER BY City) AS 'NTILE',
C_ID,C_Name,City
FROM Customer 
GO

SELECT * FROM Customer
GO

--** 7.30 IF ELSE & PRINT **--

DECLARE @BookingMoney MONEY
	SELECT @BookingMoney= SUM(BookingMoney)
	FROM Pre_Booking
IF @BookingMoney>30000
	BEGIN
		PRINT 'TRUE'
	END
ELSE
	BEGIN
		PRINT 'FALSE'
	END
GO


--** 7.31 TRANSACTION TRY CATCH **--

BEGIN TRANSACTION
	BEGIN TRY
		UPDATE Pre_Booking SET BookingMoney=BookingMoney-500
		WHERE BookinID= 3
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		raiserror (' BOOKING LOW',10,1)
		ROLLBACK TRANSACTION
	END CATCH
GO

--** ANY,ALL,SOME **--
--IFF
IF 2000 < ANY (SELECT BookingMoney FROM Pre_Booking)
	PRINT 'TRUE'
ELSE
	print 'FALES'
GO

--ALL
IF 2000 < ALL (SELECT BookingMoney FROM Pre_Booking)
	PRINT 'TRUE'
ELSE
	print 'FALES'
GO

--SOME

IF 200 < SOME (SELECT BookingMoney FROM Pre_Booking)
	PRINT 'TRUE'
ELSE
	print 'FALES'
GO


-----------------------------****************** END *****************---------------------------