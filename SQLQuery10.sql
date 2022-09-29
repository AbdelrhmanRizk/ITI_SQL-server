--1
declare t_cur cursor
	for select EmpFname, EmpLname, Salary from HumanResource.employee
	for update


declare @fname nvarchar(50)
declare @lname nvarchar(50)
declare @sal  int

open t_cur 
fetch t_cur into @fname, @lname ,@sal
begin
	While @@fetch_status=0
	begin
		if @sal<3000
			begin
update HumanResource.employee set Salary = @sal*1.10 where current of t_cur 
		    end

		else
			begin
update HumanResource.employee set Salary = @sal*1.20 where current of t_cur 
		    end
fetch t_cur into @fname , @lname ,@sal 

	end
end
close t_cur
deallocate t_cur
---------------------------------------------------
--2
declare s_cur cursor
	for select Dept_Name,Ins_Name from Department ,Instructor where Dept_Manager = Ins_Id
	for read only  --update



declare @dept_name nvarchar(50)
declare @manger_name nvarchar(50)
open s_cur 
fetch s_cur into @dept_name,@manger_name
begin
	While @@fetch_status=0  
	begin
		select @dept_name , @manger_name 
		fetch s_cur into @dept_name , @manger_name
	end
end
close s_cur
deallocate s_cur

----------------------------------------------
--3
declare s_cur cursor
	for select St_Fname from Student 
	for read only  --update
declare @stud_name nvarchar(30)
declare @one_cell nvarchar(max) =''

open s_cur 
fetch s_cur into @stud_name
begin
	While @@fetch_status=0  
	begin
		set @one_cell = @one_cell +', '+ isnull(@stud_name,'No Name')
		fetch s_cur into @stud_name	
		
	end
	select @one_cell
end
close s_cur
deallocate s_cur

------------------------------------------------
-- 4-5-6 Done

------------------------------------------------
--7
CREATE SEQUENCE S1
AS INT
START WITH 1
INCREMENT BY 1
MAXVALUE 10 
CYCLE
SELECT NEXT VALUE FOR S2
