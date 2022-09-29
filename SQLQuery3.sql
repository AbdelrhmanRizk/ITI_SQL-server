insert into Employee (Dno ,SSN , Superssn ,Salary)
values(30,102672,112233,3000)

insert into Employee (Dno ,SSN , Superssn ,Salary)
values(30,102660,null,null)

update Employee set salary = Salary * 1.2
where SSN = 102672

--------------------------------------------------

select d.Dependent_name , d.sex from Dependent d, Employee e
where e.SSN = d.ESSN and e.Sex = 'F' and d.Sex = 'F'
union
select d.Dependent_name , d.sex from Dependent d, Employee e
where e.SSN = d.ESSN and e.Sex = 'M' and d.Sex = 'M'



select pname , sum(hours)   
from Project,  Works_for
where Pno= Pnumber
group by Pname


select * from Departments inner join Employee
on dno = Dnum
where SSN =
(select  min(ssn) from Employee)



select dname , min(salary) as min , max(salary) as max , avg(salary) as avg from Employee,Departments
where Dno = Dnum 
group by Dname


select fname , lname from Employee ,Departments
where ssn = MGRSSN
intersect
select fname , lname from Employee  inner join Dependent
on SSN = ESSN
where essn is null

select Dnum , dname , count(ssn) from Employee,Departments
where Dno = Dnum 
group by Dname, Dnum
having avg(Salary) < (select avg(Salary) from Employee)


select fname , lname  , Pname
from Employee e inner join Works_for on essn=ssn
inner join Project on pno = Pnumber
order by Dnum, Fname desc ,Lname desc


select * from Employee 
where Salary in(select distinct top(2) Salary from Employee
order by Salary desc)


select fname +' '+ lname  from Employee 
intersect
select dependent_name from Dependent


--11
insert into Departments values('DEPT IT',100,112233 ,'1-11-2006')

--12
update departments set mgrssn=968574 where dnum=100
update departments set mgrssn=102672 where dnum=
(select dnum from departments where mgrssn =968574 and dnum!=100 )
update employee  set superssn= 102672 where ssn = 102660

--13
update departments set mgrssn=102672 where dnum=
(select dnum from departments d where mgrssn = 223344)
update works_for set essn=102672 where essn in
(select essn from works_for where essn = 223344)
delete from Dependent  where essn=223344
update employee set superssn=102672 where ssn in
(select e.ssn from employee e where e.superssn = 223344)
delete from Employee  where ssn=223344



--14

update Employee set Salary = salary * 1.3
where Dno in (select pnumber from Project where
pname = 'Al Rabwah'
)








