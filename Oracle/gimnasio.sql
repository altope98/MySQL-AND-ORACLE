
create table Monitor (
DNI int,
Nombre varchar(20),
Telefono varchar(9),
Titulacion varchar(10),
primary key (DNI)
);
drop table Monitor;

create table Socio(
DNI int,
Nombre varchar(20),
Direccion varchar(20),
Telefono varchar(9),
primary key (DNI)
);
drop table Socio;

create table Aparatos (
Codigo int,
Descripcion varchar(10),
Estado varchar(10),
primary key (Codigo)
);
drop table Aparatos;

create table Salas (
Numero int,
Superficie int,
Ubicacion varchar(10),
Tipo varchar(6),
primary key (Numero)
);
drop table salas;

create table Clases (
Codigo int,
Descripcion varchar(10),
DiaHora varchar2(20),
primary key (Codigo)
);
drop table clases;

create table Tienen (
Numero int,
Codigo int,
primary key (Numero,Codigo),
foreign key (Numero) references Salas(Numero),
foreign key (Codigo) references Aparatos(Codigo)
);
drop table Tienen;

create table Se_Imparten (
Numero int,
Codigo int,
primary key (Numero,Codigo),
foreign key (Numero) references Salas(Numero),
foreign key (Codigo) references Clases(Codigo)
);
drop table Se_Imparten;

create table Son_Impartidas (
Codigo int,
DNI int,
primary key (Codigo,DNI)
);
drop table Son_Impartidas;

create table Asisten (
DNI int,
Codigo int,
primary key (DNI,Codigo),
foreign key (DNI) references Socio (DNI),
foreign key (Codigo) references Clases (Codigo)
);
drop table Asisten;


insert into Monitor values (11,'Jose García','953333333','INEF');
insert into Monitor values (22,'Ana Gil','963333334','INEF');
insert into Monitor values (33,'Ana Martín','953333335','F.P.');
insert into Monitor values (44,'Pepe Pérez','953333336','IEF');

update Monitor set Titulacion='INEF' where Titulacion='IEF';

insert into Socio values (1,'Manolo Arcos','Libertad','95311111');
insert into Socio values (2,'Jose Rodríguez','Trinidad','95322222');
insert into Socio values (3,'Patricia Jiménez','Ancha','95322222');
insert into Socio values (4,'Soledad Martínez','Rastro','95322222');
insert into Socio values (5,'Inmaculada Pérez','Cava','95322222');
insert into Socio values (6,'Nicolás Ortega','Nueva','95322222');
insert into Socio values (7,'Federico Noriega','Trinidad','95322222');
insert into Socio values (8,'Rodríguez','Cava','95322222');

insert into Aparatos values (1,'Banco','Bueno');
insert into Aparatos values (2,'Pesa','Malo');
insert into Aparatos values (3,'Colchón','Nuevo');
insert into Aparatos values (4,'Barra','Bueno');
insert into Aparatos values (5,'Banco','Nuevo');
insert into Aparatos values (6,'Pesa','Nuevo');

insert into Salas values (1,10,'Planta 1','Cardio');
insert into Salas values (2,20,'Planta 1','Aerobi');
insert into Salas values (3,25,'Planta 1','Aerobi');
insert into Salas values (4,10,'Planta 2','Sauna');
insert into Salas values (5,10,'Planta 2','Masaje');
insert into Salas values (6,15,'Planta 2','Cardio');

insert into Clases values(1,'Aerobic','9:00:00');
insert into Clases values(2,'Aerobic','10:00:00');
insert into Clases values(5,'Aerobic','14:00:00');
insert into Clases values(3,'Step','20:00:00');
insert into Clases values(4,'Spining','21:00:00');

insert into Tienen values(4,4);
insert into Tienen values(5,5);
insert into Tienen values(2,1);
insert into Tienen values(3,2);
insert into Tienen values(3,3);
insert into Tienen values(6,6);

insert into Se_Imparten values(2,1);
insert into Se_Imparten values(2,2);
insert into Se_Imparten values(3,3);
insert into Se_Imparten values(3,4);
insert into Se_Imparten values(3,5);

insert into Son_Impartidas values(1,11);
insert into Son_Impartidas values(0,22);
insert into Son_Impartidas values(3,33);
insert into Son_Impartidas values(4,22);
insert into Son_Impartidas values(5,33);

insert into Asisten values(1,1);
insert into Asisten values(1,5);
insert into Asisten values(2,2);
insert into Asisten values(3,4);
insert into Asisten values(3,5);
insert into Asisten values(4,3);
insert into Asisten values(5,3);
insert into Asisten values(6,3);
insert into Asisten values(7,1);
insert into Asisten values(7,5);
insert into Asisten values(7,2);
insert into Asisten values(8,4);
insert into Asisten values(8,5);

/*1. Nombre y teléfono de los socios del gimnasio que viven en Trinidad*/
select nombre,telefono,direccion from socio where direccion='Trinidad';

--2. Nombre y teléfono del socio que vive en Cava.
select nombre,telefono, direccion from socio where direccion='Cava';

--3. Nombre y dirección de los socios que asisten a aeróbic.
select nombre,direccion 
from socio,asisten,clases
where socio.dni=asisten.dni
and clases.codigo=asisten.codigo
and clases.descripcion='Aerobic';

--4. Nombre y dirección de los socios que asisten a sep
select socio.nombre,socio.direccion,clases.descripcion 
from socio,clases,asisten
where socio.dni=asisten.dni
and clases.codigo=asisten.codigo
and clases.descripcion='Step';

--5. Nombre de los socios que asisten a las clases de Ana Gil
select socio.nombre,clases.descripcion,monitor.nombre from socio,clases,monitor,asisten,son_impartidas where asisten.codigo=clases.codigo and socio.dni=asisten.dni
and son_impartidas.codigo=clases.codigo and son_impartidas.dni=monitor.dni and monitor.nombre='Ana Gil';

--6. Nombre de los monitores que tiene titulación de la INEF
select nombre,titulacion from monitor where titulacion='INEF';

--7. Descripción de los aparatos nuevos.
select descripcion,estado from aparatos where estado='Nuevo';

--8. Nombre y dirección de los socios que asisten a clase antes de las 16:00 horas.
select socio.nombre,socio.direccion,clases.descripcion,clases.diahora from socio,clases,asisten where asisten.codigo=clases.codigo and asisten.dni=socio.dni
and clases.diahora<'16:00:00';

--9. Número y tipo de las salas que tienen más de 12 metros cuadrados.


--10. Nombre de los alumnos de Pepe.


--11. Nombre de los socios que asisten a clase en la primera planta


--12. Aparatos que están situados en la 1º planta.


--13. Todas las clases y todos los alumnos que asisten a esas clases


--14. Monitores y las clases que dan y a qué hora la dan


--15. Clases que se dan en salas de más de 22 metros cuadrados

