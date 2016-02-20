CREATE TABLE [dbo].[FactMonthlyOrder]
(
	[CustomerId] INT NOT NULL 
	, [OrderMonth] INT NOT NULL 
	, [TotalAmount] NUMERIC(10,2) NOT NULL
    , CONSTRAINT [BK_FactMonthlyOrder] UNIQUE ([CustomerId], [OrderMonth])
    , CONSTRAINT [FK_Customer_FactMonthlyOrder] FOREIGN KEY ([CustomerId]) REFERENCES [DimCustomer]([CustomerId])
)
