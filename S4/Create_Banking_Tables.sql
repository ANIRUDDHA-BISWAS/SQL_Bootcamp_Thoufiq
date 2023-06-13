-- create database banking;


drop table if exists Customer_Accounts;
drop table if exists Transactions;
drop table if exists Accounts;
drop table if exists Customers;
drop table if exists products;
drop table if exists Employees;


create table products
(
	prod_id		varchar(10),
	prod_name	varchar(100) 
);

create table Employees
(
	Emp_ID		varchar(10),
	Emp_Name	varchar(100),
	Salary		float,
	gender		varchar(10) 
);

create table Customers
(
	Customer_ID		varchar(10),
	First_Name		varchar(40),
	Last_Name		varchar(40),
	Phone			bigint,
	Address			varchar(200),
	dob				date
);

create table Accounts
(
	Account_No			bigint,
	Balance				int,
	Account_Status		varchar(10),
	Date_of_Opening		date
);

create table Transactions
(
	Transaction_ID		int ,
	Transaction_Date	date,
	Transaction_amount	float,
	Credit_Debit_flag	varchar(1),
	Account_No			bigint
);

create table Customer_Accounts
(
	Customer_ID		varchar(10),
	Account_No		bigint,
	prod_id			varchar(10)
);



select * from Customer_Accounts;
select * from Transactions;
select * from Accounts;
select * from Customers;
select * from products;
select * from Employees;

