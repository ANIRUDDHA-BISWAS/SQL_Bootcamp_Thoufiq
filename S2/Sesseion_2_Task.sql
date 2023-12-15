
/*
Hospitals -- id, name, location, contact_no
Doctors -- id, name, specilization, gender, dob, salary, hospital_id
Patients -- id, name, gender, blood group, dob, phone_no
Medical_Records -- id, problem, date_of_examination, patient_id, doctor_id
*/

DROP DATABASE Healthcare;
CREATE DATABASE IF NOT EXISTS Healthcare;
USE Healthcare;


-- DROP TABLE IF EXISTS hospitals;


CREATE TABLE hospitals(
	hospital_code	int PRIMARY KEY,
	hospital_name 	varchar(50),
	location      	varchar(200),
	contact_no		bigint
);


/*
insert into hospitals (hospital_code, hospital_name, location, contact_no)
	values (1, 'Apollo Hospital', 'Mumbai', 9900099000);
insert into hospitals (hospital_code, hospital_name, location)
	values (2, 'Fortis Hospital', 'New York');
insert into hospitals values (3, 'Duke Hospital', 'Washington DC', 171944449999);
*/


insert into hospitals values (1, 'Fortis Hospital', 'Bangalore',  94444999901);
insert into hospitals values (2, 'Manipal Hospital', 'Manipal', 94444999902);
insert into hospitals values (3, 'Apollo Hospital', 'Mumbai',  94444999903);
insert into hospitals values (4, 'Duke Hospital', 'New York',    94444999904);
insert into hospitals values (5, 'Francic Hospital', 'New York',    94444999904);

select * from hospitals;



CREATE TABLE IF NOT EXISTS doctors (
    doctors_id 		varchar(15) PRIMARY KEY, 
    first_name 		varchar(50),
    last_name 		varchar(50),
    specialization 	varchar(200), 
    gender 			bigint,
    dob 			date,
    salary 			int,
    hospital_code 	int,
    FOREIGN KEY (hospital_code) REFERENCES hospitals(hospital_code)
);

DESCRIBE doctors;


ALTER TABLE DOCTORS 
MODIFY COLUMN gender varchar(10);



/*
INSERT INTO doctors (doctors_id, first_name, last_name, specialization, gender, dob, salary, hospital_code)
VALUES (1, 'Ragav', 'Jain', 'Physician', 'male', STR_TO_DATE('10-01-1990', '%d-%m-%Y'), 150000, 1);

INSERT INTO doctors (doctors_id, first_name, last_name, specialization, gender, dob, salary, hospital_code)
VALUES (2, 'Bipul', 'Jain', 'Physician', 'male', STR_TO_DATE('20-01-1990', '%d-%m-%Y'), 450000, 2);

INSERT INTO doctors VALUES (3, 'Jayant', 'Jain', 'Physician', 'male', STR_TO_DATE('20-01-1990', '%d-%m-%Y'), 250000, 2);
*/


INSERT INTO doctors VALUES ('D1', 'Ragav', 'Jain', 'Cardiology', 'Male', STR_TO_DATE('01-01-1980', '%d-%m-%Y'), 250000, 4);
INSERT INTO doctors VALUES ('D2', 'Priyanka', 'Verma', 'Physician', 'Female', STR_TO_DATE('01-01-1995', '%d-%m-%Y'), 350000, 3);
INSERT INTO doctors VALUES ('D3', 'Sheetal', 'Shetty', 'Neurology', 'F', STR_TO_DATE('01-01-1980', '%d-%m-%Y'), 200000, 3);
INSERT INTO doctors VALUES ('D4', 'David', 'Smith', 'Psychiatry', 'M', STR_TO_DATE('01-01-1970', '%d-%m-%Y'), 150000, 1);
INSERT INTO doctors VALUES ('D5', 'James', 'Dias', 'Oncology', 'M', STR_TO_DATE('01-01-1985', '%d-%m-%Y'), 150000, 2);
INSERT INTO doctors VALUES ('D6', 'Ali', 'Abdal', 'Dermatology', 'M', STR_TO_DATE('01-01-1990', '%d-%m-%Y'), 250000, 5);


select * from Doctors;


CREATE TABLE IF NOT EXISTS patients (
    patient_id 		int PRIMARY KEY, 
    patient_name 	varchar(50),
    gender 			varchar(10),
    blood_group     varchar(10),
    dob 			date,
    phone_no 		int
);


CREATE TABLE IF NOT EXISTS medical_records (
    records_id 				int PRIMARY KEY, 
    problem		 			varchar(200),
    date_of_examination 	date, 
    patient_id				int,
    doctors_id				int,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctors_id) REFERENCES doctors(doctors_id)
);

DESCRIBE doctors;

