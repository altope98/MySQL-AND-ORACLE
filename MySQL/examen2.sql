create database examen2;
use examen2;


CREATE TABLE empleado (emp varchar(2) primary key, dni int(3), nombre varchar(10), numhijos int, ciudad varchar(30));
INSERT INTO empleado VALUES ('E1',801,'Uno',1,'Albacete');
INSERT INTO empleado VALUES ('E2',802,'Dos',2,'Cuenca');
INSERT INTO empleado VALUES ('E3',803,'Tres',3,'Albacete');
INSERT INTO empleado VALUES ('E4',804,'Cuatro',4,'Lisboa');
INSERT INTO empleado VALUES ('E5',805,'Cinco',3,'Murcia');
INSERT INTO empleado VALUES ('E6',806,'Seis',4,'Cuenca');
INSERT INTO empleado VALUES ('E7',807,'Siete',6,'Milan');
INSERT INTO empleado VALUES ('E8',808,'Ocho',1,'Albacete');

CREATE TABLE departamento (dpto varchar(2) primary key, nombre varchar(40), asignacion int);
INSERT INTO departamento VALUES ('D1','Marketing',105000);
INSERT INTO departamento VALUES ('D2','Facturacion',50000);
INSERT INTO departamento VALUES ('D3','Ventas',50000);

CREATE TABLE pertenece (emp varchar(2), dpto varchar(2), primary key(emp,dpto), FOREIGN KEY (emp) REFERENCES empleado(emp), FOREIGN KEY (dpto) REFERENCES departamento(dpto));
INSERT INTO pertenece VALUES ('E1','D1');
INSERT INTO pertenece VALUES ('E2','D1');
INSERT INTO pertenece VALUES ('E3','D1');
INSERT INTO pertenece VALUES ('E4','D2');
INSERT INTO pertenece VALUES ('E5','D2');
INSERT INTO pertenece VALUES ('E6','D3');
INSERT INTO pertenece VALUES ('E7','D3');
INSERT INTO pertenece VALUES ('E8','D3');



CREATE TABLE articulos (art varchar(2) primary key, nombre varchar(25), color varchar(15), ctd int, iva int);
INSERT INTO articulos VALUES ('A1','Impresoras','Verde',150,12);
INSERT INTO articulos VALUES ('A2','Tinta','Azul',350,6);
INSERT INTO articulos VALUES ('A3','Papel','Azul',550,6);
INSERT INTO articulos VALUES ('A4','Boligrafos','Blanco',1000,12);
INSERT INTO articulos VALUES ('A5','Lapiz','Negro',500,12);
INSERT INTO articulos VALUES ('A6','Proyector','Negro',550,12);
INSERT INTO articulos VALUES ('A7','Portatil','Amarillo',350,6);
INSERT INTO articulos VALUES ('A8','Pantalla','Rojo',3050,12);

CREATE TABLE usa (dpto varchar(2), art varchar(2), primary key(dpto,art), FOREIGN KEY (dpto) REFERENCES departamento(dpto), FOREIGN KEY (art) REFERENCES articulos(art));
INSERT INTO usa VALUES ('D1','A1');
INSERT INTO usa VALUES ('D1','A2');
INSERT INTO usa VALUES ('D2','A2');
INSERT INTO usa VALUES ('D3','A2');
INSERT INTO usa VALUES ('D3','A3');
INSERT INTO usa VALUES ('D3','A4');
INSERT INTO usa VALUES ('D3','A1');
INSERT INTO usa VALUES ('D2','A3');
INSERT INTO usa VALUES ('D1','A5');
INSERT INTO usa VALUES ('D1','A6');
INSERT INTO usa VALUES ('D2','A7');
INSERT INTO usa VALUES ('D3','A8');
INSERT INTO usa VALUES ('D3','A7');

#1.	Obtener el nombre y ciudad de los empleados con más de 2 hijos.
select nombre, ciudad from empleado where numhijos>2;

#2.	Nombre y ciudad de los empleados de Marketing.
select empleado.nombre, empleado.ciudad
from empleado, departamento, pertenece
where pertenece.emp=empleado.emp and pertenece.dpto=departamento.dpto
and departamento.nombre = 'marketing';

#3.	Nombre de los artículos que tienen un IVA de un 12 %.
select nombre from articulos where iva=12;

#4.	Nombre del departamento que tiene algún empleado de Lisboa.
select departamento.nombre from departamento, pertenece, empleado where departamento.dpto=pertenece.dpto and pertenece.emp=empleado.emp and empleado.ciudad='Lisboa';

#5.	Nombre del departamento que tiene la menor asignación.
select departamento.nombre from departamento where asignacion=(select min(asignacion) from departamento);

#6.	Número de empleados que tienen más de dos hijos.
select count(*) from empleado where numhijos>2;   #mal

#7.	Nombre departamento que no usa ningún artículo de color rojo.
select nombre from departamento where nombre not in (select departamento.nombre from departamento,usa,articulos where departamento.dpto=usa.dpto and usa.art=articulos.art and articulos.color='rojo'); 

#8.	Nombre de los departamentos que tienen la misma asignación que Facturación
select departamento.nombre from departamento where asignacion=(select nombre from departamento where nombre='Facturacion'); #mal

