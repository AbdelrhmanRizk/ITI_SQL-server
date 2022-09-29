select count (distinct Dept_Location)
from Department

select * 
from Department
where Dept_Location = 'Alex'

select * 
from Department
where Dept_Id >= 30

select count (*)
from Department

select count (dept_location)
from Department
where Dept_Location = 'Alex'

insert into Department (Dept_Id, Dept_Name,Dept_Desc,Dept_Location)
values(80,'MM', 'Multimedia','Cairo')

select *
from Department
where Manager_hiredate is null --Test for null value 

select *
from Department
where Manager_hiredate is not null --filter column with value

update Department
set Dept_Id = 90 ,Dept_Location = 'Mansoura'
where Dept_Id = 80 --if there is not where in the select statment => all record will change 

delete from Department
where Dept_Id=90

select *
from Department
where dept_location in('Alex','Cairo') -- equal to dept_location='Alex' or dept_location='Cairo'

select *
from Department
where dept_location NOT in('Alex','Cairo') 

select *
from Department
where dept_location ='Alex' AND Dept_Id= 40 

select *
from Department
where dept_location ='Alex' OR Dept_Id= 40 

select *
from Department
where NOT dept_location ='Alex' 

select *
from Department
where dept_location ='Alex' AND (Dept_Name= 'MM' OR Dept_Manager = 333) 


select *
from Department
where NOT dept_location ='Alex' AND NOT Dept_Location ='Mansoura'


select 10 + 5
select 10 - 5
select 10 * 5
select 10 / 5
select 10 % 5

select * from Department where  Dept_Id > 20
select * from Department where  Dept_Id >= 20
select * from Department where  Dept_Id < 20
select * from Department where  Dept_Id <= 20
select * from Department where  Dept_Id = 20
select * from Department where  Dept_Id <> 20 --not equal

select * from Department 
where  Dept_Id between 20 and 60 

select * from Department 
where  Dept_Id not between 20 and 60 

select * from Department 
where  Dept_Id  between 20 and 60 
and Dept_Location not in('Alex','Mansoura')

select *
from Department 
order by Dept_Location asc

select *
from Department 
order by Dept_Location desc,Dept_Name asc


select TOP 5 * from Department


select MIN(Dept_Id) as min
from Department

select Max(Dept_Id) as max
from Department

select count(*) as numOfRow
from Department

select count(Manager_hiredate)
from Department

select avg (Dept_Id) as avg
from Department

select sum (Dept_Id) as sum
from Department

-----------------------------------------


create table customer1(
cust_id integer primary key ,
cust_name varchar(30)not null unique 
)

drop table customer1

alter table customer
add Dates date

exec sp_rename 'dbo.customer','Buyers'

----------------------------------------------------------------

select st_fname from Student
union
select ins_name from Instructor

----------------------------------------------------------

select * ,
case
  when st_id > 7 then 'the number is greater than 7'
  when st_id < 7 then 'the number is smaller than 7'
  else 'the number is 7'
end as NumberText
from student
------------------------------------------------------------