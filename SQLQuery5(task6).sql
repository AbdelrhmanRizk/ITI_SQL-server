create table Department
(DeptNo varchar(10) , DeptName varchar(30) , Location nchar(2) ,
constraint DeptNo_pk primary key (DeptNo),
)

--create type loc
--from nchar(2) 

create rule loc_rule
as @loc  in ('NY','DS','KW')

create default location_default as 'NY'
go

  
alter table Department
alter column Location loc


create table employee
(EmpNo int ,EmpFname varchar(30) not null,EmpLname varchar(30) not null, DeptNo varchar(10) ,Salary  money unique,
constraint EmpNo_pk primary key (EmpNo),
constraint DeptNo_fk foreign key (DeptNo) references [dbo].[Department](DeptNo) 
,
)


insert into employee(EmpNo)
values(1111)


update Works_on set EmpNo = 11111  where EmpNo = 10102

update employee set EmpNo = 22222  where EmpNo = 10102

delete from employee where EmpNo = 10102

alter table employee
add TelephoneNumber  varchar(30)

alter table employee
drop column TelephoneNumber  



create schema company
alter schema company transfer dbo.Department
alter schema company transfer dbo.project

create schema HumanResource
alter schema HumanResource transfer employee


SELECT CONSTRAINT_NAME , CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME='Employee';

create synonym Emp
for task6.HumanResource.employee

Select * from Employee  --Invalid object name 'Employee'.
Select * from [HumanResource].employee
Select * from Emp
Select * from [HumanResource].Emp --Invalid object name 'HumanResource.Emp'.

update company.project set budget = budget * 1.1
where ProjectNo = (select ProjectNo from HumanResource.employee
where empno= 10102
)





