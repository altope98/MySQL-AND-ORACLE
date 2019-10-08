show databases;
create database Colegio;
use Colegio;

Create table Alumno(
Clave_alumno int,
Nombre varchar(20),
Edad int,
Curso_actual int,
primary key (Clave_alumno));

insert into Alumno values(1,"Juan Pérez",12,3);
insert into Alumno values(2,"Maria Gonzalez",11,2);
insert into Alumno values(3,"Jorge Lopez",13,3);
insert into Alumno values(4,"Laura Diaz",10,1);
select * from Alumno;