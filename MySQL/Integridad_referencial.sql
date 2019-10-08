create database Integridad_referencial;
use Integridad_referencial;

CREATE TABLE libro (
id_libro INT NOT NULL,
titulo VARCHAR(100) NULL,

precio NUMERIC(5,2) NULL,
PRIMARY KEY(id_libro)
);

CREATE TABLE escritor (

id_escritor INT NOT NULL,
nombre VARCHAR(30) NULL,
apellidos VARCHAR(40) NULL,
direccion VARCHAR(100) NULL,
PRIMARY KEY(id_escritor)

);

CREATE TABLE poema (
id_poema INT NOT NULL,
id_escritor INT NOT NULL,

titulo VARCHAR(50) NULL,
contenido TEXT NULL,
PRIMARY KEY(id_poema),
INDEX(id_escritor),
FOREIGN KEY(id_escritor) REFERENCES escritor(id_escritor)

ON DELETE CASCADE ON UPDATE CASCADE );
 

CREATE TABLE poema_libro (
id_poema INT NOT NULL,
id_libro INT NOT NULL,
PRIMARY KEY(id_poema, id_libro),
INDEX (id_poema), INDEX(id_libro),

FOREIGN KEY(id_poema) REFERENCES poema(id_poema) ON DELETE CASCADE ON UPDATE CASCADE, FOREIGN KEY(id_libro) REFERENCES libro(id_libro)

ON DELETE CASCADE ON UPDATE CASCADE );




