create database pruebas;
use pruebas;

create table empleado(
	apellido varchar(40),
    iddepartamento int
	
);
drop table empleado;
create table  departamento(
	nombredepartamento varchar(20),
    iddepartamento int
   
);
drop table departamento;

create table estudiantes(
	edad int
);
drop table estudantes;

insert into empleado values ('Andrade',31),('Jordan',33),('Steinberg',33),('Robinson',34),('Zolano',34),('Gaspar',36),('Wlliams',null);
insert into departamento values ('Ventas',31),('Ingenieria',33),('Produccion',34),('Mercadeo',35);

insert into estudiantes values (50),(20),(25),(15),(18),(20);

select * from empleado e join departamento d on e.iddepartamento=d.iddepartamento;

select * from empleado e left join departamento d on e.iddepartamento=d.iddepartamento;

select * from empleado e right join departamento d on e.iddepartamento=d.iddepartamento;



select * from empleado e left join departamento d on e.iddepartamento=d.iddepartamento 
union
select * from empleado e right join departamento d on e.iddepartamento=d.iddepartamento;


select e.apellido as 'apellido', d.nombredepartamento as 'Nombre de departamento' 
from empleado e left join departamento d on e.iddepartamento=d.iddepartamento 
where d.iddepartamento is null;

select e.apellido as 'apellido', d.nombredepartamento as 'Nombre de departamento' 
from empleado e left join departamento d on e.iddepartamento=d.iddepartamento 
where d.iddepartamento is not null;

select e.apellido as 'apellido', d.nombredepartamento as 'Nombre de departamento' 
from empleado e right join departamento d on e.iddepartamento=d.iddepartamento 
where e.iddepartamento is null;

select e.apellido as 'apellido', d.nombredepartamento as 'Nombre de departamento' 
from empleado e right join departamento d on e.iddepartamento=d.iddepartamento 
where e.iddepartamento is not null;


select edad from estudiantes having edad <25;

select edad from estudiantes where edad<25;

select distinct(edad) from estudiantes having edad <25 order by edad desc;

