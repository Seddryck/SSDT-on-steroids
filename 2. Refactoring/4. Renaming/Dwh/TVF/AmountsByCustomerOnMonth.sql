CREATE FUNCTION [dbo].[AmountsByCustomerOnMonth]
(
	@Month int
)
RETURNS @returntable TABLE
(
	CustomerCode int,
	Amount numeric(10,2)
)
AS
BEGIN
	insert into 
		@returntable
	select 
		CustomerCode as CustomerCode, SUM(TotalAmount) as Amount
	from
		FactDailyOrder f
	inner join
		DimCustomer d
		on f.CustomerId=d.CustomerId
	group by
		CustomerCode
	RETURN
END
