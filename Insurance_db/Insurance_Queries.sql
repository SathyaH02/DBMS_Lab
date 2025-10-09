-- Week 1

update participated set damage_amt=25000 where reg_num='KA053408' and report_num=12;
select * from participated;

insert into accident values(16,'2008-03-15','Domlur');

select acc_date,location from accident;

select driver_id from participated where  damage_amt >= 25000;

-- Week 2

select * from car order by reg_year asc;

select count(distinct driver_id) as count from participated p, car c where c.reg_num=p.reg_num and model='Lancer';

select count(distinct driver_id) as count from participated p, accident a where p.report_num=a.report_num and acc_date like "2008%";

select * from participated order by damage_amt desc;

select avg(damage_amt) as avg_damageAmt  from participated;

select driver_name from person p, participated t where p.driver_id=t.driver_id and damage_amt > (select avg(damage_amt) from participated);

select max(damage_amt) as max_damageAmt from participated;

set sql_safe_updates=0;
delete from participated where damage_amt < (select avg_val from (select avg(damage_amt) as avg_val from participated) as temp);
select * from participated;