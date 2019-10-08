create database manufactures;
use manufactures;

CREATE TABLE Manufacturers (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL,
  PRIMARY KEY (Code)   
);

CREATE TABLE Products (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL ,
  Price DECIMAL NOT NULL ,
  Manufacturer INTEGER NOT NULL,
  PRIMARY KEY (Code), 
  FOREIGN KEY (Manufacturer) REFERENCES Manufacturers(Code)
) ENGINE=INNODB;
select * from products;

INSERT INTO Manufacturers(Code,Name) VALUES(1,'Sony');
INSERT INTO Manufacturers(Code,Name) VALUES(2,'Creative Labs');
INSERT INTO Manufacturers(Code,Name) VALUES(3,'Hewlett-Packard');
INSERT INTO Manufacturers(Code,Name) VALUES(4,'Iomega');
INSERT INTO Manufacturers(Code,Name) VALUES(5,'Fujitsu');
INSERT INTO Manufacturers(Code,Name) VALUES(6,'Winchester');

INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(1,'Hard drive',240,5);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(2,'Memory',120,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(3,'ZIP drive',150,4);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(4,'Floppy disk',5,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(5,'Monitor',240,1);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(6,'DVD drive',180,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(7,'CD drive',90,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(8,'Printer',270,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(9,'Toner cartridge',66,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(10,'DVD burner',180,2);

drop table manufacturers;
drop table products;
#1
select name from products;
#2
select name, price from products;
#3
select name from products where price <=200;
#4
select name from products where price between 60 and 120;
select name from products where price >=60 and price <=120;
#5
select name, price*100 as priceincents from products;
#6
select avg(price) as precio_medio from products;
#7
select avg(price) as precio_medio from products where code=2;
#8
select count(*) from products where price >=100;
#9
select name, price from products where price >=180 group by price desc order by name asc;
#10
select * from products, manufacturers where products.manufacturer = manufacturers.code;
#11
select manufacturer, price, manufacturers.name from products,manufacturers where products.manufacturer=manufacturers.code;
#12
select avg(Price), Manufacturer from Products group by Manufacturer;
#13
select avg(price), manufacturers.name from products, manufacturers where products.manufacturer=manufacturers.code group by manufacturer;
#14
select manufacturers.name from products, manufacturers where products.manufacturer=manufacturers.code group by manufacturer having avg(Price) >= 150;
#15
select name, price, min(Price) from Products where price = (select min(price) from products);
select name, price from products order by price asc limit 1;
#16
select products.name, price, manufacturers.name from products, manufacturers where products.manufacturer = manufacturers.code and price =(select max(price)from products where products.manufacturer = manufacturers.code);
#17
insert into products values (11,'Loudspeaker',70,2);
#18
update products set name='impresora laser' where code=8;
#19
update products set price=price-(price*0.10);
#20
update products set price=price-(price*0.10) where price >=120;

select * from products;
show tables from manufactures;  #database manufactures
describe manufacturers;
show databases;
update products set price=price*100;
alter table products rename productos;
delete from products where price=240;