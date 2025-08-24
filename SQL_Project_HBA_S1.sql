use healthcare

Select * from patients

Select * from encounters

Select * from patients p
where exists( select 1 from encounters e where e.patient=p.id)

Alter table encounters
add foreign key(patient) references patients(id)


alter table encounters
alter column patient varchar(36)


---- Column profiling and distribution

-- Fact and dimensions 

Select top 3 * from patients
select top 3 * from encounters
select top 3 * from procedures


-- Step 1-- in your rdbms CREATE A DATABASE WITH THE NAME 'Healthcare_business_analysis

--- Step 2- upload the data

--- data distribution based on patient demographic

-- gender wise count of encounters

-- do we require join

Select gender, count(e.id) as 'cnt_ofencounters' from patients p
join encounters e
on p.id=e.patient
group by gender     

/* gender	cnt_ofencounters
F	14924  - more female then male
M	12967 */

Select id,Birthdate, Deathdate, Concat(prefix,'.',First,Last) as fullname, Race, Gender,Address,City,State,County from patients
where deathdate in (select cast(stop as date) from encounters) and  deathdate is not null 
-- 154
  
select count(id) from patients  -- 974  died patients

select patient ,cast (stop as date) from encounters

Select * from encounters
where encounterclass='outpatient' and reasoncode is not null

Select Count(*) from procedures
Select Distinct * from Procedures

Select Distinct code from procedures  -- 157

select Distinct trim(description) from procedures  --163

Select Distinct code, description from procedures
where description not like '%(procedure)%'
order by code

-- find the reason for this behaviour

Select min(base_cost), max(base_cost) from procedures

--- min basecost - 1.00 (Face mask (physical object)),  maxbasecost-289531.00(Admit to ICU (procedure))

Select description, min(base_cost) as mincost, max(base_cost) as maxcost from procedures
group by Description
order by 3 desc

Select count(distinct id) as 'countofpatients',max(age) as maxage, avg(age) as avgage, min(age) as minage from (Select p.id,Birthdate, Deathdate, Concat(prefix,'.',First,Last) as fullname, Race, Gender,Address,City,State,County,
Datediff(Year,cast(Birthdate as date) , cast(e.start as date)) as 'age' from patients p
join encounters e
on p.id=e.patient) as patientsagg


--- create the agebin 20-30, 31-40,41-55, 56 - try it from your end, 
Select * from encounters









Select Distinct year(Start) from encounters

--- we need to check which patient died in the treatment time










create database HCA

use HCA

Select * from Patients

Truncate table patients

Bulk insert patients
from 'C:\Users\admin\Downloads\Hospital_M_system\patients.csv'

with (fieldterminator=',', rowterminator='\n', firstrow=2)






