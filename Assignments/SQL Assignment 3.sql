Create database employees;
Use employees;

# Create a table named Managers
Create table managers(
Manager_ID int auto_increment primary key,
First_name varchar(50) not null,
Last_Name varchar(50),
DOB varchar(10) not null,
Age int check (age between 21 and 60),
Last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
Gender char(1),
Department varchar (10),
Salary int NOT NULL
);

#Insert 10 rows
Insert into Managers (First_name,Last_Name,DOB,Age,Gender,Department,Salary)
Values 
('Rohan','Thomas','01/12/1994',29,'M','IT',15000),
('Sreedevi','Krishnan', '23/05/1992',32,'F','HR', 25000),
('Tony','Thomas','27/07/1990',34, 'M', 'Finance', 38000),
('Aaliya','Luke','31/05/1974',50,'F','Finance',45000),
('Ashna','Satheesh','12/12/1979',44,'F','HR',12000),
('Saira','Thomas','24/10/1965',59,'F','HR',58000),
('Vivek','John','23/08/2000',24,'M','Marketing',13000),
('Sameera','Jake','27/11/2000',24,'F','Finance',56000),
('Shina','Wely','01/01/1994',30,'F','IT',50000),
('Yadav','Krishna','19/12/1993',30,'M','IT',53000);


#Retrieve the name and date of birth of the manager with Manager_Id 1
Select First_name,Last_Name,DOB from Managers where Manager_Id=1;

#Display the annual income of all managers.
Select First_name,Last_Name,Salary,Salary*12 AS Annual_Income from Managers;

#Display records of all managers except ‘Aaliya’. 
Select * from Managers where First_name <> 'Aaliya';

#Display details of managers whose department is IT and earns more than 25000 per month.
Select * from Managers where Department = 'IT' and Salary>25000;

#Display details of managers whose salary is between 10000 and 35000.
Select * from Managers where Salary between 10000 and 35000;
