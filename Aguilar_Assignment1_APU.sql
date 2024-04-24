CREATE TABLE Customers(
id bigserial,
First_name varchar(50),
Last_name varchar(50),
Phone_number char(13),
Email varchar(50),
Street_Adress varchar(50),
City varchar(25),
Zip char(5),
State char(2)
);
CREATE TABLE Employees (
id bigserial,
First_name varchar(50),
Last_name varchar(50),
Phone_number char(13),
Email varchar(50),
Street_Adress varchar(50),
City varchar(25),
Zip char(5),
State char(2),
hire_date date,
salary_amount numeric(9,2),
probationary_status char(1)
);
CREATE TABLE Parts_inventory (
part_number varchar(50),
manufacturer_name varchar(50),
quantity integer,
price decimal,
backordered char(1)
);