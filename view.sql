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

--39 View SQL serveris

drop table tblEmployee

create table tblEmployee
(
Id int primary key,
Name nvarchar(30),
Salary int,
Gender nvarchar(10),
DepartmentId int
);

create table tblDepartment
(
DeptId int primary key,
DeptName nvarchar(20)
);

insert into tblDepartment values(1,'IT');
insert into tblDepartment values(2,'Payroll');
insert into tblDepartment values(3,'HR');
insert into tblDepartment values(4,'Admin');

insert into tblEmployee values(1,'John',5000,'Male',3);
insert into tblEmployee values(2,'Mike',3400,'Male',2);
insert into tblEmployee values(3,'Pam',6000,'Female',1);
insert into tblEmployee values(4,'Todd',4800,'Male',4);
insert into tblEmployee values(5,'Sara',3200,'Female',1);
insert into tblEmployee values(6,'Ben',4800,'Male',3);

select Id, Name, Salary, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId

create view vWEmployeesByDepartment
as
Select Id, Name, Salary, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId

select * from vWEmployeesByDepartment

create view vWITDepartment_Employees
as
Select Id, Name, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId
where tblDepartment.DeptName = 'IT'

select * from vWITDepartment_Employees

create view vWEmployeesNonConfidentialData
as
select Id, Name, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId;

select * from vWEmployeesNonConfidentialData

create view vWEmployeesCountByDepartment
as
select DeptName, Count(Id) as TotalEmployees
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId
group by DeptName

select * from vWEmployeesCountByDepartment

execute sp_helptext vWName

--40 View uuendused

create view vWEmployeesDataExceptSalary
as
Select Id, Name, Gender, DepartmentId
from tblEmployee;

select * from vWEmployeesDataExceptSalary

update vWEmployeesDataExceptSalary
set Name = 'Mikey' Where Id = 2

delete from vWEmployeesDataExceptSalary where Id = 2
insert into vWEmployeesDataExceptSalary values (2, 'Mikey', 'Male', 2)

create view vwEmployeeDetailsByDepartment
as
select Id, Name, Salary, Gender, DeptName
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId

select * from vwEmployeeDetailsByDepartment

update vwEmployeeDetailsByDepartment
set DeptName = 'IT' Where Name = 'John'

select * from tblEmployee;
select * from tblDepartment;

--41 indekseeritud view

create table tblProduct
(
ProductId int primary key,
Name nvarchar(20),
UnitPrice int
);

insert into tblProduct values (1, 'Books', 20);
insert into tblProduct values (2, 'Pens', 14);
insert into tblProduct values (3, 'Pencils', 11);
insert into tblProduct values (4, 'Clips', 10);

create table tblProductSales(
ProductId int,
QuantitySold int
);

insert into tblProductSales values(1,10);
insert into tblProductSales values(3,23);
insert into tblProductSales values(4,21);
insert into tblProductSales values(2,12);
insert into tblProductSales values(1,13);
insert into tblProductSales values(3,12);
insert into tblProductSales values(4,13);
insert into tblProductSales values(1,11);
insert into tblProductSales values(2,12);
insert into tblProductSales values(1,14);


select * from tblProduct;
select * from tblProductSales;

create view vWTotalSalesByProduct
with SchemaBinding
as
select Name,
SUM(ISNULL((QuantitySold * UnitPrice),0)) as TotalSales,
Count_big(*) as TotalTransactions
from dbo.tblProductSales
join dbo.tblProduct
on dbo.tblProduct.ProductId = dbo.tblProductSales.ProductId
group by Name;

select * from vWTotalSalesByProduct

create unique clustered index UIX_vWTotalSalesByProduct_Name
on vWTotalSalesByProduct(Name)

--42 View piirangud

select * from tblEmployee
drop table tblEmployee

create table tblEmployee
(
Id int primary key,
Name nvarchar(30),
Salary int,
Gender nvarchar(10),
DepartmentId int
);

Insert into tblEmployee values (1,'John', 5000, 'Male', 3)
Insert into tblEmployee values (2,'Mike', 3400, 'Male', 2)
Insert into tblEmployee values (3,'Pam', 6000, 'Female', 1)
Insert into tblEmployee values (4,'Todd', 4800, 'Male', 4)
Insert into tblEmployee values (5,'Sara', 3200, 'Female', 1)
Insert into tblEmployee values (6,'Ben', 4800, 'Male', 3)

select * from tblEmployee;

Create View vWEmployeeDetails
@Gender nvarchar(20)
as
Select Id, Name, Gender, DepartmentId
from  tblEmployee
where Gender = @Gender

Create function fnEmployeeDetails(@Gender nvarchar(20))
Returns Table
as
Return 
(Select Id, Name, Gender, DepartmentId
from tblEmployee where Gender = @Gender)

Select * from dbo.fnEmployeeDetails('Male')

Create View vWEmployeeDetailsSorted
as
Select Id, Name, Gender, DepartmentId
from tblEmployee
order by Id


Create Table ##TestTempTable(
Id int,
Name nvarchar(20),
Gender nvarchar(10)
);

Insert into ##TestTempTable values(101, 'Martin', 'Male')
Insert into ##TestTempTable values(102, 'Joe', 'Female')
Insert into ##TestTempTable values(103, 'Pam', 'Female')
Insert into ##TestTempTable values(104, 'James', 'Male')

select * from ##TestTempTable

Create View vwOnTempTable
as
Select Id, Name, Gender
from ##TestTempTable
