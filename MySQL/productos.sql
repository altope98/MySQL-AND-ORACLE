
use productos1;

create table productos(
codigo varchar (3),
nombre varchar (30),
precio decimal (6,2),
fechaalta date,
primary key (codigo)
);

#comando ALTER Table
#Añadir columna
Alter table productos add fechabaja date;
#Modificar tipo de dato fechabaja
alter table productos modify fechabaja int;
#Borrar columna
alter table productos drop fechabaja;

describe productos;

create table personas(
ID int,
nombre varchar (255)not null,
apellido varchar (255),
edad int 
);

#restricciones

insert into personas values (1,'Pepa','Perez',20);
insert into personas values (2,'Altope','Torrente',18);
insert into personas values (3,'JoseFina','Paracaidas',45);
#Modificar el valor dentro de la tabla

update personas set nombre='Pocoyo' where ID=3;

alter table personas add primary key (ID);
alter table personas drop primary key;
describe personas;

# Para que te de valor nulo sino lo rellenas

alter table personas modify nombre varchar (255) not full;
#Para quitar ese valor y puedas escribir
alter table personas modify nombre varchar (255);

#Añadir columna con un valor por defecto a poner

alter table personas add Ciudad varchar(255) default 'Granada';

select * from personas;

#Al meter otra columna si queremos dejar vacia una casill o bien pones default o poner primero los valores que quieres meter

insert into personas values (3,'JoseFina','Paracaidas',45, default); 

#Para que nos muestre en una tabla lo que le indiquemos, en este caso nombre. Con una coma nos muestra lo que queramos
select nombre,apellido from personas;

# Nombre y apellidos de aquellos suyo apellido sea martinez 

select nombre,apellido from personas where nombre='pocoyo'and edad=45;




