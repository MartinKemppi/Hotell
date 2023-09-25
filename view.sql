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
