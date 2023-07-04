-- 1.1.5 Consultas multitabla (Composición externa)

-- 1. Devuelve un listado de todos los fabricantes que existen en la base de datos, 
-- junto con los productos que tiene cada uno de ellos. El listado deberá mostrar 
-- también aquellos fabricantes que no tienen productos asociados.

SELECT fabricante.id AS ID_FABRICANTE, fabricante.nombre AS NOMBRE_FABRICANTE,  
product.nombre AS NOMBRE_PRODUCTO, product.id_fabricante AS ID_FABRICANTEP, product.precio,
product.id AS ID_product
FROM fabricante
LEFT JOIN product 
ON 
fabricante.id = product.id_fabricante;


select  COUNT(DISTINCT id_fabricante),  fabricante.id AS ID_FABRICANTE, fabricante.nombre AS NOMBRE_FABRICANTE,  
product.nombre AS NOMBRE_PRODUCTO
from product
LEft join fabricante
ON 
fabricante.id = product.id_fabricante;

-- 2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.


-- left join 

SELECT f.id as Id_del_Fabricante, f.nombre as nombre_Fabricante, p.nombre AS NOMBRE_PRODUCTO
FROM fabricante f
LEFT JOIN product p 
ON f.id = p.id_fabricante
WHERE p.id IS NULL;

SELECT f.id as Id_del_Fabricante, f.nombre as nombre_Fabricante, p.nombre AS NOMBRE_PRODUCTO
FROM product p
LEFT JOIN  fabricante f
ON f.id = p.id_fabricante
WHERE p.id IS NULL;


-- right join

SELECT f.id as Id_del_Fabricante, f.nombre as nombre_Fabricante , p.nombre AS NOMBRE_PRODUCTO
FROM product p
RIGHT JOIN fabricante f
ON f.id = p.id_fabricante
WHERE p.id_fabricante IS NULL;

SELECT f.id as Id_del_Fabricante, f.nombre as nombre_Fabricante , p.nombre AS NOMBRE_PRODUCTO
FROM fabricante f 
RIGHT JOIN product p
ON f.id = p.id_fabricante
WHERE p.id_fabricante IS NULL;

-----------------------------

select * from fabricante
select * from product

SELECT f.id as Id_del_Fabricante, f.nombre as nombre_Fabricante 
FROM product p
RIGHT JOIN fabricante f
ON f.id = p.id_fabricante
WHERE p.id_fabricante IS NULL;


-- 3. ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.
-- Probablemente no, ya que es necesario tener un fabricante para crear un producto.

-- 1.1.6 Consultas resumen

-- 1. Calcula el número total de productos que hay en la tabla productos
SELECT COUNT(*) AS total_productos FROM product;

-- 2. Calcula el número total de fabricantes que hay en la tabla fabricante
SELECT COUNT(fabricante.nombre) AS total_fabricantes FROM fabricante;

-- 3. Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla productos.
SELECT COUNT(DISTINCT id_fabricante) AS total_valores_distintos FROM product;


-- 4. Calcula la media del precio de todos los productos.
SELECT AVG(precio) AS media_precio FROM product

-- 5. Calcula el precio más barato de todos los productos.
SELECT MIN(precio) AS precio_mas_barato FROM product;


-- 6. Calcula el precio más caro de todos los productos.
SELECT MAX(precio) AS precio_mas_caro FROM product;

-- 7. Lista el nombre y el precio del producto más barato.
SELECT nombre, precio
FROM product
WHERE precio = (SELECT MIN(precio) FROM product);

-- 8. Lista el nombre y el precio del producto más caro.
SELECT nombre, precio
FROM product
WHERE precio = (SELECT max(precio) FROM product);

-- 9. Calcula la suma de los precios de todos los productos.
SELECT SUM(precio) AS suma_total_productos FROM product;


-- 10. Calcula el número de productos que tiene el fabricante Asus.
SELECT COUNT(*) AS total_productos
FROM product
WHERE id_fabricante = (SELECT id FROM fabricante WHERE nombre = 'Asus');

-- 11. Calcula la media del precio de todos los productos del fabricante Asus.
SELECT AVG(precio) AS media_precio
FROM product
WHERE id_fabricante = (SELECT id FROM fabricante WHERE nombre = 'Asus');


-- 12. Calcula el precio más barato de todos los productos del fabricante Asus.
SELECT MIN(precio) AS precio_mas_barato
FROM product
WHERE id_fabricante = (SELECT id FROM fabricante WHERE nombre = 'Asus');

-- 13. Calcula el precio más caro de todos los productos del fabricante Asus.
SELECT max(precio) AS precio_mas_caro
FROM product
WHERE id_fabricante = (SELECT id FROM fabricante WHERE nombre = 'Asus');

-- 14. Calcula la suma de todos los productos del fabricante Asus.
SELECT SUM(precio) AS suma_total_productos
FROM product
WHERE id_fabricante = (SELECT id FROM fabricante WHERE nombre = 'Asus');


-- 15. Muestra el precio m�ximo, precio m�nimo, precio medio y el número total de productos que tiene el fabricante Crucial.
SELECT min(precio) AS precio_min , max(precio) AS precio_max, avg(precio) AS precio_medio, count(*) as total_productos 
FROM product
WHERE id_fabricante = (SELECT id FROM fabricante WHERE nombre = 'Crucial');


-- 16. Muestra el número total de productos que tiene cada uno de los fabricantes. El listado tambi�n debe incluir los fabricantes que no tienen ning�n producto. 
-- El resultado mostrar� dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el 
-- número de productos.

 
SELECT fabricante.nombre AS nombre_fabricante, count(product.id) as total_productos
FROM fabricante
right JOIN product ON fabricante.id = product.id_fabricante
GROUP BY fabricante.nombre
ORDER BY total_productos DESC;

-- 17. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto
-- con los datos que se solicitan.

SELECT fabricante.nombre AS nombre_fabricante, 
       MAX(product.precio) AS precio_maximo,
       MIN(product.precio) AS precio_minimo,
       AVG(product.precio) AS precio_promedio
FROM fabricante
LEFT JOIN product ON fabricante.id = product.id_fabricante
GROUP BY fabricante.nombre;


--18. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€.
-- No es necesario mostrar el nombre del fabricante, con el identificador del fabricante es suficiente.


SELECT fabricante.id AS id_fabricante, 
       MAX(product.precio) AS precio_maximo,
       MIN(product.precio) AS precio_minimo,
       AVG(product.precio) AS precio_promedio,
       COUNT(product.id) AS total_productos
FROM fabricante
LEFT JOIN product
ON fabricante.id = product.id_fabricante
GROUP BY fabricante.id
HAVING AVG(product.precio) > 200;

-- 19. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo,
-- precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. 
-- Es necesario mostrar el nombre del fabricante.

SELECT fabricante.nombre AS nombre_fabricante,
       MAX(product.precio) AS precio_maximo,
       MIN(product.precio) AS precio_minimo,
       AVG(product.precio) AS precio_promedio,
       COUNT(product.id) AS total_productos
FROM fabricante
LEFT JOIN product ON fabricante.id = product.id_fabricante
GROUP BY fabricante.nombre
HAVING AVG(product.precio) > 200;


-- 20. Calcula el número de productos que tienen un precio mayor o igual a 180€.

SELECT COUNT(*) AS numero_productos, product.nombre FROM product 
where (product.precio >= 180)
group by product.nombre 
order by product.nombre  desc;

--- 21. Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.

SELECT fabricante.nombre AS nombre_fabricante, COUNT(product.id) AS total_productos 
FROM fabricante
INNER JOIN product ON fabricante.id = product.id_fabricante
WHERE product.precio >= 180
GROUP BY fabricante.nombre;

-- 22. Lista el precio medio los productos de cada fabricante, mostrando solamente el identificador del fabricante.

SELECT fabricante.id AS id_fabricante, AVG(product.precio) AS precio_medio
FROM fabricante
INNER JOIN product ON fabricante.id = product.id_fabricante
GROUP BY fabricante.id;


-- 23. Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.

SELECT fabricante.nombre AS nombre_fabricante, AVG(product.precio) AS precio_medio
FROM fabricante
INNER JOIN product ON fabricante.id = product.id_fabricante
GROUP BY fabricante.nombre;


--24. Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.

SELECT fabricante.nombre
FROM fabricante
INNER JOIN product ON fabricante.id = product.id_fabricante
GROUP BY fabricante.nombre
HAVING AVG(product.precio) >= 150;


--25. Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.

SELECT fabricante.nombre
FROM fabricante
INNER JOIN product ON fabricante.id = product.id_fabricante
GROUP BY fabricante.nombre
HAVING COUNT(product.id) >= 2;

--26. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. 
-- No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.

SELECT fabricante.nombre, COUNT(product.id) AS total_productos
FROM fabricante
INNER JOIN product ON fabricante.id = product.id_fabricante
WHERE product.precio >= 220
GROUP BY fabricante.nombre 
;

--27. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. 
--El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superior o igual
-- a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.

SELECT fabricante.nombre, COUNT(product.id) AS total_productos
FROM fabricante
LEFT JOIN product ON fabricante.id = product.id_fabricante AND product.precio >= 220
GROUP BY fabricante.nombre;

--28 Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.


SELECT fabricante.nombre
FROM fabricante
INNER JOIN product ON fabricante.id = product.id_fabricante
GROUP BY fabricante.nombre
HAVING SUM(product.precio) > 1000;
-- La cláusula HAVING se usa a menudo con la cláusula GROUP BY para filtrar grupos en una lista específica de condiciones.


--29. Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. 
-- El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. 
-- El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.

SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante
FROM product p
INNER JOIN fabricante f 
ON p.id_fabricante = f.id
WHERE p.precio = (
    SELECT MAX(precio)
    FROM product
    WHERE id_fabricante = f.id
)
ORDER BY f.nombre ASC;

create table tabla_ejemplo(
id_ejemplo int  PRIMARY KEY,
			campo_uno  VARCHAR(100) NOT NULL,
);

 
INSERT INTO tabla_ejemplo (id_ejemplo, campo_uno) values (332, 'sfdsfsfsfsfdre')

select * from tabla_ejemplo

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'pr_ejemplo')
	DROP PROC dbo.pr_ejemplo
GO

CREATE PROC dbo.pr_ejemplo (
--	@i_usuario					udt_login			= 'batch-usr',
	@i_accion					char(1),
	@i_id_ejemplo				int					= null,
	@i_campo_uno				varchar(50)			= null,
	@i_offset					int					= null,
	@i_limit					int					= null
)
AS

IF @i_accion = 'I'
BEGIN
	INSERT	INTO tabla_ejemplo (
			id_ejemplo,
			campo_uno
	)
	VALUES (
	@i_id_ejemplo,
			@i_campo_uno
	)

	RETURN 0
END

IF @i_accion = 'M'
BEGIN
	UPDATE	tabla_ejemplo
	SET		campo_uno				= @i_campo_uno
	WHERE	id_ejemplo				= @i_id_ejemplo

	RETURN 0
END

IF @i_accion = 'C'
BEGIN
	SELECT	id_ejemplo				= a.id_ejemplo,
			campo_uno				= a.campo_uno
	FROM	tabla_ejemplo a
	WHERE	a.id_ejemplo			= @i_id_ejemplo

	RETURN select @i_id_ejemplo as id_ejemplo

	END

IF @i_accion = 'G'
BEGIN
	-- Se obtiene el total de registros
	SELECT	total_registros			= COUNT(1)
	FROM	tabla_ejemplo a
	WHERE	a.campo_uno				LIKE '%' + ISNULL(@i_campo_uno,a.campo_uno) + '%'

	-- Se obtienen los registros con un límite
	-- BEGIN: Consulta para versiones de SQL Server actuales
	SELECT	id_ejemplo				= a.id_ejemplo,
			campo_uno				= a.campo_uno
	FROM	tabla_ejemplo a
	WHERE	a.campo_uno				LIKE '%' + ISNULL(@i_campo_uno,a.campo_uno) + '%'
	ORDER	BY a.campo_uno
	OFFSET	(@i_offset - 1) ROWS
	FETCH	NEXT @i_limit ROWS ONLY
	-- END


 RETURN 0
END



RAISERROR ('El código de la acción es incorrecto.',16,1)

GO



-----------------------------

drop table tabla_persona

create table tabla_persona (
	id int identity primary key not null,
	nombre varchar(100) not null,
	apellido varchar(100) not null, 
	domicilio varchar(100) not null,
	edad int not null
);

select * from tabla_persona


insert into tabla_persona (nombre, apellido, domicilio, edad) values ('Walthersdsdde', 'Olivo', 'AV Francisco de Orellana' , 20)

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'pr_persona')
	DROP PROC dbo.pr_persona
GO

CREATE PROC dbo.pr_persona (
	
	@i_accion					char(1),
	@i_id						int					= null,
	@i_nombre				    varchar(50)			= null,
 	@i_apellido				    varchar(50)			= null,
	@i_domicilio		 		varchar(50)			= null,
	@i_edad						int					= null,
	@i_offset					int					= null,
	@i_limit					int					= null
)
AS

IF @i_accion = 'I'
BEGIN
	INSERT	INTO tabla_persona (
		 
			nombre, apellido, domicilio, edad
	)
	VALUES (
			 
			@i_nombre, @i_apellido, @i_domicilio,
			  @i_edad
	)

	RETURN 0
END

IF @i_accion = 'M'
BEGIN
	UPDATE	tabla_persona
	SET		nombre				= @i_nombre,
			apellido		    = @i_apellido,
			domicilio		    = @i_domicilio,
		 	edad		        = @i_edad
	WHERE	id		        	= @i_id 

	RETURN 0
END

IF @i_accion = 'C'
BEGIN
	SELECT	id				        = a.id,
			nombre			     	= a.nombre,
			apellido				= a.apellido,
			domicilio				= a.domicilio,
			edad					= a.edad
	FROM	tabla_persona a
	WHERE	a.id					= @i_id 

	 RETURN select @i_id  as id 
END


IF @i_accion = 'G'
BEGIN
	-- Se obtiene el total de registros
	SELECT	total_registros			= COUNT(1)
	FROM	tabla_persona a
	WHERE	a.nombre				LIKE '%' + ISNULL(@i_nombre,a.nombre) + '%'

	-- Se obtienen los registros con un límite
	-- BEGIN: Consulta para versiones de SQL Server actuales
	SELECT	id		         	= a.id,
			nombre				= a.nombre,
			apellido		 	= a.apellido,
			domicilio		 	= a.domicilio,
		 	edad		        = a.edad

	FROM	tabla_persona a
	WHERE	a.nombre				LIKE '%' + ISNULL(@i_nombre,a.nombre) + '%'
	ORDER	BY a.nombre
	OFFSET	(@i_offset - 1) ROWS
	FETCH	NEXT @i_limit ROWS ONLY
	-- END


 RETURN 0
END

RAISERROR ('El código de la acción es incorrecto.',16,1)

GO

-----
-----------------

create table CONTACTO(
IdContacto int identity primary key,
Nombre varchar(100),
Telefono varchar(100),
Correo varchar(100)
)
 

 select * from CONTACTO
--
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sp_Listar')
	DROP PROC dbo.sp_Listar
GO

create procedure sp_Listar
as
begin
	select * from CONTACTO
end

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sp_Listar')
	DROP PROC dbo.sp_Listar
GO

create procedure sp_Listar
as
begin
	select * from CONTACTO
end

--

create procedure sp_Obtener(
@IdContacto int )
as
begin
	select * from CONTACTO where IdContacto = @IdContacto
end

create procedure sp_Guardar(
@Nombre varchar(100),
@Telefono varchar(100),@Correo varchar(100)  )
as
begin
	insert into   CONTACTO (Nombre , Telefono, Correo) values (@Nombre , @Telefono, @Correo) 
end

--

create procedure sp_Editar(
@IdContacto  int,
@Nombre varchar(100),
@Telefono varchar(100),@Correo varchar(100)  )
as
begin
	UPDATE    CONTACTO SET  Nombre = @Nombre , Telefono = @Telefono , Correo = @Correo WHERE IdContacto = @IdContacto 
end

----
create procedure sp_Eliminar(
@IdContacto  int  )
as
begin
	delete from     CONTACTO   WHERE IdContacto = @IdContacto 
end
