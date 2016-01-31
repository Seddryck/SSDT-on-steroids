Use [Steroids];
go

ALTER TABLE DimCountry
	ADD OfficialLanguage varchar(255) null;
GO

UPDATE DimCountry SET OfficialLanguage='German' WHERE CountryIso='DE';
UPDATE DimCountry SET OfficialLanguage='French' WHERE CountryIso='FR';
UPDATE DimCountry SET OfficialLanguage='English' WHERE CountryIso='UK';
UPDATE DimCountry SET OfficialLanguage='Dutch' WHERE CountryIso='NL';