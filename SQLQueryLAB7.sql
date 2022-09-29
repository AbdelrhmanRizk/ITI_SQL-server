create function getmonth (@date date)
returns varchar(10)
as
begin

declare @month varchar(10)
set @month = MONTHNAME(@date)

return @month
end


select dbo.getmonth('5-5-2000')


------------------------------------------
create function getnumber(@a int,@b int)
returns @table table (column1 int)
as
begin

while @a <= @b
begin
insert into @table values(@a)
set  @a = @a + 1
end
return;
end

select * from dbo.getnumber(1,5)

---------------------------------

create function getfullname(@stud_num int)
returns table
as
return (
select  st_fname+' '+st_lname as 'full name' ,dept_name from Student s inner join Department d
on s.Dept_Id = d.Dept_Id
where s.St_Id = @stud_num
)

select * from dbo.getfullname(10)

---------------------------------------------------------------

create function checkName(@fname varchar(30),@lname varchar(30))
returns  varchar(40)
as
begin
declare @messg  varchar(30)
if @fname  is null and @lname is null
set @messg = 'First name & last name are null'

else if @fname  is null and @lname is not null
set @messg = 'first name is null'

else if @fname  is not null and @lname is null
set @messg = 'last name is null'

else if @fname  is not null and @lname is not null
set @messg = 'First name & last name are not null'

else
set @messg = 'invailed input'

return @messg
end

select st_id, dbo.checkName(St_Fname,St_Lname) from Student

--------------------------------------------------------

create function getManger(@mang_id int)
returns table
as
return (
select  Ins_Name ,dept_name , Manager_hiredate
from Instructor i inner join Department d
on i.Ins_Id = d.Dept_Manager
where i.Ins_Id = @mang_id
)

select * from dbo.getManger(10)

-----------------------------------------------------------

create function fullNameCheck(@name varchar(30))
returns @table table (column1 varchar(30))
as
begin



if @name in (select st_fname from Student )
insert into @table values('student frist name')

else if @name in (select st_lname from Student ) 
insert into @table values('student last name')

else if @name in (select St_Fname+ ' '+st_lname from Student)   
insert into @table values('student full name')

else
insert into @table values('you didnt not enter a name')
return;
end

select * from fullNameCheck('Ahmed Hassan')
----------------------------------------------------------

select  st_id , SUBSTRING(st_fname,1,len(st_fname)-1) 
from Student

-----------------------------------------------------------



update Stud_Course set grade = 0
where Crs_Id in (select sc.Crs_Id from Stud_Course sc inner join
Course c on sc.Crs_Id = c.Crs_Id inner join Student s on s.St_Id=sc.St_Id
inner join Department d on d.Dept_Id = s.Dept_Id
where d.Dept_Name = 'SD'
) 



----------------------------------------------------------

--bouns 2
Declare @i As BigInt = 0;
Declare @newssn Int = 1;

while (@i < 3000) Begin
Set @newssn = @newssn + 1;

    Insert Into  Company_SD.dbo.Employee
    (
        SSN,
        FName,
        LName

    ) Values (
	    @newssn,
        'Jane',
        'Smith'
       );  

    Set @i = @i + 1;

End;

















