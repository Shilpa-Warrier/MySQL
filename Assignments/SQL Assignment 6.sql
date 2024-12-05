#Creating database Populations
CREATE DATABASE populations;
USE populations;

# Creating tables Country and Persons
-- Creating table Country
CREATE TABLE Country(
Id int auto_increment primary key,
Country_name varchar(100),
Population bigint,
Area int
);

-- Creating table Persons
CREATE TABLE Persons(
Id int,
Fname varchar(50) not null,
Lname varchar(50),
Population int,
Rating decimal(2,1) check(Rating between 1 and 5),
Country_Id int auto_increment primary key,
Country_name varchar(100)
);

#Insert values into Country and Persons tables
-- Inserting values into Country
INSERT INTO Country (Country_name,Population,Area)
VALUES
('USA', 331002651, 9833520),
('Canada', 37742154, 9984670),
('Mexico', 1439323776, 9596961),
('New Zealand', 1380004385, 3287263),
('Finland', 145934462, 17098242),
('Australia', 25499884, 7692024),
('USA', 541562651, 9765320),
('USA', 541002651, 9763520),
('Canada', 47742154, 8984670),
('UK', 12345637,7654321);

-- Insert values into Persons
INSERT INTO Persons (Id,Fname,Lname,Population,Rating,Country_name)
VALUES
(1, 'John', 'Doe', 10000, 4.5, 'USA'),
(2, 'Jane', 'Smith', 50000, 4.0, 'Canada'),
(3, 'Ali', 'Khan', 15000, 3.8, 'UK'),
(4, 'Wei', 'Zhang', 20000, 4.2, 'UK'),
(5, 'Maria', 'Gomez', 120000, 4.7, 'Russia'),
(11, 'Sneha','John',140000, 3.9,'Netherlands'),
(12,'Ram', 'Rajesh',21000,4.1,'Iran');


# Perform inner join, Left join, and Right join on the tables. 
-- Inner Join
select c.Id, p.Fname,p.Lname,c.Country_name from country c 
inner join persons p 
on  c.Id = p.Id;

-- Left Join
select c.Id, p.Fname,p.Lname,c.Country_name from country c 
left join persons p 
on  c.Id = p.Id;

-- Right Join
select c.Id, p.Fname,p.Lname,c.Country_name from country c 
right join persons p 
on  c.Id = p.Id;

# List all distinct country names from both the Country and Persons tables. 
Select distinct CountryNames 
From( 
select c.Country_name AS CountryNames from country c 
union
select p.Country_name AS CountryNames from persons p
) as Distinct_Country_Names; 

# List all country names from both the Country and Persons tables, including duplicates. 
select c.Country_name AS CountryNames from country c 
union all
select p.Country_name AS CountryNames from persons p;

# Round the ratings of all persons to the nearest integer in the Persons table.
select Rating, round(Rating) as Rating_Rounded from persons;


