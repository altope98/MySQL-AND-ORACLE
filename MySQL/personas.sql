create database personas;
use personas;

create table personas (
Id int,
Nombre varchar (50),
Apellidos1 varchar (50),
Apellidos2 varchar (50),
Nacimiento  varchar (20),
primary key (Id)
);

create table Ficha (
Id int,
Id_personas int,
CCC nchar (10) null,
primary key (Id),
foreign key (Id_personas) references personas(Id)
);

insert into personas values 
(1,'Juan','Quijano','Abad','2007-11-22'),
(2,'Pedro','Perez','Rivera','1980-10-12'),
(3,'Beatriz','Garcia','Ruperez','1975-06-25');

insert into ficha values
(1,1,'123456789'),
(2,3,'987654321');

#¿Que personas tienen ficha?
select * from ficha, personas where personas.id=ficha.id_personas;

#¿Que personas tienen ficha? Recoge los datos en comun
select * from ficha inner join personas on personas.id=ficha.id_personas;

#Coge todo lo que tenga ficha y lo que tenga en comun con personas, coge todo lo que tenga ficha y lo relaciona con la persona que tiene esa ficha
select * from ficha left join personas on personas.id=ficha.id_personas;

# intenta coger lo que no tenga ficha y no sale nada porque todas tienen ficha
select * from ficha left join personas on personas.id=ficha.id_personas where ficha.id_personas is null;

#no existe en mysql
select * from ficha full outer join personas on personas.id=ficha.id_personas; # se puede hacer mediante la union de left join y right join mediante union
select * from ficha left join  personas on personas.id=ficha.id_personas
union
select * from ficha right join personas on personas.id=ficha.id_personas;

#Sale un  null porque coge las personas que tienen ficha + las personas que no tienen ficha
select * from ficha right join personas on personas.id=ficha.id_personas;

#sale las persona que no tienen ficha
select * from ficha right join personas on personas.id=ficha.id_personas where personas.id is null;

#
select * from fcha full outer join personas on personas.id = ficha .id_personas where personas.id is null on ficha.id is null;