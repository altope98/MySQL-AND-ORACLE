create database computerfirm;
use computerfirm;

CREATE TABLE product (
    maker VARCHAR(10),
    model VARCHAR(50),
    type VARCHAR(50),
    PRIMARY KEY (model)
);
desc product;
SELECT 
    *
FROM
    product;

CREATE TABLE PC (
    code INT,
    model VARCHAR(50),
    speed SMALLINT,
    ram SMALLINT,
    hd REAL,
    cd VARCHAR(10),
    price INT,
    PRIMARY KEY (code),
    FOREIGN KEY (model)
        REFERENCES product (model)
);
desc PC;
SELECT 
    *
FROM
    PC;


CREATE TABLE laptop (
    code INT,
    model VARCHAR(50),
    speed SMALLINT,
    ram SMALLINT,
    hd REAL,
    price INT,
    screen TINYINT,
    PRIMARY KEY (code),
    FOREIGN KEY (model)
        REFERENCES product (model)
);
desc laptop;
SELECT 
    *
FROM
    laptop;

CREATE TABLE printer (
    code INT,
    model VARCHAR(50),
    color CHAR(1),
    type VARCHAR(10),
    price INT,
    PRIMARY KEY (code),
    FOREIGN KEY (model)
        REFERENCES product (model)
);
desc printer;
SELECT 
    *
FROM
    pinter;


insert into product values
('A','1232','PC'),
('A','1233','PC'),
('A','1276','Printer'),
('A','1298','Laptop'),
('A','1401','Printer'),
('A','1408','Printer'),
('A','1752','Laptop'),
('B','1121','PC'),
('B','1750','Laptop'),
('C','1321','Laptop'),
('D','1288','Printer'),
('D','1433','Printer'),
('E','1260','PC'),
('E','1434','Printer'),
('E','2112','PC'),
('E','2113','PC');


insert into pc values
('1','1232',500,64,5.0,'12x',600),
('10','1260',500,32,10.0,'12x',350),
('11','1233',900,128,40.0,'40x',980),
('12','1233',800,128,20.0,'50x',970),
('2','1121',750,128,14.0,'40x',850),
('3','1233',800,64,5.0,'12x',600),
('4','1121',600,128,14.0,'40x',850),
('5','1121',600,128,8.0,'40x',850),
('6','1233',750,128,20.0,'50x',950),
('7','1232',500,32,10.0,'12x',400),
('8','1232',450,64,8.0,'24x',350),
('9','1232',450,32,10.0,'24x',350)
;


insert into laptop values
(1,'1298',350,32,4.0,700,11),
(2,'1321',500,64,8.0,970,12),
(3,'1750',750,128,12.0,1200,14),
(4,'1298',600,64,10.0,1050,15),
(5,'1752',750,128,10.0,1150,14),
(6,'1298',450,64,10.0,950,12)
;


insert into printer values
(1,'1276','n','laser',400),
(2,'1433','y','jet',270),
(3,'1434','y','jet',290),
(4,'1401','n','matrix',150),
(5,'1408','n','matrix',270),
(6,'1288','n','laser',400)
;

#1 numero de modelo,velocidad y capacidad para los PC por debajo de 500€
SELECT 
    model, speed, hd
FROM
    PC
WHERE
    price <= 500;

#2 


#3 modelo,ram,screen para los laptops de mas de 1000€
SELECT 
    model, ram, screen
FROM
    laptop
WHERE
    price >= 1000;


#4 modelo,velocidad,capacidad de las PC que tienen 12 CD y precios inferiores a 600€ y cd de 24 y menos de 600€
SELECT 
    model, speed, hd
FROM
    PC
WHERE
    (cd = 12 AND price <= 600) ;
    
#5 
