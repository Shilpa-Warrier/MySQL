#Creating a database named Sales
Create database sales;
Use sales;
#Creating a table orders
Create table orders (
Order_Id int auto_increment primary key, 
Customer_name varchar(100) not null, 
Product_Category varchar(100) not null,
Ordered_item varchar(100),
Contact_No int,
Unique (Contact_No)
);

#Add a new column named “order_quantity” to the orders table. 
Alter table orders
Add column order_quantity int;

# Rename the orders table to the sales_orders table. 
Rename table orders to sales_orders;

#Insert 10 rows into the sales_orders table. 
Insert into sales_orders (Customer_name, Product_Category, Ordered_item, Contact_No, Order_Quantity)
Values ('Sanjana', 'Electronics', 'Mobile hone', 1234567890, 3),
('Ahana', 'Books', 'Fairy Tales', 2121213443, 1),
('Rob', 'Electornics', 'Laptop', 1221321310,5),
('Bibin', 'Books', 'Story Books', 1342342345, 2),
('Jisha', 'Clothing', 'Bedsheets', 1452455422,4),
('Sanya', 'Clothing','Tablecloths', 1534534532, 10),
('Arun', 'Clothing','Floor Mat', 1233211233, 12),
('Kevin', 'Electronics','Tablets',1533215233,7),
('Jeni', 'Books','Drawing Books',1793211233,15),
('Gopika','Books','Books',1323321123,3);

# Retrieve customer_name and Ordered_Item from the sales_orders table. 
Select Customer_name, Ordered_item from sales_orders;

# Use the update command to change the name of the product for any row.
Update sales_orders
Set Product_Category = 'Pillow Cover' where Customer_name = 'Arun';

# Delete the sales_orders table from the database.
Drop table sales_orders;


