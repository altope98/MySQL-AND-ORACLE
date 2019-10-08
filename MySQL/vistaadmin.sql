show databases;

create database vista;
use vista;

drop table usuarios;
CREATE TABLE usuarios(
id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
nombre varchar(40) NOT NULL,
rango varchar (50) NOT NULL
) ENGINE=INNODB;
 
INSERT INTO usuarios VALUES (null, 'Andrés', 'novato');
INSERT INTO usuarios VALUES (null, 'Luís', 'medio');
INSERT INTO usuarios VALUES (null, 'Juan', 'experto');
 drop table comentarios;
CREATE TABLE comentarios(
id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
usuario_id int(11) NOT NULL,
titulo varchar(40) NOT NULL,
comentario varchar (50) NOT NULL,
FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
) ENGINE=INNODB;
 
INSERT INTO comentarios VALUES (null, 1, 'titulo 1', 'comentario 1');
INSERT INTO comentarios VALUES (null, 2, 'titulo 2', 'comentario 2');
INSERT INTO comentarios VALUES (null, 3, 'titulo 3', 'comentario 3');

SELECT nombre, rango, titulo, comentario
FROM usuarios
INNER JOIN comentarios
ON usuarios.id = comentarios.usuario_id;

CREATE VIEW 
usuarios_comentarios AS 
SELECT usuarios.id,nombre, rango, titulo, comentario 
FROM usuarios 
INNER JOIN comentarios 
ON usuarios.id = comentarios.usuario_id;

select * from usuarios_comentarios;

show tables;


# Crear el usuario vista@localhost password vista
CREATE USER vista@'localhost' IDENTIFIED BY 'vista';

grant select on vista.* to vista@localhost;
flush privileges;
grant all privileges on vista.usuarios to vista@localhost;
flush privileges;
grant all privileges on vista.comentarios to vista@localhost;

grant all privileges on vista.usuarios_comentarios to vista@localhost;

flush privileges;