
CREATE TABLE clientes (
clinum NUMBER,
clinomb VARCHAR2(200),
calle VARCHAR2(200),
ciudad VARCHAR2(200),
prov CHAR(2),
codpos VARCHAR2(20),
tel1 VARCHAR2(20),
tel2 VARCHAR2(20),
tel3 VARCHAR2(20),
PRIMARY KEY (clinum)
);
CREATE TABLE ordenes (
ordnum NUMBER,
clinum NUMBER REFERENCES clientes,
fechpedido DATE,
fechaentrega DATE,
callent VARCHAR2(200),
ciuent VARCHAR2(200),
provent CHAR(2),
codpent VARCHAR2(20),
PRIMARY KEY (ordnum)
) ;
CREATE TABLE items (
numitem NUMBER PRIMARY KEY,
precio NUMBER,
tasas NUMBER
) ;
CREATE TABLE lineas (
linum NUMBER,
ordnum NUMBER REFERENCES ordenes,
numitem NUMBER REFERENCES items,
cantidad NUMBER,
descuento NUMBER,
PRIMARY KEY (ordnum, linum)
) ;


define type ListaTelT: type list(string);
define type DireccionT: type tuple [ calle:string,ciudad:string,prov:string,codpos:string];
define class ClientesT: type tuple [ clinum: integer,clinomb:string,direccion:DireccionT,listatel: ListaTelT];
define class ItemT: type tuple [ itemnum:integer,precio:real,tasas:real];
define type LineaT: type tuple [linum:integer,item:ItemT,cantidad:integer,descuento:real];
define type LineasPedidoT: type set(LineaT);
define class OrdenesT: type tuple [ ordnum:integer,cliente:ClientesT,fechpedido:date,fechentrega:date,pedido:LineasPedidoTdirecentrega:DireccionT];

-- Definir tipos en oracle

CREATE TYPE listatelt AS VARRAY(10) OF VARCHAR2(20) ;
CREATE TYPE direcciont AS OBJECT (
calle VARCHAR2(200),
ciudad VARCHAR2(200),
prov CHAR(2),
codpos VARCHAR2(20)
) ;
CREATE TYPE clientest AS OBJECT(
clinum NUMBER,
clinomb VARCHAR2(200),
direccion direcciont,
listatel listatelt
);
CREATE TYPE itemt AS OBJECT
( itemnum NUMBER,
precio NUMBER,
tasas NUMBER
) ;
CREATE TYPE lineat AS OBJECT
( linum NUMBER,
item REF itemt,
cantidad NUMBER,
descuento NUMBER
) ;
CREATE TYPE lineaspedidot AS TABLE OF lineat ;
CREATE TYPE ordenest AS OBJECT (
ordnum NUMBER,
cliente REF clientest,
fechpedido DATE,
fechentrega DATE,
pedido lineaspedidot,
direcentrega direcciont
); 
drop type ordenest;
-- Creaccion de tablas de objetos

CREATE TABLE clientestab OF
clientest (clinum PRIMARY KEY);

CREATE TABLE itemstab OF
itemt (itemnum PRIMARY KEY);

CREATE TABLE ordenestab OF ordenest (PRIMARY KEY (ordnum),
SCOPE FOR (cliente) IS clientestab)
NESTED TABLE pedido STORE AS pedidostab ;

ALTER TABLE pedidostab
ADD (SCOPE FOR (item) IS itemstab); 


--Insert
INSERT INTO itemstab VALUES(1004, 6750.00, 2);
INSERT INTO itemstab VALUES(1011, 4500.23, 2);
INSERT INTO itemstab VALUES(1534, 2234.00, 2);
INSERT INTO itemstab VALUES(1535, 3456.23, 2);
INSERT INTO itemstab VALUES(2004, 33750.00, 3);
INSERT INTO itemstab VALUES(3011, 43500.23, 4);
INSERT INTO itemstab VALUES(4534, 5034.00, 6);
INSERT INTO itemstab VALUES(5535, 34456.23, 5);

INSERT INTO clientestab VALUES (1,'Lola Caro',direcciont('12 Calle Lisboa', 'Nules', 'CS','12678'), listatelt('415-555-1212'));
INSERT INTO clientestab VALUES (2, 'Jorge Luz',direcciont('323 Calle Sol', 'Valencia', 'V','08820'), listatelt('609-555-1212','201-555-1212'));
INSERT INTO clientestab VALUES (3, 'Jose Perez',direcciont('12 Calle Colon', 'Castellon', 'ES','12001'), listatelt('964-555-1212', '609-543-1212','201-775-1212','964-445-1212'));
INSERT INTO clientestab VALUES (4, 'Ana Gil',direcciont('5 Calle Sueca', 'Burriana', 'ES','12345'), listatelt()) ; 
--Ordenes de Cliente1
INSERT INTO ordenestab
SELECT 1001, REF(C),
SYSDATE,'10-MAY-1999',
lineaspedidot(),
NULL
FROM clientestab C
WHERE C.clinum= 1 ;

INSERT INTO THE (
SELECT P.pedido FROM
ordenestab P
WHERE P.ordnum = 1001)
SELECT 01, REF(S), 12, 0
FROM itemstab S WHERE
S.itemnum = 1534;

INSERT INTO THE (
SELECT P.pedido FROM
ordenes_tab P
WHERE P.ordnum = 1001)
SELECT 02, REF(S), 10, 10
FROM itemstab S
WHERE S.itemnum = 1535; 

-- Ordenes Cliente 2
INSERT INTO ordenestab
SELECT 2001, REF(C),
SYSDATE,'20-MAY-1999',
lineaspedidot(),
direcciont('55 Madison
Ave','Madison','WI','53715') FROM clientestab C
WHERE C.clinum= 2;
INSERT INTO THE (
SELECT P.pedido FROM
ordenestab P
WHERE P.ordnum = 2001
)
SELECT 10, REF(S), 1, 0
FROM itemstab S WHERE
S.itemnum = 1004;
INSERT INTO THE (
SELECT P.pedido
FROM ordenestab PWHERE P.ordnum= 2001
)
VALUES( lineat(11, NULL, 2, 1) ) ;

--Ordenes Cliente 3

INSERT INTO ordenestab
SELECT 3001, REF(C),
SYSDATE,'30-MAY-1999',
lineaspedidot(),
NULL
FROM clientestab C
WHERE C.clinum= 3 ;
INSERT INTO THE (
SELECT P.pedido FROM
ordenestab P
WHERE P.ordnum = 3001
)
SELECT 30, REF(S), 18, 30
FROM itemstab S
WHERE S.itemnum = 3011;
INSERT INTO THE (
SELECT P.pedido FROM
ordenestab P
WHERE P.ordnum = 3001
)
SELECT 32, REF(S), 10, 100
FROM itemstab S
WHERE S.itemnum = 1535;
INSERT INTO ordenestab
SELECT 3002, REF(C),
SYSDATE,'15-JUN-1999',
lineaspedidot(),
NULL
FROM clientestab C
WHERE C.clinum= 3 ;
INSERT INTO THE (
SELECT P.pedido FROM
ordenestab P
WHERE P.ordnum = 3002
)
SELECT 34, REF(S), 200, 10
FROM itemstab S
WHERE S.itemnum = 4534;

--Ordenes Cliente 4
INSERT INTO ordenestab
SELECT 4001, REF(C),
SYSDATE,'12-MAY-1999',
lineaspedidot(),
direcciont('34 Nave Oeste','Nules','CS','12876') 
FROM clientestab C
WHERE C.clinum= 4;
INSERT INTO THE (
SELECT P.pedido FROM
ordenestab P
WHERE P.ordnum = 4001
)
SELECT 41, REF(S), 10, 10
FROM itemstab S
WHERE S.itemnum = 2004;
INSERT INTO THE (
SELECT P.pedido FROM
ordenestab P
WHERE P.ordnum = 4001
)
SELECT 42, REF(S), 32, 22
FROM itemstab S
WHERE S.itemnum = 5535;

--Borrado de tablas y objetos
DELETE FROM ordenestab;
DROP TABLE ordenestab;
DELETE FROM clientestab;
DROP TABLE clientestab;
DELETE FROM itemstab;
DROP TABLE itemstab;
DROP TYPE ordenest;
DROP TYPE lineaspedidot;
DROP TYPE lineat;
DROP TYPE itemt;
DROP TYPE clientest;
DROP TYPE listatelt;
DROP TYPE direcciont;

--Definicion de metodos para los tipos
CREATE TYPE ordenest AS OBJECT (
ordnum NUMBER,
cliente REF clientest,
fechpedido DATE,
fechentrega DATE,
pedido lineaspedidot,
direcentrega direcciont,
MEMBER FUNCTION
costetotal RETURN NUMBER,
PRAGMA RESTRICT_REFERENCES(costetotal, WNDS, WNPS) );
CREATE TYPE BODY ordenest AS
MEMBER FUNCTION costetotal RETURN NUMBER IS
i INTEGER;
item itemt;
linea lineat;
total NUMBER:=0;
BEGIN
FOR i IN 1..SELF.pedido.COUNT LOOP
linea:=SELF.pedido(i);
SELECT DEREF(linea.item) INTO item FROM DUAL;
total:=total + linea.cantidad * item.precio;
END LOOP;
RETURN total;
END;
END;


