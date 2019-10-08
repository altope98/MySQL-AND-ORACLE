create database refresher;
use refresher;

create table empinfo(
	first varchar(20),
    last varchar(20),
    id int,
    age int,
    city varchar(20),
    state varchar(20)
    );

insert into empinfo values
('John','Jones',99980,45,'Payson','Arizona'),
('Mary','Jones',99982,25,'Payson','Arizona'),
('Eric','Edwards',88232,32,'San Diego','California'),
('Mary Ann','Edwards',88233,32,'Phoenix','Arizona'),
('Ginger','Howell',98002,42,'Cottonwood','Arizona'),
('Sebastian','Smith',92001,23,'Gila Bend','Arizona'),
('Gus','Gray',22322,35,'Bagdad','Arizona'),
('Mary Ann','May',32327,52,'Tucson','Arizona'),
('Erica','Williams',32327,60,'Show Low','Arizona'),
('Leroy','Brown',32380,22,'Pinetop','Arizona'),
('Elroy','Cleaver',32382,22,'Globe','Arizona');

#Ejemplos
select first, last, city from empinfo;
select last, city, age from empinfo where age > 30;
select first, last, city, state from empinfo where first LIKE 'J%';
select * from empinfo;
select first, last, from empinfo where last LIKE '%s';
select first, last, age from empinfo where last LIKE '%illia%';
select * from empinfo where first = 'Eric';

#1
select first,age from empinfo;
#2
select first,last,city from empinfo where city not like'Payson';
#3
select * from empinfo where age>40;
#4
select first, last from empinfo where last like'%ay%';
#5
select * from empinfo where first='Mary';
#6
select * from empinfo where first like '%Mary%';
