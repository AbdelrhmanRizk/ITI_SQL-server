--1 ITI
create procedure std_count as
begin
select dept_name , count(*) as no_students
from Department
group by Dept_Name
end

exec std_count
---------------------------------------
--2 Company 
alter procedure chk_empno (@pno int)as
begin 
declare @count int
set @count = 
(select count(*) 
from [Company ].Project p ,HumanResource.employee e,works_on w
where p.ProjectNo = w.ProjectNo and w.EmpNo = e.EmpNo
and p.ProjectNo = @pno)
if @count >= 3
select concat('The number of employees in the project p',@pno,' is 3 or more')
else
select concat('The following employee work for the project p',@pno,':',EmpFname,' ',EmpLname)
from HumanResource.employee e , works_on w
where e.EmpNo = w.EmpNo and w.ProjectNo = @pno
end

exec chk_empno 10102
-------------------------------------------
--3 Company 
alter procedure replace_emp (@old_empno int , @new_empno int,@pno int) as
begin
BEGIN TRY  
update WORKS_ON
set EmpNo = @new_empno 
where ProjectNo = @pno and EmpNo = @old_empno  
END TRY  
BEGIN CATCH  
select ERROR_MESSAGE() AS ErrorMessage;  
END CATCH
end


----------------------------------------
--4 Company
alter table Company.Project
add budget int

create table Audit
(ProjectNO varchar(5),UserName varchar(30),ModifiedDate date,Budget_Old int,Budget_New int)

alter trigger update_pudget on Company.Project
after update as
begin
if update(budget)
insert into Audit
select i.ProjectNo,@@SERVERNAME,getdate(),d.budget,i.budget
from inserted i ,deleted d
end

update Company.Project
set budget = 200000
where ProjectNo = 114

select * from audit
-----------------------------------------------
--5 Company
create trigger prevent_ins on Company.Department
instead of insert
as
begin
select 'you can’t insert a new record in that table'
end

insert into company.department(DeptNo)
values(100)
------------------------------------------
--6 Company
create trigger prevent_ins2 on HumanResource.employee
instead of insert
as
begin 
declare @current_date int
set @current_date = datepart(month,getdate())
if @current_date = 3
select 'you can not add an employee in march'
else
insert into HumanResource.employee
select * from inserted
end

insert into HumanResource.employee(EmpFname,EmpLname,EmpNo)
values ('ABDO','RIZK',12245)
------------------------------------------------
--7 ITI
create table std_audit
(user_name varchar(30),date date,note varchar(100))

alter trigger add_std on student
after insert as
begin
insert into std_audit
select @@SERVERNAME,getdate(),@@SERVERNAME+
' Insert New Row with Key='+St_Id+' in table [Student]'
from inserted
end

SELECT * FROM std_audit


---------------------------------------------------------
--8 ITI
alter trigger delete_std on student
instead of delete as
begin
insert into std_audit
select @@SERVERNAME,getdate(),concat(@@SERVERNAME,
' try to delete Row with Key=',St_Id,' in table [Student]')
from deleted
end


delete from student 
where St_Id = 1

select * from std_audit


