create database comisaria;
use comisaria;

create table arma(
	codArma int,
    clase varchar(20),
    nomArma  varchar(20),
    dniPoli  int,
    primary key(codArma)

);

create table policia(
	dniPoli  int,
    nombrePoli varchar(20),
    categoria  varchar(20),
    funcion  int ,
    dniJefe   int,
    primary key(dniPoli)

);




create table delincuente(
	dniDelin  int,
    nombre    varchar(20),
    direccion  varchar(20),
    telefono   int,
    codCalab   int,
    primary key(dniDelin)
    
);


create table calabozo(
	codCalab   int,
    ubicacion  varchar(20) ,
    primary key(codCalab)

);


create table arresta(
	dniPoli   int ,
    dniDeli    int,
    fecha    varchar(50),
    foreign key(dniPoli) references policia(dniPoli),
    foreign key(dniDeli) references delincuente(dniDelin),
    primary key(fecha)

);

create table caso(
	codCaso  int,
    juzgado  varchar(20),
    primary key(codCaso)

);


create table involucrado(
	dniDelin int ,
    codCaso  int,
    cargo    varchar(20),
    foreign key(dniDelin) references delincuente(dniDelin),
    foreign key(codCaso) references caso(codCaso)

);


drop table arresta;
drop table policia;
drop table calabozo;
drop table involucrado;
drop table arma;
drop table caso;
drop table delincuente;

    
 insert into policia values
(1,'Juan Perez','oficina',1,null),
(2,'Luisa Garcia','oficina',2,1),
(3,'Miguel Martinez','oficina',1,1),
(4,'Antonio Lopez','patrulla',2,null),
(5,'Pepe Castillo','patrulla',1,4),
(6,'Juan Fernandez','patrulla',2,4),
(7,'Maria Lopez','trafico',1,null),
(8,'Manuel Delgado','trafico',2,7),
(9,'Fernando Fernandez','trafico',2,7);

insert into arma values
(11,'ak47','fusil',4),
(12,'ak47','fusil',5),
(13,'asalto','fusil',7),
(21,'m3','pistola',7),
(22,'z55','pistola',8),
(23,'m2','pistola',9);

insert into calabozo values
(1,'ala derecha'),
(2,'ala derecha'),
(3,'ala izquierda');

insert into delincuente values
(11,'Mario Profugo','Granada',666231321,1),
(12,'Pelaez','Granada',666231555,1),
(13,'El Barto','Armilla',666321111,1),
(14,'Miguel Ruiz','Maracena',666555444,2),
(15,'Luis Aguilera','Granada',666898989,2),
(16,'Pepe Maletas','Granada',666111444,2),
(17,'Paco Machacasaurio','Guadix',611222222,3);

insert into arresta values
(4,11,'2010-01-01'),
(5,12,'2011-02-02'),
(6,13,'2010-02-02'),
(4,12,'2012-03-03'),
(5,14,'2014-01-01'),
(6,14,'2014-03-03'),
(7,15,'2012-09-09'),
(7,16,'2012-09-09'),
(7,13,'2012-09-09'),
(4,17,'2010-01-01'),
(4,14,'2011-02-02');

insert into caso values
(1,'pendiente'),
(2,'finalizado'),
(3,'en curso'),
(4,'parado'),
(5,'finalizado'),
(6,'en curso'),
(7,'en curso'),
(8,'finalizado');

insert into involucrado values
(11,1,'acusado'),
(17,1,'complice'),
(12,2,'culpable'),
(14,2,'culpable'),
(15,3,'acusado'),
(16,3,'acusado'),
(13,3,'acusado'),
(15,5,'culpable'),
(16,5,'inocente'),
(12,7,'acusado'),
(17,8,'inocente');