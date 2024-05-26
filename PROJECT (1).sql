CREATE TABLE Employee (
empID NUMBER(6) CONSTRAINT employee_empID_pk PRIMARY KEY,
fname VARCHAR2(20) CONSTRAINT employee_fname_nn NOT NULL,
lname VARCHAR2(25) CONSTRAINT employee_lname_nn NOT NULL,
salary NUMBER(6),
address VARCHAR2(255),
managerId NUMBER(6) CONSTRAINT employee_managerId_fk REFERENCES Employee(empID)
);

CREATE TABLE Employee_phone (
empID NUMBER(2) CONSTRAINT employee_phone_empID_fk 
REFERENCES Employee(empID),
phoneNum VARCHAR2(20) CONSTRAINT employee_phone_phoneNum_nn NOT NULL, 
type VARCHAR2(50),
PRIMARY KEY (empID, phoneNum)
);

CREATE TABLE Doctor (
licence_num NUMBER(6) CONSTRAINT doctor_licence_num_pk PRIMARY KEY,
empID NUMBER(6) CONSTRAINT doctor_empID_fk REFERENCES Employee(empID),
fname VARCHAR2(20) CONSTRAINT doctor_fname_nn NOT NULL,
lname VARCHAR2(25) CONSTRAINT doctor_lname_nn NOT NULL,
salary NUMBER(6),
address VARCHAR2(20),
phoneNum VARCHAR2(20),
specialization VARCHAR2(20),
CONSTRAINT doctor_phone_fk foreign key (empID, phoneNum) references employee_phone(empID, phoneNum)
);

CREATE TABLE Nurse (
nursing_license NUMBER(6) CONSTRAINT nurse_nursing_license_pk PRIMARY KEY,
empID NUMBER(6) CONSTRAINT nurse_empID_fk REFERENCES Employee(empID),
fname VARCHAR2(20) CONSTRAINT nurse_fname_nn NOT NULL,
lname VARCHAR2(25) CONSTRAINT nurse_lname_nn NOT NULL,
salary NUMBER(6),
address VARCHAR2(20),
phoneNum VARCHAR2(20),
CONSTRAINT nurse_phone_fk 
        FOREIGN KEY (empID, phoneNum) 
        REFERENCES employee_phone(empID, phoneNum));

CREATE TABLE Receptionist (
    receptionist_id NUMBER(6) CONSTRAINT receptionist_receptionist_id_pk PRIMARY KEY,
    empID NUMBER(6) CONSTRAINT receptionist_empID_fk REFERENCES Employee(empID),
    fname VARCHAR2(20) CONSTRAINT receptionist_fname_nn NOT NULL,
    lname VARCHAR2(25) CONSTRAINT receptionist_lname_nn NOT NULL,
    salary NUMBER(6),
    phone VARCHAR2(20),
    shift VARCHAR2(50),
    CONSTRAINT receptionist_phone_fk 
        FOREIGN KEY (empID, phone) 
        REFERENCES employee_phone(empID, phoneNum)
);

CREATE TABLE Finance (
financeID NUMBER(6) CONSTRAINT finance_financeID_pk PRIMARY KEY,
name VARCHAR2(20)
);

CREATE TABLE Inventory (
ItemID NUMBER(6) CONSTRAINT inventory_ItemID_pk PRIMARY KEY,
supplier_info VARCHAR2(25),
quantity NUMBER(10),
financeID NUMBER(6) CONSTRAINT inventory_financeID_fk REFERENCES Finance(financeID)
);

CREATE TABLE Patient (
PatientID NUMBER(6) CONSTRAINT patient_PatientID_pk PRIMARY KEY,
name VARCHAR2(20) CONSTRAINT patient_name_nn NOT NULL,
dob DATE,
phone_number VARCHAR2(20)
);

CREATE TABLE Consultation (
consultation_id NUMBER(6) CONSTRAINT consultation_consultation_id_pk PRIMARY KEY,
c_date DATE,
 reason VARCHAR2(25),
licence_num NUMBER(6) CONSTRAINT consultation_licence_num_fk REFERENCES Doctor(licence_num),
PatientID NUMBER(6) CONSTRAINT consultation_PatientID_fk REFERENCES Patient(PatientID)
);

CREATE TABLE Bill (
bill_num NUMBER(6) CONSTRAINT bill_bill_num_pk PRIMARY KEY,
b_date DATE,
amount NUMBER(10, 2),
consultation_id NUMBER(6) CONSTRAINT bill_consultation_id_fk REFERENCES Consultation(consultation_id),
financeID NUMBER(6) CONSTRAINT bill_financeID_fk REFERENCES Finance(financeID)
);

CREATE TABLE Facility (
FacId NUMBER(6) CONSTRAINT facility_FacId_pk PRIMARY KEY,
name VARCHAR2(20)
);

CREATE TABLE Rooms (
RoomID NUMBER(3) CONSTRAINT rooms_RoomID_pk PRIMARY KEY,
capacity NUMBER(2),
nursing_license NUMBER(6) CONSTRAINT rooms_nursing_license_fk REFERENCES Nurse(nursing_license),
FacId NUMBER(6) CONSTRAINT rooms_FacId_fk REFERENCES Facility(FacId)
);

INSERT INTO Employee VALUES (1, 'Bamlak', 'Lemma', 50000, 'popart', 1);
INSERT INTO Employee VALUES (2, 'Angel', 'Ibeshi', 60000, 'kaliland', 1);
INSERT INTO Employee VALUES (3, 'Olivia', 'Andrew', 60000, 'kaliland', 1);
INSERT INTO Employee VALUES (4, 'Abigail', 'Adam', 60001, 'kaliland', 1);
INSERT INTO Employee VALUES (5, 'Mary', 'John', 600002, 'kaliland', 1);
INSERT INTO Employee VALUES (6, 'Ashley', 'Dawn', 600002, 'kaliland', 1);
INSERT INTO Employee VALUES (7, 'Avery', 'Ben', 600002, 'kaliland', 1);
INSERT INTO Employee VALUES (8, 'Ama', 'Ben', 600002, 'kaliland', 1);
INSERT INTO Employee VALUES (9, 'Aly', 'Ben', 600002, 'kaliland', 1);
INSERT INTO Employee VALUES (10, 'Ava', 'Ben', 600002, 'kaliland', 1);
INSERT INTO Employee VALUES (11, 'Alex', 'Ben', 600002, 'kaliland', 1);
INSERT INTO Employee VALUES (12, 'Anna', 'Ben', 600002, 'kaliland', 1);
INSERT INTO Employee VALUES (13, 'Audry', 'Ben', 600002, 'kaliland', 1);
INSERT INTO Employee VALUES (14, 'Caty', 'Ben', 600002, 'kaliland', 1);
INSERT INTO Employee VALUES (15, 'Conno', 'Ben', 600002, 'kaliland', 1);
INSERT INTO Employee VALUES (16, 'Celine', 'Ben', 600002, 'kaliland', 1);
INSERT INTO Employee VALUES (17, 'Coco', 'Ben', 600002, 'kaliland', 1);
INSERT INTO Employee VALUES (18, 'Cathren', 'Ben', 600002, 'kaliland', 1);


INSERT INTO Employee_phone VALUES (1, '095338719278', 'Mobile');
INSERT INTO Employee_phone VALUES (2, '095338719279', 'Home');
INSERT INTO Employee_phone VALUES (3, '095338719211', 'Home');
INSERT INTO Employee_phone VALUES (4, '095338719222', 'Home');
INSERT INTO Employee_phone VALUES (5, '095338719233', 'Home');
INSERT INTO Employee_phone VALUES (6, '095338719333', 'Home');
INSERT INTO Employee_phone VALUES (7, '095338329233', 'Home');
INSERT INTO Employee_phone VALUES (8, '095337729233', 'Home');
INSERT INTO Employee_phone VALUES (9, '095337779233', 'Home');
INSERT INTO Employee_phone VALUES (10, '095337119233', 'Home');
INSERT INTO Employee_phone VALUES (11, '09533778233', 'Home');
INSERT INTO Employee_phone VALUES (12, '095337714233', 'Home');
INSERT INTO Employee_phone VALUES (13, '095337714233', 'Home');
INSERT INTO Employee_phone VALUES (14, '095337777231', 'Home');
INSERT INTO Employee_phone VALUES (15, '095335414233', 'Home');
INSERT INTO Employee_phone VALUES (16, '095337778933', 'Home');
INSERT INTO Employee_phone VALUES (17, '095337874233', 'Home');
INSERT INTO Employee_phone VALUES (18, '095338989278', 'Home');

INSERT INTO Doctor VALUES (101, 1, 'Dr. Bamlak', 'Lemma', 32000, 'popart', '095338719278', 'Cardiology');
INSERT INTO Doctor VALUES (102, 2, 'Dr. Angel', 'Ibeshi', 32000, 'popart', '095338719279', 'Cardiology');
INSERT INTO Doctor VALUES (103, 3, 'Dr. Olivia', 'Andrew', 32000, 'popart', '095338719211', 'Cardiology');
INSERT INTO Doctor VALUES (104, 4, 'Abigail', 'Adam', 32000, 'popart', '095338719222', 'Cardiology');
INSERT INTO Doctor VALUES (105, 5, 'Mary', 'John', 32000, 'popart', '095338719233', 'Cardiology');

INSERT INTO Nurse VALUES (201, 7, 'Avery', 'Ben', 51000, 'kaliland', '095338329233');
INSERT INTO Nurse VALUES (202, 8, 'Ama', 'Polw', 51000, 'kaliland', '095337729233');
INSERT INTO Nurse VALUES (203, 9, 'Aly', 'Ben', 51000, 'kaliland', '095337779233');
INSERT INTO Nurse VALUES (204, 10, 'Ava', 'Ben', 51000, 'kaliland', '095337119233');
INSERT INTO Nurse VALUES (205, 11, 'Alex', 'Ben', 51000, 'kaliland', '09533778233');
INSERT INTO Nurse VALUES (206, 12, 'Anna', 'Ben', 51000, 'kaliland', '095337714233');

INSERT INTO Receptionist VALUES (301, 13, 'Audry', 'Ben', 45000, '095337714233', 'Day Shift');
INSERT INTO Receptionist VALUES (302, 14, 'Caty', 'Ben', 45000, '095337777231', 'Day Shift');
INSERT INTO Receptionist VALUES (303, 15, 'Conno', 'Ben', 45000, '095335414233', 'Day Shift');
INSERT INTO Receptionist VALUES (304, 16, 'Celine', 'Ben', 45000, '095337778933', 'Day Shift');
INSERT INTO Receptionist VALUES (305, 17, 'Coco', 'Ben', 45000, '095337874233', 'Day Shift');
INSERT INTO Receptionist VALUES (306, 18, 'Cathren', 'Ben', 45000, '095338989278', 'Day Shift');

INSERT INTO Finance VALUES (321, 'Hospital Finance');
INSERT INTO Finance VALUES (322, 'Inventory Finance');
INSERT INTO Finance VALUES (323, 'Admin Finance');
INSERT INTO Finance VALUES (324, 'Management Finance');
INSERT INTO Finance VALUES (325, 'Employee Finance');
INSERT INTO Finance VALUES (326, 'Patient Finance');


INSERT INTO Inventory VALUES (214, 'EMU Suppliers', 100, 321);
INSERT INTO Inventory VALUES (215, 'CIU Suppliers', 100, 322);
INSERT INTO Inventory VALUES (216, 'GIU Suppliers', 100, 323);
INSERT INTO Inventory VALUES (217, 'LEU Suppliers', 100, 324);
INSERT INTO Inventory VALUES (218, 'MEU Suppliers', 100, 325);
INSERT INTO Inventory VALUES (219, 'REU Suppliers', 100, 326);

INSERT INTO Patient VALUES (1, 'Hanna Kuzniatsova', TO_DATE('1990-05-15', 'YYYY-MM-DD'), '095333739270');
INSERT INTO Patient VALUES (2, 'Emily White', TO_DATE('1985-08-22', 'YYYY-MM-DD'), '095333739271');
INSERT INTO Patient VALUES (3, 'Emily Black', TO_DATE('1985-08-22', 'YYYY-MM-DD'), '095333739272');
INSERT INTO Patient VALUES (4, 'Yellow White', TO_DATE('1985-08-22', 'YYYY-MM-DD'), '095333739273');
INSERT INTO Patient VALUES (5, 'Pink White', TO_DATE('1985-08-22', 'YYYY-MM-DD'), '095333739274');
INSERT INTO Patient VALUES (6, 'Green White', TO_DATE('1985-08-22', 'YYYY-MM-DD'), '095333739275');

INSERT INTO Consultation VALUES (101, TO_DATE('2023-01-10', 'YYYY-MM-DD'), 'Checkup', 101, 1);
INSERT INTO Consultation VALUES (302, TO_DATE('2023-01-10', 'YYYY-MM-DD'), 'Checkup', 102, 2);
INSERT INTO Consultation VALUES (303, TO_DATE('2023-01-10', 'YYYY-MM-DD'), 'Checkup', 103, 3);
INSERT INTO Consultation VALUES (304, TO_DATE('2023-01-10', 'YYYY-MM-DD'), 'Checkup', 104, 4);
INSERT INTO Consultation VALUES (305, TO_DATE('2023-01-10', 'YYYY-MM-DD'), 'Checkup', 105, 5);

INSERT INTO Bill VALUES (1, TO_DATE('2023-01-15', 'YYYY-MM-DD'), 150.00, 101, 321);
INSERT INTO Bill VALUES (2, TO_DATE('2023-01-15', 'YYYY-MM-DD'), 150.00, 101, 322);
INSERT INTO Bill VALUES (3, TO_DATE('2023-01-15', 'YYYY-MM-DD'), 150.00, 101, 323);
INSERT INTO Bill VALUES (4, TO_DATE('2023-01-15', 'YYYY-MM-DD'), 150.00, 101, 324);
INSERT INTO Bill VALUES (5, TO_DATE('2023-01-15', 'YYYY-MM-DD'), 150.00, 101, 325);
INSERT INTO Bill VALUES (6, TO_DATE('2023-01-15', 'YYYY-MM-DD'), 150.00, 101, 326);


INSERT INTO Facility VALUES (221, 'Emergency Center');
INSERT INTO Facility VALUES (222, 'ICU Center');
INSERT INTO Facility VALUES (223, 'Labour Center');
INSERT INTO Facility VALUES (224, 'Children Center');
INSERT INTO Facility VALUES (225, 'Cardiovascular Cente');
INSERT INTO Facility VALUES (226, 'Physiotherapy Center');


INSERT INTO Rooms VALUES (100, 10, 201, 221);
INSERT INTO Rooms VALUES (101, 8, 202, 222);
INSERT INTO Rooms VALUES (102, 8, 203, 223);
INSERT INTO Rooms VALUES (103, 8, 204, 224);
INSERT INTO Rooms VALUES (104, 8, 205, 225);
INSERT INTO Rooms VALUES (105, 8, 206, 226);

UPDATE Employee
SET salary = 70000
WHERE empID = 1;

UPDATE Doctor
SET salary = 90000
WHERE licence_num = 101;

UPDATE Nurse
SET address = 'Lefkosia'
WHERE nursing_license = 201;

UPDATE Receptionist
SET shift = 'Evening'
WHERE receptionist_id = 301;

UPDATE Finance
SET name = 'Inventory Finance'
WHERE financeID = 321;

UPDATE Inventory
SET quantity = 20
WHERE ItemID = 214;

UPDATE Patient
SET phone_number = '095338719222'
WHERE PatientID = 1;

UPDATE Consultation
SET reason = 'Headache'
WHERE consultation_id = 101;

UPDATE Bill
SET amount = 200.00
WHERE bill_num = 1;

UPDATE Facility
SET name = 'ICU'
WHERE FacId = 221;

UPDATE Rooms
SET capacity = 15
WHERE RoomID = 101;

ALTER TABLE Employee
MODIFY salary NUMBER(6) CONSTRAINT Employee_salary_nn NOT NULL;

ALTER TABLE Nurse
DROP COLUMN address;

ALTER TABLE Employee
DROP CONSTRAINT Employee_salary_nn;

ALTER TABLE Nurse
ADD CONSTRAINT Nurse_phoneNum_unique UNIQUE (phoneNum);

ALTER TABLE Doctor
MODIFY specialization VARCHAR2(30);

ALTER TABLE Employee
DISABLE CONSTRAINT employee_lname_nn;

ALTER TABLE Nurse
DROP PRIMARY KEY CASCADE;

ALTER TABLE Consultation
     DROP CONSTRAINT consultation_PatientID_fk;

     DELETE FROM Patient
     WHERE PatientID=3;

ALTER TABLE Employee
     DROP primary key cascade;
     DELETE FROM Employee
     WHERE empID= (select empID from Employee where fname ='Ashley');

DELETE FROM Receptionist;

DROP TABLE Receptionist CASCADE CONSTRAINTS;
DROP TABLE Finance CASCADE CONSTRAINTS;
DROP TABLE Inventory CASCADE CONSTRAINTS;
DROP TABLE Patient CASCADE CONSTRAINTS;
DROP TABLE Consultation CASCADE CONSTRAINTS;
DROP TABLE Bill CASCADE CONSTRAINTS;
DROP TABLE Facility CASCADE CONSTRAINTS;
DROP TABLE Rooms CASCADE CONSTRAINTS;
DROP TABLE Nurse CASCADE CONSTRAINTS;
DROP TABLE Doctor CASCADE CONSTRAINTS;
DROP TABLE Employee_phone CASCADE CONSTRAINTS;
DROP TABLE Employee CASCADE CONSTRAINTS;
