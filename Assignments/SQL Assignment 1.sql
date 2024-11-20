#Creating database School
create database School;

#Using the database School to create different tables
use school;

#Creating a table names STUDENT with Roll No, Name, Mark and Grade
create table STUDENT(
Roll_No int auto_increment primary key,
Student_Name varchar (100) not null,
Marks int not null,
Grade char(1) check (Grade in('A', 'B', 'C', 'D', 'E', 'F')));

Select * from STUDENT;

#Adding a new column (Contact) to the table Student
Alter table STUDENT 
add Contact int;

#Inserting values to the table
Insert into student (Student_Name, Marks, Grade, Contact)
Values ('Saira John', 100, 'A', 1234567890),
('John Doe', 90, 'B', 1123456789),
('Shikha Kael', 75, 'C', 1656576567);

# Displaying the contents of STUDENT Table
Select * from STUDENT;

# Removing the Grade column
Alter table student
Drop column grade;

# Renaming the the table to CLASSTEN
Rename table student to classten;

Select * from classten;

# remove all rows from the table classten.
Truncate table classten;

#Remove table from database
Drop table classten;



