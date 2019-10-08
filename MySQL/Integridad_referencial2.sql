create database Integridad_referencial2;
use Integridad_referencial2;

create table clientes(
dni int,
nombre varchar(45),
primary key (dni)
);

create table cuentas(
id_cuenta int,
saldo float,
clientesdni int,
primary key (id_cuenta),
foreign key (clientesdni) references clientes(dni)
);

create table compras(
idcompra int,
articulo varchar(45),
precio float,
cuentasid int,
primary key (idcompra) ,
foreign key (cuentasid) references cuentas(id_cuenta),
index i_precio (precio)
);

INSERT INTO CLIENTES VALUES (123456789, 'John Carter');
INSERT INTO CLIENTES VALUES (987654321, 'JohnQ');
INSERT INTO CLIENTES VALUES (193749372, 'John Doe');

INSERT INTO CUENTAS  VALUES (10, 1000, 123456789);
INSERT INTO CUENTAS  VALUES (11, 0, 123456789);
INSERT INTO CUENTAS  VALUES (12, 20, 123456789);
INSERT INTO CUENTAS  VALUES (20, 40.23, 987654321);
INSERT INTO CUENTAS  VALUES (21, 2350.48, 987654321);
INSERT INTO CUENTAS  VALUES (30, 12000000, 193749372);
INSERT INTO CUENTAS  VALUES (31, 999999999999, 193749372);

INSERT INTO COMPRAS VALUES (1, 'Barra de pan', 1, 10);
INSERT INTO COMPRAS VALUES (2, 'Cuota del gimnasio', 30, 10);
INSERT INTO COMPRAS VALUES (3, 'Caja de cervezas 12 latas', 5, 10);
INSERT INTO COMPRAS VALUES (4, 'Calzoncillos Boxer', 3, 12);
INSERT INTO COMPRAS VALUES (5, 'Pack DVD Juego de tronos', 36, 20);
INSERT INTO COMPRAS VALUES (6, 'Lavadora', 300, 21);
INSERT INTO COMPRAS VALUES (7, 'Lavavajillas', 460, 21);
INSERT INTO COMPRAS VALUES (8, 'Jacuzzi de Ikea', 3200, 30);
INSERT INTO COMPRAS VALUES (9, 'Boeing 747', 17000000, 30);
INSERT INTO COMPRAS VALUES (10, 'Servicio de compañia de lujo', 1350, 30);
INSERT INTO COMPRAS VALUES (12, 'Empresa Google', 173652000000, 31);
INSERT INTO COMPRAS VALUES (11, 'Asesino a sueldo', 3450, 30);
INSERT INTO COMPRAS VALUES (13, 'Empresa Apple', 246992000000, 31);
INSERT INTO COMPRAS VALUES (14, 'Empresa Microsoft', 115500000000, 31);

#views
DELETE FROM cuentas WHERE cuentas.id_cuenta = 10;

DELETE FROM clientes WHERE clientes.dni = 987654321;

CREATE VIEW vista_saldo AS select saldo from cuentas;

select * from vista_saldo;

delete from vista_saldo where precio=20;

#index
show tables;

show index from compras;

SELECT * FROM indice;

drop index i_precio on compras;

create index i_cuentasid on compras(cuentasid);

show index from compras;

# el unique te permite selecionar d eun sitio

