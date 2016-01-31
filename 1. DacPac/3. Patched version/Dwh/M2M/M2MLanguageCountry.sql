CREATE TABLE [dbo].[M2MLanguageCountry]
(
	[CountryId] INT NOT NULL , 
    [LanguageId] INT NOT NULL, 
    CONSTRAINT [FK_M2MLanguageCountry_Language] FOREIGN KEY ([LanguageId]) REFERENCES [DimLanguage]([LanguageId])
	, CONSTRAINT [FK_M2MLanguageCountry_Country] FOREIGN KEY ([CountryId]) REFERENCES [DimCountry]([CountryId]), 
    PRIMARY KEY ([LanguageId], [CountryId])
)
