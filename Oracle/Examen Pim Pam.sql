CREATE TABLE Equipos (
cCodEquipo varchar2(10),
cNomEquipo varchar2(50)
);

CREATE TABLE Jugadores (
cCodEquipo varchar2(10),
nNumJugador numeric(18,0),
cNomJugador varchar2(50),
nLibres numeric(10),
nDobles numeric(10),
nTriples numeric(10),
nFaltas numeric(10)
);

CREATE TABLE Partidos (
nPartido numeric(10),
Fecha date,
Lugar varchar2(50),
cEqLocal varchar2(10),
cEqVisitante varchar2(10)
);

CREATE TABLE Incidencias (
nIncidencia numeric(10),
nPartido numeric(10),
cCodEquipo varchar2(10),
nNumJugador numeric(18),
Incidencia varchar2(2),
Minuto date
);

Insert Into Equipos Values ('GR' ,'C.B. GRANADA');
Insert Into Equipos Values ('UNI','UNICAJA MALAGA');
Insert Into Equipos Values ('CSF','CAJA SAN FERNADO');
Insert Into Equipos Values ('RM' ,'C.B. REAL MADRID');
Insert Into Equipos Values ('BCN','C.B. BARCELONA');
Insert Into Equipos Values ('PAM','PAMESA VALENCIA');

Insert Into Jugadores(cCodEquipo,nnumjugador,cnomjugador)
Values ('GR',1,'PAU GASOL');
Insert Into Jugadores(cCodEquipo,nnumjugador,cnomjugador)
Values ('GR',2,'CALDERON');
Insert Into Jugadores(cCodEquipo,nnumjugador,cnomjugador)
Values ('GR',3,'NAVARRO');
Insert Into Jugadores(cCodEquipo,nnumjugador,cnomjugador)
Values ('GR',4,'JIMENEZ');

Insert Into Jugadores(cCodEquipo,nnumjugador,cnomjugador)
Values ('RM',1,'CORBALAN');
Insert Into Jugadores(cCodEquipo,nnumjugador,cnomjugador)
Values ('RM',2,'FERNANDO MARTIN');
Insert Into Jugadores(cCodEquipo,nnumjugador,cnomjugador)
Values ('RM',3,'ROMAY');


-- Primer partido entre el Granada y el Real Madrid
Insert Into Partidos Values (1,'01/09/2007','Granada','GR','RM');
-- Segundo partido entre el Unicaja y el Caja San Fernando
Insert Into Partidos Values (2,'01/09/2007','Malaga','UNI','CSF');
--
Insert Into Partidos Values (3,'01/09/2007','Valencia','PAM','BCN');
Insert Into Partidos Values (4,'01/09/2007','Armilla','GR','UNI');
Insert Into Partidos Values (5,'01/09/2007','Granada','GR','CSF');

-- Comienza el partido numero 1 entre el CB Granada y el UNICAJA de Malaga

-- ¡¡ Doble de Pau Gasol del CB Granada ¡¡
Insert Into Incidencias Values (01,1,'GR',1,'D','05/12/2007');
-- ¡¡ Triple de Calderon del CB Granada ¡¡
Insert Into Incidencias Values (02,1,'GR',2,'T','05/12/2007');
-- ¡¡ Triple de Navarro del CB Granada ¡¡
Insert Into Incidencias Values (03,1,'GR',3,'T','05/12/2007');
-- ¡¡ Falta de Pau Gasol del CB Granada ¡¡
Insert Into Incidencias Values (04,1,'GR',1,'F','05/12/2007');

Insert Into Incidencias Values (05,1,'GR',2,'F','05/12/2007');
Insert Into Incidencias Values (06,1,'GR',3,'F','05/12/2007');
Insert Into Incidencias Values (07,1,'GR',4,'T','05/12/2007');
Insert Into Incidencias Values (08,1,'GR',3,'D','05/12/2007');
Insert Into Incidencias Values (09,1,'GR',3,'T','05/12/2007');
Insert Into Incidencias Values (10,1,'GR',1,'T','05/12/2007');
Insert Into Incidencias Values (11,1,'GR',4,'T','05/12/2007');
Insert Into Incidencias Values (12,1,'GR',1,'L','05/12/2007');

-- Al fin despiertan los jugadores del Real Madrid

Insert Into Incidencias Values (13,1,'RM',1,'T','05/12/2007');

drop table equipos;
drop table jugadores;
drop table incidencias;
drop table partidos;

--Primera pregunta apartado d es informativo

--1
alter table incidencias add constraint pk_incidencias primary key (nIncidencia);
alter table jugadores add constraint pk_jugadores primary key (ccodequipo,nnumjugador);
alter table equipos add constraint pk_equipos primary key (ccodequipo);
alter table partidos add constraint pk_partidos primary key (npartido);

alter table incidencias add constraint fk_incidencias1 foreign key (ccodequipo) references equipos(ccodequipo);
alter table incidencias add constraint fk_incidencias2 foreign key (nnumjugador) references jugadores(nnumjugador);

alter table jugadores add constraint fk_jugadores1 foreign key (ccodequipo) references equipos(ccodequipo);

alter table partidos add constraint fk_equipos foreign key (cEqLocal) references equipos(ccodequipo);
alter table partidos add constraint fk_equipos2 foreign key (cEqVisitante) references equipos(ccodequipo);



alter table jugadores add nExpulsiones numeric(10,0);


alter table partidos modify fecha default sysdate;

alter table incidencias
add constraint restriccion_letras
check (incidencia in ('T','D','L','F','E'));

alter table jugadores modify nlibres default 0;
alter table jugadores modify ndobles default 0;
alter table jugadores modify ntriples default 0;
alter table jugadores modify nfaltas default 0;
alter table jugadores modify nexpulsiones default 0;

--2
select cnomjugador,cnomequipo,npartido from jugadores,equipos,partidos where equipos.ccodequipo=jugadores.ccodequipo and partidos.ceqlocal=equipos.ccodequipo and npartido=1;

select cnomequipo,ceqvisitante from partidos,equipos where ceqvisitante='RM' and equipos.ccodequipo=partidos.ceqlocal;



--3
create or replace procedure sp_ListaJugadores(nombreequipo varchar2)
IS
xjugador Jugadores%ROWTYPE;
 CURSOR jugador
  IS
    select cnomequipo,nnumjugador,cnomjugador,count(cnomjugador)as contador from jugadores,equipos where equipos.ccodequipo=jugadores.ccodequipo; --and equipos.cnomequipo like nombreequipo;
BEGIN
        OPEN jugador;
  LOOP
    FETCH jugador
    INTO xjugador;
    EXIT WHEN jugador%NOTFOUND;
  
    DBMS_OUTPUT.PUT_LINE('Equipo: '||xjugador.cnomequipo);
    DBMS_OUTPUT.PUT_LINE('Nº Jugador: '||xjugador.nnumjugador);
    DBMS_OUTPUT.PUT_LINE('Nombre del Jugador: '||xjugador.cnomjugador);
    DBMS_OUTPUT.PUT_LINE('Nº Jugadores: '||xjugador.contador);
    END LOOP;
    CLOSE jugador;
       
END;       







--4
create or replace procedure sp_Resultado(npartido numeric)
is
xPartidos Partidos%ROWTYPE;
begin