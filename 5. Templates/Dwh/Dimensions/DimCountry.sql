CREATE TABLE [dbo].[DimCountry]
(
	[CountryId] INT IDENTITY NOT NULL PRIMARY KEY
	, [CountryIso] CHAR(2)
	, [DisplayName] VARCHAR(120)
	, [Capital] VARCHAR (120), 
    [OfficialLanguage] VARCHAR(255) NULL
)

GO

CREATE UNIQUE INDEX [IX_DimCountry_Column] ON [dbo].[DimCountry] ([CountryIso])
