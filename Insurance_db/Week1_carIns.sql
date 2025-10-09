use car_insurance;
create table Person(
driver_id varchar(3) primary key,
driver_name varchar(30),
address varchar(40)
);
insert into person values
('A01','Richard','Srinivas Nagar'),
('A02','Pradeep','Rajaji Nagar'),
('A03','Smith','Ashok Nagar'),
('A04','Venu','NR Colony'),
('A05','John','Hanumanth Nagar');

create table Car(
reg_num varchar(8) primary key,
model varchar(30),
reg_year int
);
insert into Car values
('KA052250','Indica',1990),
('KA031181','Lancer',1957),
('KA095477','Toyota',1998),
('KA053408','Honda',2008),
('KA041702', 'Audi', 2005);

create table Accident(
report_num int primary key,
acc_date date,
location varchar(30)
);
insert into Accident values
(11, '2003-01-01', 'Mysore Road'),
(12, '2004-02-02', 'South end Circle'),
(13, '2003-01-21', 'Bull temple Road'),
(14, '2008-02-17','Mysore Road'),
(15, '2005-03-04', 'Kanakpura Road');

create table Owns(
driver_id varchar(3),
reg_num varchar(8),
primary key(driver_id,reg_num),
foreign key(driver_id) references Person(driver_id),
foreign key(reg_num) references Car(reg_num)
);
insert into Owns values
('A01','KA052250'),
('A02','KA053408'),
('A03','KA031181'),
('A04','KA095477'),
('A05','KA041702');

create table Participated(
driver_id varchar(3),
reg_num varchar(8),
report_num int,
damage_amt int,
primary key(driver_id,reg_num,report_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num),
foreign key(report_num) references accident(report_num)
);
insert into participated values
('A01', 'KA052250', 11,	10000),
('A02', 'KA053408', 12,	50000),
('A03','KA095477', 13, 25000),
('A04',	'KA031181',	14,	3000),
('A05',	'KA041702',	15, 5000);

desc participated;