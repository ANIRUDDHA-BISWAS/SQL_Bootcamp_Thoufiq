select * from information_schema.tables 
where table_schema='public';


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


insert into Doctors values ('D6', null, null, 'Dermatology', 'M', to_date('01-01-1990', 'dd-mm-yyyy'), 250000, 5);



insert into Patients values ('P1', 'Vishva', 'Kumar', 'M', to_date('10-05-1990', 'dd-mm-yyyy'), 9990099900, 'A+');
insert into Patients values ('P2', 'Steven', 'Smith', 'M', to_date('10-05-1990', 'dd-mm-yyyy'), 9990099901, 'B+');
insert into Patients values ('P3', 'Ram', 'Kumar', 'M', to_date('11-05-1990', 'dd-mm-yyyy'), 9990099902, 'O+');
insert into Patients values ('P4', 'Raju', 'Sharma', 'M', to_date('14-05-1990', 'dd-mm-yyyy'), 9990099903, 'O-');
insert into Patients values ('P5', 'Eshal', 'Maryam', 'F', to_date('10-07-1990', 'dd-mm-yyyy'), 9990099904, 'A-');
insert into Patients values ('P6', 'Reshal', 'Verma', 'F', to_date('10-05-1990', 'dd-mm-yyyy'), 9990099905, 'A+');

insert into Patients values ('P5', 'Rajeev', 'Verma', 'F', to_date('10-05-1990', 'dd-mm-yyyy'), 9990099905, 'A+');


insert into Medical_Records values (1, 'Food Poisoning', to_date('10-01-2023', 'dd-mm-yyyy'), 'P1', 'D2');
insert into Medical_Records values (2, 'Fever and Flu', to_date('11-01-2023', 'dd-mm-yyyy'), 'P6', 'D6');
insert into Medical_Records values (3, 'Back Spasm', to_date('15-01-2023', 'dd-mm-yyyy'), 'P7', 'D6');
insert into Medical_Records values (4, 'Headache', to_date('20-01-2023', 'dd-mm-yyyy'), 'P0', 'D7');






select * from hospitals;
select * from doctors;
select * from patients;
select * from medical_records;


