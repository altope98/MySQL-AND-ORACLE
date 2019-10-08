create database empleado;
drop database empleado;
use empleado;
drop table dept;
drop table emp;

create table dept(
deptno int,
dname varchar(15),
loc varchar (15),
primary key (deptno));

create table emp (
empno int,
ename varchar (20),
job varchar (15),
mgr int,
hiredate date,
sal int,
comm varchar (15),
deptno int,
primary key (empno), 
foreign key (mgr) references emp(empno),
foreign key (deptno) references dept(deptno));

create table pro (
prono int,
pname varchar (15),
loc varchar (15),
deptno int,
primary key (prono),
foreign key (deptno) references dept (deptno));

create table emppro (
empno int,
prono int,
hours int,
primary key (empno, prono),
foreign key (empno) references emp (empno),
foreign key (prono) references pro (prono));

show tables;

describe emp;

select *from dept;
select *from emp;
select *from pro;