use bank_db;

select branch_name,assets as assets_in_lakhs from branch;

select d.customer_name from depositor d join bankAccount b on d.acc_no=b.acc_no group by d.customer_name having count(*) >= 2;

create view loan_sum as select branch_name, sum(amount) as total_loan from loan group by branch_name ;
select * from loan_sum;
