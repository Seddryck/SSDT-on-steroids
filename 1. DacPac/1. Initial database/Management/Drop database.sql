USE [master]
GO

/****** Drop if exists Database [Steroids] ******/
IF EXISTS(select * from sys.databases where name='Steroids')
BEGIN
	ALTER DATABASE [Steroids] SET SINGLE_USER
	DROP DATABASE [Steroids]
END
GO

TRUNCATE TABLE
	msdb.[dbo].[sysdac_instances_internal];

TRUNCATE TABLE
	msdb.dbo.sysdac_history_internal;

