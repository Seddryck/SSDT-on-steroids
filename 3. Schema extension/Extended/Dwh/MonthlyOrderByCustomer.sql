CREATE FUNCTION [dbo].[MonthlyOrderByCustomer]
(
	@CustomerCode CHAR(8)
	, @Year int
)
RETURNS @returntable TABLE
(
	DisplayName VARCHAR(120)
	, MonthDisplayName VARCHAR(50) 
	, TotalAmount numeric(10,2)
)
AS
BEGIN
	insert @returntable
	select
		[CustomerName]
		, DATENAME(month,DATEFROMPARTS(@Year, OrderMonth % 100, 1))
		, TotalAmount
	from
		DimCustomer cust
	left outer join
		FactMonthlyOrder mo
		on mo.CustomerId=cust.CustomerId
	where
		(mo.OrderMonth - (mo.OrderMonth %  100))/100 = @Year

	return;
END
