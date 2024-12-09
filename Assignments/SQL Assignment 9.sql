create database companydb;
use companydb;
create table worker(
WorkerId int,
FirstName varchar(25), 
LastName varchar(25), 
Salary decimal(10,2), 
JoiningDate DATETIME, 
Department varchar(25));
 
# Create a stored procedure that takes in IN parameters for all the columns in the Worker table and 
-- adds a new record to the table and then invokes the procedure call. 
delimiter //
create procedure Insert_Display_Employees(
IN P_WorkerId INT,
IN P_FirstName varchar(25), 
IN P_LastName varchar(25), 
IN P_Salary DECIMAL(10,2), 
IN P_JoiningDate DATETIME, 
IN P_Department varchar(25))
begin 
insert into worker(WorkerId,FirstName,LastName,Salary,JoiningDate,Department)
Values (P_WorkerId,P_FirstName,P_LastName,P_Salary,P_JoiningDate,P_Department);
select * from worker;
end //
delimiter ;

Call Insert_Display_Employees(1,'John','Doe',10000,'2024-12-01','IT');
Call Insert_Display_Employees(2,'Jane','Doe',20000,'2024-11-01','IT');
Call Insert_Display_Employees(3,'Mary','Smith',30000,'2024-10-01','HR');

# Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. 
-- It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter. 
-- Then make the procedure call. 
delimiter //
Create procedure Display_Salary(
in P_WorkerId int,
out P_Salary decimal(10,2))
begin
Select Salary into P_Salary from worker
where WorkerId = P_WorkerId;
end //
delimiter ; 

set @P_Salary = 0;
Call Display_Salary(2,@P_Salary);
select @P_Salary as P_Salary;

#Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. 
-- It should update the department of the worker with the given ID. Then make a procedure call. 
Delimiter //
Create procedure Update_Department(
in P_WorkerId int,
inout P_Department varchar(25))
begin
update worker 
set Department = P_Department
where WorkerId = P_WorkerId;
Select * from worker;
end //
Delimiter ;

set @P_Department = 'IT';
set @P_WorkerId = 3;
Call Update_Department(@P_WorkerId,@P_Department);

#Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. 
-- It should retrieve the number of workers in the given department and returns it in the p_workerCount parameter. 
-- Make procedure call. 
delimiter //
create procedure Display_WorkerCount(
in P_Department varchar(25),
out P_WorkerCount int)
begin
Select Count(Department) into P_WorkerCount
from worker
where P_Department = Department;
Select P_Department as Department,P_Workercount as WorkerCount;
end //
Delimiter ;

set @P_WorkerCount=0;
Call Display_WorkerCount('It',@P_WorkerCount);

#Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. 
-- It should retrieve the average salary of all workers in the given department and returns it in the p_avgSalary parameter 
-- call the procedure.
 delimiter //
 Create procedure AvgSalary(
 in P_Department varchar(25),
 out P_Average_Salary decimal(10,2))
 Begin
 select avg(Salary) into P_Average_Salary
 from worker
 where P_Department = Department group by Department;
 Select P_Department as Department, P_Average_Salary As Average_Salary;
end //
delimiter ;

set @P_Average_Salary = 0;
call AvgSalary('IT',@P_Average_Salary);
 
 
 
 
