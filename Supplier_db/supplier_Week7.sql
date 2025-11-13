create database supplier_db;
use supplier_db;

create table supplier(
sid int not null primary key,
sname varchar(30),
city varchar(30));

create table parts(
pid int not null primary key,
pname varchar(30),
color varchar(20));

create table catalog(
sid int,
pid int,
cost int,
primary key(pid,sid),
foreign key(pid) references parts(pid),
foreign key(sid) references supplier(sid));

insert into supplier values
(10001,'Acme Widget','Bangalore'),
(10002,'Johns','Kolkatha'),
(10003,'Vimal','Mumbai'),
(10004,'Reliance','Delhi'),
(10005,'Alex','Chennai');

insert into parts values
(20001,'Book','Red'),
(20002,'Pen','Red'),
(20003,'Pencil','Green'),
(20004,'Mobile','Green'),
(20005,'Charger','Black');

insert into catalog values
(10001,20001,10),
(10001,20002,10),
(10001,20003,30),
(10001,20004,10),
(10001,20005,10),
(10002,20001,10),
(10002,20002,20),
(10003,20003,30),
(10004,20003,40);

select distinct(p.pname) from parts p join catalog c on p.pid=c.pid;

select s.sname from supplier s join catalog c on s.sid=c.sid group by s.sname having count(distinct pid)=(select count(*) from parts);

select s.sname from supplier s join catalog c on s.sid=c.sid group by s.sname having count(distinct pid)>=(select count(*) from parts where color='Red');

select p.pname from parts p where p.pid not in (select c1.pid from catalog c1 join supplier s1 on c1.sid=s1.sid where s1.sname <> 'Acme Widget');

select distinct(s.sid) from supplier s join catalog c on c.sid=s.sid where c.cost>(select avg(c1.cost) from catalog c1 group by c1.pid having c1.pid=c.pid);

select c.pid, s.sname from catalog c join supplier s on c.sid=s.sid where c.cost = (select max(c1.cost) from catalog c1 where c1.pid=c.pid);