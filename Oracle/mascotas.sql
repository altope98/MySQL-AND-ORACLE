CREATE TABLE mascotas(
  nombre VARCHAR2(20),
  propietario VARCHAR2(20), 
  especie VARCHAR2(20), 
  sexo CHAR(1), 
  nacimiento NVARCHAR2(10), 
  fallecimento NVARCHAR2(10)
);
drop table mascotas;
insert into mascotas (nombre, propietario, especie, sexo, nacimiento, fallecimento) values ('Fluffy','Arnoldo','Gato','f','1999-02-04',null);
insert into mascotas (nombre, propietario, especie, sexo, nacimiento, fallecimento) values ('Mau', 'Juan', 'Gato', 'm', '1998-03-17', null);
insert into mascotas (nombre, propietario, especie, sexo, nacimiento, fallecimento) values ('Buffy', 'Arnoldo', 'Perro', 'f', '1999-05-13', null);
insert into mascotas (nombre, propietario, especie, sexo, nacimiento, fallecimento) values ('FanFan', 'Benito', 'Perro', 'm', '2000-02-09', null);
insert into mascotas (nombre, propietario, especie, sexo, nacimiento, fallecimento) values ('Kaiser', 'Diana', 'Perro', 'm', '1998-08-31', '1997-07-29');
insert into mascotas (nombre, propietario, especie, sexo, nacimiento, fallecimento) values ('Chispa', 'Omar', 'Ave', 'f', '1998-09-11', null);
insert into mascotas (nombre, propietario, especie, sexo, nacimiento, fallecimento) values ('Wicho', 'Tomas', 'Ave', null, '2000-02-09', null);
insert into mascotas (nombre, propietario, especie, sexo, nacimiento, fallecimento) values ('Skim', 'Benito', 'Serpiente', 'm', '2001-04-29', null);

SELECT * FROM MASCOTAS;

/*1.- Cambia la fecha de nacimiento de Kaiser a 1989-08-31*/
update mascotas set nacimiento='1989-08-31' where nombre='Kaiser';

/*2.- Deseamos verificar el cambio que hicimos a la fecha de nacimiento de Kaiser*/
select nombre,nacimiento from mascotas where nombre='Kaiser';

/*3.- Deseamos conocer qué mascotas nacieron después del 2000.*/
select nombre from mascotas where nacimiento >='2000-01-01';

/*4.- Deseamos conocer los nombres y los propietarios de las perras.*/
select nombre,propietario from mascotas where(especie='Perro') and (sexo='f');

/*5.- Deseamos conocer los nombres y los propietarios de las perras y las gatas.*/
select * from mascotas WHERE (especie = 'Gato' AND sexo = 'f') OR (especie = 'Perro' AND sexo = 'f');

/*6.- Deseamos conocer la fecha de nacimiento de nuestras mascotas.*/
select nombre, especie, nacimiento from mascotas;

/*7.- Conocer quién tiene alguna mascota.*/
select nombre,propietario, especie, sexo, nacimiento  from mascotas where nacimiento is not null;

/*8.- Obtener la fecha de nacimiento de los perros y los gatos.*/
select nacimiento, especie from mascotas where especie='Gato' or especie = 'Perro';

/*9.- Nombre de las mascotas ordenadas por fecha de nacimiento*/
select nombre, nacimiento from mascotas order by nacimiento;

/*10.- Nombre de las mascotas ordenadas por fecha de nacimiento en orden inverso.*/
select nombre, nacimiento from mascotas order by nacimiento desc;

/*11.- Nombre de las mascotas ordenadas por especie y fecha de nacimiento en orden inverso.*/
select nombre, nacimiento from mascotas order by  especie, nacimiento desc;

/*12.- Nombre de las mascotas cuyo cumpleaños es el próximo mes.*/
select nombre, nacimiento from mascotas where nacimiento like '%-03-%';

/*13.- Nombre de las mascotas que empiezan por B.*/
select nombre from mascotas where nombre like 'B%';

/*14.- Nombre de las mascotas que terminan por fy.*/
select * from mascotas where nombre like '%fy';

/*15.- Deseamos conocer cuántas mascotas tiene cada uno de los propietarios.*/
select propietario, count(*) from mascotas group by propietario;

/*16.- El número de animales por especie.*/
select especie, count(*) from mascotas group by especie;

/*17.- El número de animales por sexo.*/
select especie, count(*) from mascotas group by sexo, especie;

/*18.- El número de animales por combinación de especie y sexo.*/
select especie, sexo, count(*) from mascotas group by especie, sexo;

/*19.- Modifica la consulta anterior, para ver únicamente los datos de perros y gatos.*/
select especie, sexo, count(*) from mascotas where especie='Perro' or especie='Gato' group by especie, sexo;

/*20.- Lista de las mascotas que han fallecido.*/  
select nombre from mascotas where fallecimento is not null;





