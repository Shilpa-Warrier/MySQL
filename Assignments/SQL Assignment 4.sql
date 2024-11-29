Create database populations;
use populations;

#drop database populations;

#Create a table named Country
Create table Country(
Id int auto_increment primary key,
Country_name varchar(100),
Population bigint,
Area int
);

#Create a table named Persons
Create table Persons(
Id int,
Fname varchar(50) not null,
Lname varchar(50),
Population int,
Rating decimal(2,1) check(Rating between 1 and 5),
Country_Id int auto_increment primary key,
Country_name varchar(100),
Foreign	key	(Id) references Country (Id)
);

#Insert values into two tables
#Inserting values into Country
Insert into Country (Country_name,Population,Area)
Values
('India',75000,300000),
('China',5000000,900000),
('USA',3400000,800000),
('UK',2800000, 500000),
('Canada',2500000,600000),
('Nigeria',2300000,700000),
('Australia',2100000,100000),
('Bangladesh',1700000,200000),
('Russia',1400000,1100000),
('Mexico',1300000,300000);

#Insert values into Persons
Insert into Persons (Id,Fname,Lname,Population,Rating,Country_name)
Values
(4,'Cathy','Patti',1700000,1.9,'Bangladesh'),
(5,'Banu','Bablu',2100000,4.6,'Canada'),
(6,'Indira','Krishna',2300000,5.0,'India'),
(7,'Peter','Thomas',3400000,3.7,'USA'),
(8,'Louis','Kather',1000000,2.8,'Australia'),
(9,'Sherin','Nobel',1300000,4.9,'UK');


Insert into Persons (Id,Fname,Lname,Population,Rating)
Values (10,'Smitha','Indira',4500000,4.5);

Insert into Persons (Id,Fname,Lname,Country_name)
Values (1,'Jane','Doe','Mexico'),
(2,'John','Doe','Mexico'),
(3,'Jeevan','John','Mexico');

Truncate table persons;
Select * from PErsons;

#List the distinct country names from the Persons table.
Select distinct Country_name from Persons;

#Select first names and last names from the Persons table with aliases. 
Select Fname, Lname, concat(Fname,' ',Lname) AS Fullname from Persons;

#Find all persons with a rating greater than 4.0.
Select * from Persons where  Rating>4.0;

#Find countries with a population greater than 10 lakhs.
Select * from Country where Population>1000000;

#Find persons who are from 'USA' or have a rating greater than 4.5. 
Select * from Persons where Country_name = 'USA' OR Rating>4.5;

#Find all persons where the country name is NULL. 
Select * from Persons where Country_name IS NULL;

#Find all persons from the countries 'USA', 'Canada', and 'UK'. 
Select * from Persons where Country_name IN ('USA','Canada','UK');

#Find all persons not from the countries 'India' and 'Australia'.
Select * from Persons where Country_name NOT IN ('India','Australia');
 
#Find all countries with a population between 5 lakhs and 20 lakhs.
Select Country_name from Persons where Population between 500000 and 2000000;

#Find all countries whose names do not start with 'C'.
Select * from Country where Country_name not like 'c%';
