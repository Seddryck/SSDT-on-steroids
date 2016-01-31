USE [Steroids]
GO

TRUNCATE TABLE [FactDailyOrder];
DELETE FROM [dbo].[DimCustomer];
DELETE FROM [dbo].[DimCountry];

INSERT INTO [dbo].[DimCountry]
           ([CountryIso]
           ,[DisplayName]
           ,[Capital]
           ,[OfficialLanguage])
     VALUES
           ('DE','Germany','Berlin', 'German')
		   , ('FR','France','Paris', 'French')
		   , ('UK','United Kingdom','London', 'English')
		   , ('NL','Netherlands','Den Haag', 'Dutch')
GO

INSERT INTO [dbo].[DimCustomer]
           ([CustomerCode]
           ,[CustomerName])
     VALUES
           ('ALP001', 'D. Müller')
		   , ('ALP002', 'F. Schmidt')
		   , ('BET002', 'JM. Martin')
		   , ('GAM003', 'E. Dubois')
		   , ('DEL004', 'T. Smith')
		   , ('DEL005', 'F. Jones')
		   , ('DEL006', 'L. Williams')
		   , ('DEL007', 'B. De Jong')
GO

INSERT INTO [dbo].[FactDailyOrder]
           ([CustomerId]
           ,[OrderDay]
           ,[TotalAmount])
     VALUES
           (1, '2016-02-10', 1520)
		   , (1, '2016-02-11', 1680)
		   , (1, '2016-02-12', 780)
		   , (1, '2016-02-13', 810)
		   , (2, '2016-02-11', 300)
		   , (2, '2016-02-12', 5000)
		   , (3, '2016-02-10', 3500)
		   , (3, '2016-02-12', 1200)
		   , (4, '2016-02-14', 1400)
		   , (5, '2016-02-12', 1800)
		   , (6, '2016-02-11', 1000)
		   , (6, '2016-02-14', 720)
		   , (7, '2016-02-13', 900)
		   , (7, '2016-02-11', 450)
		   , (8, '2016-02-12', 1500)
GO


