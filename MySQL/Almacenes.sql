create database Almacenes;
use Almacenes;

create table Cajeros(
	codigo int primary key,
	nomApels nvarchar (255));
drop table Cajeros;

create table Productos(
	codigo int primary key,
	nombre nvarchar (100),
	precio int);
drop table Productos;

create table Maquinas(
	codigo int primary key,
	piso int);
drop table Maquinas;

create table Venta(
	cajero int,
	maquina int,
	producto int,
	primary key (cajero, maquina, producto),
	foreign key (cajero) references Cajeros(codigo) on delete cascade on update cascade,
	foreign key (maquina) references Maquinas(codigo) on delete cascade on update cascade,
	foreign key (producto) references Productos(codigo) on delete cascade on update cascade);
drop table Venta;


insert into Cajeros values
	(1,'CajeroA'),
	(2,'CajeroB'),
	(3,'CajeroC'),
	(4,'CajeroD');

insert into Productos values
	(101,'Tornillo',10),
	(102,'Tuerca',20),
	(103,'Martillo',30),
	(104,'Taladro',40);

insert into Maquinas values
	(1001,21),
	(1002,22),
	(1003,23),
	(1004,24);

insert into Venta values
	(1,1001,101),
	(1,1001,102),
	(2,1002,103),
	(3,1003,104),
	(4,1004,102),
	(4,1003,101);


#Consultas
#HAVING

#1
select count(venta.producto), nombre
from Venta join Productos
on Venta.producto=Productos.codigo
group by venta.producto
order by venta.producto;

#2
select Venta.producto as 'Cod. Producto', nombre, precio, Venta.maquina as 'Cod. Maquina', piso, Venta.cajero, nomApels
from Venta join Productos join Cajeros join Maquinas
on Venta.producto=Productos.codigo
and Venta.cajero=Cajeros.codigo
and Venta.maquina=Maquinas.codigo;

#3
select count(venta.producto), piso
from Venta join Maquinas
on Venta.maquina=Maquinas.codigo
group by Venta.maquina
order by piso;

#4
select Cajeros.codigo, nomApels, SUM(precio)
from Cajeros join Venta join Productos
on Venta.producto=Productos.codigo
and Venta.cajero=Cajeros.codigo
group by nomApels;

#5
select Cajeros.codigo, nomApels, piso
from Cajeros join Venta join Productos join Maquinas
on Venta.producto=Productos.codigo
and Venta.cajero=Cajeros.codigo
and Venta.maquina=Maquinas.codigo
group by piso
having sum(precio)>30;

