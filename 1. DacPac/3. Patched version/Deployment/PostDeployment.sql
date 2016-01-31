--Populate new dimension DimLanguage
insert into
	DimLanguage
select distinct
	[OfficialLanguage]
from	
	[tmp].[OfficialLanguage]
;

--Populate many-to-many between language and country
insert into
	[M2MLanguageCountry]
select
	[tmp].[OfficialLanguage].[CountryId]
	, [DimLanguage].[LanguageId]
from	
	[tmp].[OfficialLanguage]
inner join
	[DimLanguage]
	on [DimLanguage].[Label] = [tmp].[OfficialLanguage].[OfficialLanguage]
;

--Insert new values for Belgium
insert into
	DimCountry
values
	('BE', 'Belgium', 'Brussels', 'EUR')
;

declare @BelgiumId int;
select @BelgiumId = @@IDENTITY;

insert into
	[M2MLanguageCountry]
select
	@BelgiumId
	, LanguageId
from
	[DimLanguage]
where
	[Label] in ('Dutch', 'French', 'German')
;

-- Generate drop statement for all tables in schema 'tmp'
declare @statement varchar(max);
declare cur cursor for 
select 'drop ' + case
    when o.xtype = 'U' then 'TABLE'
    when o.xtype = 'V' then 'VIEW'
    when o.xtype = 'P' then 'PROCEDURE'
    when o.xtype = 'FN' then 'FUNCTION'
  end + ' "' + s.name + '"."' + o.name + '"'
from
  sys.sysobjects as o
  join sys.schemas as s on o.uid = s.schema_id
where
  s.name = 'tmp' and
  o.xtype IN ('U','V','P','FN')
 
-- Iterate over drop statement and execute them
open cur
fetch next from cur into @statement
while (@@fetch_status = 0) begin
  print @statement
  exec (@statement)
  fetch next from cur into @statement
end 
close cur
deallocate cur
go

drop schema tmp;
go