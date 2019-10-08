create database cliente_venta;
use cliente_venta;
drop table cliente;
drop table venta;
CREATE TABLE cliente
(
id_cliente INT NOT NULL,
nombre VARCHAR(30),
PRIMARY KEY (id_cliente)
); 

CREATE TABLE venta
(
id_factura INT NOT NULL,
id_cliente INT NOT NULL,
cantidad	INT,

PRIMARY KEY(id_factura),
INDEX (id_cliente),
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

INSERT INTO cliente VALUES(1,'Juan Penas');
INSERT INTO cliente VALUES(2,'Pepe el toro');
INSERT INTO venta VALUES(1,1,23); 
INSERT INTO venta VALUES(3,2,81); 
INSERT INTO venta VALUES(2,3,39);

INSERT INTO cliente VALUES(3,'Pepe pecas');
INSERT INTO venta VALUES(2,3,39);
DELETE FROM cliente WHERE id_cliente=3;

ALTER TABLE venta DROP FOREIGN KEY;

ALTER TABLE venta ADD FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente) ON DELETE CASCADE;

SELECT * FROM cliente;

SELECT * FROM venta;

DELETE FROM cliente WHERE id_cliente=3; 

SELECT * FROM venta;
SELECT * FROM cliente;

ALTER TABLE venta ADD FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente) ON DELETE RESTRICT ON UPDATE CASCADE;
