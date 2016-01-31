CREATE TABLE [dbo].[DimCustomer]
(
	[CustomerId] INT NOT NULL IDENTITY PRIMARY KEY
	, [CustomerCode] CHAR(8) NULL
	, [CustomerName] VARCHAR(120)
	, [Level] tinyint 
	CONSTRAINT [BK_Customer_CustomerCode] UNIQUE ([CustomerCode]) NOT NULL DEFAULT 10
)
