CREATE SCHEMA tmp;
go

select 
	[CountryId]
	, [OfficialLanguage]
into
	tmp.OfficialLanguage
from
	DimCountry