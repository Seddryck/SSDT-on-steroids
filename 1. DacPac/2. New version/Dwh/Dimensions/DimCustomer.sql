CREATE TABLE [dbo].[DimCustomer]
(
	[CustomerId] INT NOT NULL IDENTITY PRIMARY KEY
	, [CustomerCode] CHAR(8) NOT NULL
	, [CustomerName] VARCHAR(120) NOT NULL
	, [Level] tinyint DEFAULT 10
	CONSTRAINT [BK_Customer_CustomerCode] UNIQUE ([CustomerCode]) NOT NULL 
)
