create table secciones(
 codigo int,
 nombre varchar(30),
 sueldomaximo decimal(8,2),
 constraint PK_secciones primary key(codigo)
 );
 create table empleados(
 documento char(8) not null,
 nombre varchar(30) not null,
 domicilio varchar(30),
 codigoseccion int not null,
 sueldo decimal(8,2),
 constraint PK_empleados primary key(documento),
 constraint FK_empelados_seccion
 foreign key (codigoseccion) references secciones(codigo)
 );
 
 insert into secciones values(1,'Administracion',1500);
 insert into secciones values(2,'Sistemas',2000);
 insert into secciones values(3,'Secretaria',1000);
 insert into empleados values('22222222','Ana Acosta','Avellaneda 88',1,1100);
 insert into empleados values('23333333','Bernardo Bustos','Bulnes 345',1,1200);
 insert into empleados values('24444444','Carlos Caseres','Colon 674',2,1800);
 insert into empleados values('25555555','Diana Duarte','Colon 873',3,1000); 
 
 
 drop table secciones;
 drop table empleados;
 
CREATE OR REPLACE TRIGGER insertEmpresa
BEFORE INSERT
ON empleados
FOR EACH ROW

DECLARE
  sueldoMax DECIMAL;
BEGIN

  SELECT sueldomaximo INTO sueldoMax
  FROM secciones, empleados
  WHERE :new.codigoseccion = codigo
  AND secciones.codigo = empleados.codigoseccion;

  IF :new.sueldo > sueldoMax
  THEN
    RAISE_APPLICATION_ERROR( -20202, 'No puede cobrar mas de su sueldo maximo');
  END IF;

END;
delete empleados where documento=26568758;
insert into empleados values('26568758','Altope Duarte','Concha 12',3,80000);









create table socios(
documento char(8) not null,
nombre varchar(30),
domicilio varchar(30),
constraint PK_socios primary key (documento)
);
create table inscriptos(
documento char(8) not null,
deporte varchar(30) not null,
matricula char(1),
constraint CK_inscriptos check (matricula in ('s','n')),
constraint PK_inscriptos primary key (documento,deporte),
constraint FK_inscriptos_documento foreign key(documento)
references socios (documento)
);
create table morosos(
documento char(8) not null
);
insert into socios values ('22222222','Ana Acosta','Avellaneda 800');
insert into socios values ('23333333','Bernardo Bustos','Bulnes 234');
insert into socios values ('24444444','Carlos Caseros','Colon 321');
insert into socios values ('25555555','Mariana Morales','Maipu 483');
insert into inscriptos values ('22222222','tenis','s');
insert into inscriptos values ('22222222','natacion','n');
insert into inscriptos values ('23333333','tenis','n');
insert into inscriptos values ('24444444','tenis','s');
insert into inscriptos values ('24444444','futbol','s');
insert into morosos values ('22222222');
insert into morosos values ('23333333');

create or replace trigger ClubdeBarrio
before insert
on inscriptos
for each row
declare
  numeromoroso char(8);
BEGIN

  SELECT morosos.documento INTO numeromoroso
  FROM morosos, socios,inscriptos
  WHERE :new.documento = inscriptos.documento
  AND morosos.documento = inscriptos.documento and socios.documento=inscriptos.documento;

  IF :new.sueldo > sueldoMax
  THEN
    RAISE_APPLICATION_ERROR( -20202, 'No puede cobrar mas de su sueldo maximo');
  END IF;

END;