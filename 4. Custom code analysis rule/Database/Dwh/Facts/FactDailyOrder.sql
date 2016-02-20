CREATE TABLE [dbo].[FactDailyOrder]
(
	[CustomerId] INT NOT NULL 
	, [OrderDay] DATE NOT NULL 
	, [TotalAmount] NUMERIC(10,2) NOT NULL
    , CONSTRAINT [BK_FactOrder] UNIQUE ([CustomerId], [OrderDay]), 
    CONSTRAINT [FK_FactDailyOrder_DimCustomer] FOREIGN KEY ([CustomerId]) REFERENCES [DimCustomer]([CustomerId])
)
