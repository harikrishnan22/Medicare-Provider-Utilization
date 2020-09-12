/****** Script for SelectTopNRows command from SSMS  ******/

select Count(Distinct(NPI))
from [Opioid Prescriber Stg]


select NPI,ROW_NUMBER() over(Order BY NPI) AS NPI_ID 
Into DIM_NPI
FROM [Opioid Prescriber Stg]
Group by NPI


select *
from [Opioid Prescriber Stg]
where  [NPPES Provider State] = 'AA'


Create Table [Dim_State] 
(
[state] Varchar(100),
code varchar(100)

)


select [state],code,ROW_NUMBER() over(Order BY code) AS State_ID 
Into DIM_State
FROM [data]
Group by [state],code

select zip,city,ROW_NUMBER() over(Order BY zip) AS ZipCode_ID 
Into DIM_ZipCode
FROM [uszips]
Group by [zip],city




select [Specialty Description], ROW_NUMBER() over(Order by [Specialty Description]) as [Speciality_Id]
Into Dim_Speciality
From [Opioid Prescriber Stg]
Group by [Specialty Description]


Select [Year], ROW_NUMBER() over(Order by [year]) as year_id
Into Dim_Year
From [Opioid Prescriber Stg]
Group by [Year]







Update  [temp1]
Set city = (Select top(1) [nppes_provider_city]
                      from [temp2]
                      where NPI = 1093060360)
Where NPI = 1093060360


Alter table [Opioid Prescriber]
drop column  [nppes_provider_city]

Alter table temp1
add  city char(100)