Create table Depot
 (dno varchar2(5),
 dname varchar2(20),
 daddress varchar2(20),
 constraint pk_dno primary key(dno) );
Create table BusType
 (tno varchar2(5),
 tdescript varchar2(20),
 constraint pk_tno primary key(tno) );
Create table BusDriver
 (bdno varchar2(5),
 bdname varchar2(20),
 bdsalary number(6,2),
 pcvdate date,
 dno varchar2(5),
 constraint pk_bdno primary key(bdno),
 constraint fk_dno foreign key(dno) references Depot(dno));

Create table Cleaner
 (cno varchar2(5),
 cname varchar2(20),
 csalary number(6,2),
 dno varchar2(5),
 constraint pk_cno primary key(cno),
 constraint fk_dno1 foreign key(dno) references Depot(dno));

Create table Route
 (rno varchar2(5),
 rdescript varchar2(30),
 dno varchar2(5),
 constraint pk_rno primary key(rno),
 constraint fk_dno2 foreign key(dno) references Depot(dno));
Create table Bus
 (regno varchar2(10),
 model varchar2(20),
 tno varchar2(5),
 dno varchar2(5),
 cno varchar2(5),
 constraint pk_reg_no primary key(regno),
 constraint fk_tno foreign key(tno) references BusType(tno),
 constraint fk_dno3 foreign key(dno) references Depot(dno),
 constraint fk_cno foreign key(cno) references Cleaner(cno));
Create table Ability
 (bdno varchar2(5),
 rno varchar2(5),
 constraint pk_drroute primary key(bdno, rno),
 constraint fk_bdno foreign key(bdno) references busdriver(bdno),
 constraint fk_rno foreign key(rno) references route(rno) );
Create table Training
 (bdno varchar2(5),
 tno varchar2(5),
 trainingdate date,
 constraint pk_drbustype primary key(bdno, tno),
 constraint fk_bdno2 foreign key(bdno) references busdriver(bdno),
 constraint fk_tno2 foreign key(tno) references BusType(tno));
Create table Restriction
 (rno varchar2(5),
 tno varchar2(5),
 constraint pk_rbustype primary key(rno, tno),
 constraint fk_rno2 foreign key(rno) references route(rno),
 constraint fk_tno3 foreign key(tno) references BusType(tno));
 
 
 
 
 --load Depot with data
insert into Depot values
('101','Holloway','Camden Road');
insert into Depot values
('102','Hornsey','High Road');
insert into Depot values
('104','Islington','Upper Street');
--load BusType with data
insert into BusType values
('1','double-decker');
insert into BusType values
('2','metrobus');
insert into BusType values
('3','midibus');
insert into BusType values
('4','bendy bus');
insert into BusType values
('5','open top');

drop table Busdriver;
--load Busdriver with data
insert into Busdriver values
('001','Jane Brown',1800,'09-feb-1985','101');
insert into Busdriver values
('006','Sally Smith',1750,'09-mar-1996','');
insert into Busdriver values
('007','James Bond',1500,'09-jan-1999','102');
insert into Busdriver values
('008','Maggie May',2200,'09-jan-2000','102');
insert into Busdriver values
('009','Jack Jones',1400,'09-aug-2001','101');
insert into Busdriver values
('010','Peter Piper',3500,'09-jun-2004','104');
insert into Busdriver values
('011','John Peel',2000,'09-feb-2005','102');
--load Cleaner with data
insert into Cleaner values
('110','John',2550,'101');
insert into Cleaner values
('111','Jean',2500,'101');
insert into Cleaner values
('112','Betty',2400,'102');
insert into Cleaner values
('113','Vince',2800,'102');
insert into Cleaner values
('114','Jay',3000,'102');
insert into Cleaner values
('115','Doug',2000,'102');
insert into Cleaner values
('116','Geeta',4000,'');




--1
create or replace procedure getCleanerDetails (numerocleaner varchar2,salario int,nombre varchar2)
is
begin  
    if numerocleaner='113'
    then
        salario:=salario+(salario*10/100);
        DBMS_OUTPUT.PUT_LINE('El salario de '||nombre||' es:  ' || salario);
    else
    DBMS_OUTPUT.PUT_LINE('El salario de '||nombre||' es:  ' || salario);
    end if;
end;

SET SERVEROUTPUT ON;
declare
numerocleaner int:=0;
begin
    numerocleaner:=&Ingresa_numero_de_cleaner; 
    getCleanerDetails(numerocleaner,salario,nombre);
end;
 
 --3
 /*create or replace function getCleanersLocation (numerocleaner varchar2)
 return varchar2
is
    ubicacion varchar2;
begin
  select ubicacion= dname from depot where dno=numerocleaner;
  return ubicacion;
end;
 
 SET SERVEROUTPUT ON;
declare
numerocleaner int:=0;

begin
    numerocleaner:=&Ingresa_numero_de_cleaner; 
    getCleanersLocation(numerocleaner);
    DBMS_OUTPUT.PUT_LINE('El empleado con codigo '||numerocleaner||' esta en:  ' || ubicacion);
end;
 
 
create or replace procedure nombredepot (numero in depot.dno%type, nombre out depot.dname%type)
is
begin
    select dname into nombre from depot where dno=numero;
end
create or replace function nombredepot2(numero in depot.dno%type)
return depot.dname%type;
*/


--2
set serveroutput on;
declare
    numbercleaner cleaner.cno%type;
    salary cleaner.salary%type;
    cleanername cleaner.cname%type;
    cursor cursorclenaer is select cno from cleaner;
begin
    open cursor;
    loop
        fetch cursorcleaner into numbercleaner;
        getCleanerDetails(numbercleaner,salary,cleanername);
        dbms_output.put_line(numbercleaner,salary,cleanername);
    exit when cursorcleaner%not found;
    end loop
end


select * from emp;


create table auditando(
usuario varchar2(30),
fecha date,
operacion varchar2(15));

select * from auditando;

CREATE TRIGGER audit_trigger BEFORE INSERT OR DELETE OR UPDATE ON
emp FOR EACH ROW
BEGIN
  IF INSERTING THEN /* Si estamos insertando pondremos el USER, la fecha actual y la operación que esta realizando en ese momento */
    INSERT INTO auditando VALUES(USER,sysdate, 'Inserting');
  ELSIF DELETING THEN
    INSERT INTO auditando VALUES(USER,sysdate,'Deleting');
    ELSIF UPDATING THEN
        INSERT INTO auditando VALUES(USER,sysdate,'Updating');
  END IF;
END;

DROP TRIGGER audit_trigger;

insert into emp values(3334,'Jairo','Analist',7839,sysdate,1000,0,10);
update emp set sal=sal+100 where empno=3334;
delete emp where empno=3334;

DROP TABLE AUDITANDO;

--CREAR TRIGGER QUE SOLAMENTE ACTUALICE CUANDO SE ESTE ACTUALIZANDO
CREATE TRIGGER auditando_trigger BEFORE UPDATE ON
emp FOR EACH ROW
BEGIN
 
        INSERT INTO auditando VALUES(USER,sysdate,'Actualizando');
  
END;
DROP TRIGGER auditando_trigger;

select * from auditando;

create or replace trigger SeguridadEmp BEFORE INSERT ON emp
Begin
  if (TO_CHAR(sysdate, 'DY') IN ('SAB','DOM')) OR (TO_CHAR(sysdate,'HH24') NOT BETWEEN '08' AND '15')
  THEN
  RAISE_APPLICATION_ERROR (-20100, 'NO PUEDES INSERTAR REGISTROS FUERA DEL HORARIO NORMAL DE OFICINA');
  END IF;
end;


--Supongamos que queremos hacer un trigger que no permita

create or replace trigger TopeDeSueldo before insert or update on emp for each row
begin
    if inserting then
        if (:new.sal > 5000) AND NOT(:new.JOB = 'President') THEN
            RAISE_APPLICATION_ERROR(-20100,'No puedes introducir un salario tan alto');
        end if;
        else
            if(:new.sal >5000) AND NOT(:new.JOB = 'President') THEN
                RAISE_APPLICATION_ERROR(-20100,'No puedes introducir un salario tan alto');
                end if;
                end if;
                end;
                
                
--que no permita inserte un empleado que sea presidente o actualizar un  empleado presidente si ya hay presidente
CREATE OR REPLACE TRIGGER NumeroPresidente
BEFORE INSERT OR UPDATE
ON emp
FOR EACH ROW

DECLARE
numPresi INT:=0;

BEGIN
  SELECT COUNT(*) INTO numPresi
  FROM emp
  WHERE job = 'PRESIDENT';
  DBMS_OUTPUT.put_line(numPresi);
  
  IF (numPresi > 0) THEN
    RAISE_APPLICATION_ERROR( -20202, 'La empresa no puede tener más de un presidente');
    
  END IF;
END;

create or replace trigger control_supervisor
before insert or update
on emp 
for each row
declare
    contador int;
begin
    select count(mgr) into contador from emp where emp.mgr=:new.mgr;
    if contador>5 then
        raise_application_error(-20100,'No puede supervisar');
    end if;
    end;








