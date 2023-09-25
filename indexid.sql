--funktsiooni loomine
Create function fn_ILTV_GetEmployee()
returns Table
as
Return (Select EmployeeKey, FirstName, cast (BirthDate as Date) as DOB
	From DimEmployee)

Create function fn_ILTVF_GetEmployee()
returns @Table Table(Id int, Name varchar(20), DOB Date)
as
begin
insert into @Table
Select EmployeeKey, FirstName, cast (BirthDate as Date)
From DimEmployee
Return
End

Select * from fn_ILTV_GetEmployee();
Select * from fn_ILTVF_GetEmployee();

update fn_ILTV_GetEmployee() set FirstName = 'Sam1' where EmployeeKey = 1;
select * from fn_ILTV_GetEmployee();


--funktsiooni kontseptsiooniga

Create function fn_GetEmployeeNameById (@Id int)
returns nvarchar(20)
as
begin
return (select FirstName from DimEmployee where EmployeeKey = @Id)
end

select dbo.fn_GetEmployeeNameById(1);

sp_helptext fn_GetEmployeeNameById

Alter Function fn_GetEmployeeNameById (@Id int)
Returns nvarchar(20)
With Encryption
as
Begin
return (select FirstName from DimEmployee where EmployeeKey = @Id)
end

select dbo.fn_GetEmployeeNameById(1);

alter function fn_GetEmployeeNameById( @Id int)
returns nvarchar(20)
with schemabinding
as
begin
return (select FirstName from dbo.DimEmployee where EmployeeKey = @Id)
end

drop table DimEmployee


--ajutised tabelid

create table #PersonDetails(
Id int Primary key,
Name varchar(20)
);

insert into #PersonDetails values(1,'Tom');
insert into #PersonDetails values(2,'Dom');
insert into #PersonDetails values(3,'Rom');

Select * from #PersonDetails

select name from tempdb.sys.all_objects
where name like '#PersonDetails%'


create procedure spCreateLocalTempTable
as
begin
create table #PersonDetails(
Id int Primary key,
Name varchar(20)
);
insert into #PersonDetails values(1,'Tom');
insert into #PersonDetails values(2,'Dom');
insert into #PersonDetails values(3,'Rom');
select * from #PersonDetails
end

exec spCreateLocalTempTable

create table ##EmployeeDetails (Id int, Name nvarchar(20))

--index

select * from DimEmployee where BaseRate > 35 and BaseRate < 50

create index IX_tblEmployee_Salary
ON DimEmployee (BaseRate asc)
exec sys.sp_helpindex @objname = 'DimEmployee'

drop index DimEmployee.FirstName_LastName


--36 klasteeritud ja mitte klasteeritud indexid

create clustered index IX_tblEmployee_Name
on DimEmployee(FirstName)

select * from DimEmployee

create table tblEmployee
(
Id int primary key,
Name nvarchar(50),
Salary int,
Gender nvarchar(10),
City nvarchar(50)
);

insert into tblEmployee values(3,'John',4500,'Male','New York');
insert into tblEmployee values(1,'Sam',2500,'Male','London');
insert into tblEmployee values(4,'Sara',5500,'Female','Tokyo');
insert into tblEmployee values(5,'Todd',3100,'Male','Toronto');
insert into tblEmployee values(2,'Pam',6500,'Female','Sydney');

drop index tblEmployee.PK__tblEmplo_3214EC07180FD880

create clustered index IX_tblEmployee_Gender_Salary
on tblEmployee(Gender DESC, Salary ASC)

select * from tblEmployee

create nonclustered index IX_tblEmployee_Name
on tblEmployee(Name)

select * from tblEmployee

drop table tblEmployee

--37 unikaalne ja mitte unikaalne index


create table tblEmployee
(
Id int primary key,
FirstName nvarchar(50),
LastName nvarchar(50),
Salary int,
Gender nvarchar(10),
City nvarchar(50)
);

execute sp_helpindex tblEmployee

insert into tblEmployee values(1,'Mike','Sandoz',4500,'Male','New York');
insert into tblEmployee values(1,'John','Menco',2500,'Male','London');

select * from tblEmployee

drop index PK__tblEmplo_3214EC0780489261

Create Unique NonClustered Index UIX_tblEmployee_FirstName_LastName
On tblEmployee(FirstName, LastName)


delete from tblEmployee
where id = 1

alter table tblEmployee
add constraint UQ_tblEmployee_City
unique nonclustered (City)

execute sp_helpconstraint tblEmployee

create unique index IX_tblEmployee_City
on tblEmployee(City)
with ignore_dup_key

--38 index plussid ja miinused 

delete from tblEmployee
where id = 1

insert into tblEmployee values(1,'Mike','Sandoz',4500,'Male','New York');
insert into tblEmployee values(2,'Sara','Menco',6500,'Female','London');
insert into tblEmployee values(3,'John','Barber',2500,'Male','Sydney');
insert into tblEmployee values(4,'Pam','Grove',3500,'Female','Toronto');
insert into tblEmployee values(5,'James','Mirch',7500,'Male','London');

create nonclustered index IX_tblEmployee_Salary
on tblEmployee (Salary ASC)

select * from tblEmployee

select * from tblEmployee where Salary > 4000 and Salary < 8000

delete from tblEmployee where Salary = 2500;

update tblEmployee set Salary = 9000 where Salary = 7500;

select * from tblEmployee order by Salary;

select * from tblEmployee order by Salary DESC;

select Salary, COUNT(Salary) as Total
from tblEmployee
group by Salary;
