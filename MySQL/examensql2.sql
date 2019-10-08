CREATE DATABASE torrenteperez;

USE torrenteperez;

CREATE TABLE Pieces(
code INT PRIMARY KEY,
name VARCHAR(100)
);


CREATE TABLE Providers(
code VARCHAR(4) PRIMARY KEY,
name VARCHAR(100)
);

CREATE TABLE Provides(
piece INT, 
provider VARCHAR(4),
price INT,
PRIMARY KEY (piece, provider),
foreign key (piece) references pieces(code) on delete cascade on update cascade,
foreign key (provider) references providers(code) on delete cascade on update cascade
);
drop table pieces;
drop table providers;
drop table provides;

INSERT INTO Pieces
(code, name)
VALUES
(1, 'Sprocket'),
(2,'Screw'),
(3, 'Nut'),
(4, 'Bolt');

INSERT INTO Providers
(code, name)
VALUES
('HAL', 'Clarke Enterprises'),
('RBT', 'Susan Calvin Corp.'),
('TNBC', 'Skellington Supplies');

INSERT INTO Provides
(piece, provider, price)
VALUES
(1, 'HAL', 10),
(1, 'RBT', 15),
(2, 'HAL', 20),
(2, 'RBT', 15),
(2, 'TNBC', 14),
(3, 'RBT', 50),
(3, 'TNBC', 45),
(4, 'HAL', 5),
(4, 'RBT', 7);

insert into provides (piece, provider, price) values(1,'TNBC',7);

select * from provides;


select  p.piece,avg(price) from pieces join provides p on pieces.code=p.piece group by p.piece;

select distinct (providers.name),pieces.name from providers join pieces join provides p on pieces.code=p.piece and providers.code=p.provider where pieces.name='Sprocket';

select distinct (providers.name),pieces.name from providers join pieces join provides p on pieces.code=p.piece and providers.code=p.provider where p.piece=1;

select pieces.name from providers join pieces join provides p on pieces.code=p.piece and providers.code=p.provider where providers.code='HAL';


select distinct (providers.name),pieces.name from providers join pieces join provides p on pieces.code=p.piece and providers.code=p.provider where p.piece=1;


select providers.name, p.piece from providers left join provides p on providers.code=p.provider where p.piece is null;


select distinct (providers.name),pieces.name,count(p.provider) as 'Numero de piezas'from providers join provides p join pieces on providers.code=p.provider and pieces.code=p.piece group by pieces.name where count;

select pieces.name,providers.name,max(provides.price) as 'precio maximo'from pieces join providers join provides on pieces.code=provides.piece and providers.code=provides.provider group by pieces.name;









