create database examen1;
use examen1;

create table pieza(
pieza int,
nombre varchar(15),
color varchar(15),
peso int,
ciudad varchar(15),
primary key (pieza)
);

create table proveedor(
prov int,
nombre varchar(15),
status int,
ciudad varchar(15),
primary key (prov)
);

create table proyecto(
proyecto int,
nombre varchar(20),
ciudad varchar(15),
primary key (proyecto)
);

create table suministro(
prov int,
pieza int,
proyecto int,
cantidad int,
primary key (prov,pieza,proyecto),
foreign key (prov) references proveedor(prov),
foreign key (pieza) references pieza(pieza),
foreign key (proyecto) references proyecto(proyecto)
);

insert into pieza values
(1,'tuerca','rojo',15,'paris'),
(2,'tornillo','azul',15,'londres'),
(3,'martillo','negro',100,'roma'),
(4,'punzon','rojo',60,'madrid'),
(5,'clavo','rojo',10,'londres');

insert into proveedor values
(1,'lopez',20,'londres'),
(2,'jimenez',30,'paris'),
(3,'perez',25,'londres'),
(4,'martinez',80,'madrid'),
(5,'torres',15,'roma');

insert into proyecto values
(1,'construccion','londres'),
(2,'programacion','londres'),
(3,'carpinteria','roma'),
(4,'techos','paris'),
(5,'construccion','madrid'),
(6,'programacion','madrid');

insert into suministro values
(1,1,1,350),
(2,5,5,225),
(3,2,2,1000),
(4,3,3,250),
(5,4,4,150),
(1,2,1,120),
(2,3,4,110),
(2,2,1,111),
(3,1,6,121);

insert into suministro values(3,1,1,120),(4,1,2,500);
#1.	Encontrar los códigos de los proveedores que suministran a proyectos de Programación.
select prov from suministro,proyecto where suministro.proyecto=proyecto.proyecto and proyecto.nombre='Programacion';

#2.	Encontrar todos los suministros que cuya cantidad estén entre 200 y 300 inclusive.
select * from suministro where cantidad>200 and cantidad<300 ;

#3.	Encontrar los triples de códigos de proveedor, proyecto y piezas  que estén en la misma ciudad.
select proveedor.prov,proyecto.proyecto,pieza.pieza from proveedor,proyecto,pieza,suministro where proyecto.proyecto=suministro.proyecto and proveedor.prov=suministro.prov and pieza.pieza=suministro.pieza and pieza.ciudad=proyecto.ciudad and proyecto.ciudad=proveedor.ciudad;

#4.	Encontrar los códigos y nombres de los proyectos que tienen suministro cuya cantidad es superior a 1000.
select suministro.proyecto, proyecto.nombre, suministro.cantidad from proyecto, suministro where suministro.proyecto=proyecto.proyecto and cantidad >=1000;

#5.	Encontrar los proveedores que suministran a proyectos de Programación pero no de Construcción.
select  proveedor.prov from proveedor,suministro,proyecto where suministro.proyecto=proyecto.proyecto and suministro.prov=proveedor.prov and proyecto.nombre='Programacion' and proveedor.prov not in(select proveedor.prov from proveedor,suministro,proyecto where suministro.proyecto=proyecto.proyecto and suministro.prov=proveedor.prov and proyecto.nombre='Construccion')  ;


#6.	El nombre de la pieza más pesada.
select pieza.nombre from pieza where peso=(select max(peso) from pieza);

#7.	Código de las piezas que no se usan en ningún proyecto.
select pieza from pieza where pieza not in (select pieza from suministro);

#8.	El nombre de los proyectos y las piezas que usan siempre que superen la cantidad de 120.
select proyecto.nombre,pieza.nombre from proyecto,pieza,suministro where suministro.proyecto=proyecto.proyecto and pieza.pieza=suministro.pieza and suministro.cantidad>100;
