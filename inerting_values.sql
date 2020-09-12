
Insert Into DIM_State 
select ROW_NUMBER()  over (Order BY [NPPES Provider State]), [NPPES Provider State]
FROM [Opioid Prescriber]
Group by [NPPES Provider State]




Insert into DIM_Year
Select  ROW_NUMBER() over(Order by [year]), [Year]
From [Opioid Prescriber]
Group by [Year]



Insert into DIM_Speciality
Select  ROW_NUMBER() over(Order by specialty_description ,description_flag), specialty_description,description_flag
From [Provider Utilization]
Group by specialty_description,description_flag



Insert into DIM_Drug
select ROW_NUMBER() over(Order by [drug_name] ,[generic_name]),  [drug_name] ,[generic_name]
From [Provider Utilization]
Group by [drug_name] ,[generic_name]


Insert into DIM_NPI
select ROW_NUMBER() over(Order by NPI),  NPI 
From [Opioid Prescriber]
Group by NPI




with t1 as
(
select ROW_NUMBER() over(Order by State_id, Year_id) as rn, State_id, Year_id
from [Fact_DrugOverdoseDeaths]
Group By State_id,Year_id


)

Update [Fact_DrugOverdoseDeaths] 
set FD_id = t1.rn 
from t1
inner join Fact_DrugOverdoseDeaths fd
on t1.State_id = fd.State_id and t1.Year_id = fd.Year_id


Alter table [Fact_DrugOverdoseDeaths] 
alter column  FD_id int not null


Alter table [Fact_DrugOverdoseDeaths] 
add primary key (FD_id)

