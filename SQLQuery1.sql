select * from employee
select Fname , Lname , salary , dno from Employee
select pname , plocation , dnum from Project
select  Fname + ' ' + Lname as "full name" , salary * 0.1 * 12 as "annual comm" from Employee
select ssn , Fname from Employee where salary > 1000
select ssn , Fname from Employee where salary * 12 > 10000
select Fname, Salary from Employee where Sex = 'F'
select Dnum,dname from Departments where MGRSSN = 968574
select Pnumber,Pname,Plocation from Project where Dnum = 10