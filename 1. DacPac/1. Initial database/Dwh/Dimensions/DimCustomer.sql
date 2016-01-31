CREATE TABLE [dbo].[DimCustomer]
(
	[CustomerId] INT NOT NULL IDENTITY PRIMARY KEY
	, [CustomerCode] CHAR(8) NULL
	, [CustomerName] VARCHAR(120)
)
