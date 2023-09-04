SET SERVEROUTPUT ON

DROP TABLE PERSONA;

CREATE TABLE PERSONA (
    ID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    NOMBRE VARCHAR2(100),
    EDAD INT
);

DROP TABLE USUARIOS;
CREATE TABLE USUARIOS (
    ID_USUARIOS NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    EMAIL VARCHAR2(100),
    PASSSWORD VARCHAR2(100)
);

CREATE OR REPLACE PROCEDURE oc_create (
    u_email IN USUARIOS.EMAIL%TYPE,
    u_password IN USUARIOS.PASSSWORD%TYPE
)
AS
BEGIN
    INSERT INTO USUARIOS (EMAIL, PASSSWORD)
    VALUES (u_email, u_password);
    COMMIT;
END;


SELECT * FROM  USUARIOS;

SELECT * FROM  PERSONA;

UPDATE PERSONA SET EDAD = 20;

INSERT INTO PERSONA (NOMBRE, EDAD)  VALUES ('WALTHER', 20);

-- Tipos Variables
-- Las variables son nombres que se le ponen a un �rea de almacenamiento, se utlizan para almacenar y manipular valores dentro de un bloque de code.
-- Las constantes son como las variables, la diferencia radica en que su valor no var�a.
-- Bloque de Code in PLSQL
 
DECLARE

EDAD NUMBER := 20;
NOMBRE VARCHAR2(20) := 'WALTHER JOANDER';
APELLIDO CHAR(30) := 'OLIVO';
SUELDO DECIMAL := 200.00;
FECHA DATE:= TO_DATE('2022/07/15', 'YYYY/MM/DD');
FECHA_ DATE := TO_DATE('2022/07/15 10:59:39', 'YYYY/MM/DD HH24:MI:SS');
STATUS VARCHAR2(20) default 'AVAILABLE';
TODAY  DATE := (SYSDATE);
ESTADO_CIVIL CONSTANT VARCHAR2(20) := 'SOLTERO';

BEGIN

DBMS_OUTPUT.PUT_LINE('EL MUCHACHO SE LLAMA: ' || NOMBRE);
DBMS_OUTPUT.PUT_LINE('EL MUCHACHO SE APELLIDA: ' || APELLIDO);
DBMS_OUTPUT.PUT_LINE('AGE: ' || EDAD);
DBMS_OUTPUT.PUT_LINE('EL SUELDO EN SASF ES DE: ' || SUELDO);
DBMS_OUTPUT.PUT_LINE('FECHA: ' ||  fecha);
DBMS_OUTPUT.PUT_LINE('FECHA_: ' ||  fecha_);
DBMS_OUTPUT.PUT_LINE('TODAY: ' ||  TODAY);
DBMS_OUTPUT.PUT_LINE('STATUS: ' ||  STATUS);

END;


-- Condicionales
-- Son estructuras de toma de decisiones, puedes utilizar las sentencias IF-THEN-ELSE para implementar l�gica condicional en tus procedimientos, funciones o bloques an�nimos.
-- Los condicionales son; IF, ELSIF y ELSE, el condicional if se cierra con el ENDIF.

DECLARE
    EDAD NUMBER := 5;
BEGIN
    IF EDAD >= 18 THEN
        DBMS_OUTPUT.PUT_LINE('ES MAYOR DE EDAD.');
    ELSIF edad < 10 THEN
        DBMS_OUTPUT.PUT_LINE('ES UN NI�O.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('ES MENOR DE EDAD.');
    END IF;
END;

-- Bucles 
-- FOR 
DECLARE
   -- CONTADOR NUMBER;
BEGIN
    FOR CONTADOR IN -10..5 LOOP
        DBMS_OUTPUT.PUT_LINE('ITERACI�N: ' || CONTADOR);
    END LOOP;
END;

DECLARE
    CONTADOR NUMBER := 1;
BEGIN
    FOR CONTADOR IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('ITERACI�N: ' || CONTADOR);
    END LOOP;
END;

-- WHILE 

DECLARE
    CONTADOR NUMBER := 1;
BEGIN
    WHILE CONTADOR <= 5 LOOP
        DBMS_OUTPUT.PUT_LINE('ITERACI�N: ' || CONTADOR);
        CONTADOR := CONTADOR + 1;
    END LOOP;
END;


-- LOOP
DECLARE
    valor NUMBER := 1;
BEGIN
    loop
        DBMS_OUTPUT.PUT_LINE('Iteraci�n: ' || valor);
        valor := valor + 1;
        if valor = 6 then
        exit;
        end if;
    END LOOP;
END;

-- M�todos STRINGS
-- UPPER: Convierte una cadena en may�sculas.
-- LOWER: Convierte una cadena en min�sculas.

DECLARE
   texto VARCHAR2(100) := 'h0La mundo';
   texto2 VARCHAR2(100) := 'hola mundo';

BEGIN
   texto := UPPER(texto);
   texto2 := LOWER(texto2);
   DBMS_OUTPUT.PUT_LINE(texto);
   DBMS_OUTPUT.PUT_LINE(texto2); 
END;

-- INITCAP: Convierte la primera letra de cada palabra en may�scula y el resto en min�sculas.
DECLARE
   texto VARCHAR2(100) := 'hola mundo';
BEGIN
   texto := INITCAP(texto);
   DBMS_OUTPUT.PUT_LINE(texto); -- Salida: Hola Mundo
END;

-- SUBSTR: Obtiene una subcadena de la cadena original, debes pasar por parametros la posici�n del inicio y el final de la extracci�n.

DECLARE
   texto VARCHAR2(100) := 'Hola Mundo';
   subcadena VARCHAR2(10);
BEGIN
   subcadena := SUBSTR(texto, 1, 4);
   DBMS_OUTPUT.PUT_LINE(subcadena); -- Salida: Hola
END;

-- INSTR: Busca la posici�n de una subcadena dentro de otra cadena y muestra la posici�n.
DECLARE
   texto VARCHAR2(100) := 'Hola Mundo';
   posicion NUMBER;
BEGIN
   posicion := INSTR(texto, 'd');
   DBMS_OUTPUT.PUT_LINE(posicion); -- Salida: 6
END;

-- RTRIM, LTRIM, TRIM: Eliminan espacios en blanco (u otro car�cter especificado) al final (RTRIM), al principio (LTRIM) o tanto al principio como al final (TRIM) de una cadena.
DECLARE
   texto VARCHAR2(100) := '**Hola Mundo**';
BEGIN
   DBMS_OUTPUT.PUT_LINE(RTRIM(texto, '*'));
   DBMS_OUTPUT.PUT_LINE(LTRIM(texto, '*'));
   DBMS_OUTPUT.PUT_LINE(TRIM( '*' FROM texto));

END;

-- Bucles anidados

DECLARE
   bucle1 NUMBER := 0;
   bucle2 NUMBER;

BEGIN
   LOOP
      DBMS_OUTPUT.PUT_LINE( '---');
      DBMS_OUTPUT.PUT_LINE( 'Bucle externo ' || bucle1);
      DBMS_OUTPUT.PUT_LINE( '---');
      bucle2 := 0;
        loop
        dbms_output.put_line('Valor del bucle anidado' || bucle2);
        bucle2:= bucle2 + 1;
        exit when bucle2=5;
    end loop;
    bucle1:= bucle1 +1;
    exit when bucle1=3;
   END LOOP;
END;

-- MATRICES
-- En Oracle el �ndice inicial para un array o matriz es siempre 1.
-- Inicializas el array utilizando el m�todo constructor del tipo varray.
-- Los arrays o matrices sin unidimensionales en PLSQL.


declare 
 type countries is varray(2) of varchar2(10);
 names_ countries;
 
BEGIN
    names_ := countries('ECU', 'BRA');
    FOR f  in 1..2 loop
    dbms_output.put_line('Countries ' || names_(f));

    end loop;
   
END;



-- PROCEDURES
-- Es un conjunto de instrucciones que se pueden llamar desde otras consultas o desde otros procedimientos almacenados.

-- TIPOS
-- A nivel de esquema, dentro de un paquete, dentro de un bloque PLSQL.

-- A nivel de esquema es independiente de cualquier paquete o bloque PL/SQL y puede ser invocado desde cualquier lugar dentro del esquema en el que est� definido.
-- Los procedimientos definidos dentro de un paquete son parte de ese paquete y pueden ser accedidos solo dentro del contexto del paquete.
-- Los procedimientos definidos dentro de un bloque PL/SQL solo pueden ser invocados desde dentro del mismo bloque.

CREATE OR REPLACE PROCEDURE suma_numeros (num1 NUMBER, num2 NUMBER)
as
   total NUMBER;
BEGIN
   total := num1 + num2;
   DBMS_OUTPUT.PUT_LINE('La suma es: ' || total);
END;


BEGIN
   suma_numeros(5, 10); -- Llamada al procedimiento con los valores 5 y 10
END;

EXECUTE suma_numeros(5, 10);

-- 
CREATE OR REPLACE  PROCEDURE newRowInTablePersona(nombre IN VARCHAR2, edad IN NUMBER)
AS
    BEGIN
        INSERT INTO persona (nombre, edad) VALUES (nombre, edad);
        END newRowInTablePersona;

EXECUTE  newRowInTablePersona('Mar�a', 23);

--
CREATE TABLE libros (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    titulo VARCHAR2(100),
    autor  VARCHAR2(100),
    precio decimal
);

alter table libros
add editorial varchar2(100);

insert into libros (titulo, autor , precio) values ('Buscando a Nemo', 'Walther Olivo', 90.99);

select * from libros;

drop table tabla1; 

CREATE TABLE tabla1 (
    id_tabla1 NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    titulo VARCHAR2(100),
    precio decimal
);

select * from tabla1;

CREATE OR REPLACE PROCEDURE autorLibro(atitulo IN VARCHAR2)
AS
    vautor VARCHAR2(100);
BEGIN
    SELECT autor INTO vautor FROM libros WHERE titulo = atitulo;
    INSERT INTO tabla1  (   titulo, precio)
    SELECT titulo, precio FROM libros WHERE autor = vautor;
END autorLibro;

EXECUTE autorLibro('Buscando a Nemo');


-- FUNCIONES EN PLSQL
-- En PL/SQL, una funci�n es un bloque de c�digo que realiza una tarea espec�fica y devuelve un valor como resultado.


CREATE OR REPLACE FUNCTION calcular_area_circulo (radio NUMBER)
RETURN NUMBER
IS
   pi CONSTANT NUMBER := 3.14159;
   area NUMBER;
BEGIN
   area := pi * radio * radio;
   RETURN area;
END;

select calcular_area_circulo(2) from dual;

create or replace function DiasDeLaSemana(numero int)
return varchar2
is
 dia varchar2(10);
 begin
    dia := '';
    case numero
    when 1 then dia := 'Lunes';
    when 2 then dia := 'Martes';
    when 3 then dia := 'Mi�rcoles';
    when 4 then dia := 'Jueves';
    when 5 then dia := 'Viernes';
    when 6 then dia := 'S�bado';
    when 7 then dia := 'Domingo';
    else dia := 'Ese n�mero es correcto';
 end case;
    return dia;
end;

select diasdelasemana(2) from dual;

    
-- TRIGGERS 
-- Los triggers o disparadores son bloques de c�digo que se ejecutan de forma automatica.

-- CLASIFICACI�N  

-- Seg�n el momento de ejecuci�n.
-- Triggers BEFORE: Se ejecutan antes de que se complete la operaci�n en la tabla (inserci�n, actualizaci�n o eliminaci�n).
-- Triggers AFTER: Se ejecutan despu�s de que se complete la operaci�n en la tabla. Pueden utilizarse para realizar acciones adicionales despu?s de que se realice la operaci�n.

-- Seg�n el evento que desencadenan:
-- Triggers de inserci�n (INSERT): Se ejecutan cuando se inserta una nueva fila en la tabla.
-- Triggers de actualizaci�n (UPDATE): Se ejecutan cuando se actualiza una o varias filas en la tabla.
-- Triggers de eliminaci�n (DELETE): Se ejecutan cuando se elimina una o varias filas de la tabla.

-- Seg�n el nivel de fila o tabla:
-- Triggers de fila (ROW-level): Se ejecutan para cada fila afectada por la operaci�n. Son �tiles cuando se necesita realizar acciones espec�ficas en funci�n de cambios en filas individuales en una tabla. 
-- Triggers de tabla (TABLE-level): Se ejecutan una vez para cada operaci�n, independientemente del n�mero de filas afectadas. 

select * from control;

select * from persona;

create or replace trigger tr_ingresolibros
before insert
on libros
begin
 insert into control values(user, sysdate, 'insert');
 end tr_ingresolibros;

select  * from user_triggers where trigger_name='TR_INGRESOLIBROS';

--
create or replace NONEDITIONABLE TRIGGER INSERTPERSONAS
after INSERT
ON persona
for each row -- El for each row significa que el trigger se activar� y ejecutar� para cada fila afectada por la operaci�n INSERT que lo desencadena.
 begin
  insert into control values (user, sysdate, 'insertando');
end INSERTPERSONAS;

insert into persona (nombre, edad)  values ('Vegueta', 33);

create or replace  trigger deleteAlumnos
before delete
on persona
for each row
 begin
  insert into control values (user, sysdate, 'eliminando');
end deleteAlumnos;

DELETE FROM PERSONA WHERE EDAD = 23;

create or replace NONEDITIONABLE trigger updatePersona
before update
on persona
for each row
 begin
  insert into control values (user, sysdate, 'actualizando');
end updatePersona;

UPDATE PERSONA SET NOMBRE = 'WALTHER OLIVO MACIAS' WHERE ID=1;

-- TRIGGER M�LTIPLES EVENTOS 
create or replace NONEDITIONABLE trigger TR_MULTIPLES_EVENTOS
before insert or update or delete
on persona
 begin
  if inserting then
   insert into control values (user, sysdate, 'insertando');
end if;
  if deleting then
   insert into control values (user, sysdate, 'eliminando');
end if;
  if updating then
   insert into control values (user, sysdate, 'actualizando');
end if;
end TR_MULTIPLES_EVENTOS;


-- TRIGGERS :NEW AND :OLD
-- CUANDO TRABAJAMOS TRIGGERS A NIVEL DE FILA ORACLE NOS PROPORCIONA DOS TABLAS TEMPORALES QUE CONTIENEN 
-- LOS ANTIGUOS Y NUEVOS VALORES DE LOS REGISTROS AFECTADOS CON LA SENTENCIA QUE DISPAR� DICHO TRIGGER,
-- EL VALOR VIEJO ES OLD Y EL VALOR NUEVO SE ALMACENA EN EL NEW.



SELECT * FROM LIBROS;

insert into libros (titulo, autor , precio, editorial) values ('Buscando a Emma', 'Josthin Ayon', 1290, ' Edelvives');

drop table  ofertas;
CREATE TABLE OFERTAS(
    ID number,
    PRECIO NUMBER,
    USUARIO VARCHAR2(100),
    FECHA DATE
)

--
create or replace trigger newLibros
after insert 
on libros
for each row
begin
 if(:new.precio<=30) then
 insert into ofertas values (:new.id, :new.precio, user, sysdate);
 end if;
 end newlibros;

select * from ofertas;

--

drop trigger OLDANDNEWROWINOFERAS;

create or replace trigger oldAndNewRowInOferas
before update of precio 
on libros
for each row
begin
 if(:old.precio<=30) and (:new.precio>30) then
 delete from ofertas where id=:old.id;
 end if;
 if (:new.precio>400) then
 raise_application_error(-2000, 'El precio no puede ser mayor a 400');
 end if;
 if(:old.precio>30) and (:new.precio<=30) then
 insert into ofertas values (:new.id, :new.precio, user, sysdate);
 end if;
end oldAndNewRowInOferas;

select * from ofertas;
select * from libros;

update libros set precio= 288 where id=24;


create or replace trigger aumentarPrecio
before update of precio 
on libros
for each row when (new.precio > old.precio)
begin
 insert into ofertas values (:old.id, :new.precio, user, sysdate);
end aumentarPrecio;


-- TRIGGER QUE ALTERA EL FORMATO DEL REGISTRO INSERTADO
create or replace trigger updateFormatInTableLibros
before insert
on libros
for each row 
begin
 :new.titulo :=upper(:new.titulo);
 if :new.precio is null then
 :new.precio := 0;
 end if;
 end;
 
-- TRIGGERS , ENABLE , DISABLE
ALTER TRIGGER updateFormatInTableLibros disable -- or enable;

--  Un cursor es un puntero que se utiliza para manjear sentencias select.
--  Cursores impl�citos. Estos devuelven un registro en espec�fico.
--  Cursores expl�citos. Se utilizan cuando la sentencia select devuelve varios registros

-- Atributos
-- %ISOPEN. Devuelve true si el cursor est� abierto
-- %FOUND. Devuelve true si el registro fue procesado satisfactoriamente.
-- %NOTFOUND. Devuelve true si el registro no pudo ser procesado.
-- %ROWCOUNT. Devuelve el n�smero de registros que han sido procesados hasta ese momento.

-- CURSORES EXPL�CITOS

select * from libros;

declare 
    filas number;
begin   
    update libros set precio= precio +20 where precio >=10;
    if sql%notfound then
    dbms_output.put_line('No se puede actualizar libros');
    elsif sql%found then
    filas := sql%rowcount;
    dbms_output.put_line(filas || ' Libros actualizados ');
    end if;
end;

-- Partes del cursor
-- Declare : En esta parte, se declara y define el cursor, especificando la consulta SQL que se utilizar� para obtener los datos. 
-- Open: Se debe abrir antes de utilizarlo. La apertura del cursor ejecuta la consulta y carga los resultados en la memoria
-- Fetch: Es una funci�n que recupera cada fila de la consulta ejecutada.
-- Empty: Eval�a si los registros cumplen con las funciones de los atributos 
-- Close: Se cierra el cursor y libera recursos.

declare 
    v_titulo libros.titulo%type;
    v_autor libros.autor%type;
    v_precio libros.precio%type;
    v_editorial libros.editorial%type;

cursor c_cursor is
    select titulo, autor, precio, editorial from libros where precio > 100;
    
begin
    open c_cursor;
    fetch c_cursor into v_titulo, v_autor, v_precio, v_editorial;
    close c_cursor;
    dbms_output.put_line(v_titulo);
    dbms_output.put_line(v_autor);
    dbms_output.put_line(v_precio);
    dbms_output.put_line(v_editorial);
end;

DECLARE
    c_libros libros%rowtype;
    contador INTEGER := 0;
BEGIN
    FOR c_libros IN (SELECT * FROM libros) LOOP
        contador := contador + 1;
        dbms_output.put_line('Dato ' || contador || ' = ' ||  c_libros.precio);
    END LOOP;
END;

BEGIN
    --UPDATE libros SET autor = 'WALTHER OLIVO MACIASss' WHERE precio > 100;
    UPDATE PERSONA SET NOMBRE = 'WALTHER OLIVO MACIASss' WHERE ID=9;
    if sql%notfound then
    dbms_output.put_line('No existe la persona con ese id');
    end if;
end;

select * from persona;
select p.edad from persona p;


-- CURSOR CON PAR�METROS 

declare
    c_libro libros.titulo%type;
    c_id    libros.id%type;
    cursor c_cursor_l(c_id libros.id%type)
    is 
    select titulo, id from libros where id =c_id;
    
BEGIN
    open c_cursor_l (23);
    loop
    fetch c_cursor_l into c_libro, c_id;
    exit when c_cursor_l%notfound;
    dbms_output.put_line('Libro ' || c_libro || ' , id: ' || c_id);
    end loop;
    close c_cursor_l;
end;
    
-- ref_cursor es un tipo de dato especial que permite devolver conjuntos de resultados desde un bloque PL/SQL como un cursor que puede ser procesado fuera del bloque original.

create or replace function getLibro(id_libro in number)
return sys_refcursor
is
    c_ref sys_refcursor;
begin
    open c_ref for select * from libros where id = id_libro;
    return c_ref;
end;

var r refcursor;
exec :r:=getLibro(1);
print r;
 
select getLibro(1) from dual;

-- Variables Compuestas
-- Son capaces almacenar distintos valores de registros con distintos tipos de datos en una sola variable;

-- Variable compuesta a nivel de tabla

declare 
	vc_libros libros%rowtype; -- El rowtype toma todos los tipos de datos de la tabla y los guarda en una variable, entonces vc_libros tendr� acceso a todos los campos de la tabla libros.
begin
	select * into vc_libros from libros -- select * into , aqu� seleccionamos todos los registros from liibros y los guardamos en la variable compuesta
    where id = 1;
	dbms_output.put_line('ID: ' || vc_libros.id);
	dbms_output.put_line('TITULO: ' || vc_libros.titulo);
end;


-- Variable compuesta a nivel de cursores


declare 
	cursor cu_libros is -- con el is defines que guardar� o que datos va a manipular el cursor, en este caso ser�n todos los libros, por el select * from libros.
	select * from libros;
	vc_libros cu_libros%rowtype;
begin
  	open cu_libros;
	loop
	  fetch cu_libros into vc_libros; -- con el fetch buscamos todos los registros y los guardamos en la variable
	  exit when cu_libros%notfound; -- termina el loop cuando ya no hay registros co el notfound
	  dbms_output.put_line(vc_libros.id || ' ' || vc_libros.titulo);
	end loop;
end;


-- Package
-- Son un grupo l�gico de objetos de la DB, tales como, variables, procedimientos, bloques de code, etc.
-- Todos estos objetos se relacionan entre s�, son encapsulados y convertidos en una unidad dentro de la DB.

-- Partes del Package
-- Especificaci�n, es obligatoria de configurar, se definen variables, procedures, functions, etc.
-- Body, no es obligatoria y es el body del package.

-- ESPECIFICACION DEL PACKAGE
create or replace package getAllBooks as
procedure caracteristicas(p_id libros.id%type);
function f_precio(f_id int) return number;
end getAllBooks;
 
-- BODY OF PACKAGE
create or replace package body getAllBooks as
procedure caracteristicas(p_id libros.id%type) is
 v_titulo  libros.titulo%type;  
begin 
 select  titulo into  v_titulo
from libros where id = p_id;
 dbms_output.put_line('titulo: ' || v_titulo);
 end caracteristicas;
 
  function f_precio(f_id int)
 RETURN number
 as
  f_precio number;
  begin
  select precio into f_precio
  from libros where id = f_id;
  return f_precio;
end f_precio;
 
end getAllBooks;

begin
 getAllBooks.caracteristicas(1);
  
end;
select getAllBooks.f_precio(1)as Precio from dual;




-- CONSULTAS JERARQUICAS

drop table empleados;
create table empleados (
id_empleado int not null primary key,
nombre varchar(20) not null,
id_puesto char(20),
id_supervisor int null
);
insert into empleados values(100,'Miguel Gonzales','PRESIDENTE',null);           
insert into empleados values(101,'Federico Antillana','VICE_PRESIDENTE',100);
insert into empleados values(102,'MIguel Montero','GERENTE_GRAL',100);
insert into empleados values(103,'Manuel Salda?os','IT_GERENTE',102);
insert into empleados values(104,'Ana Montesinos','SOPORTE_IT',103);
insert into empleados values(105,'Manuel Figueroa','SOPORTE_IT',103);
insert into empleados values(106,'Eliana Sandoval','SOPORTE_IT',103);
insert into empleados values(107,'Iluminada Contreras','SOPORTE_IT',103);
insert into empleados values(108,'Manuela Condado','SECRETARIA',101);
insert into empleados values(109,'Emilia Cortinez','SECRETARIA',102);
insert into empleados values(110,'Denia Soler','SECRETARIA',103);
insert into empleados values(111,'Barbara Eleonor','SECRETARIA',101);
insert into empleados values(112,'Fausto Melaneo','VENDEDOR',102);
insert into empleados values(113,'Adalberto Mirabal','VENDEDOR',102);
insert into empleados values(114,'Estelvina Zorrilla','VENDEDORA',102);
insert into empleados values(115,'Mireya Matos','ASISTENTE_SECRETARIO',108);
insert into empleados values(116,'Elena Martinez','ASISTENTE_SECRETARIO',109);


SELECT * FROM EMPLEADOS;

SELECT NOMBRE, ID_PUESTO, LEVEL
FROM EMPLEADOS
START WITH NOMBRE = 'Miguel Gonzales'
connect by prior id_empleado = ID_SUPERVISOR;

select level, nombre, id_puesto,
sys_connect_by_path(NOMBRE, ' > ') JERARQUIA
FROM EMPLEADOS
START WITH ID_SUPERVISOR IS NULL
CONNECT BY PRIOR ID_EMPLEADO = ID_SUPERVISOR;



-- TRANSACCIONES
-- Es una unidad at�mica de trabajo que ouede contar por una o m�s sentencias relacionadas entre s�.
-- Con decir atomica me refiero a que las modificaciones de la DB provocadas por las sentencias pueden ser permanentes o pueden desaserce.

drop table clientes;
create table clientes(
id_cliente int not null,
nombre varchar2(30),
edad numeric(2),
direccion varchar(60),
salario number(6,2));

--SOLO HACER ESTOS INSERTS PRIMERO
insert into clientes values (1,'Ramon Rodriguez',32,'Calle primera numero 001',2000.00); 
insert into clientes values (2,'Jose Tomas',25,'Calle segunda numero 002',1500.00); 
insert into clientes values (3,'Ana Jimenez',23,'Calle tercera numero 003',2000.00); 
insert into clientes values (4,'Emilio Contreras',25,'Calle cuarta numero 004',6500.00); 
insert into clientes values (6,'Pedro Sandoval',22,'Calle quinta numero 005',4500.00); 

COMMIT ; -- GUARDA AQUELLA TRANSACCI?N O MODIFICACI�N

ROLLBACK; -- ES COMO EL CTRL Z, DESACE LA TRANSACCI�N



SAVEPOINT P1; -- Se utiliza para establecer un punto de guardado dentro de una transacci�n. 
-- Esto permite realizar una acci�n y, si algo falla despu�s, se puede retroceder solo hasta el punto de guardado (SAVEPOINT) en lugar de deshacer toda la transacci�n.

insert into  clientes values (7,'Esther Sanchez',27,'Calle sexta numero 006',5500.00 ); 
insert into  clientes values (8,'Antonio Peralta',21,'Calle septima numero 007',4500.00 ); 

UPDATE CLIENTES SET SALARIO = SALARIO+200;
COMMIT;

SELECT * FROM CLIENTES;

ROLLBACK TO P1; -- DESACE UN CAMBIO ESPECIFICADO


-- los "jobs" se refieren a tareas programadas o procesos automatizados que se ejecutan de forma peri�dica o en un momento espec�fico en la base de datos Oracle. 
-- Estos jobs se crean utilizando el Oracle Job Scheduler, una caracter�stica que permite a los desarrolladores programar la ejecuci�n de ciertas tareas o procedimientos de forma automatizada.
-- Los jobs se refieren a la capacidad de programar y automatizar ciertas tareas para que se ejecuten de forma autom�tica en un horario determinado

drop table log_actividades;

create table log_actividades(
    id_log int not null,
    fecha date
);

begin
  sys.dbms_scheduler.create_job(
    job_name => 'job_uno',
    job_type => 'PLSQL_BLOCK',
    job_action => 'declare
                      v_conteo number := 0;
                    BEGIN
                      select count(*) into v_conteo
                      from log_actividades;
                      insert into log_actividades values (v_conteo + 1, sysdate);
                      commit;
                    end;',
    start_date => systimestamp,
    repeat_interval => 'freq=secondly; interval=20',
    end_date => null,
    enabled => true,
    comments => 'log de actividades'
  );
end;


select * from log_actividades;
select * from user_dependencies;
select * from user_dependencies where name='libros';


-- VALIDACIONES DE PAQUETES

CREATE OR REPLACE PACKAGE paquete1 is
function f1 return number;
procedure pr1;
PROCEDURE PR2;

end;

select * from user_objects where object_name='PAQUETE1';

CREATE OR REPLACE PACKAGE BODY PAQUETE1
IS 
FUNCTION F1 RETURN NUMBER IS
BEGIN
    RETURN 0;
    END;

PROCEDURE PR1 IS
BEGIN 
    NULL;
    END;
    
PROCEDURE PR2 IS
BEGIN 
    NULL;
    END;
END;

-- COLECCIONES
-- ES UN TIPO DE DATO COMPUESTO QUE CONSITE EN UNA MATRIZ DE UNA SOLA DIMENSI�N, COMPUESTA POR UNO O M�S ELEMENTOS,
-- PODEMOS ACCEDER A ELLA MEDIANTE LOS �NDICES, SON OBJETOS CON DOS COLUMNAS, TIPO CLAVE VALOR.

DECLARE 
    TYPE LIBROS IS TABLE OF libros.titulo%type
    INDEX BY PLS_INTEGER;

    lib LIBROS;

   -- TYPE CUSTOMERS IS TABLE OF clientes%rowtype
   -- INDEX BY PLS_INTEGER;

  --  cu CUSTOMERS;

BEGIN

    lib(1) := 'Pinocho';
    lib(2) := 'Avengers';
    lib(20) := 'Robbin Hood';

    dbms_output.put_line(li(2));
END;


-- Como llenar arrays con tablas


DECLARE

    -- forma 1
  /*  TYPE LIBROS IS TABLE OF libros.titulo%type
    INDEX BY PLS_INTEGER;

    lib LIBROS;

    cursor cu_libros is select * from libros;
    f pls_integer := 1;
    
    */
    -- forma 2
    type books is table of libros%rowtype index by pls_integer;
    cursor cu2_libros is select * from libros where precio  >  100;
    z PLS_INTEGER := 1;
    
     libr books;


BEGIN
  /*  for libr in cu_libros loop
    lib(f) := libr;
    f := f + 1;
    end loop;
    for i in 1..f-1 loop
    dbms_output.put_line(lib(i));
    end loop; */
    
    -- Se utiliza un for para iterar sobre cada registro para luego mostrarlo
    for l in cu2_libros loop
    libr(z) := l;
    z := z + 1;
    end loop;
    for d in 1..z-1 loop
    dbms_output.put_line(libr(d).titulo);
    end loop;
END;



-- BULL COLLECT
-- Realiza una consulta y carga todos esos datos en una solta tabla, en un array asociativo

DECLARE

   
    type books is table of libros%rowtype index by pls_integer;
    z PLS_INTEGER := 1;
    
     libros2 books;


BEGIN
  
    select * bulk collect into libros2
    from libros;
    
    
    for d in 1..libros2.count() loop
    dbms_output.put_line(libros2(d).titulo);
    end loop;
END;

-- EXCEPCIONES

DECLARE 
 book libros%rowtype;
 
begin
   select * into book from libros ;
   dbms_output.put_line(book.titulo);
  -- dbms_output.put_line(100/0);
exception
  when NO_DATA_FOUND then
     dbms_output.put_line('No se encontr? el id');
  when TOO_MANY_ROWS then -- Indica que los datos a recuperar son m�s de los que se solicitan
    dbms_output.put_line('La recuperaci�n exacta devuelve un n�mero mayor de filas que el solicitado');
  when zero_divide then 
    dbms_output.put_line('Imposible dividir entre 0');
  when dup_val_on_index then -- Indica si el valor que se est� insertando ya existe
     dbms_output.put_line('El valor insertado ya existe');
  when others then 
     --dbms_output.put_line('Exception not controlled');
     dbms_output.put_line(sqlcode); -- exceptions of PLSQL
     dbms_output.put_line(sqlerrm); 

end;

-- tipos de EXCEPTIONS
-- NO DATA FOUND
-- TOO_MANY_ROWS
-- ZERO_DIVIDE
-- DUP_VALL_ON_INDEX


-- ECCEPTIOS WITH CONDITIONS
-- raise_application_error


declare
 empl empleados%rowtype;
 empl_control empleados.id_empleado%type;
 
begin

  empl.id_empleado :=100;
  empl.nombre := 'Tom and Jerry';
  select id_empleado into empl_control from empleados
  where id_empleado = empl.id_empleado;
  -- El c�digo del error debe estar entre -20000 y -20999
  raise_application_error(-20001, 'El empleado ya existe');
  --dbms_output.put_line('El libro ya existe');
exception
  when no_data_found then
  insert into  empleados values (empl.id_empleado, empl.nombre, null, null);
  commit;
end;

select * from empleados;


-- POO EN ORACLE 
-- Oracle es una DB relacional, por ende no es una DB de tipo objeto, sin embargo Oracle incorpora funcionalidades para trabajar con caracter�sticas de las DB orientadas a objetos.

-- Objetos, Atributos y M�todos

-- Creaci�n de objetos

create or replace type libro as object(

-- Atributos
id_ number,
titulo varchar2(200),
precio number,

-- M�todos
member function ver_libro return varchar2,
member function ver_precio return number,
member function ver_precio(iva number) return number, -- Sobrecarga de m?todos

member procedure cambiar_precio (precio number),
static procedure auditoria,
constructor function libro (n1 varchar2) return self as result
) not final;

create or replace type body libro as 

member function ver_libro return varchar2 as
 begin 
  return id_ || titulo;
end ver_Libro;

member function ver_precio return number as
 begin 
  return  precio;
end ver_Precio;


member function ver_precio(iva number) return number as

    begin 
        return precio - precio * iva /100;
    end;


member procedure cambiar_precio (precio number) as
 begin 
  self.precio:=  precio; -- al poner self hace referencia al atributo del objeto, m�s no al parametro que le pasamos.
end cambiar_precio;

static procedure auditoria
as
 BEGIN
 insert into auditoria values (user, sysdate);
 
 END;
 
constructor function libro (n1 varchar2) return self as result
is
    begin
        self.titulo := n1;
        self.id_ := null;
        self.precio := null;
        return;
end;
end;

--


begin
 libro.auditoria; -- En los m�todos estaticos debemos escribir el objeto m�s mi m�todo est�tico.
end;

select * from auditoria;


declare 
    v1 libro;
    v2 libro;

begin
    v1 := libro(1, 'Pinocho', 98);
    dbms_output.put_line(v1.ver_precio(9));

    v2 := libro('Pinocho');
    dbms_output.put_line(v1.ver_libro());
end;

-- M�todo self para atributos
-- Con el m�todo self puedes hacer referencia a una propiedad y a una variable con el mimsmo nombre
declare 
    lb1 libro;
begin
    lb1 := libro(2, 'Las habichuelas m?gicas', 99);
    dbms_output.put_line(lb1.ver_libro());
    lb1.titulo := 'XD';
    dbms_output.put_line(lb1.ver_libro());
    dbms_output.put_line(lb1.ver_precio());

end;

-- M�todos est?ticos

drop table auditoria;
create table auditoria(
    usuario varchar2(100),
    fecha date
);

-- ALTER TABLE
-- alter table libros 
-- ADD new_field VARCHAR2(50); 
-- alter table libros rename to <nuevo_nombre>

-- VER OBJETOS
-- desc  <nombre_del_objeto> , podemos ver la descripci�n del objeto o de la tabla. 
desc libro;
select * from user_source;
select * from user_types;

-- HERENCIA UNDER

 create or replace type animados under libro(
    fecha_creacion date,
    
    member function ver_fecha return varchar2,
    overriding member function ver_precio return number -- sobreescritura de m?todos

    ); 
-- Si tienes un objeto padre y creas un objeto que hereda de el , si necesitar alterar algo del objeto padre procura eliminar al objeto hijo y actualizar, luego podr�s crear tu objecto heredado sin problemas.

drop type animados;


create or replace type body animados as

member function ver_fecha return varchar2 as
    begin 
    return fecha_creacion;
    
    end;
    
    overriding member function ver_precio return number as -- sobreescritura de m�todos
 
    begin
    return precio + 10;
    end;
end;
--
    
declare 
    fecha date:= to_date('2022/07/15','yyyy/mm/dd');

    v1 animados:= animados (2, 'El chavo del 8', 9, fecha);
begin

    dbms_output.put_line(v1.ver_fecha());
    dbms_output.put_line(v1.ver_precio());

end;

-- USAR OBJETOS EN TABLAS

DROP TABLE TIENDA;
create table tienda(
    codigo number,
    estanteria number,
    libro libro
);

select * FROM tienda;

insert into tienda values (1, 9393, libro(2, 'El chavo del 8', 9));

select t.libro.titulo from tienda t;
select t.libro.precio from tienda t;

-- JSON JavaScript Object Notation, es decir notaci�n de objeto de JavaScript se utiliza para estructurar datos en forma de texto y permite el intercambio de informaci�n entre aplicaciones de manera sencilla, liviana y r�pida.

-- funciones 

-- JSON_QUERY: Similar a JSON_VALUE, JSON_QUERY se utiliza para extraer un valor espec�fico de un documento JSON. 
-- JSON_VALUE: Esta funci�n se utiliza para extraer un valor espec�fico de un documento JSON.
-- JSON_EXISTS: Con esta funci�n, puedes verificar si una ruta de b�squeda espec�fica (JSON Path) existe en el documento JSON. Retorna un valor booleano que indica si la ruta existe o no.
-- JSON_TABLE: Esta funci�n te permite transformar datos JSON en filas y columnas. Puedes utilizar JSON_TABLE para consultar y procesar datos JSON como si estuvieras trabajando con una tabla relacional.
-- JSON_ARRAY: JSON_ARRAY te permite crear un array JSON. Puedes especificar una lista de valores que se incluir�n en el array JSON resultante.
-- SON_OBJECT: Con JSON_OBJECT, puedes crear un objeto JSON. Puedes especificar pares clave-valor que se incluir�n en el objeto JSON resultante.
-- JSON_SERIALIZE: JSON_SERIALIZE se utiliza para convertir un valor de datos en formato JSON. 
-- JSON_ARRAYAGG: JSON_ARRAYAGG se usa para agregar valores en un array JSON. Esta funci�n toma valores individuales y los agrupa en un array JSON.
-- JSON_MERGEPATCH: Esta funci�n se utiliza para fusionar datos JSON. Puedes proporcionar un documento JSON y un parche JSON, y la funci�n aplicar� los cambios del parche al documento.

drop table product;
create table product(
    codigo NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre varchar2(200),
    datos  CLOB
);

insert into product (nombre, datos) values ('PC','{"pais": "Ecuador","ciudad": "Quito","poblaci�n": "130.000","direccion":{ "calle": "Av ddfedsf",  "edificio": 12,   "piso": 121,},"telefonos": ["3394793473", "892923479237"]}' 
);

select * from product;
select * from product where datos is json; -- or is not json

-- JSON_EXITS
select p.datos from product p where json_exists(p.datos, '$.ciudad');

select p.datos from product p where json_exists(p.datos, '$.direccion.calle');

select p.datos from product p where json_exists(p.datos, '$.telefonos[1]');

-- JSON_VALUE
select JSON_VALUE(pr.datos, '$.pais') from product pr;

-- JSON_QUERY
select json_query(pr2.datos, '$.direccion') from product pr2;

-- JSON_TABLE
SELECT jt_pais  from product p, json_table(p.datos, '$'columns (jt_pais path '$.pais'));
SELECT jt_pais , jt_city from product p, json_table(p.datos, '$'columns (jt_pais path '$.pais', jt_city path '$.ciudad' ));
SELECT jt_pais , jt_city, jt_direccion from product p, json_table(p.datos, '$'columns (jt_pais path '$.pais', jt_city path '$.ciudad', jt_direccion path '$.direccion.calle'));

-- JSON_MERGEPATCH
update product set datos = json_mergepatch(datos,'{"precio":"3048308430",}') where codigo = 2;

update product set datos = json_transform(datos, set '$.ciudad'='Santiago de Chile' ) where codigo = 2;