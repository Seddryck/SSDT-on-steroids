CREATE TABLE [dbo].[DimCountry]
(
	[CountryId] INT IDENTITY NOT NULL PRIMARY KEY
	, [CountryIso] CHAR(2) NOT NULL
	, [DisplayName] VARCHAR(120) NOT NULL
	, [Capital] VARCHAR (120) NOT NULL
	, [Currency] VARCHAR(50) 
    CONSTRAINT [BK_Country_CountryIso] UNIQUE ([CountryIso]) NOT NULL
)
