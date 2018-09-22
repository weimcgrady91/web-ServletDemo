create database databaseWeb;
use databaseWeb;
create table tb_person(
 id integer auto_increment ,
 name varchar(45) ,
 english_name varchar(45) ,
 age integer unsigned ,
 sex varchar(45) ,
 birthday date ,
 description text ,
 create_time timestamp default current_timestamp() ,
 primary key (id)
);



insert into tb_person (name,english_name,age,sex,birthday,description) values('刘精华','helloweenvsfei','25','男','1982-08-09','无备注');
insert into tb_person (name,english_name,age,sex,birthday,description) values('科特柯本','Kurt Cobain','27','男','1967-02-20','Nirvana');
insert into tb_person (name,english_name,age,sex,birthday,description) values('李四','Faye','31','女','1969-08-08','狮子座');
insert into tb_person (name,english_name,age,sex,birthday,description) values('张三','Foo Bar','18','女','2008-08-08','');

insert into tb_person (name,english_name,age,sex,birthday,description) values('张三','Foo Bar','18','女','2008-08-08','');


create table tb_department(
	id int auto_increment,
    name varchar(255),
    primary key(id)
);

create table tb_employee(
	id int auto_increment,
    department_id int,
    name varchar(255),
    sex varchar(255),
    employed_date date,
    primary key(id)
);