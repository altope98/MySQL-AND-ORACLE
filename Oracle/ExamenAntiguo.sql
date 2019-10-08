CREATE TABLE Medicamentos (
	cCodMed varchar2 (13)  NOT NULL,
	cDesMed varchar2 (100) NOT NULL,
	nPvpMed number(12, 2)  NOT NULL );

CREATE TABLE Companias (
	cCodComp varchar2 (13) NOT NULL,
	cNomComp varchar2 (100) NOT NULL );

CREATE TABLE TarifasComp (
	cCodMed varchar2 (13)  NOT NULL,
	cCodComp varchar2 (13) NOT NULL,
	nPvpTar number(12, 2)  NOT NULL );

CREATE TABLE Tickets (
	nNumTick number(10, 0) NOT NULL ,
	dFecTick date );

CREATE TABLE LinTickets (
	nNumTick number(10, 0) NOT NULL ,
	nNumLin number(10, 0)  NOT NULL ,
	cCodMed varchar2 (13)  NOT NULL,
	nPrecio number(12, 2),
	nCantidad number(12, 3) );

CREATE TABLE Recetas (
	nNumRec number(10, 0)  NOT NULL ,
	nNumTick number(10, 0) NOT NULL ,
	nNumLin number(10, 0)  NOT NULL ,
	dFecRec date,
	Paciente varchar2 (100),
	dFecNac date NULL ,
	cCodComp varchar2 (13) );
    
CREATE TABLE Ventas (
	dFecha 		date,
	cCodMed 	varchar2 (13)  NOT NULL,
	cCodComp 	varchar2 (13) NOT NULL,
	TotalVentas 	number(12, 2)  NOT NULL );
    
drop table ventas;

Alter table ventas add constraint ventaspk primary key (ccodcomp,ccodmed);
alter table ventas add constraint ventasfk foreign key (ccodcomp) references companias(ccodcomp);
alter table ventas add constraint ventasfk2 foreign key (ccodmed) references medicamentos(ccodmed);


ALTER TABLE Companias    ADD CONSTRAINT PK_Companias PRIMARY KEY (cCodComp);
ALTER TABLE Medicamentos ADD CONSTRAINT PK_Medicamentos PRIMARY KEY (cCodMed);
ALTER TABLE TarifasComp  ADD CONSTRAINT PK_TarifasComp PRIMARY KEY (cCodMed,cCodComp);
ALTER TABLE Tickets 	 ADD CONSTRAINT PK_Tickets PRIMARY KEY (nNumTick);
ALTER TABLE LinTickets   ADD CONSTRAINT PK_LinTickets PRIMARY KEY (nNumTick,nNumLin) ;
ALTER TABLE Recetas  	 ADD CONSTRAINT PK_Recetas PRIMARY KEY (nNumRec);

ALTER TABLE LinTickets ADD 
	CONSTRAINT FK_LinTickets_Medicamentos FOREIGN KEY (cCodMed) 
	REFERENCES Medicamentos (cCodMed);

ALTER TABLE LinTickets ADD 
	CONSTRAINT FK_LinTickets_Tickets FOREIGN KEY (nNumTick) 
	REFERENCES Tickets (nNumTick) ON DELETE CASCADE;

ALTER TABLE Recetas ADD 
	CONSTRAINT FK_Recetas_Companias FOREIGN KEY (cCodComp) 
	REFERENCES Companias (cCodComp) ON DELETE CASCADE;

ALTER TABLE Recetas ADD 
	CONSTRAINT FK_Recetas_LinTickets FOREIGN KEY (nNumTick,nNumLin) 
	REFERENCES LinTickets (nNumTick,nNumLin);

ALTER TABLE TarifasComp ADD 
	CONSTRAINT FK_TarifasComp_Companias FOREIGN KEY (cCodComp) 
	REFERENCES Companias (cCodComp) ON DELETE CASCADE;

ALTER TABLE TarifasComp ADD 
	CONSTRAINT FK_TarifasComp_Medicamentos FOREIGN KEY	(cCodMed) 
	REFERENCES Medicamentos (cCodMed) ON DELETE CASCADE;





INSERT INTO MEDICAMENTOS VALUES ('ASP','ASPIRINA',2);
INSERT INTO MEDICAMENTOS VALUES ('PAR','PARACETAMOL',3);
INSERT INTO MEDICAMENTOS VALUES ('IBU','IBUPROFENO',4);

INSERT INTO COMPANIAS VALUES ('SS','SEGURIDAD SOCIAL');
INSERT INTO COMPANIAS VALUES ('AS','ASISA MUTUA SEGUROS');
INSERT INTO COMPANIAS VALUES ('AD','ADESLAS');

INSERT INTO TarifasComp VALUES ('ASP','SS',1.9);
INSERT INTO TarifasComp VALUES ('PAR','SS',2.8);
INSERT INTO TarifasComp VALUES ('IBU','SS',3.7);
INSERT INTO TarifasComp VALUES ('ASP','AD',1.7);
INSERT INTO TarifasComp VALUES ('PAR','AD',2.7);


INSERT INTO TICKETS VALUES (1,'01/01/2009');
INSERT INTO TICKETS VALUES (2,'03/03/2009');
INSERT INTO TICKETS VALUES (3,'17/03/2009');

INSERT INTO LINTICKETS VALUES (1,1,'ASP',2,5);
INSERT INTO LINTICKETS VALUES (1,2,'ASP',2,11);
INSERT INTO LINTICKETS VALUES (1,3,'PAR',3,6);
INSERT INTO LINTICKETS VALUES (1,4,'PAR',3,5);
INSERT INTO LINTICKETS VALUES (1,5,'PAR',3,7);
INSERT INTO LINTICKETS VALUES (1,6,'IBU',4,12);
INSERT INTO LINTICKETS VALUES (1,7,'IBU',4,8);
INSERT INTO LINTICKETS VALUES (1,8,'IBU',4,3);
INSERT INTO LINTICKETS VALUES (2,1,'IBU',4,9);


INSERT INTO RECETAS VALUES (1,1,2,SYSDATE,'JUAN MOLES','01/01/1970','AD');
INSERT INTO RECETAS VALUES (2,1,4,SYSDATE,'PACO PEREZ','01/01/1970','SS');
INSERT INTO RECETAS VALUES (3,1,7,SYSDATE,'MARICARMEN','01/01/1970','SS');
INSERT INTO RECETAS VALUES (4,1,8,SYSDATE,'MARICARMEN','01/01/1970','SS');
INSERT INTO RECETAS VALUES (5,2,1,SYSDATE,'LUISA PEREZ','01/01/1970','SS');

drop table lintickets;
drop table medicamentos;
drop table tarifascomp;
drop table companias;
drop table recetas;
drop table tickets;



--1
select lintickets.nnumtick,nnumlin from lintickets,tickets where lintickets.nnumtick=tickets.nnumtick and lintickets.nnumlin>=5;


--2
select companias.cnomcomp, medicamentos.ccodmed from Companias,TarifasComp,Medicamentos
where Companias.cCodComp=TarifasComp.cCodComp and TarifasComp.cCodMed=Medicamentos.cCodMed;


--3
update tarifascomp set npvpTar= 1.05*npvpTar where ccodcomp='AD';

--4
select Distinct dfectick,nprecio from lintickets,tickets where tickets.NNUMTICK=lintickets.NNUMTICK and nprecio=(select min(nprecio) from lintickets);


CREATE OR REPLACE PROCEDURE sp_ventas (codigocompania COMPANIAS.CCODCOMP%TYPE, fechainicio DATE, fechafinal DATE)
IS
	comprobantedecompañia  NUMBER;
BEGIN
	SELECT COUNT(*) INTO comprobantedecompañia FROM COMPANIAS WHERE cCodComp = comprobantedecompañia;
	IF comprobantedecompañia = 0 THEN
		RAISE_APPLICATION_ERROR( -20502,'Código Compañia no Existe');
	END IF;
	INSERT INTO VENTAS SELECT SYSDATE,LT.CCODMED,R.CCODCOMP,SUM(LT.NPRECIO*LT.NCANTIDAD)
			FROM RECETAS R,LINTICKETS LT,TICKETS T 
			WHERE R.NNUMTICK = LT.NNUMTICK AND R.NNUMLIN = LT.NNUMLIN AND LT.NNUMTICK = T.NNUMTICK 
			AND R.CCODCOMP = comprobantedecompañia
			AND T.DFECTICK BETWEEN fechainicio AND fechafinal
			GROUP BY LT.CCODMED,R.CCODCOMP;
END;

select * from companias;
select * from tickets;

SET SERVEROUTPUT ON
DECLARE
 codigocompania COMPANIAS.CCODCOMP%TYPE;
 fechainicio date;
 fechafinal date;
 BEGIN
 codigocompania:=&Introduce_codigo_compañia;
 fechainicio:=&Ingresa_fecha_inicio;
 fechafinal:=&Ingresa_fecha_final;
 sp_ventas(codigocompania,fechainicio,fechafinal);
 end;

--1
 CREATE OR REPLACE TRIGGER TR_INS_UP_DEL_REC AFTER INSERT OR UPDATE OR DELETE ON RECETAS FOR EACH ROW


DECLARE
	xPvpTar TARIFASCOMP.nPvpTar%TYPE;
	xPvpMed MEDICAMENTOS.nPvpMed%TYPE;
	xCodMed LINTICKETS.cCodMed%TYPE;
	xNReg   NUMBER;
BEGIN 

	IF INSERTING OR UPDATING('CCODCOMP') THEN 
		SELECT cCodMed INTO xCodMed FROM LINTICKETS 
			WHERE nNumTick = :NEW.nNumTick AND nNumLin = :NEW.nNumLin;
		SELECT COUNT(*) INTO xNReg FROM TARIFASCOMP 
			WHERE CCODCOMP = :NEW.cCodComp AND cCodMed = xCodMed;

-- Si no hay registro no da Error

		IF xNReg = 1 THEN
			SELECT nPvpTar INTO xPvpTar FROM TARIFASCOMP 
				WHERE CCODCOMP = :NEW.cCodComp AND cCodMed = xCodMed;
			UPDATE LINTICKETS SET nPrecio = xPvpTar 
				WHERE nNumTick = :NEW.nNumTick AND nNumLin = :NEW.nNumLin;
		END IF;
	END IF;

	IF DELETING THEN
		SELECT cCodMed INTO xCodMed FROM LINTICKETS 
			WHERE nNumTick = :OLD.nNumTick AND nNumLin = :OLD.nNumLin;
		SELECT nPvpMed INTO xPvpMed FROM MEDICAMENTOS 
			WHERE cCodMed = xCodMed;
		UPDATE LINTICKETS SET nPrecio = xPvpMed 
			WHERE nNumTick = :OLD.nNumTick AND NNUMLIN = :OLD.nNumLin;
	END IF;
END;


--2 
CREATE OR REPLACE TRIGGER Trigger2ExamenPrueba
BEFORE DELETE
ON Recetas
FOR EACH ROW
DECLARE
codMed LinTickets.cCodMed%TYPE;

BEGIN
SELECT Medicamentos.cCodMed INTO codMed
FROM Medicamentos,LinTickets,Recetas
WHERE Medicamentos.cCodMed=LinTickets.cCodMed
AND Recetas.nNumTick=LinTickets.nNumTick
AND Recetas.nNumLin=LinTickets.nNumLin
AND LinTickets.nNumLin LIKE :old.nNumLin; 

UPDATE LinTickets
SET nPrecio=(SELECT nPvpMed FROM Medicamentos WHERE cCodMed LIKE codMed) 
WHERE cCodMed LIKE codMed;
END;
