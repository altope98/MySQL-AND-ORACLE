CREATE DATABASE productos1;
USE productos1;

CREATE TABLE productos (
  codigo varchar(3),
  nombre varchar(30),
  precio decimal(6,2),
  fechaalta date,
  PRIMARY KEY (codigo));
  
INSERT INTO productos VALUES ('a01','Afilador', 2.50, '2007-11-02');
INSERT INTO productos VALUES ('s01','Silla mod. ZAZ', 20, '2007-11-03');
INSERT INTO productos VALUES ('s02','Silla mod. XAX', 25, '2007-11-03');
SELECT * FROM productos;
SELECT * FROM productos WHERE nombre='Afilador';
SELECT * FROM productos WHERE nombre LIKE 'S%';
SELECT nombre, precio FROM productos WHERE precio > 22;
SELECT avg(precio) FROM productos WHERE LEFT(nombre,5) = 'Silla';
ALTER TABLE productos ADD categoria varchar(10);
SELECT * FROM productos;

UPDATE productos SET categoria='utensilio';
UPDATE productos SET categoria='silla' WHERE LEFT(nombre,5) = 'Silla';
SELECT DISTINCT categoria FROM productos;
SELECT categoria, count(*) FROM productos GROUP BY categoria;
