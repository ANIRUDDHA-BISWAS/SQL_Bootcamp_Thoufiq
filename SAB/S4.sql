-- From Google:
Hospitals -- id, name, location, contact_no
Doctors -- id, name, specilization, gender, dob, salary, hospital_id
Patients -- id, name, gender, blood group, dob, phone_no
Medical_Records -- id, problem, date_of_examination, patient_id, doctor_id


select * from information_schema.tables where table_schema='public';
select * from information_schema.table_constraints where table_name='medical_records';
select * from information_schema.column_constraints where table_name='hospitals';

drop table if exists hospitals;
create table hospitals
(
	hospital_code	int,
	hospital_name	varchar(50),
	location		varchar (200),
	contact_no		bigint,
	constraint pk_hospitals primary key (hospital_code,hospital_name)
);


drop table if exists doctors;
create table doctors
(
	id				varchar(15),
	first_name		varchar(50) not null , 
	last_name		varchar(50) not null, 
	specilization	varchar(200), 
	gender			bigint,
	dob				date,
	salary			int,
	hospital_id		int
);


alter table Doctors
alter column gender type varchar(10);

alter table Doctors
add constraint pk_doctor primary key (id);




drop table if exists patients;
create table patients
(
	id				varchar(15) unique,
	first_name		varchar(50), 
	last_name		varchar(50), 
	gender			varchar(10) check (gender in ('M', 'F')),
	dob				date,
	phone_no		bigint,
	blood_group		varchar(15)
);



drop table if exists medical_records;
create table medical_records
(
	id 						int, 
	problem					varchar(200),
	date_of_examination		date, 
	patient_id				varchar(15), 
	doctor_id				varchar(15)
);


-- ADDING foreign key constraint


-- -----------------------------  Method 1  ----------------------------------
drop table if exists Medical_Records;
create table Medical_Records
(
	id 						int, 
	problem					varchar(200),
	date_of_examination		date, 
	patient_id				varchar(15), 
	doctor_id				varchar(15) references doctors(id)
);

-- -----------------------------  Method 2   ----------------------------------

drop table if exists Medical_Records;
create table Medical_Records
(
	id 						int, 
	problem					varchar(200),
	date_of_examination		date, 
	patient_id				varchar(15), 
	doctor_id				varchar(15) ,
	constraint fk_med_rec foreign key (doctor_id, column2) references doctors(id, column2)
);





-- -----------------------------    ----------------------------------


-- IDENTITY column


drop table if exists medical_Records;
create table medical_Records
(
	id 						int primary key generated always as identity, 
	problem					varchar(200),
	date_of_examination		date, 
	patient_id				varchar(15), 
	doctor_id				varchar(15) references doctors(id)
);

-- -----------------------------    ----------------------------------

drop table if exists medical_records;
create table medical_records
(
	id 						int primary key generated by default as identity , 
	problem					varchar(200),
	date_of_examination		date, 
	patient_id				varchar(15), 
	doctor_id				varchar(15) references doctors(id)
);



select * from hospitals;
select * from doctors;
select * from patients;
select * from Medical_Records;

insert into hospitals values (1, 'Fortis Hospital', 'Bangalore', 9900099000);
insert into hospitals values (2, 'Manipal Hospital', 'Manipal', 9900099222);
insert into hospitals values (3, 'Apollo Hospital', 'Mumbai', 9900099333);
insert into hospitals values (4, 'St. Francis Hospital', 'New York', 17194440001);
insert into hospitals values (4, 'Duke Hospital', 'New York', 17194440022);



insert into Doctors values ('D1', 'Ragav', 'Jain', 'Cardiology', 'M', to_date('01-01-1980', 'dd-mm-yyyy'), 250000, 4);
insert into Doctors values ('D2', 'Priyanka', 'Verma', 'Physician', 'f', to_date('01-01-1995', 'dd-mm-yyyy'), 350000, 3);
insert into Doctors values ('D3', 'Sheetal', 'Shetty', 'Neurology', 'F', to_date('01-01-1980', 'dd-mm-yyyy'), 200000, 3);
insert into Doctors values ('D4', 'David', 'Smith', 'Psyatry', 'M', to_date('01-01-1970', 'dd-mm-yyyy'), 150000, 1);
insert into Doctors values ('D5', 'James', 'Dias', 'Oncology', 'm', to_date('01-01-1985', 'dd-mm-yyyy'), 150000, 2);
insert into Doctors values ('D6', 'Ali', 'Abdal', 'Dermatology', 'M', to_date('01-01-1990', 'dd-mm-yyyy'), 250000, 5);


insert into Doctors values ('D7', 'AB', 'Bis', 'Dermatology', 'M', to_date('01-01-1990', 'dd-mm-yyyy'), 250000, 5);



insert into Patients values ('P1', 'Vishva', 'Kumar', 'M', to_date('10-05-1990', 'dd-mm-yyyy'), 9990099900, 'A+');
insert into Patients values ('P2', 'Steven', 'Smith', 'M', to_date('10-05-1990', 'dd-mm-yyyy'), 9990099901, 'B+');
insert into Patients values ('P3', 'Ram', 'Kumar', 'M', to_date('11-05-1990', 'dd-mm-yyyy'), 9990099902, 'O+');
insert into Patients values ('P4', 'Raju', 'Sharma', 'M', to_date('14-05-1990', 'dd-mm-yyyy'), 9990099903, 'O-');
insert into Patients values ('P5', 'Eshal', 'Maryam', 'F', to_date('10-07-1990', 'dd-mm-yyyy'), 9990099904, 'A-');
insert into Patients values ('P6', 'Reshal', 'Verma', 'F', to_date('10-05-1990', 'dd-mm-yyyy'), 9990099905, 'A+');

insert into Patients values ('P5', 'Rajeev', 'Verma', 'F', to_date('10-05-1990', 'dd-mm-yyyy'), 9990099905, 'A+');


insert into Medical_Records values (default, 'Food Poisoning', to_date('10-01-2023', 'dd-mm-yyyy'), 'P1', 'D2');
insert into Medical_Records values (default, 'Fever and Flu', to_date('11-01-2023', 'dd-mm-yyyy'), 'P6', 'D6');
insert into Medical_Records values (default, 'Back Spasm', to_date('15-01-2023', 'dd-mm-yyyy'), 'P7', 'D6');
insert into Medical_Records values (default, 'Headache', to_date('20-01-2023', 'dd-mm-yyyy'), 'P0', 'D7');









-- CONSTRAINTS
PRIMARY KEY -- Make sure that the column does not have null values and is always having unique records
FOREIGN KEY -- Build parent child relationship
NOT NULL -- Define a column as not null if you never want to have null values in it.
CHECK -- Validates with the given list of values
UNIQUE -- Avoid duplicate values. But it allows NULL values.
IDENTITY column -- Auto generates column values


-- Remaining SQL Commands

-- UPDATE
update hospitals 
set hospital_code=50
where hospital_name='Duke Hospital';

update hospitals 
set hospital_code=50, location='Wahsington DC'
where hospital_name='Duke Hospital';


-- DELETE , TRUNCATE
select * from doctors;

delete from doctors
where id = 'D7';

select * from medical_records;

delete from medical_records
where doctor_id = 'D7';

truncate table doctors;

alter table medical_records 
drop constraint medical_records_doctor_id_fkey;


select * from information_schema.table_constraints where table_name='medical_records';

-- Difference between DELETE and TRUNCATE
1) DELETE can either delete few records or all records but TRUNCATE ALWAYS REMOVES all data/records/rows.
2) TRUNCATE is much faster than DELETE



-- ---------------------------------MERGE -- If data exist then do update else insert.----------------------------------

select * from medical_records;


-- Create Table with same structure in different way.
create table medical_records_history
as
select * from medical_records 
where 1 = 2;


select * from medical_records_history;


merge into medical_records_history h
using medical_records m on m.id = h.id
when matched then
	update set problem = m.problem
when not matched then 
	insert (id,problem,date_of_examination,patient_id,doctor_id)
	values(m.id,m.problem,m.date_of_examination,m.patient_id,m.doctor_id);

update medical_records
set problem='covid'
where id=2;

-- -----------------------------------------------------------------------------------------------------------




-- --------------------------------------------- DCL Commands --------------------------------------------------------------
select * from patients;

-- -----------------------------------------------  VIEW -------------------------------------------------------------------
-- Its a database object which is created over an SQL query. 

create view patient_record
as
select (first_name||' '||last_name) as patient_name, 
gender 
from patients;



select * from patient_record;

-- To Check wheather its a TABLE or VIEW
select * from information_schema.tables where table_schema='public';



-- --------------------------- CREATE USERS -----------------------------------------------

create user pwc_auditors with password 'admin';

grant select on patient_record to pwc_auditors;
revoke select on patient_record from pwc_auditors;




-- --------------------------------------------- TCL Commands --------------------------------------------------------------


select * from hospitals;

delete from hospitals where hospital_code = 4 ;

rollback;

commit;




insert into hospitals values (5, 'Fortis Hospital', 'Bangalore', 9900099000);
savepoint record_1;

insert into hospitals values (6, 'Fortis Hospital', 'Bangalore', 9900099000);
savepoint record_2;

insert into hospitals values (7, 'Fortis Hospital', 'Bangalore', 9900099000);
savepoint record_3;

insert into hospitals values (8, 'Fortis Hospital', 'Bangalore', 9900099000);
savepoint record_4;

rollback to record_2;





