select
	instance_name, type_version
from
	msdb.[dbo].[sysdac_instances_internal]
where
	instance_name='Steroids'



select
	dac_object_name_pretran 
	, action_type_name
	, dac_object_type_name
	, action_status_name
	, date_modified
from 
	msdb.dbo.sysdac_history_internal
where
	DATEDIFF(MINUTE, date_modified, CURRENT_TIMESTAMP)<60
order by 
	date_modified desc