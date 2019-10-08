--76
drop table inscriptos;
 drop table socios;
 
 create table socios(
  numero number(4),
  documento char(8),
  nombre varchar2(30),
  domicilio varchar2(30),
  primary key (numero)
 );
 
 create table inscriptos (
  numerosocio number(4) not null,
  deporte varchar(20) not null,
  cuotas number(2) default 0,
  constraint CK_inscriptos_cuotas
   check (cuotas>=0 and cuotas<=10),
  primary key(numerosocio,deporte),
  constraint FK_inscriptos_socio
   foreign key (numerosocio)
   references socios(numero)
   on delete cascade
 );
 
insert into socios values(1,'23333333','Alberto Paredes','Colon 111');
 insert into socios values(2,'24444444','Carlos Conte','Sarmiento 755');
 insert into socios values(3,'25555555','Fabian Fuentes','Caseros 987');
 insert into socios values(4,'26666666','Hector Lopez','Sucre 344');

 insert into inscriptos values(1,'tenis',1);
 insert into inscriptos values(1,'basquet',2);
 insert into inscriptos values(1,'natacion',1);
 insert into inscriptos values(2,'tenis',9);
 insert into inscriptos values(2,'natacion',1);
 insert into inscriptos values(2,'basquet',default);
 insert into inscriptos values(2,'futbol',2);
 insert into inscriptos values(3,'tenis',8);
 insert into inscriptos values(3,'basquet',9);
 insert into inscriptos values(3,'natacion',0);
 insert into inscriptos values(4,'basquet',10);
 
 select socios.nombre,socios.domicilio,(select count(*) from inscriptos where socios.numero=inscriptos.numerosocio)as contador 
 from socios;
 
 select socios.nombre,(select count(*)*10 from inscriptos where socios.numero=inscriptos.numerosocio)as cuotas_a_pagar, (select sum(cuotas) from inscriptos where socios.numero=inscriptos.numerosocio)as pagas
 from socios;
 
 select nombre,count(deporte)*10,sum(cuotas)
 from socios 
 join inscriptos 
 on socios.numero=inscriptos.numerosocio 
 group by nombre;
 
 
 --77
 drop table inscriptos;
 drop table socios;
 
  create table socios(
  numero number(4),
  documento char(8),
  nombre varchar2(30),
  domicilio varchar2(30),
  primary key (numero)
 );
 
 create table inscriptos (
  numerosocio number(4) not null,
  deporte varchar2(20) not null,
  cuotas number(2) default 0,
  constraint CK_inscriptos_cuotas
   check (cuotas>=0 and cuotas<=10),
  primary key(numerosocio,deporte),
  constraint FK_inscriptos_socio
   foreign key (numerosocio)
   references socios(numero)
   on delete cascade
 );
 
 insert into socios values(1,'23333333','Alberto Paredes','Colon 111');
 insert into socios values(2,'24444444','Carlos Conte','Sarmiento 755');
 insert into socios values(3,'25555555','Fabian Fuentes','Caseros 987');
 insert into socios values(4,'26666666','Hector Lopez','Sucre 344');

 insert into inscriptos values(1,'tenis',1);
 insert into inscriptos values(1,'basquet',2);
 insert into inscriptos values(1,'natacion',1);
 insert into inscriptos values(2,'tenis',9);
 insert into inscriptos values(2,'natacion',1);
 insert into inscriptos values(2,'basquet',default);
 insert into inscriptos values(2,'futbol',2);
 insert into inscriptos values(3,'tenis',8);
 insert into inscriptos values(3,'basquet',9);
 insert into inscriptos values(3,'natacion',0);
 insert into inscriptos values(4,'basquet',10);
 
 select nombre from socios where exists(select * from inscriptos where socios.numero=inscriptos.numerosocio and deporte='futbol');
 
 select nombre from socios where not exists(select * from inscriptos where socios.numero=inscriptos.numerosocio and deporte='futbol');
 
 select * from socios where exists(select * from inscriptos where socios.numero=inscriptos.numerosocio and cuotas=10);
 
 select * from socios join inscriptos on socios.numero=inscriptos.numerosocio where cuotas=10;
 
 
 --78
 
  drop table deportes;
  
 create table deportes(
  nombre varchar2(15),
  profesor varchar2(30),
  dia varchar2(10),
  cuota number(5,2)
 );
 
  insert into deportes values('tenis','Ana Lopez','lunes',20);
 insert into deportes values('natacion','Ana Lopez','martes',15);
 insert into deportes values('futbol','Carlos Fuentes','miercoles',10);
 insert into deportes values('basquet','Gaston Garcia','jueves',15);
 insert into deportes values('padle','Juan Huerta','lunes',15);
 insert into deportes values('handball','Juan Huerta','martes',10);
 
select distinct profesor from deportes d1 where profesor in(select profesor from deportes d2 where d1.nombre <> d2.nombre);

select distinct d1.profesor from deportes d1 join deportes d2  on d1.profesor=d2.profesor where d1.nombre <> d2.nombre; 

select nombre from deportes where nombre<>'padle' and dia=(select dia from deportes where nombre='padle');

select d1.nombre from deportes d1 join deportes d2 on d1.dia=d2.dia where d2.nombre='padle' and d1.nombre<>d2.nombre;


--79

 drop table empleados;
 drop table sucursales;
 
 create table sucursales( 
  codigo number(2),
  ciudad varchar2(30) not null,
  provincia varchar2(30),
  primary key(codigo)
 ); 
 
  create table empleados( 
  documento char(8) not null,
  nombre varchar2(30) not null,
  codigosucursal number(2),
  sueldo number(6,2),
  primary key(documento),
  constraint FK_empleados_sucursal
   foreign key (codigosucursal)
   references sucursales(codigo)
 ); 
 
  insert into sucursales values(1,'Cordoba','Cordoba');
 insert into sucursales values(2,'Tucuman','Tucuman');
 insert into sucursales values(3,'Carlos Paz','Cordoba');
 insert into sucursales values(4,'Cruz del Eje','Cordoba');
 insert into sucursales values(5,'La Plata','Buenos Aires');

 insert into empleados values('22222222','Ana Acosta',1,500);
 insert into empleados values('23333333','Carlos Caseros',1,610);
 insert into empleados values('24444444','Diana Dominguez',2,600);
 insert into empleados values('25555555','Fabiola Fuentes',5,700);
 insert into empleados values('26666666','Gabriela Gonzalez',3,800);
 insert into empleados values('27777777','Juan Juarez',4,850);
 insert into empleados values('28888888','Luis Lopez',4,500);
 insert into empleados values('29999999','Maria Morales',5,800);
 
 select documento,nombre,sueldo,ciudad,provincia from empleados  join sucursales  on empleados.codigosucursal=sucursales.codigo;
 
 update empleados set sueldo=sueldo+sueldo*0.1 where codigosucursal=(select codigo from sucursales where ciudad='Cruz del Eje');
 
 update empleados set sueldo=sueldo+sueldo*0.2 where codigosucursal=(select codigo from sucursales where ciudad='Cordoba');
 
 update empleados set sueldo=(select sueldo from empleados where nombre='Maria Morales'),codigosucursal=(select codigo from sucursales where ciudad='Carlos Paz');
 
 delete from epleados where codigosucursal=(select codigo from sucursales where provincia='Cordoba');
 
 drop table inscriptos;
 drop table socios;
 
 create table socios(
  numero number(5),
  documento char(8),
  nombre varchar2(30),
  domicilio varchar2(30),
  primary key (numero)
 );
 
  create table inscriptos (
  numerosocio number (5) not null,
  deporte varchar2(20) not null,
  matricula char(1),-- 'n' o 's'
  primary key(numerosocio,deporte),
  constraint FK_inscriptos_socio
   foreign key (numerosocio)
   references socios(numero)
 );
 
  insert into socios values(1,'23333333','Alberto Paredes','Colon 111');
 insert into socios values(2,'24444444','Carlos Conte','Sarmiento 755');
 insert into socios values(3,'25555555','Fabian Fuentes','Caseros 987');
 insert into socios values(4,'26666666','Hector Lopez','Sucre 344');
 insert into socios values(5,'27777777','Ines Irala','Colon 888');

 insert into inscriptos values(1,'tenis','s');
 insert into inscriptos values(1,'basquet','s');
 insert into inscriptos values(1,'natacion','s');
 insert into inscriptos values(2,'tenis','s');
 insert into inscriptos values(2,'natacion','s');
 insert into inscriptos values(2,'basquet','n');
 insert into inscriptos values(2,'futbol','n');
 insert into inscriptos values(3,'tenis','s');
 insert into inscriptos values(3,'basquet','s');
 insert into inscriptos values(3,'natacion','n');
 insert into inscriptos values(4,'basquet','n');
 
 select numero,documento,nombre,domicilio,deporte,matricula from socios full join inscriptos on numerosocio=numero;
 
update inscriptos set matricula='s' where numerosocio=(select numero from socios where documento='2444444');

delete from inscriptos where numerosocio in(select numero from socios  join inscriptos on numerosocio=numero where matricula='n');
 
 
 --80
 
 drop table facturas;
 drop table clientes;
 
  create table clientes(
  codigo number(5),
  nombre varchar2(30),
  domicilio varchar2(30),
  primary key(codigo)
 );
 
 create table facturas(
  numero number(6) not null,
  fecha date,
  codigocliente number(5) not null,
  total number(6,2),
  primary key(numero),
  constraint FK_facturas_cliente
   foreign key (codigocliente)
   references clientes(codigo)
 );
 
 insert into clientes values(1,'Juan Lopez','Colon 123');
 insert into clientes values(2,'Luis Torres','Sucre 987');
 insert into clientes values(3,'Ana Garcia','Sarmiento 576');
 insert into clientes values(4,'Susana Molina','San Martin 555');

 insert into facturas values(1200,'15/04/2007',1,300);
 insert into facturas values(1201,'15/04/2007',2,550);
 insert into facturas values(1202,'15/04/2007',3,150);
 insert into facturas values(1300,'20/04/2007',1,350);
 insert into facturas values(1310,'22/04/2007',3,100);
 

 create table clientespref(
  nombre varchar2(30),
  domicilio varchar2(30)
 );
 
 
 insert into clientespref select nombre,domicilio from clientes where codigo in (select codigocliente from clientes join facturas on codigocliente=codigo group by codigocliente having sum(total)>500);
 
 select * from clientespref;