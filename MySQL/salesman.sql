create database salesman;
use salesman;
drop table salesman;
create table salesman (  #vendedor
Salesman_id int,
Name varchar (30),
City varchar (15),
Commission decimal (5,2),
primary key (salesman_id)
);
drop table customer;
create table customer (   #cliente
Customer_id int,
Cust_name varchar (30),
City varchar(15),
Grade int,
Salesman_id int,
primary key (customer_id)
);

drop table orders;  #pedidos
create table orders (
Ord_no int,
Purch_amt decimal (8,2),
Ord_date date,
Customer_id int,
Salesman_id int,
primary key (Ord_no),
foreign key (salesman_id) references salesman(salesman_id) on delete cascade on update cascade,
foreign key (customer_id) references customer(customer_id) on delete cascade on update cascade
);


insert into Salesman values
	(5001,'James Hoog','New York',0.15),
	(5002,'Nail Knite','Paris',0.13),
	(5005,'Pit Alex','London',0.11),
	(5006,'Mc Lyon','Paris',0.14),
	(5003,'Lauson Hen','San Jose',0.12),
	(5007,'Paul Adam','Rome',0.13);

insert into Customer values
	(3002,'Nick Rimando','New York',100,5001),
	(3005,'Graham Zusi','California',200,5002),
	(3001,'Brad Guzan','London',100,5005),
	(3004,'Fabian Johns','Paris',300,5006),
	(3007,'Brad Davis','New York',200,5001),
	(3009,'Geoff Camero','Berlin',100,5003),
	(3008,'Julian Green','London',300,5002),
	(3003,'Jozy Altidor','Moncow',200,5007);

insert into Orders values
	(70001,150.5,'2012-10-05',3005,5002),
	(70009,270.65,'2012-09-10',3001,5005),
	(70002,65.26,'2012-10-05',3002,5001),
	(70004,110.5,'2012-08-17',3009,5003),
	(70007,948.5,'2012-09-10',3005,5002),
	(70005,2400.6,'2012-07-27',3007,5001),
	(70008,5760,'2012-09-10',3002,5001),
	(70010,1983.43,'2012-10-10',3004,5006),
	(70003,2480.4,'2012-10-10',3009,5003),
	(70012,250.45,'2012-06-27',3008,5002),
	(70011,75.29,'2012-08-17',3003,5007),
	(70013,3045.6,'2012-04-25',3002,5001);


#1.- Escribir una declaración de SQL para preparar una lista con el nombre del vendedor,
# el nombre del cliente y sus ciudades para los vendedores y clientes que pertenecen a la misma ciudad.

Select distinct salesman.name, customer.cust_name, salesman.city, customer.city
FROM customer join salesman join orders
on salesman.Salesman_id=orders.Salesman_id
and orders.Customer_id= customer.Customer_id
where salesman.city=customer.city;

#2.- Escriba una declaración de SQL para hacer una lista con el número de orden, el monto de la compra, el nombre del cliente y 
#sus ciudades para aquellos pedidos cuya cantidad entre 500 y 2000.

select orders.Ord_no, orders.Purch_amt,salesman.name, customer.city
from salesman join customer join orders
on salesman.Salesman_id=orders.Salesman_id
and orders.Customer_id= customer.Customer_id
where orders.Purch_amt between 500 and 2000;


#3.- Escribe una declaración SQL para saber qué vendedor está trabajando para qué cliente.

select salesman.name, customer.Cust_name
from salesman join customer join orders
on salesman.Salesman_id=orders.Salesman_id
and orders.Customer_id= customer.Customer_id;


#4.- Escribir una declaración de SQL para encontrar la lista de clientes que designó a un vendedor para sus trabajos,
#quien recibe una comisión de la compañía es más del 12%.

select customer.Cust_name, salesman.name, customer.city, salesman.Commission
from customer inner join salesman join orders
on salesman.Salesman_id=orders.Salesman_id
and orders.Customer_id= customer.Customer_id
where commission >0.12;

#5.- Escriba una declaración de SQL para encontrar la lista de clientes que designó a un vendedor para sus trabajos que no vive en la misma ciudad donde vive el cliente,
# y obtiene una comisión superior al 12%.

select distinct customer.Cust_name, salesman.name, customer.city, salesman.Commission
from customer inner join salesman join orders
on salesman.Salesman_id=orders.Salesman_id
and orders.Customer_id= customer.Customer_id
where commission >0.12
and customer.city <> salesman.city;

#6.- Escriba una declaración de SQL para encontrar los detalles de un pedido, es decir, número de orden, 
#fecha de pedido, cantidad de pedido, qué cliente le da el pedido y qué vendedor trabaja para ese cliente y cuánta comisión obtiene por un pedido.

SELECT orders.ord_no,orders.ord_date,orders.purch_amt,
customer.cust_name, customer.grade, 
salesman.name, salesman.commission 
from customer inner join salesman join orders
on salesman.Salesman_id=orders.Salesman_id
and orders.Customer_id= customer.Customer_id;

#7.- Escribir una declaración de SQL para hacer una unión dentro de las tablas vendedor, 
#cliente y pedidos de tal forma que la misma columna de cada tabla aparezca una sola vez y solo vendrán las filas relacionales.   #no se sabe como funciona

select * 
from orders 
natural join customer  
natural join salesman;

#8.- Escribir una instrucción SQL para hacer una lista en orden ascendente para el cliente que trabaja ya sea a través de un vendedor o por propia cuenta.

select distinct customer.Cust_name, salesman.name
from customer join salesman join orders
on salesman.Salesman_id=orders.Salesman_id
and orders.Customer_id= customer.Customer_id;

#9.- Escribir una declaración de SQL para hacer una lista en orden ascendente para el cliente que posee una calificación inferior a 300        #corregido
#y trabaja a través de un vendedor o por cuenta propia.

select distinct customer.Cust_name,customer.city,customer.grade, 
salesman.name, salesman.city 
from customer join salesman join orders
on salesman.Salesman_id=orders.Salesman_id
and orders.Customer_id= customer.Customer_id
where customer.grade<300;


#10.- Escriba una declaración de SQL para generar un informe con el nombre del cliente, la ciudad, el número de pedido,
# la fecha del pedido y el importe del pedido en orden ascendente de acuerdo con la fecha del pedido para descubrir que ninguno de los clientes 
# existentes ha realizado un pedido o colocado uno o más pedidos.

select customer.Cust_name, customer.city, orders.Ord_no, orders.Ord_date, orders.Purch_amt
from customer join orders join salesman
on salesman.Salesman_id=orders.Salesman_id
and orders.Customer_id= customer.Customer_id
order by orders.Ord_date asc;


#11.- Escribir una declaración de SQL para generar un informe con el nombre del cliente, ciudad,
 #número de pedido, fecha de pedido, nombre del vendedor y comisión de la orden para encontrar que cualquiera de los clientes existentes no
 #ha realizado ningún pedido o colocado uno o más pedidos por su cuenta. vendedor o por cuenta propia.

select distinct customer.Cust_name, customer.city, orders.Ord_no, orders.Ord_date, salesman.name, salesman.Comission
from customer left outer join orders
on orders.Customer_id= customer.Customer_id
left outer join salesman
on salesman.salesman_id=orders.salesman_id
where orders.ord_no is not null;


#12.- Escribir una declaración de SQL para hacer una lista en orden ascendente para los vendedores que trabajan ya sea para 
#uno o más clientes o que aún no se han unido a ninguno de los clientes.

select distinct customer.Cust_name, salesman.city, salesman.name, customer.grade, customer.city
from customer join orders right outer join salesman 
on salesman.Salesman_id=orders.Salesman_id
and orders.Customer_id= customer.Customer_id
group by salesman.name;


#13.- Escriba una declaración SQL para hacer una lista para los vendedores que trabajan para uno o más clientes o que aún no
 #se han unido bajo ninguno de los clientes que realizaron uno o más pedidos o ningún pedido a su proveedor.

select  salesman.name, customer.Cust_name, customer.city, customer.Grade, orders.Ord_no, orders.Ord_date, orders.Purch_amt
from customer right join orders 
on orders.Customer_id= customer.Customer_id
right  join salesman
on salesman.Salesman_id=orders.Salesman_id
group by salesman.name;


#14.- Escribir una declaración de SQL para hacer una lista para los vendedores que trabajan para uno o más clientes o aún para
 #unirse a cualquiera de los clientes. El cliente, puede haber realizado, ya sea uno o más pedidos en o por encima del importe 
# de la orden 2000 y debe tener una calificación, o puede que no haya realizado ningún pedido al proveedor asociado.

select customer.Cust_name, salesman.name, customer.city, customer.Grade, orders.Ord_no, orders.Ord_date, orders.Purch_amt
from customer right outer join orders 
on orders.Customer_id= customer.Customer_id
right  join salesman
on salesman.Salesman_id=orders.Salesman_id
where orders.Purch_amt >=2000
and customer.grade is not null;

#15.- Escribe una declaración SQL para hacer un informe con el nombre del cliente, ciudad, orden no. fecha de pedido,
 #importe de compra para aquellos clientes de la lista existente que realizaron uno o más pedidos o qué orden (es) 
 #han sido colocados por el cliente que no están en la lista.
 
 select customer.Cust_name, customer.city, orders.Ord_no, orders.Ord_date, orders.Purch_amt
 from customer join orders join salesman
 on salesman.Salesman_id=orders.Salesman_id
and orders.Customer_id= customer.Customer_id;
 

#16.- Escribe una declaración SQL para hacer un informe con el nombre del cliente, ciudad, orden no. fecha de pedido, 
#cantidad de compra solo para aquellos clientes en la lista que deben tener una calificación y colocaron uno o más pedidos 
#o qué orden (es) han sido colocados por el cliente que no están en la lista y no tienen una calificación.

select customer.Cust_name, customer.city, orders.Ord_no, orders.Ord_date, orders.Purch_amt
from customer left join orders
on orders.Customer_id= customer.Customer_id
where customer.grade is not null
union
select customer.cust_name, customer.city, orders.Ord_no, orders.Ord_date, orders.Purch_amt
from customer right join orders
on orders.Customer_id= customer.Customer_id
where customer.grade is not null;     # para que sea una outer tienen que tener el mismo numero de columnas y el tipo de columnas


#17.- Escriba una declaración SQL para hacer un producto cartesiano entre el vendedor y el cliente, es decir, 
#cada vendedor aparecerá para todos los clientes y viceversa.

select * from salesman cross join customer cross join orders
on customer.customer_id=orders.customer_id
and salesman.salesman_id=orders.salesman_id;

#18.- Escriba una declaración SQL para hacer un producto cartesiano entre el vendedor y el cliente, es decir, 
#cada vendedor aparecerá para todos los clientes y viceversa para los clientes que pertenecen a una ciudad.

select *
from salesman
cross join customer
where salesman.city is not null;


#19.- Escribir una declaración de SQL para hacer un producto cartesiano entre el vendedor y el cliente, es decir,
 #cada vendedor aparecerá para todos los clientes y viceversa para aquellos vendedores que pertenecen a una ciudad y los clientes que deben tener una calificación.

select *
from salesman
cross join customer
where salesman.city is not null
and customer.grade is not null;

#20.- Escribir una declaración SQL para hacer un producto cartesiano entre el vendedor y el cliente, es decir,
 #cada vendedor aparecerá para todos los clientes y viceversa para aquellos vendedores que deben pertenecer a una ciudad que no 
 #es la misma que su cliente y los clientes deben tener una propia grado.
 
 select *
 from salesman
 cross join customer
 where salesman.city is not null
 and customer.grade is not null
 and salesman.city <> customer.city;
 
 


