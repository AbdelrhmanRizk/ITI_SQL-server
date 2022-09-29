select dnum , dname , fname , lname from Departments , Employee
where MGRSSN = SSN

select Dname , pname from Departments D , Project P
where P.Dnum = D.Dnum

select essn , Dependent_name , d.sex , d.Bdate , fname , lname from Dependent d , Employee
where essn = SSN 

select pname , plocation , pnumber from Project
where City = 'alex' or City = 'cairo'

select * from Project
where pname like 'a%'

select * from Employee
where dno=30  and Salary between 1000 and 2000

select fname , lname  
from Employee e inner join Works_for on essn=ssn
inner join Project on pno = Pnumber
where e.Dno = 10 and Hours >=10 and Pname = 'AL Solimaniah'

select e.fname , e.lname from Employee e , Employee s
where e.Superssn = s.SSN and s.Lname='moahmed' and s.Fname='kamel'

select e.fname , e.lname , pname 
from Employee e inner join Works_for on essn=ssn
inner join Project on pno = Pnumber

select p.Pnumber, d.Dname , e.lname , e.Address ,e.Bdate
from Project p inner join Departments d on p.Dnum=d.Dnum
inner join Employee e on e.SSN = d.MGRSSN
where p.City = 'cairo'


select * 
from Employee e right join departments d 
on e.ssn = d.MGRSSN


select e.Fname , e.lname , d.Dependent_name
from Employee e left join Dependent d
on e.Dno = d.ESSN





