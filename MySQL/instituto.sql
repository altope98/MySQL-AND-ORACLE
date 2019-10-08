create database instituto;
use instituto;
create table alumno(
	DNI int,
    Nombre varchar(20),
    Apellidos varchar(20),
    primary key (DNI)
    );
create table asignatura(
	Codigo int,
    Asignatura varchar(20),
    Curso varchar(20),
    Horas int,
    primary key (Codigo)
    );
create table estudia(
	DNI int,
    Codigo int,
    primary key (DNI,Codigo),
    foreign key (DNI) references alumno(DNI),
    foreign key (Codigo) references asignatura(Codigo)
    );

    insert into alumno values('1','Pepe','Perez');
    insert into alumno values('2','Ana','Garcia');
    insert into alumno values('3','Laura','Perez');
    
    insert into asignatura values('1','matematicas','1ºESO','4');
	insert into asignatura values('2','matematicas','2ºESO','4');
    insert into asignatura values('3','matematicas','3ºESO','4');
    
    insert into estudia values('1','1');
    insert into estudia values('2','2');
    insert into estudia values('3','3');
    
    SELECT *FROM alumno;
    select * from asignatura;
    select * from estudia;
    
    select Nombre,Apellidos 
    from alumno,asignatura,estudia 
    where Asignatura='matematicas' 
    and Curso='3ºESO' 
    and alumno.DNI=estudia.DNI 
    and estudia.Codigo=asignatura.Codigo;
    
    select * from alumno,asignatura,estudia where alumno.dni=estudia.dni and estudia.codigo=asignatura.codigo;
    