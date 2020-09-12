Create table DIM_State (
State_id int NOT NULL PRIMARY KEY,
[State] char(100) NOT NULL

)

Create table DIM_Year (
Year_id int NOT NULL PRIMARY KEY,
[Year] int NOT NULL
)

Create table DIM_Drug (
Drug_id int NOT NULL PRIMARY KEY,
[Drug Name] char(100) NOT NULL,
[Generic Name] char(100) NOT NULL
)


Create table DIM_Speciality (
Speciality_id int NOT NULL PRIMARY KEY,
[Speciality Desc] char(100) NOT NULL,
[Flag] char(100) NOT NULL

)




Create table DIM_Provider (
NPI_id int NOT NULL PRIMARY KEY,
NPI int NOT NULL,
[Last Name] char(100),
[First Name] char(100),
[State_id] int not null,
Speciality_id int not null


 CONSTRAINT FK_Provider FOREIGN KEY (State_id)
    REFERENCES DIM_State(State_id),
	Foreign key(Speciality_id) References DIM_Speciality(Speciality_id)

)




Create table DIM_Speciality (
Speciality_id int NOT NULL PRIMARY KEY,
[Speciality Desc] char(100) NOT NULL,
[Flag] char(100) NOT NULL

)



Create table Fact_DrugOverdoseDeaths(
FD_id int,
State_id int NOT NULL,
Deaths int,
Year_id int NOT NULL 
CONSTRAINT FK_DrugOverdoseDeaths Foreign KEY (State_id)
    REFERENCES DIM_State(State_id), Foreign key ([Year_id])   REFERENCES DIM_Year(Year_id)
	
	)

	Create table Fact_DrugOverdoseDeaths(
FD_id int,
State_id int NOT NULL,
Deaths int,
Year_id int NOT NULL 

	
	)




Create table Fact_ProviderCounts(
FPC_id int IDENTITY(1,1),
NPI_id int not null,
[Total Claim Count] int,
[Opioid Claim Count] int,
[Opioid Prescribing Rate] float,
Year_id int NOT NULL,
Speciality_id int Not Null,
State_id int Not Null
CONSTRAINT FK_Fact_ProviderCounts Foreign KEY (State_id)
    REFERENCES DIM_State(State_id), Foreign key ([Year_id])   REFERENCES DIM_Year(Year_id), 
	Foreign key([Speciality_id]) References DIM_Speciality(Speciality_id),
   Foreign key([NPI_id]) References DIM_Provider(NPI_id),
   Constraint PK_Fact_ProviderCounts Primary key(FPC_id)
	)

	
   


Create table Fact_UtilizationPayment(
FUP_id int IDENTITY(1,1),
NPI_id int not null ,
[Bene Count] int,
[Total Claim Count] int,
[Total 30 day fill Count] int,
[Total day supply] int,
[Total drug cost] int,
Drug_id int Not Null,
Year_id int NOT NULL,
Speciality_id int Not Null,
State_id int Not Null

CONSTRAINT FK_Fact_UtilizationPayments Foreign KEY (State_id)
    REFERENCES DIM_State(State_id), Foreign key ([Year_id])   REFERENCES DIM_Year(Year_id), 
	Foreign key([Speciality_id]) References DIM_Speciality(Speciality_id),
   Foreign key([NPI_id]) References DIM_Provider(NPI_id),
   Foreign key([Drug_id]) References DIM_Drug(Drug_id),
    Constraint PK_Fact_UtilizationPayments Primary key(FUP_id)
	)

	
  


Create table DIM_NPI (
NPI_id int NOT NULL PRIMARY KEY,
NPI int NOT NULL

)

Alter table DIM_Provider
Add CONSTRAINT FK_Provider FOREIGN KEY (State_id)
    REFERENCES DIM_State(State_id) 


	Alter table DIM_Provider
	 DROP FOREIGN KEY Speciality_id


	 truncate table dim_provider


	 truncate table Fact_UtilizationPayment

	 ALTER TABLE Fact_ProviderCounts
ALTER COLUMN [Opioid Prescribing rate] int