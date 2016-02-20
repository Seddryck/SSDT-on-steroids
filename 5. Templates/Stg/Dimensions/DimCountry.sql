CREATE TABLE [stg].[DimCountry]
(
	[CountryIso] CHAR(2)
	, [DisplayName] VARCHAR(120)
	, [Capital] VARCHAR (120) 
    , [OfficialLanguage] VARCHAR(255) NULL, 
    CONSTRAINT [UK_DimCountry_CountryIso] UNIQUE ([CountryIso])
)
