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
# Add a new column called DOB in Persons table with data type as Date. 
Alter table persons add DOB date;

#Insert values into Country and Persons tables
-- Inserting values into Country
INSERT INTO Country (Country_name,Population,Area)
VALUES
('USA', 331002651, 9833520),
('Canada', 37742154, 9984670),
('Mexico', 1439323776, 9596961),
('New Zealand', 1380004385, 3287263);

-- Insert values into Persons
INSERT INTO Persons (Id,Fname,Lname,Population,Rating,Country_name,DOB)
VALUES
(1, 'John', 'Doe', 10000, 4.5, 'USA','1990-01-15'),
(2, 'Jane', 'Smith', 50000, 4.0, 'Canada','1985-06-22'),
(3, 'Ali', 'Khan', 15000, 3.8, 'UK','1992-09-10'),
(4, 'Wei', 'Zhang', 20000, 4.2, 'UK','2000-12-05');

# Write a user-defined function to calculate age using DOB. 
delimiter //
Create Function Age_From_DOB(DOB date)
returns int
deterministic
no sql
begin
declare age int;
set age = floor(datediff(curdate(),DOB)/365.25);
return age;
end //
delimiter ;

# Write a select query to fetch the Age of all persons using the function that has been created. 
Select DOB,Age_From_DOB(DOB) As Age from persons;

# Find the length of each country name in the Country table. 
Select Country_name, length(Country_name) as CountryName_Length from country;

# Extract the first three characters of each country's name in the Country table. 
Select Country_name, substring(Country_name,1,3) as CountryName_First3Characters from country;

# Convert all country names to uppercase and lowercase in the Country table.
Select Country_name, ucase(Country_name) as Country_name_UpperCase,
lcase(Country_name) as Country_name_LowerCase from country;