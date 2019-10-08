CREATE TABLE AUTOBUSES(
Matricula VARCHAR2(7) PRIMARY KEY,
Marca VARCHAR2(20) NOT NULL,
Modelo VARCHAR2(20) NOT NULL
);

CREATE TABLE CONDUCTORES(
NIF VARCHAR2(10) PRIMARY KEY,
cNomConductor VARCHAR2(20) NOT NULL);

CREATE TABLE CIUDADES(
cCodCiudad VARCHAR2(10) PRIMARY KEY,
cNomCiudad VARCHAR2(20) NOT NULL);

CREATE TABLE RUTAS(
NumRuta NUMBER(10) PRIMARY KEY,
Fecha DATE,
KmRuta NUMBER(10)default 1 NOT NULL ,
Matricula VARCHAR2(7) NOT NULL,
NIF VARCHAR2(10) NOT NULL ,
foreign key (matricula) references autobuses(matricula),
foreign key (nif) references conductores(nif)
);

CREATE TABLE PASA(
NumRuta NUMBER(10) NOT NULL,
cCodCiudad VARCHAR2(10) NOT NULL,
Orden NUMBER(10) PRIMARY KEY,
foreign key (numruta) references rutas(numruta),
foreign key (ccodciudad) references ciudades(ccodciudad)
);

drop table autobuses;
drop table conductores;
drop table ciudades;
drop table rutas;
drop table pasa;



alter table pasa
add constraint CHK_PASA_ORDEN check (orden>=0 and orden<=10);




/*1 Nombre de las ciudades por las que pasan más rutas.*/
select cNomCiudad,orden from ciudades join pasa on pasa.cCodCiudad=ciudades.cCodCiudad where orden=(select max(orden)from pasa);




/*2 Numero y fecha de las rutas que pasan por todas las ciudades.*/
select pasa.numruta, rutas.fecha, ciudades.cnomciudad from rutas, pasa, ciudades where pasa.cCodCiudad=ciudades.cCodCiudad and pasa.numruta=rutas.numruta and exists (select cnomciudad from ciudades,pasa where pasa.cCodCiudad=ciudades.cCodCiudad);



/*3 Nombre de los conductores que han realizado mas kilómetros en todas las rutas que han
realizado que el conductor 'PEPE SANCHEZ'*/
select cNomconductor,kmruta from conductores,rutas where rutas.nif=conductores.nif and kmruta>(select kmruta from conductores,rutas where rutas.nif=conductores.nif and cNomconductor='PEPE SANCHEZ');


/*4 Marca y modelo de cada autobús y kilómetros totales realizado por cada uno de ellos.*/
select marca,modelo,sum(kmruta) from autobuses,rutas where autobuses.matricula=rutas.matricula group by marca;



/*5 Numero de rutas realizadas en ABRIL del año que marca el servidor de la BD.*/
select count(numruta) from rutas where fecha='ABRIL' group by numruta;



/*6 Numero, kilómetros y fecha de las rutas que solo ha realizado el autobús con matricula
'1234ABC'.*/
select count(numruta),sum(kmruta),fecha from rutas, autobuses where rutas.MATRICULA = autobuses.MATRICULA and autobuses.MATRICULA='1234ABC' group by numruta;



/*7 Nombre de los conductores que realizaron las rutas con mayor numero de ciudades por las
que pasan.*/



/*8 NIF y nombre de los conductores que nunca han conducido un autobús de la marca
'MERCEDES'.*/

select nif, cNomconductor from conductores,autobuses ,rutas where rutas.nif=conductores.NIF and rutas.matricula=autobuses.MATRICULA and not exists(select marca from autobuses where marca='MERCEDES');

/*9 Realizar las siguientes operaciones:
a Insertar la ruta numero 10, con fecha de hoy, 400 kilómetros de recorrido, con salida en
GRANADA, llegada en MADRID y que pasa por JAEN.*/



/*b Borrar todas las rutas realizadas por PEPE SANCHEZ en las que conducía un autobús de la
marca 'VOLVO'*/



/*c Modificar todas las rutas realizadas por PEPE SANCHEZ incrementando sus kilómetros en
un 5%.*/





