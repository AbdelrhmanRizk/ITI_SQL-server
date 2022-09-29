create view v1  (stu_fullName,grade) as
select St_Fname+' '+St_Lname as fullName , crs_name from Student s ,Course c , Stud_Course as sc
where s.St_Id = sc.st_id and sc.Crs_Id = c.Crs_Id and sc.Grade > 50

select * from v1

---------------------------------------------
alter view v2 (top_name, ins_name) as
select top_name , Ins_Name
from Instructor i join Department d on d.Dept_Manager = i.Ins_Id
join Ins_Course ic on ic.Ins_Id = i.Ins_Id join Course c on c.Crs_Id =ic.Crs_Id
join Topic t on t.Top_Id = c.Crs_Id

select * from v2

--------------------------------------------
create view v3 (ins_name,dept_name) as
select i.Ins_Name ,d.Dept_Name from Instructor i, Department d
where i.Dept_Id = d.Dept_Id and d.Dept_Name in('SD','Java')

select * from v3

---------------------------------------------

create view v4  as
select * from Student where St_Address in('Cairo','Alex') with check option

select * from v4

Update V4 set st_address='tanta'
Where st_address='Alex';

------------------------------------------------
CREATE view v5 (PRO_NAME, COUN_EMP) as
select p.projectName  , count(e.EmpNo) 
from [Company].Project p ,HumanResource.employee e,works_on w
where p.ProjectNo = w.ProjectNo and w.EmpNo = e.EmpNo
group by p.projectName

select * from v5 

-----------------------------------------------
create clustered index ind1 on Department (manager_Hiredate)
--Cannot create more than one clustered index on table 'Department'
-----------------------------------------------
create unique index ind2 on Student (St_Age)
--The CREATE UNIQUE INDEX statement terminated because a duplicate key was found for the object name
----------------------------------------------
create procedure get_dept_name (@stud_num int) as
begin
select  st_fname+' '+st_lname as 'full name' ,dept_name from Student s inner join Department d
on s.Dept_Id = d.Dept_Id
where s.St_Id = @stud_num
end
exec get_dept_name 5
-----------------------------------------------
alter procedure get_message (@stud_num int)
as
begin
declare @fname varchar(15)
declare @lname varchar(15)
set @fname = (select St_Fname from  Student where St_Id = @stud_num)
set @lname = (select St_Lname from  Student where St_Id = @stud_num)
if @fname  is null and @lname is null
select 'First name & last name are null'

else if @fname  is null and @lname is not null
select 'first name is null'

else if @fname  is not null and @lname is null
select 'last name is null'

else if @fname  is not null and @lname is not null
select 'First name & last name are not null'

else
select 'invailed input'
end
exec get_message 5
-----------------------------------------------
create procedure get_dept_info (@mang_id int)as
begin
select  Ins_Name ,dept_name , Manager_hiredate
from Instructor i inner join Department d
on i.Ins_Id = d.Dept_Manager
where i.Ins_Id = @mang_id
end

exec get_dept_info 344
-----------------------------------------------
 create procedure get_stu_data (@stu varchar(15)) as
 begin 
 if @stu  = 'frist name'
 select st_fname from Student
 else if @stu  = 'last name'
 select St_Lname from Student
 else if @stu  = 'full name'
 select st_fname +' '+St_Lname from Student
 else 
 select 'No vailed data'
 end

exec get_stu_data 'frist name'

 ----------------------------------






