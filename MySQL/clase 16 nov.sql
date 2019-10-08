
# Comentario de una línea

/* comentarios 
de varias 
líneas*/


# Comando para crear una bases de datos
create database IES;

-- Comando para mostar las bases de datos existentes
show databases;

-- Comando para borrar una bases de datos
drop database IES;


-- Comando para usar una bases de datos

use IES;

-- Comando para visualizar las tablas que tenemos en la BD show


show tables;

-- Comando para crear una tabla nueva es CREATE

create table alumno(
dni int,
nombre varchar(15),
apellidos varchar(30),
age int,
direccion varchar(30),
primary key(dni));

show tables;

-- Comando para borrar una tabla DROP TABLE
drop table alumno;

-- Para insertar valores se usa el comando insert into

insert into alumno values(111,'Luis',"Pérez",18,'Calle ancha 12');
insert into alumno(dni,nombre,apellidos,direccion) values(222,'Ana',"Pérez",'Calle ancha 12');


select * from alumno;

create table profesor(
dni int,
nombre varchar(15),
apellidos varchar(30),
fechar_nac date,
direccion varchar(30),
salario int,
primary key(dni));



insert into profesor values(333,'pepe','sanchez',18/11/1970,'Calle baja',10000);

select 