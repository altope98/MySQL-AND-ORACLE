create database productos1;
use productos1;

create table productos(
codigo varchar(3),
nombre varchar(30),
precio decimal(6,2),
fechaalta date,
primary key (codigo)
);

#comando alter table sirve para lterar tabla
#añadir columna
alter table productos add fechabaja date;
#modificar tipo de dato
alter table productos modify fechabaja int;
#borrar columna
alter table productos drop fechabaja;

describe productos;
#insert into productos values
#select * from productos

create table personas(
	ID int,
    nombre varchar(255) not null,
    apellido varchar(255),
    Age int
);

#Restricciones
alter table personas add nombre;
alter table personas add apellido;

insert into personas values(1,'Pepe','Perez',20);

select * from personas;
SET SQL_SAFE_UPDATES=0;

update personas set Age=30 where ID=3;

alter table personas modify Age int not null;

alter table personas add primary key (ID);
alter table personas drop primary key;
desc personas;
alter table personas modify nombre varchar(255) not null;
alter table personas add City varchar(255) default 'Granaaaaaaaa'; #crea una nueva columna con valores por defecto
alter table personas drop City;
select * from personas;

select nombre from personas;

select nombre,apellido from personas where nombre='Pepe' and age=20;