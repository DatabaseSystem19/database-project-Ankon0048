--dropping all tables

drop table user_history;
drop table admin;
drop table transactions;
drop table items;
drop table users;

--table creations

create table users(
user_id varchar(50) not null,
name varchar(50) not null,
gender varchar(50) not null,
email varchar(50) not null,
phone varchar(50) not null,
password varchar(50) not null,
primary key(user_id));

create table items(
item_no number(10,7) not null,
title varchar(50) not null,
category varchar(50) not null,
publisher varchar(50),
year_of_publication Date not null,
floor number(10,7) not null,
shelf_no number(10,7) not null,
primary key(item_no));

create table transactions(
transaction_id number(10,7) not null,
user_id varchar(50) not null,
item_no number(10,7) not null,
burrow_date Date not null,
return_date Date not null,
fine number(10,7),
primary key(transaction_id),
foreign key(user_id) references users(user_id),
foreign key(item_no) references items(item_no),
check (burrow_date < return_date)
);


create table admin(
admin_id varchar(50) not null,
user_id varchar(50) not null,
role varchar(50) not null,
transaction_id number(10,7) unique not null,
foreign key(user_id) references users(user_id),
foreign key (transaction_id) references transactions(transaction_id)
on delete cascade
);

create table user_history(
user_id varchar(50) not null,
item_no number(10,7) not null,
burrow_date Date not null,
return_date Date not null,
fine number(10,7) not null,
prev_loaned_item number(10,7),
prev_fine_payed number(10,7),
foreign key(user_id) references users(user_id),
foreign key(item_no) references items(item_no),
check (burrow_date<return_date));

--describing tables

desc users;
desc items;
desc admin;
desc transactions;
desc user_history;

--showing existing tables

select table_name from user_tables;