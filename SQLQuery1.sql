
UPDATE [Opioid Prescriber Stg]
SET          Year = (select SUBSTRING(? ,PATINDEX('%File_[0-9]%',?)+6,4))
Where Year is NULL




select SUBSTRING('D:\dektop data\spring2020\dwbi\Project\data\Medicare_Utilization\Medicare_Provider_Utilization_and_Payment_Data__2013_Part_D_Prescriber' ,
PATINDEX('%Data__[0-9]%',
'D:\dektop data\spring2020\dwbi\Project\data\Medicare_Utilization\Medicare_Provider_Utilization_and_Payment_Data__2013_Part_D_Prescriber')+6,4)

Truncate table [Provider Utilization Stg]