/*
DDL - DATA DEFINITION LANGUAGE
CREATE
DROP
ALTER
TRUNCATE
*/


-- Create a DataBase Named "Healthcare".

-- To show list all databases in Our MySQL database server, we can use the SHOW DATABASES SQL command. 
SHOW DATABASES;

-- If we want to drop an existing database,
DROP DATABASE Healthcare;

-- Create a database.
CREATE DATABASE IF NOT EXISTS Healthcare;

-- Use the database.
USE Healthcare;

/*
Hospitals -- id, name, location, contact_no
Doctors -- id, name, specilization, gender, dob, salary, hospital_id
Patients -- id, name, gender, blood group, dob, phone_no
Medical_Records -- id, problem, date_of_examination, patient_id, doctor_id
*/

create table hospitals(
			hospital_code	int,
            hospital_name 	varchar(50),
            location      	varchar(200),
            contact_no		bigint
);


-- To list the names of all tables in a specific database in MySQL, we can use
SELECT table_name FROM information_schema.tables 
WHERE table_schema = 'Healthcare';

-- To find out the number of tables in a specific database in MySQL, we can use
SELECT COUNT(*) FROM information_schema.tables 
WHERE table_schema = 'Healthcare';

-- To Remove the Table 
DROP TABLE hospitals;

-- If we wanted to get detail information about a table 
DESCRIBE hospitals;


-- To Change name of the table 
alter table hospitals rename to hospitals_tab;

alter table hospitals_tab  rename to hospitals;


/*
Using alter, we can do following things:
Rename column, 
Change column data type
Add new column
Drop a column
Add constraint
Remove a constraint
*/


-- To drop a column
alter table hospitals drop column contact_no;

-- To Add a column
alter table hospitals add column contact_no bigint;



/*
Assignment:
1) Create a database - 1) Healthcare, 2) Banking
2) Create atleast 4 tables for each of these DBs
3) Load data into each of these tables
*/


