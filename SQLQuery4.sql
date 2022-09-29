select * from Student where St_Age is not null

select distinct ins_name from Instructor

select isnull(St_fname+' '+St_Lname,''),isnull(St_id ,''),isnull(dept_name,'') from Student s , Department d
where s.Dept_Id = d.Dept_Id

select i.ins_name , d.dept_name from Instructor i left join Department d
on i.Dept_Id = d.Dept_Id

select st_fname +' '+ st_lname as 'full name', crs_name from student s inner join Stud_Course sc
on s.St_Id = s.St_Id inner join Course c on c.Crs_Id = sc.crs_id 
where sc.Grade is not null

select top_name , count(crs_id) from Topic t, Course c 
where t.top_id = c.top_id
group by Top_Name

select min(salary) , max(salary) from Instructor

select * from Instructor where Salary < 
(select avg(salary) from Instructor)

select dept_name from Department d inner join Instructor i 
on d.Dept_Id = i.Dept_Id
where salary =
(select min(salary) from Instructor)

select top(2)salary from Instructor
order by Salary desc

select ins_name , coalesce(convert(varchar(20),salary),'instructor bonus') from Instructor

select AVG(salary) from Instructor

select s.st_fname , super.* from Student s , Student super
where s.St_super = super.St_Id
--self join


select * from (
select Ins_Name, Salary,Dept_Id, ROW_NUMBER() over(partition by Dept_Id order by  salary desc) a1
from Instructor)table1
where a1 in(1,2)

select * from (
select st_fname, Dept_Id, rank() over(partition by Dept_Id order by  newid()) a1
from Student)table1
where a1 in (1)