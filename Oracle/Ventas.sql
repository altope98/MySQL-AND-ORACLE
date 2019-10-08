CREATE TABLE Vendedores(
idVendedor number PRIMARY KEY,
nombre varchar2(35),
apellidos varchar2(45),
ventas_IdVentas number
);

CREATE TABLE Ventas(
idVentas NUMBER PRIMARY KEY,
idProducto NUMBER,
idMaquina NUMBER,
idVendedor NUMBER
);

CREATE TABLE Productos(
idProducto NUMBER PRIMARY KEY,
Nombre VARCHAR2(45),
Precio NUMBER
);

CREATE TABLE MaquinasRegistradoras(
idMaquina NUMBER PRIMARY KEY,
Piso NUMBER(2)
);

--insercion valores tabla vendedores
insert into vendedores(idvendedor,nombre,apellidos) values
(1,'Luis','Valdes');
insert into vendedores(idvendedor,nombre,apellidos) values
(2,'Juan','Perez');
insert into vendedores(idvendedor,nombre,apellidos) values
(3,'Pedro','Duran');
insert into vendedores(idvendedor,nombre,apellidos) values
(4,'Maria','Ayala');
insert into vendedores(idvendedor,nombre,apellidos) values
(5,'Lucia','Duran');
insert into productos(idProducto,nombre,precio) values (1,'Arroz:
tucapel',950);
insert into productos(idProducto,nombre,precio) values (2,'Arroz:
Zaror',650);
insert into productos(idProducto,nombre,precio) values (3,'cafe:
nescafe',750);
insert into productos(idProducto,nombre,precio) values (4,'cafe:
Colombiano',690);
insert into productos(idProducto,nombre,precio) values (5,'cafe: Juan
Valdez',2470);
insert into productos(idProducto,nombre,precio) values (6,'Salsa de
tomate: Doña clara',790);
insert into productos(idProducto,nombre,precio) values (7,'Salsa de
tomate: carozzi',750);
insert into productos(idProducto,nombre,precio) values (8,'Te:
Club',850);
insert into productos(idProducto,nombre,precio) values (9,'Te:
Lipton',930);
insert into productos(idProducto,nombre,precio) values (10,'Galletas:
Costa',470);
insert into productos(idProducto,nombre,precio) values (11,'Galletas:
Salvado',520);
insert into productos(idProducto,nombre,precio) values (12,'Galletas:
Triton',760);
insert into productos(idProducto,nombre,precio) values (13,'Azucar:
iansa',986);
insert into productos(idProducto,nombre,precio) values (14,'Azucar:
Acuenta',300);
insert into productos(idProducto,nombre,precio) values (15,'Azucar:
Refinada',2950);
insert into productos(idProducto,nombre,precio) values (16,'Galletas:
ricalata',660);insert into productos(idProducto,nombre,precio) values (17,'Aceite:
Miraflores',660);
insert into productos(idProducto,nombre,precio) values (18,'Aceite:
Belmontt',489);
insert into productos(idProducto,nombre,precio) values (19,'Aceite:
Acuenta',489);
insert into MaquinasRegistradoras(idmaquina,piso) values (1,2);
insert into MaquinasRegistradoras(idmaquina,piso) values (2,2);
insert into MaquinasRegistradoras(idmaquina,piso) values (3,2);
insert into MaquinasRegistradoras(idmaquina,piso) values (4,4);
insert into MaquinasRegistradoras(idmaquina,piso) values (5,4);
insert into MaquinasRegistradoras(idmaquina,piso) values (6,4);
insert into MaquinasRegistradoras(idmaquina,piso) values (7,3);
insert into MaquinasRegistradoras(idmaquina,piso) values (8,5);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(1,2,2,2);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(2,2,2,19);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(3,2,2,19);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(4,2,2,18);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(5,2,2,17);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(6,2,2,10);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(7,2,2,1);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(8,2,2,2);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(9,2,2,2);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(10,2,2,4);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(11,2,2,5);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(12,2,2,6);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(13,4,2,2);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(14,4,2,4);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(15,4,2,10);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(16,4,2,12);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(17,4,2,13);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(18,4,2,11);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(19,4,2,14);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(20,6,2,16);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(21,6,2,2);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(22,6,2,14);insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(23,6,2,16);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(24,2,4,2);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(25,2,4,4);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(26,2,4,10);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(27,2,2,6);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(28,2,2,7);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(29,2,2,8);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(30,4,2,9);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(31,4,2,19);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(32,3,3,18);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(33,3,4,17);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(34,2,5,13);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(35,2,4,11);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(36,2,4,18);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(37,2,4,8);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(38,2,4,6);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(39,2,4,6);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(40,2,4,11);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(41,6,4,10);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(42,2,2,7);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(43,6,2,4);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(44,2,4,6);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(45,2,4,2);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(46,8,4,4);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(47,8,2,12);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(48,7,4,17);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(49,2,4,15);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(50,1,2,2);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(51,5,2,6);insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(52,6,2,2);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(53,4,2,10);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(54,4,2,7);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(55,2,4,4);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(56,8,4,3);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(57,7,4,2);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(58,4,4,14);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(59,6,4,14);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(60,4,3,6);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(61,8,2,1);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(62,2,4,6);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(63,2,5,14);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(64,2,4,12);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(65,2,4,11);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(66,3,1,16);
insert into ventas(idVentas,idMaquina,idVendedor,idProducto) values
(67,3,4,6);

--1
ALTER TABLE Ventas ADD CONSTRAINT productos
FOREIGN KEY (idProducto) references Productos(idProducto);

ALTER TABLE Ventas ADD CONSTRAINT maquinas
FOREIGN KEY (idMaquina) references MaquinasRegistradoras(idMaquina);

ALTER TABLE Ventas ADD CONSTRAINT vendedores
FOREIGN KEY (idVendedor) references Vendedores(idVendedor);

--6
--A
SELECT DISTINCT nombre, ventas.idProducto
FROM productos, ventas
where ventas.idProducto=productos.idProducto 
and productos.idProducto =(
  SELECT MAX(COUNT(idProducto))
  FROM ventas
  GROUP BY idProducto);
  
--B
select nombre,count(idVentas) from ventas,productos where productos.idproducto=ventas.idproducto group by nombre order by count(idventas) desc;


--C
select idventas,MaquinasRegistradoras.idmaquina,productos.nombre,precio,piso 
from ventas,MAQUINASREGISTRADORAS,productos 
where ventas.IDMAQUINA=MaquinasRegistradoras.idMaquina and ventas.IDPRODUCTO=productos.IDPRODUCTO order by idventas;


--D
select count(idVentas),piso from ventas,maquinasregistradoras where ventas.idmaquina=maquinasregistradoras.idmaquina group by piso order by count(idventas) desc;


--E
select Distinct vendedores.nombre, vendedores.idVendedor, count(productos.precio) from ventas,vendedores,productos
where vendedores.idvendedor=ventas.idvendedor and ventas.idproducto=productos.idproducto;-- order by vendedores.IDVENDEDOR,vendedores.nombre,sum(Productos.precio);

--F
select Distinct Vendedores.idVendedor,Vendedores.Nombre,MaquinasRegistradoras.piso,Productos.Precio
from Vendedores,Productos,MaquinasRegistradoras,ventas
where ventas.IDVENDEDOR = vendedores.IDVENDEDOR and ventas.IDMAQUINA=MaquinasRegistradoras.idmaquina and ventas.IDPRODUCTO=productos.idproducto
order by Vendedores.IDVENDEDOR,Vendedores.Nombre,MaquinasRegistradoras.piso;

select Vendedores.idVendedor,Vendedores.Nombre,MaquinasRegistradoras.piso,Productos.Precio
from Vendedores,Productos,MaquinasRegistradoras,ventas
where ventas.IDVENDEDOR = vendedores.IDVENDEDOR and ventas.IDMAQUINA=MaquinasRegistradoras.idmaquina and ventas.IDPRODUCTO=productos.idproducto
and (select sum(Productos.precio) from Productos where Productos.PRECIO <= 28000 order by Vendedores.Nombre);

--7
create or replace procedure sacar_total_ventas(idVend int)
is
total number:=0;
BEGIN 
 select count(idVentas) into total from ventas where ventas.idVendedor=idVend;
 DBMS_OUTPUT.PUT_LINE('La suma total de ventas del vendedor '||idVend||' es '||total);
 END;
 
 SET SERVEROUTPUT ON;
 DECLARE
 idVend INT:=0;
 BEGIN
 idVend:=&Ingresa_numero_de_vendedor;
 sacar_total_ventas(idVend);
 end;

--8
CREATE OR REPLACE TRIGGER verificar_id_vendedor
BEFORE INSERT 
ON Vendedores
FOR EACH ROW
DECLARE
  ultimoID number;
BEGIN
  SELECT MAX(idVendedor) INTO ultimoId FROM Vendedores;
  DBMS_OUTPUT.PUT_LINE('TRIGGER LANZADO');
  IF(:new.IdVendedor IS NULL) THEN :new.idVendedor :=ultimoID +2;
  END IF;
END;

SET SERVEROUTPUT ON;

--9
CREATE OR REPLACE TRIGGER aumento_ingreso
BEFORE INSERT 
ON Productos
FOR EACH ROW
DECLARE
  precioMod NUMBER;
  precioFinal NUMBER;
  idP NUMBER;
  nomb VARCHAR2(35);
BEGIN
  idP := :old.idProducto;
  nomb := :old.nombre;
  precioMod := :new.precio * 0.005;
  
  IF (:new.precio > 25000) THEN
    precioFinal := :new.precio - precioMod;
    DBMS_OUTPUT.PUT_LINE(precioFinal);
    
    :new.precio := precioFinal; -- estableces el precio que hemos calculado
  END IF;
  DBMS_OUTPUT.PUT_LINE('Precio Modificado' );
END;

INSERT INTO Productos(IDPRODUCTO, nombre, precio) VALUES (51,'Prueba2',30000);
SELECT * FROM Productos;


--10
SELECT * FROM ESTADISTICAS;
CREATE TABLE estadisticas(
  totalVendido NUMBER,
  cantidadProductos NUMBER,
  precioPromedio NUMBER
);
INSERT INTO estadisticas VALUES (0,0,0);
SELECT * FROM ventas;

CREATE OR REPLACE TRIGGER update_estadisticas
BEFORE INSERT OR DELETE OR UPDATE
ON ventas
FOR EACH ROW
DECLARE
    totalVentas NUMBER;
    totalProductos NUMBER;
    mediaPrecio NUMBER;
BEGIN
    SELECT COUNT(idVentas) INTO totalVentas
    FROM ventas;
    
    SELECT COUNT(idProducto) INTO totalProductos
    FROM productos;
    
    SELECT AVG(precio) INTO mediaPrecio
    FROM productos;
    
    UPDATE estadisticas SET totalVendido = totalVentas , cantidadProductos = totalProductos , precioPromedio = mediaPrecio;
    DBMS_OUTPUT.PUT_LINE('Estadisticas modificadas');
END;

SELECT * FROM ventas;
INSERT INTO ventas VALUES (69,6,3,4);
    