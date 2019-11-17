CREATE DATABASE IF NOT EXISTS HOSPITAL;

USE HOSPITAL;

CREATE TABLE IF NOT exists Ward
(
	wardID int auto_increment,
    wardName varchar(20),
    wardType ENUM ('emergency', 'intensive care', 'standard'),
    primary key (WardID)
);

insert into ward (wardName, wardType)
values
('Ward 1','Emergency'),
('Ward 2', 'Intensive care'),
('Ward 3', 'Standard');

select * from ward;

create table if not exists Patient
(
	patientID int auto_increment,
    fName varchar(20),
    lName varchar(20),
    street varchar(20),
    town varchar(20),
    county varchar(20),
    contactNo int(8),
    arriveDate date, 
    dischargeDate date default null, 
    primary key (patientID)
);

INSERT into patient (fName, lName, street, town, county, contactNo, arriveDate, dischargeDate)
Values
('James','Malone','21 Main Street','Tramore','Waterford','0879127175','2017-09-04','2018-08-06'),
('Marie','Ryan','Kylerue','New Ross','Wexford','0832699374','2019-01-08','2018-10-16'),
('Philip','Walsh','Boherdrad','Cashel','Tipperary','0863118014','2017-08-14','2017-06-09'),
('James','Ryan','Tinniscully','The Rower','Kilkenny','0854103609','2018-09-14','2018-08-30'),
('Rose','Davis','15 Main Street','New Ross','Wexford','0858925164','2019-01-24','2017-09-06'),
('Kevin','Roche','Rathinure','Glenmore','Kilkenny','0860361652','2018-03-14','2017-09-19'),
('Orla','Ryan','5 Rose Lawn','Grace Dieu','Waterford','0846602415','2017-06-16','2019-03-30'),
('Cathy','Brown','Kill and Mill','Cashel','Tipperary','0875317305','2017-07-01','2019-01-17'),
('James','Smith','123 Riverwalk','Thomastown','Kilkenny','0838041473','2019-04-07','2019-04-07'),
('Claire','Kelly','11 Church Road','Cashel','Tipperary','0879134179','2019-03-30','2017-02-03'),
('Mairead','Walsh','5 The Drive','Tramore','Waterford','0842757389','2018-04-23','2017-11-16');

update patient
set dischargeDate = '201-04-26'
where patientid =11;

INSERT into patient (fName, lName, street, town, county, contactNo, arriveDate)
Values
('Anne','Ryan','14 Fishermans Grove','Dunmore East','Waterford','0866988046','2018-02-20'),
('Eoin','Delaney','Lower South Street','New Ross','Wexford','0836654207','2019-08-06'),
('Cathal','Mooney','1 School House Road','New Ross','Wexford','0870081464','2017-12-26'),
('Niall','Flynn','The Quay','Thomastown','Kilkenny','0838959025','2018-05-09'),
('Tom','Smith','Upper Rosemount','Inistioge','Kilkenny','0849997207','2019-08-24'),
('Martin','Roche','Belview','Slieverue','Kilkenny','0870243236','2018-09-26'),
('Molly','Doyle','13 The Village','Clonroche','Wexford','0855484270','2018-01-24'),
('Anne','Brown','28 Main Street','Tramore','Waterford','0872123066','2017-10-30'),
('Sam','Brown','Tintine','The Rower','Kilkenny','0866490864','2019-06-27'),
('Steven','Ryan','25 Upper Street','Clonmel','Tipperary','0870420746','2018-03-20'),
('Paul','Doyle','The Mews','Sycamores','Kilkenny','0836982514','2019-05-26'),
('Phil','Smith','Rose Inn','Dungarvan','Waterford','08
60346138','2017-07-12');

select * from patient;

create table if not exists Bed
(
	bedNumber int auto_increment,
    bedType ENUM ('emergency', 'intensive care', 'standard'),
    wardID int,
    patientID int,
    primary key (bedNumber),
    constraint FK_ward foreign key (wardID)
    references ward(wardID)
    on update cascade on delete set null,
    constraint FK_patient_bed foreign key(patientID)
    references patient(patientID)
    on update cascade on delete set NULL
);

insert into bed (bedType, wardID, patientId)
values
('emergency', '1','12'),
('intensive care', '2','13'),
('standard', '3','14'),
('emergency', '1','15'),
('intensive care', '2','16'),
('standard', '3','17'),
('emergency', '1','18'),
('intensive care', '2','19'),
('standard', '3','20'),
('emergency', '1','21'),
('intensive care', '2','22'),
('standard', '3','23');

select * from bed;
    
create table if not exists Doctor
(
	PPS int(6),
    fName varchar(20),
    lName varchar(20),
    street varchar(20),
    town varchar(20),
    county varchar(20),
    contactNo int(8),
    hireDate DATE,
    specialisation varchar(20),
    primary key (PPS)
);

insert into doctor 
values
('160728','Orla','Smith','1 School House Road','Inistioge','Kilkenny','0863742892','2017-12-26','Cardiac'),
('287588','Rose','Brown','11 Church Road','The Rower','Kilkenny','0872771104','2017-08-01','Oncology'),
('513805','Cathy','Ryan','123 Riverwalk','The Rower','Kilkenny','0869536231','2017-01-03','Pediatrics'),
('235156','Niall','Flynn','13 The Village','Thomastown','Kilkenny','0872072455','2017-09-11','Neurology'),
('177259','Steven','Doyle','14 Fishermans Grove','Sycamores','Kilkenny','0877526934','2017-11-04','Pathology'),
('453904','Tom','Smith','15 Main Street','Dungarvan','Waterford','0879429423','2017-09-13','Surgery'),
('626177','Eoin','Roche','21 Main Street','Glenmore','Kilkenny','0874529346','2017-04-16','Emergency'),
('567443','Martin','Delaney','25 Upper Street','New Ross','Wexford','0873611217','2017-04-04','Radiology'),
('308458','Anne','Ryan','28 Main Street','New Ross','Wexford','0871563537','2017-07-02','ANESTHESIOLOGY');

select * from doctor;


create table if not exists Drug
(
	drugID int auto_increment,
    drugName varchar(20),
    manufacturer varchar(20),
    primary key (drugID)
);

insert into drug (drugName, manufacturer)
Values
('Amoxicillin','Bayer'),
('Flucloxacillin','Eli Lilly'),
('Meropenem','Gilead'),
('Vancomycin','Amgen'),
('Gentamycin','Steven'),
('Clarithromycin','GSK'),
('Co-amoxiclav','Novartis'),
('Doxycycline','Pfizer'),
('Ceftazidime','Roche'),
('Piperacillin','Johnson & Johnson'),
('Ciprofloxacin','Sanofi'),
('Levofloxacin','Abbvie');

select * from drug;


create table if not exists Visit
(
	visitID int auto_increment,
    patientID int,
    PPS int, 
    date date, 
    time time,
    primary key (visitID),
    constraint FK_patient foreign key(patientID)
    references patient(patientID)
    on update cascade on delete set null,
    constraint FK_DOC foreign key(PPS)
    references doctor(PPS)
    on update cascade on delete set null
);

insert into visit (patientId, pps, date, time)  
values
('1','626177','2017-09-04','09:00:00'),
('2','567443','2019-01-08','09:30:00'),
('3','513805','2017-08-14','10:00:00'),
('4','453904','2018-09-14','10:30:00'),
('5','308458','2019-01-24','11:00:00'),
('6','287588','2018-03-14','11:30:00'),
('7','235156','2017-06-16','12:00:00'),
('8','177259','2017-07-01','12:30:00'),
('9','160728','2019-04-07','13:00:00'),
('10','626177','2019-03-30','13:30:00'),
('11','567443','2018-04-23','14:00:00'),
('12','513805','2018-02-20','14:30:00'),
('13','453904','2019-08-06','15:00:00'),
('14','308458','2017-12-26','15:30:00'),
('15','287588','2018-05-09','16:00:00'),
('16','235156','2019-08-24','16:30:00'),
('17','177259','2018-09-26','17:00:00'),
('18','160728','2018-01-24','17:30:00'),
('19','308458','2017-10-30','18:00:00'),
('20','287588','2019-06-27','18:30:00'),
('21','235156','2018-03-20','19:00:00'),
('22','177259','2019-05-26','19:30:00'),
('23','177259','2017-07-12','20:00:00'),
('1','626177','2017-09-05','20:00:00'),
('2','567443','2019-01-09','19:30:00'),
('3','513805','2017-08-15','19:00:00'),
('4','453904','2018-09-15','18:30:00'),
('5','308458','2019-01-25','18:00:00'),
('6','287588','2018-03-15','17:30:00'),
('7','235156','2017-06-17','17:00:00'),
('8','177259','2017-07-02','16:30:00'),
('9','160728','2019-04-08','16:00:00'),
('10','626177','2019-03-31','15:30:00'),
('11','567443','2018-04-24','15:00:00'),
('12','513805','2018-02-21','14:30:00'),
('13','453904','2019-08-07','14:00:00'),
('14','308458','2017-12-27','13:30:00'),
('15','287588','2018-05-10','13:00:00'),
('16','235156','2019-08-25','12:30:00'),
('17','177259','2018-09-27','12:00:00'),
('18','160728','2018-01-25','11:30:00'),
('19','308458','2017-10-31','11:00:00'),
('20','287588','2019-06-28','10:30:00'),
('21','235156','2018-03-21','10:00:00'),
('22','177259','2019-05-27','09:30:00'),
('23','177259','2017-07-13','09:00:00');

select * from visit;

create table if not exists Prescription
(
	visitID int, 
    drugID int, 
    doseageDetails varchar(40),
    primary key (visitID, drugID),
    constraint FK_visit foreign key(visitID)
    references visit(visitId)
    on update cascade on delete no action,-- records of the perscrition should be retained even if the data in the partent table is deleted. 
    constraint FK_drug foreign key(drugID)
    references drug(drugID)
    on update cascade on delete no action 
);

insert into Prescription
values
('2','6','One four times daily'),
('3','9','One three times daily '),
('5','12','One four times daily'),
('6','10','One two times daily '),
('9','11','One two times daily '),
('13','12','One three times daily '),
('16','7','One three times daily '),
('18','5','One four times daily'),
('20','9','One two times daily '),
('22','12','One three times daily '),
('24','12','One three times daily '),
('25','4','One two times daily '),
('26','9','One two times daily '),
('29','6','One two times daily '),
('31','12','One two times daily '),
('33','5','One three times daily '),
('41','6','One two times daily '),
('42','10','One three times daily ');

select * from prescription;



-- ***QUERIES***
 
 
 
-- count of current patients
select count(patientID) as "Current Patients"
 from patient
 Where dischargeDate is null;
 
 -- Count of discharged patients
 select count(patientID) as "Current Patients"
 from patient
 Where dischargeDate is not null;
 
 -- List of current patients ordered by name
 
 select concat(fName," ", lName) as 'Name'
 from patient 
 where dischargeDate is null
 order by fName, lName;
 
 -- List of previous patients ordered by name
 
 select concat(fName," ", lName) as 'Name'
 from patient 
 where dischargeDate is not null
 order by fName, lName; 
 
-- Patients in the Emergency Ward

select concat(fName," ", lName) as 'Name', wardName as 'Ward'
from patient join bed
on patient.patientID = bed.patientID
join ward
on bed.wardID = ward.wardID
where ward.wardID = '1';

-- Patients discharged in 2018
select concat(fName," ", lName) as 'Name', dischargeDate as 'Date Discharged'
from patient
where dischargeDate between '2018-01-01' and '2018-12-31'
order by dischargeDate;

-- Drugs & dose perscribed for current patients

select concat(fName," ", lName) as 'Name',drugName as 'Drug', doseageDetails as 'Dose'
from drug join prescription
on drug.drugID = prescription.drugID
join visit
on prescription.visitID = visit.visitID
join patient
on visit.patientID = patient.patientID
where dischargeDate is not null
order by fName, lName;
 
 -- Average days admitted per ward
 
 select distinct wardName,
 (
	select round(avg((datediff(dischargeDate,arriveDate))),2)
    from patient  
 ) as 'Average Admitted Days'
from patient join bed
on patient.patientID = bed.patientID
join ward
on bed.wardID = ward.wardID;

-- visits that resulted in a prescription 

select concat(fName, " ", lName) as 'Name', concat(date, " ", time) as 'Vist Date/time', drugName as 'Drug'
from visit left join prescription
on visit.visitID = prescription.visitID
join patient
on visit.patientID = patient.patientID
left join drug 
on prescription.drugID = drug.drugID; 

-- number of times Ceftazidime has been perscribed

select count(drugID) as 'No. times Ceftazidime used'
from prescription 
where drugID = 
(
    select drugID 
    from drug 
    where drugName = 'Ceftazidime'
);

-- Number of patients by county 

select count(patientID), county
from patient
group by county;



-- ***Index***



-- create an index of doctor specialisations

create index docSpec on doctor(specialisation);



-- ***Views***



-- Create views that shows the prescritions needed for each ward

create or replace view ward1scripts AS
	select concat(fName, " ", lName) as 'Patient Name', drugName as 'Drug', doseageDetails as 'Doesage'
    from patient join visit
    on patient.patientID = visit.patientID
    join prescription 
    on visit.visitID = prescription.visitID
    join drug
    on prescription.drugID = drug.drugID
    join bed 
    on patient.patientID = bed.patientID
    join ward 
    on bed.wardID = ward.wardID
    where ward.wardID =1;
    
select * from ward1scripts;

create or replace view ward2scripts AS
	select concat(fName, " ", lName) as 'Patient Name', drugName as 'Drug', doseageDetails as 'Doesage'
    from patient join visit
    on patient.patientID = visit.patientID
    join prescription 
    on visit.visitID = prescription.visitID
    join drug
    on prescription.drugID = drug.drugID
    join bed 
    on patient.patientID = bed.patientID
    join ward 
    on bed.wardID = ward.wardID
    where ward.wardID =2;
    
select * from ward2scripts;

create or replace view ward3scripts AS
	select concat(fName, " ", lName) as 'Patient Name', drugName as 'Drug', doseageDetails as 'Doesage'
    from patient join visit
    on patient.patientID = visit.patientID
    join prescription 
    on visit.visitID = prescription.visitID
    join drug
    on prescription.drugID = drug.drugID
    join bed 
    on patient.patientID = bed.patientID
    join ward 
    on bed.wardID = ward.wardID
    where ward.wardID =3;
    
select * from ward3scripts;



-- *** Users and Privileges***



create user Nurse identified by 'nurse';

grant select,update on bed to Nurse;
grant select on prescription to Nurse;
grant select on patient to Nurse;
grant select on visit to Nurse;

create user Doctor identified by 'doctor';

grant insert, update, select on prescription to Doctor;
grant insert, update, select on visit to Doctor;
grant select on patient to Doctor;
grant select on drug to Doctor;

create user Pharmacist identified by 'pharmacist';

grant select, update, delete, insert on drug to Pharmacist;
grant select on patient to Pharmacist;
grant select on visit to Pharmacist;
grant select on prescription to Pharmacist;

create user Administrator identified by 'administrator';

grant all on hospital.* to Administrator;



-- ***Triggers***



-- Count of times a drug is prescribed. Each time a drug is prescribed the count is incremented.  

create table if not exists prescriptionCount
(
	id int auto_increment primary key, 
    drugID int,
    count int,
    constraint FK_drugID foreign key(drugID)
    references drug(drugID)
    on update cascade on delete no action
);

-- Update the prescriptionCount table when a new drug is added

DELIMITER $$
create trigger drug_count
	after insert on drug
	for each row
BEGIN
	insert into prescriptionCount
    set 
    drugID = new.drugID,
    count = 0;
END $$
DELIMITER ;

-- Increase the count when a drug is prescribed

DELIMITER $$
create trigger drug_count_add
	after insert on prescription
    for each row
BEGIN
	update prescriptionCount
	set count = count +1
    where drugid = new.drugid;
END $$
DELIMITER ;

insert into prescription( visitID, drugID, doseageDetails)
values
('12','10','one a day'); 

insert into drug (drugName, manufacturer)
values('panadol','GSK');

select * from prescriptionCount;

commit;
 
 
    
