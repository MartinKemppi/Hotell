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
