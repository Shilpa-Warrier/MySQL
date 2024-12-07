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
INSERT INTO Country (Country_name, Population, Area) 
VALUES 
('USA', 100000, 9833520),
('India', 140000, 3287263),
('Russia', 75000, 9596961),
('Italy', 58000, 8515767),
('China', 120000, 17098246),
('Netherlands', 50000, 7692024),
('Canada', 79000, 9984670),
('Germany', 56000, 357022),
('Japan', 78000, 377975),
('United Kingdom', 52000, 243610);

Select * from country;

-- Insert values into Persons
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_name) 
VALUES 
(1, 'Alice', 'Johnson', 100000, 4.5, 'USA'),
(2, 'Bob', 'Smith', 140000, 4.2, 'India'),
(3, 'Cathy', 'Brown', 100000, 3.8, 'USA'),
(4, 'David', 'Miller', 140000, 4.9, 'India'),
(5, 'Ella', 'Davis', 100000, 4.1, 'USA'),
(6, 'Frank', 'Wilson', 100000, 3.5, 'USA'),
(7, 'Grace', 'Taylor', 100000, 4.0, 'USA'),
(8, 'Henry', 'Anderson', 140000, 3.7, 'India'),
(9, 'Isabella', 'Moore', 78000, 4.0, 'Japan'),
(10, 'Jack', 'Thomas', 52000, 4.5, 'United Kingdom');

Select * from persons;

#Find the number of persons in each country. 
Select Country_name, count(Id) as NumberOfPersons from persons group by	Country_name;

#Find the number of persons in each country sorted from high to low. 
Select Country_name, count(Id) as NumberOfPersons from persons group by Country_name order by NumberOfPersons desc;

#Find out an average rating for Persons in respective countries if the average is greater than 3.0 
select Country_name,avg(Rating) as AvgRating from persons group by Country_name having avg(Rating)>3.0;

#Find the countries with the same rating as the USA. (Use Subqueries) 
Select Country_name from persons
where Rating in (
select Rating from persons where Country_name = 'USA')
and Country_name!= 'USA';

#Select all countries whose population is greater than the average population of all nations. 
Select distinct Country_name from country 
where Population > (
select avg(Population) as AvgPopulation from country);

#-----------------------------------------------------------------------------------------------------------------------#
#Creating database Product
Create database product;
use product;

#Creating table Customer
create table customer (
Customer_Id int auto_increment primary key,
First_name varchar(50),
Last_name varchar(50),
Email varchar(100),
Phone_no varchar(13),
Address varchar(100),
City varchar(50),
State varchar(50),
Zip_code int,
Country varchar(50));

#Inserting values to Customer
Insert into customer (First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
values
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Elm St', 'Springfield', 'Illinois', 62704, 'USA'),
('Jane', 'Smith', 'jane.smith@example.com', '2345678901', '456 Oak St', 'Dallas', 'Illinois', 75201, 'USA'),
('Mike', 'Johnson', 'mike.johnson@example.com', '3456789012', '789 Pine St', 'San Francisco', 'Illinois', 94107, 'USA'),
('Emily', 'Davis', 'emily.davis@example.com', '4567890123', '321 Maple Ave', 'Seattle', 'Illinois', 98101, 'USA'),
('Chris', 'Brown', 'chris.brown@example.com', '5678901234', '654 Cedar Blvd', 'Miami', 'Illinois', 33101, 'USA'),
('Carlos', 'Gonzalez', 'carlos.gonzalez@example.com', '6789012345', '12 Avenida Central', 'Madrid', 'Madrid', 28013, 'Spain'),
('Aisha', 'Khan', 'aisha.khan@example.com', '7890123456', '56 Shahrah-e-Faisal', 'Karachi', 'Sindh', 75500, 'Pakistan'),
('Liam', 'O\'Connor', 'liam.oconnor@example.com', '8901234567', '89 High Street', 'Dublin', 'Leinster', 10001, 'Ireland'),
('Mei', 'Wang', 'mei.wang@example.com', '9012345678', '234 Zhongshan Rd', 'Beijing', 'Beijing', 100010, 'China'),
('Akira', 'Tanaka', 'akira.tanaka@example.com', '0123456789', '78 Sakura Blvd', 'Tokyo', 'Tokyo', 1000014, 'Japan'),
('Sophia', 'Evans', 'sophia.evans@example.com', '2345678901', '123 Willow St', 'Austin', 'Illinois', 78701, 'USA'),
('Isabella', 'Martinez', 'isabella.martinez@example.com', '3456789012', '45 Gran Via', 'Barcelona', 'Catalonia', 8002, 'Spain'),
('Ahmed', 'Ali', 'ahmed.ali@example.com', '4567890123', '78 Mall Road', 'Lahore', 'Punjab', 54000, 'Pakistan'),
('Niamh', 'Murphy', 'niamh.murphy@example.com', '5678901234', '12 St Patrick\'s St', 'Cork', 'Munster', 20002, 'Ireland'),
('Wei', 'Chen', 'wei.chen@example.com', '6789012345', '345 Chang\'an Ave', 'Shanghai', 'Shanghai', 200003, 'China');

Select * from customer;

#Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. 
#Then perform the SELECT operation for the customer_info view.
Create view Customer_Info as
select concat(First_name,' ',Last_name) as Full_Name, email from customer;

Select * from customer_info;

#Create a view named US_Customers that displays customers located in the US.
Create view US_Customers AS
select * from customer where Country = 'USA';

Select * from US_Customers;

#Create view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state. 
Create view Customer_details as
select concat(First_name,' ',Last_name) as Full_Name, Email,Phone_no,State from customer;

Select * from Customer_details;

#Update phone numbers of customers who live in California for Customer_details view. 
Update Customer_details
set Phone_no = 9867542310 where State = 'California';

#Count the number of customers in each state and show only states with more than 5 customers. 
select State,count(Customer_Id) as Number_Of_Customers from customer group by State having Number_Of_Customers>5;

#Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view. 
Select State,count(*) as Number_Of_Customers 
from customer
Group by State;

#Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
Select * from customer_details order by State;


