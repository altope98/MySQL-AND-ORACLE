select * from emp;

SET SERVEROUTPUT ON;
declare 
ename emp.ename%type;
job emp.job%type;

cont int:=1;

cursor ejemplo is select ename,job from emp;

begin
open ejemplo;
loop
fetch ejemplo into ename, job;
exit when ejemplo%notfound;
DBMS_OUTPUT.PUT_LINE(ename ||''|| job );
cont:=cont+1;
end loop;
close ejemplo;
DBMS_OUTPUT.PUT_LINE('El numero de empleados es:'|| cont );

end;

--Sobre la tabla empleado hacer un cusor y que diga cuantas categorias de trabajos hay

SET SERVEROUTPUT ON;
DECLARE
  ename emp.ename%TYPE;
  job emp.job%TYPE;
  presi INT:=0;
  manager INT:=0;
  analyst INT:=0;
  clerk INT:=0;
  salesman INT:=0;
  ordenanza INT:=0;
  
  CURSOR tipo_trabajador IS
    SELECT ename,job
    FROM emp;
  
BEGIN
  OPEN tipo_trabajador;
  
  LOOP
    FETCH tipo_trabajador INTO ename,job;
    EXIT WHEN tipo_trabajador%NOTFOUND;
    IF job = 'PRESIDENT' THEN
      presi:=presi+1;
    ELSIF job = 'MANAGER' THEN
      manager:=manager+1;
    ELSIF job = 'ANALYST' THEN
      analyst:=analyst+1;
    ELSIF job = 'CLERK' THEN
      clerk:=clerk+1;
    ELSIF job = 'SALESMAN' THEN
      salesman:=salesman+1;      
    ELSIF job = 'ORDENANZA' THEN
      ordenanza:=ordenanza+1;
    END IF;
  END LOOP;
  
  CLOSE tipo_trabajador;
  DBMS_OUTPUT.PUT_LINE('Hay '||presi||' presidente.');
  DBMS_OUTPUT.PUT_LINE('Hay '||manager||' managers.');
  DBMS_OUTPUT.PUT_LINE('Hay '||analyst||' analistas.');
  DBMS_OUTPUT.PUT_LINE('Hay '||clerk||' oficinistas.');
  DBMS_OUTPUT.PUT_LINE('Hay '||salesman||' vendedores.');
  DBMS_OUTPUT.PUT_LINE('Hay '||ordenanza||' ordenanzas.');
  
END;

--Realizar un cursor que aumente el sueldo de los empleados de la siguiente forma:
--  - si el empleado pertenece al departamento con codigo 10, se le aumenta 5%
--  - si el empleado pertenece al departamento con codigo 20, se le aumenta 7.5%
--  - si el empleado pertenece al departamento con codigo 30, se le aumenta 10%

set serveroutput on;
declare
empno emp.empno%type;
salario emp.sal%type;
deptno emp.deptno%type;


CURSOR codigo IS
    SELECT empno,deptno,sal
    FROM emp for update;
begin
open codigo;
 LOOP
    FETCH codigo INTO empno,deptno,salario;
    EXIT WHEN codigo%NOTFOUND;
    if deptno=10
    then
    salario:=salario*1.05;
    else
    if deptno=20
    then
    salario:=salario*1.075;
    else
    if deptno=30
    then
    salario:=salario*1.10; 
    END IF;
    end if;
    end if;
    DBMS_OUTPUT.PUT_LINE('El empleado '||empno||' perteneciente al departamento '||deptno||' se queda con el sueldo de '||salario);
    update emp set sal=salario where current of codigo;
  END LOOP;
  CLOSE codigo;
END;

select * from emp;

--Crear una funcion total_empleados que nos devuleva el numero de empleados que tiene

create or replace function totalEmpleado
return number
is
  total number(2) :=0;
begin
  select count(*) into total
  from emp;
  
  return total;
end;
--Llamar a una funcion
SET SERVEROUTPUT ON;
declare
  c number(2);
begin
   c :=totalEmpleado();
   DBMS_OUTPUT.PUT_LINE('Total no. of Empleado: ' || c);
end;

--Funcion:sumasueldos que devuelva la suma total de todos los sueldos de los empelados.
create or replace function sumaSueldos
return number
is
  suma number:=0;
begin
  select sum(sal) into suma
  from emp;
  
  return suma;
end;
--Llamar a la funcion sumasueldos
SET SERVEROUTPUT ON;
declare
  s number;
begin
   s :=sumaSueldos();
   DBMS_OUTPUT.PUT_LINE('La suma total de los empleados es:  ' || s);
end;
--Realizar funcion que se llame sumaSueldosDepartamento y que sume los sueldos del departamento
create or replace function sumaSueldosDepartamento (departamento INT)
return number
is
  suma number:=0;
  
begin
  select sum(sal) into suma
  from emp where deptno=departamento;
  
  return suma;
end;

SET SERVEROUTPUT ON;
declare
  s number;
  departamento int:=0;
begin
    departamento:=&Ingresa_numero_de_departamento;
   s :=sumaSueldosDepartamento(departamento);
   DBMS_OUTPUT.PUT_LINE('La suma total de los empleados pertenecientes al departamento '||departamento||' es:  ' || s);
end;

--Crear procedimeinto subirsueldoDEPTO que dado un numero de departamento y un numero entre 0 y 100 suba el sueldo de los empleados de ese departamento ese tanto porciento
create or replace procedure subirsueldoDEPTNO (departamento INT,porcentaje INT)
is
begin
  update emp set sal=sal+(sal*porcentaje)/100 where deptno=departamento;
end;

SET SERVEROUTPUT ON;
declare
departamento int:=0;
porcentaje int:=0;
begin
    departamento:=&Ingresa_numero_de_departamento;
    porcentaje:=&Ingrese_porcentaje_De_subida;  
    subirsueldoDEPTNO(departamento,porcentaje);
end;

--Crear funcion que saque el factorial de un  umero
create or replace function factorial (numero int)
return int
is
    factorial int:=1;
    i int:=0;
begin
    while i<=numero
    loop
    i:=i+1;
    factorial:=factorial*i;
  end loop;
  return factorial;
end;

SET SERVEROUTPUT ON;
declare
numero int:=0;
numerofactorial int:=0;
begin
    numero:=&Ingresa_numero;
    numerofactorial:=factorial(numero);
    DBMS_OUTPUT.PUT_LINE('Factorial de '||numero||' es:  ' || numerofactorial);
end; 

--Booleano que haga una funcion
create or replace procedure bajarsueldoDEPTNO (departamento int,porcentaje int)
is
begin
  update emp set sal=sal-(sal*porcentaje)/100 where deptno=departamento;
end;

create or replace procedure booleana(decision int,departamento int,porcentaje int)
is
begin
    if decision = 1
    then
        subirsueldoDEPTNO(departamento,porcentaje);
    else
    if decision = 0
    then
        bajarsueldoDEPTNO(departamento,porcentaje);
    end if;
    end if;
end;

SET SERVEROUTPUT ON;
declare
decision int:=0;
departamento int:=0;
porcentaje int:=0;
begin
    decision:=&Ingresa_1_para_subir_sueldo_y_0_para_decrementar;
    departamento:=&Ingresa_numero_de_departamento;
    porcentaje:=&Ingrese_porcentaje_De_subida; 
    booleana(decision,departamento,porcentaje);
end;
drop table emp;
select * from emp;