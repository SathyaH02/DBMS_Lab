create database Bank_db;
use Bank_db;

create table branch (
branch_name varchar(30) not null primary key,
branch_city varchar(30),
assets real);

create table bankAccount (
acc_no int,
branch_name varchar(30),
balance real,
primary key (acc_no),
foreign key(branch_name) references branch(branch_name));

create table bankCustomer (
customer_name varchar(40) not null primary key,
customer_street varchar(40),
customer_city varchar(40));

create table depositor (
customer_name varchar(40),
acc_no int,
primary key(customer_name,acc_no),
foreign key(acc_no) references bankAccount(acc_no),
foreign key(customer_name) references bankCustomer(customer_name));

create table loan (
loan_number int,
branch_name varchar(30),
amount real,
primary key (loan_number),
foreign key (branch_name) references branch(branch_name));

insert into branch values 
('SBI_Chamrajpet','Bangalore',50000),
('SBI_ResidencyRoad','Bangalore',10000),
('SBI_ShivajiRoad','Bombay',20000),
('SBI_ParliamentRoad','Delhi',10000),
('SBI_Jantarmantar','Delhi',20000);

insert into bankAccount values 
(1,'SBI_Chamrajpet',2000),
(2,'SBI_ResidencyRoad',5000),
(3,'SBI_ShivajiRoad',6000),
(4,'SBI_ParliamentRoad',9000),
(5,'SBI_Jantarmantar',8000),
(6,'SBI_ShivajiRoad',4000),
(8,'SBI_ResidencyRoad',4000),
(9,'SBI_ParliamentRoad',3000),
(10,'SBI_ResidencyRoad',5000),
(11,'SBI_Jantarmantar',2000);

insert into bankCustomer values
('Avinash','BullTemple_Road','Bangalore'),
('Dinesh','Bannerghatta_Road','Bangalore'),
('Mohan','NationalCollege_Road','Bangalore'),
('Nikil','Akbar_Road','Delhi'),
('Ravi','Prithviraj_Road','Delhi');

insert into depositor values
('Avinash',1),
('DInesh',2),
('Nikil',4),
('Ravi',5),
('Avinash',8),
('Nikil',9),
('Dinesh',10),
('Nikil',11);

insert into loan values
(1,'SBI_Chamrajpet',1000),
(2,'SBI_ResidencyRoad',2000),
(3,'SBI_ShivajiRoad',3000),
(4,'SBI_ParliamentRoad',4000),
(5,'SBI_Jantarmantar',5000);