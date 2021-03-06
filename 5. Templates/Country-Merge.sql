
CREATE PROCEDURE [dbo].[DimCountry_Merge] AS

MERGE [dbo].[DimCountry] AS [target]
USING [stg].[DimCountry] AS [source]
	ON 
	(
		[target].[CountryIso]=source.[CountryIso]
	)
WHEN MATCHED THEN 
	UPDATE SET 
		[DisplayName]=source.[DisplayName]
		, [Capital]=source.[Capital]
		, [OfficialLanguage]=source.[OfficialLanguage]
WHEN NOT MATCHED THEN
    INSERT 
	(
		[CountryIso]
		, [DisplayName]
		, [Capital]
		, [OfficialLanguage]
	)
    VALUES
	(
		source.[CountryIso]
		, source.[DisplayName]
		, source.[Capital]
		, source.[OfficialLanguage]	
	)
;

