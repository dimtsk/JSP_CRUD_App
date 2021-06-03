create database studentTable;

use studentTable;

create table records(
id int not null auto_increment,
stname varchar(40),
course varchar(40),
fee int,
primary key(id)
);

select * from records;
