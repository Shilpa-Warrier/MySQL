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
Country_name varchar(100),
Foreign	key	(Id) references Country (Id)
);

#Insert values into Country and Persons tables
-- Inserting values into Country
INSERT INTO Country (Country_name,Population,Area)
VALUES
('USA', 331002651, 9833520),
('Canada', 37742154, 9984670),
('UK', 1439323776, 9596961),
('UK', 1380004385, 3287263),
('Russia', 145934462, 17098242),
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
(6, 'Paul', 'Brown', 25000, 3.9, 'Australia'),
(7, 'Shemi','Liane',230000,4.2,'USA'),
(8, 'John', 'Doe', 10000, 4.5, 'USA'),
(9, 'Jane', 'Smith', 50000, 4.0, 'Canada'),
(10, 'Ali', 'Khan', 15000, 3.8, 'UK');


#Print the first three characters of Country_name from the Country table
SELECT substring(Country_name,1,3) AS First3Char_CountryName FROM Country;

#Concatenate first name and last name from Persons table
SELECT concat(Fname, ' ',Lname) AS FullName FROM persons;

#Count the number of unique country names from Persons table. 
SELECT count(distinct Country_name) FROM Persons;

#Maximum population from the Country table. 
SELECT max(Population) AS MaxPopulation FROM country;

#Minimum population from Persons table. 
SELECT min(Population) AS MinPopulation FROM persons;

#Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table.
-- Inserting values into Country
INSERT INTO Country (Country_name,Population,Area)
VALUES
('USA', 441002651, 8833520),
('Canada', 47742154, 8984670);

-- Inserting values into Persons
INSERT INTO Persons (Id,Fname,Population,Rating,Country_name)
VALUES
(11, 'Shani',240000,4.3,'USA'),
(12, 'Karthik',310000,5.0,'Canada');

-- Count Lname from Persons table.
SELECT count(Lname) FROM Persons;

# Find the number of rows in the Persons table.
SELECT count(Country_Id) FROM Persons;
 
#Find population of the Country table for the first 3 rows. 
SELECT Population AS First3Population FROM country LIMIT 3;

#Print 3 random rows of countries. (Hint: Use rand() function and LIMIT) 
SELECT * FROM country ORDER BY RAND() LIMIT 3;

#List all persons ordered by their rating in descending order. 
SELECT * FROM persons ORDER BY Rating DESC; 

#Find the total population for each country in the Persons table. 
SELECT Country_name, SUM(Population) AS TotalPopulation FROM persons GROUP BY Country_name;

#Find countries in the Persons table with a total population greater than 50,000 
SELECT DISTINCT Country_name FROM persons WHERE Population > 50000;

#List the total number of persons and average rating for each country, 
# but only for countries with more than 2 persons, ordered by the average rating in ascending order.
	
SELECT COUNT( DISTINCT Country_Id) AS NumberOfPersons, Avg(Rating) AS AvgRating 
FROM persons GROUP BY Country_name HAVING NumberOfPersons > 2 ORDER BY AvgRating;













