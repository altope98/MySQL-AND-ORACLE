create database cientificos;
use cientificos;

create table cientifico(
	DNI int,
    Nombre varchar(20),
    Apellido varchar(20),
    FechaNaciemiento varchar(20),
    primary key (DNI)
    );
    
create table proyecto(
	Codigo varchar(1),
    Nombre varchar(20),
    Horas int,
    primary key (Codigo)
    );

create table asignado(
	DNI int,
    Codigo varchar(1),
    foreign key (DNI) references cientifico(DNI),
    foreign key (Codigo) references  proyecto(Codigo)
    );

insert into cientifico values
(1,'Maria','Guzman','1974-02-12'),
(2,'Maria','Jimenez','1954-02-11'),
(3,'Rafael','Girado','1964-01-22'),
(4,'Alonso','Gomez','1990-12-12'),
(5,'Clara','Antunez','1973-11-12');
insert into proyecto values
('A','Bioquimica',410),
('B','Electroquimica',1200),
('C','Geologica',300),
('D','Tectonica',500),
('E','Histograma',70);
insert into asignado values
(1,'A'),
(1,'B'),
(1,'C'),
(2,'A'),
(3,'A'),
(2,'B'),
(4,'C'),
(4,'A'),
(4,'B'),
(4,'E'),
(4,'D');


select * from asignado;
select * from proyecto;
select * from cientifico;

# Relación completa de los científicos asignados a cada proyecto. Mostrar DNI, Nombre del científico, Identificador del proyecto y nombre del proyecto.
SELECT 
    cientifico.DNI,
    cientifico.nombre,
    proyecto.codigo,
    proyecto.nombre
FROM
    cientifico
        JOIN
    asignado
        JOIN
    proyecto 
    ON asignado.DNI = cientifico.DNI
	AND asignado.codigo = proyecto.codigo;
# Obtener el número de proyectos al que está asignado cada científico (mostrar el DNI y el nombre)
select cientifico.DNI,cientifico.nombre,count(proyecto.codigo) from cientifico join proyecto join asignado on proyecto.codigo=asignado.codigo and cientifico.dni=asignado.dni group by dni;

#Obtener el número de científicos asignados a cada proyecto (mostrar el identificador del proyecto y el nombre del proyecto)
select proyecto.codigo, proyecto.nombre, count(cientifico.dni) from cientifico join proyecto join asignado on proyecto.codigo=asignado.codigo and cientifico.dni=asignado.dni group by codigo;

#Obtener el número de dedicación de cada científico
select cientifico.nombre, horas from cientifico join proyecto join asignado on proyecto.codigo=asignado.codigo and cientifico.dni=asignado.dni order by nombre;     #

#Obtener el DNI y el nombre de los científicos que se dedican a más de un proyecto y cuya dedicación media a cada proyecto sea superior a las 80 horas.			#
select cientifico.dni, cientifico.nombre from cientifico join proyecto join asignado on proyecto.codigo=asignado.codigo and cientifico.dni=asignado.dni having count(proyecto)=(select count(*) from proyecto);   #

#Nombre del científico que trabaja en todos los proyectos.	#
select cientifico.nombre from cientifico left outer join asignado using(codigo) where codigo is not null group by nombre;


#Nombre del científico que no trabaja en ningún proyecto    #
select cientifico.nombre from cientifico left outer join proyecto using(codigo) where codigo is null;




