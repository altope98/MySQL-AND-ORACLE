create database mascotas;
use mascotas;
create table mascotas(
	Nombre varchar(20),
    Propietario varchar(20),
    Especie varchar(20),
    Sexo varchar (1),
    Nacimiento date,
    Fallecimiento date
);

insert into mascotas values('Fluffy','Arnoldo','Gato','f','1999-02-04',null);
insert into mascotas values('Mau','Juan','Gato','m','1998-03-17',null);
insert into mascotas values('Buffy','Arnoldo','Perro','f','1999-05-13',null);
insert into mascotas values('FanFan','Benito','Perro','m','2000-08-27',null);
insert into mascotas values('Kaiser','Diana','Perro','m','1998-08-31','1997-07-29');
insert into mascotas values('Chispa','Omar','Ave','f','1998-09-11',null);
insert into mascotas values('Wicho','Tomas','Ave',null,'2000-02-09',null);
insert into mascotas values('Skim','Benito','Serpiente','m','2001-04-29',null);
select * from mascotas;
#1 Cambiar fecha de nacimiento de Kaiser a 1989-08-31
update mascotas set nacimiento='1989-08-31' where nombre='kaiser';

#2 Deseamos verificar el cambio que hicimos a la fecha de nacimiento de Kaiser
select nombre,nacimiento from mascotas where nombre='kaiser';

#3 mascotas que nacieron después del 2000
select nombre,propietario from mascotas where nacimiento >='2000-01-01';

#4 nombres y propietarios de perras
select nombre,propietario from mascotas where(especie='perro') and (sexo='f');

#5 nombres y propietarios de perras y gatas
select * from mascotas WHERE (especie = 'Gato' AND sexo = 'f') OR (especie = 'Perro' AND sexo = 'f');

#6 fecha de nacimiento de mascotas
select nombre, especie, nacimiento from mascotas;

#7 propietario de mascota
select nombre,propietario, especie, sexo, nacimiento  from mascotas where nacimiento or null;

#8 fecha nacimiento perros y gatos
select nacimiento, especie from mascotas where especie='Gato' or especie = 'Perro';

#9 mascotas ordenadas por fecha de nacimiento
select nombre, nacimiento from mascotas order by nacimiento;

#10 mascotas ordenadas por fecha de nacimiento inverso
select nombre, nacimiento from mascotas order by nacimiento desc;

#11 mascotas ordenadas por especie y fecha de nacimiento inverso
select nombre, nacimiento from mascotas order by  especie, nacimiento desc;

#12 mascotas cuyo cumpleaños es el próximo mes
select nombre, nacimiento from mascotas where month(nacimiento) = 2;
select * from mascotas where Nacimiento like '____%02%__';-- tambien se puede hacer asi

#13 mascotas que empiezan por B
select nombre from mascotas where nombre like 'b%';

#14 mascotas que terminan por fy
select * from mascotas where nombre like '%fy';

#15 mascotas de cada uno de los propietarios
select propietario, count(*) from mascotas group by propietario;

#16 cantidad de animales por especie
select especie, count(*) from mascotas group by especie;

#17 cantidad de animales por sexo
select especie, count(*) from mascotas group by sexo;

#18 cantidad de animales por combinación de especie y sexo
select especie, sexo, count(*) from mascotas group by especie, sexo;

#19 modifica para ver únicamente los datos de perros y gatos
select especie, sexo, count(*) from mascotas where especie='Perro' or especie='Gato' group by especie, sexo;

#20 mascotas que han fallecido
select * from mascotas where fallecimiento;
