CREATE DATABASE IF NOT EXISTS HOSPITAL;

USE HOSPITAL;

CREATE TABLE IF NOT exists Ward
(
	wardID int auto_increment,
    wardName varchar(20),
    wardType ENUM('male', 'female'),
    primary key (WardID)
);

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

drop table patient;

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
    bedType ENUM ('emergency', 'outPatient', 'standard'),
    wardID int,
    patientID int,
    primary key (bedNumber),
    constraint FK_ward foreign key (wardID)
    references ward(wardID)
    on update cascade on delete set null,
    constraint FK_patient foreign key(patientID)
    references patient(patientID)
    on update cascade on delete set NULL
);
    
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
drop table visit;

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

drop table Prescription;


commit; 
    
    
