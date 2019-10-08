create table empleado(
dni int primary key,
nombre varchar2(20),
apellido varchar2(20),
direccion varchar2(50));

insert into empleado values(1,'Pepe','Arcos','Calle Alta');
insert into empleado values(2,'Maria','Cuevas','Calle Baja');


SET SERVEROUTPUT ON;
DECLARE
mensaje VARCHAR(50);
BEGIN
mensaje:='Hola Mundo';
dbms_output.put_line(mensaje);
EXCEPTION
WHEN OTHERS THEN
dbms_output.put_line('Chungo');
END;


SET SERVEROUTPUT ON;
DECLARE
A VARCHAR(10) := '';
Fecha date;
nombre varchar2(20);
BEGIN
SELECT TO_CHAR(SYSDATE) INTO A FROM DUAL;
select sysdate into fecha from dual;
DBMS_OUTPUT.PUT_LINE('LA FECHA ACTUAL ES : ' || A);
DBMS_OUTPUT.PUT_LINE('LA FECHA ACTUAL ES : ' || fecha);
select empleado.nombre into nombre from empleado where direccion = 'Calle Alta';
DBMS_OUTPUT.PUT_LINE('EL NOMBRE ES : ' || nombre);
EXCEPTION
WHEN OTHERS THEN 
DBMS_OUTPUT.PUT_LINE('HOLA');
END;





set serveroutput on
declare
numero1 float;
numero2 float;
suma float;
begin
numero1:= &Ingrese_el_primer_valor;
numero2:=&Ingrese_el_segundo_valor;
suma:= (numero1 + numero2);
DBMS_OUTPUT.put_line('La suma de ' || numero1 || ' y ' || numero2 || ' es igual a: ' || suma);

if (numero1>numero2)then
    DBMS_OUTPUT.put_line('El numero ' || numero1 || ' es mayor que el numero ' || numero2);
    else 
    DBMS_OUTPUT.put_line('El numero ' || numero2 || ' es mayor que el numero ' || numero1);
    end if;

exception
when others then dbms_output.put_line('Error');
end;


--Realizar un programa que muestre los 100 primeros numeros
set serveroutput on;
declare contador int:=0;
begin
loop
    contador:=contador+1;
    DBMS_OUTPUT.put_line(contador);
    exit when contador > 99;
end loop;
exception
when others then dbms_output.put_line('Error');
end;
    

--Pide numero y que escriba los 50 multiplos (for)
set serveroutput on;
declare 
numero int;
contador int;
begin
numero:= &Ingrese_el_primer_valor;
for contador in 1..50
loop
    DBMS_OUTPUT.put_line(numero*contador);
end loop;
exception
    when others then dbms_output.put_line('Error');
end;

--Ponga los 100 primeros multiplos de 5 (while)

set serveroutput on;
declare
contador int:=1;
begin
while contador<=100 loop
   
 DBMS_OUTPUT.put_line(5*contador);
  contador:=contador+1;
 end loop;
 exception
    when others then dbms_output.put_line('Error');
end;


--Introduce DNI y devuelve la letra del DNI (case)































