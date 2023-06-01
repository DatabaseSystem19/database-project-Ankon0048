--initial table datas
select table_name from user_tables;
select * from users;
select * from items;
select * from transactions;
select * from admin;
select * from user_history;

--DDL query for columns in user table(alter)
alter table users add address varchar(50);
alter table users modify address varchar(40);
alter table users rename column address to perma_address;
alter table users drop column perma_address;

--DML for users table(insert,delete and update)
insert into users values('tahim1','tahim','male','tahim@gmail.com','01793425049','tahimpass');
update users set gender='female' where user_id='tahim1';
delete from users where user_id='tahim1'; --delete row

--some select queries
select * from items order by title;
select * from user_history where fine=0;
select user_id,role from admin where user_id=(select user_id from transactions where item_no=3);

--union and inersect queires
select name from users union select user_id from admin;
select category from items where title like 'O%' intersect select category from items where title like '%o';

--group by with having query
select user_id, count(*) as transaction_count from transactions group by user_id having count(*) > 2;

--with query
with user_summary as (
  select user_id, count(*) as total_transactions, sum(fine) as total_fine
  from transactions
  group by user_id
)
select users.name, user_summary.total_transactions, user_summary.total_fine from users
join user_summary on users.user_id = user_summary.user_id;

--string operations queries
select * from users where name like 's%';
select * from items where title like '%game%';
select * from items where length(title) > 5;
select * from items where category like'g%';
select * from items where title like '____';

--a query on view
create view user_transactions as
select u.user_id, u.name, t.transaction_id, t.burrow_date, t.return_date
from users u
join transactions t on u.user_id = t.user_id;
select * from user_transactions;
drop view user_transactions;

--query on set memberships
select * from items where category = 'book' and floor=4;
select * from items where category = 'book' or floor=2;
select *
from transactions
where fine > some (
  select fine
  from transactions
  where return_date >= to_date('01-JAN-25')
);

--all query
select *
from transactions
where fine > all (
  select fine
  from transactions
  where return_date >= to_date('01-JAN-25')
);

--exists query
select *
from users
where exists (
  select *
  from transactions
  where users.user_id = transactions.user_id
    and transactions.fine > 0
);

--aggregate function on tables;
select count(*) from users;
select count(user_id) as number_of_users_rented from user_history;
select count(distinct user_id) as number_of_users_rented from user_history;
select avg(fine) from user_history group by user_id;
select sum(fine) from user_history;
select min(fine) from user_history;
select max(fine) from user_history;

--join operations;
select * from transactions where user_id in (select user_id from user_history where fine>0);
select user_id,transaction_id from transactions natural join user_history where item_no>5;
select user_id,transaction_id from transactions join users using(user_id);
select user_id,transaction_id from transactions left outer join users using(user_id);
select user_id,transaction_id from transactions right outer join users using(user_id);
select user_id,transaction_id from transactions full outer join users using(user_id);
