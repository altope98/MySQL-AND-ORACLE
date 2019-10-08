create database ProveedoresYPiezas;
use ProveedoresYPiezas;

create table piezas (
    codigo int,
    nombre varchar(15),
    primary key (codigo)
);
desc piezas;
create table proveedores (
    id varchar(3),
    nombre varchar(20),
    primary key (id)
);
desc proveedores;


create table suministra (
    codigoPieza int,
    idProveedor varchar(3),
    precio int,
    primary key (codigoPieza , idProveedor),
    foreign key (codigoPieza)
        references piezas (codigo),
    foreign key (idProveedor)
        references proveedores (id)
);
desc suministra;

insert into piezas values
(1,'clavo'),
(2,'tuerca'),
(3,'arandela'),
(4,'grifo'),
(5,'tornillo'),
(6,'martillo'),
(7,'destornillador'),
(8,'llave'),
(9,'serrucho');
select 
    *
from
    piezas;
insert into proveedores values
('RBT', 'Susan Calvin Corp'), ('GHJ','Wellington'), ('HAL','Perry'), ('JUL','Hopper');
select 
    *
from
    proveedores;
insert into suministra values
(1,'RBT',10), (1,'GHJ',7), (2,'GHJ',7), (3,'RBT',5), (3,'GHJ',7), (4,'GHJ',27), (5,'HAL',7), 
(1,'JUL',7), (8,'JUL',17), (9,'JUL',7), (7,'GHJ',7), (7,'HAL',15), (8,'HAL',7), (9,'GHJ',66);
select 
    *
from
    suministra;
alter table suministra modify column precio decimal(4,2);

/*1.- Obtener los nombres de todas las piezas.*/
select 
    nombre
from
    piezas;

/*2.- Obtener los datos de todos los proveedores.*/
select 
    *
from
    proveedores;

/*3.- Obtener el precio medio al que se nos suministra las piezas.*/
select 
    avg(precio) as PrecioMedio
from
    suministra;



select 
    piezas.nombre, avg(precio)
from
    suministra,
    piezas
where
    piezas.codigo = suministra.codigopieza
group by codigoPieza;

/*4.- Obtener los nombres de los proveedores que suministran la pieza 1.*/
select 
    proveedores.nombre
from
    proveedores,
    suministra
where
    codigoPieza = 1 and id = idProveedor;

/*5.- Obtener los nombres de las piezas suministradas por el proveedor cuyo código es HAL.*/
select distinct
    piezas.nombre
from
    piezas,
    suministra
where
    suministra.idProveedor = 'HAL'
        and suministra.codigoPieza = piezas.codigo;

/*6.- Obtener los nombres de los proveedores que suministran la pieza más cara, indicando el 
nombre de la pieza y el precio al que la suministran.*/
select 
    proveedores.nombre, piezas.nombre, suministra.precio
from
    proveedores,
    piezas,
    suministra
where
    suministra.precio = (select 
            max(precio)
        from
            suministra);


/*7.- Aumentar los precios en una unidad.*/

update suministra set precio = 10;




select 
    *
from
    suministra;

/*8.- Hacer constar en la BD que la empresa “Susan Calvin” (RBT) ya no va a suministrar más clavos.*/
delete from suministra 
where
    idproveedor = 'RBT'
    and codigopieza = (select distinct
        codigo
    from
        piezas
    
    where
        nombre = 'clavo');
select 
    *
from
    suministra;