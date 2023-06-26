-- 1.1.5 Consultas multitabla (Composición externa)

-- 1. Devuelve un listado de todos los fabricantes que existen en la base de datos, 
-- junto con los productoos que tiene cada uno de ellos. El listado deberá mostrar 
-- también aquellos fabricantes que no tienen productoos asociados.

SELECT fabricante.id AS ID_FABRICANTE, fabricante.nombre AS NOMBRE_FABRICANTE,  
producto.nombre AS NOMBRE_productoO, producto.id_fabricante AS ID_FABRICANTEP, producto.precio,
producto.id AS ID_producto
FROM fabricante
LEFT JOIN producto
ON 
fabricante.id = producto.id_fabricante;



-- 2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún productoo asociado.

SELECT f.id as Id_del_Fabricante, f.nombre as nombre_Fabricante, p.nombre AS NOMBRE_productoO
FROM fabricante f
LEFT JOIN producto p 
ON f.id = p.id_fabricante
WHERE p.id IS NULL;

SELECT f.id as Id_del_Fabricante, f.nombre as nombre_Fabricante , p.nombre AS NOMBRE_productoO
FROM producto p
RIGHT JOIN fabricante f
ON f.id = p.id_fabricante
WHERE p.id_fabricante IS NULL;


-- 3. ¿Pueden existir productoos que no estén relacionados con un fabricante? Justifique su respuesta.
-- Probablemente no, ya que es necesario tener un fabricante para crear un productoo.

-- 1.1.6 Consultas resumen

-- 1. Calcula el número total de productoos que hay en la tabla productoos
SELECT COUNT(*) AS total_productoos FROM producto;

-- 2. Calcula el número total de fabricantes que hay en la tabla fabricante
SELECT COUNT(fabricante.nombre) AS total_fabricantes FROM fabricante;

-- 3. Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla productoos.
SELECT COUNT(DISTINCT id_fabricante) AS total_valores_distintos FROM producto;


-- 4. Calcula la media del precio de todos los productoos.
SELECT AVG(precio) AS media_precio FROM producto

-- 5. Calcula el precio más barato de todos los productoos.
SELECT MIN(precio) AS precio_mas_barato FROM producto;


-- 6. Calcula el precio más caro de todos los productoos.
SELECT MAX(precio) AS precio_mas_caro FROM producto;

-- 7. Lista el nombre y el precio del productoo más barato.
SELECT nombre, precio
FROM producto
WHERE precio = (SELECT MIN(precio) FROM producto);

-- 8. Lista el nombre y el precio del productoo más caro.
SELECT nombre, precio
FROM producto
WHERE precio = (SELECT max(precio) FROM producto);

-- 9. Calcula la suma de los precios de todos los productoos.
SELECT SUM(precio) AS suma_total_productoos FROM producto;


-- 10. Calcula el número de productoos que tiene el fabricante Asus.
SELECT COUNT(*) AS total_productoos
FROM producto
WHERE id_fabricante = (SELECT id FROM fabricante WHERE nombre = 'Asus');

-- 11. Calcula la media del precio de todos los productoos del fabricante Asus.
SELECT AVG(precio) AS media_precio
FROM producto
WHERE id_fabricante = (SELECT id FROM fabricante WHERE nombre = 'Asus');


-- 12. Calcula el precio más barato de todos los productoos del fabricante Asus.
SELECT MIN(precio) AS precio_mas_barato
FROM producto
WHERE id_fabricante = (SELECT id FROM fabricante WHERE nombre = 'Asus');

-- 13. Calcula el precio más caro de todos los productoos del fabricante Asus.
SELECT max(precio) AS precio_mas_caro
FROM producto
WHERE id_fabricante = (SELECT id FROM fabricante WHERE nombre = 'Asus');

-- 14. Calcula la suma de todos los productoos del fabricante Asus.
SELECT SUM(precio) AS suma_total_productoos
FROM producto
WHERE id_fabricante = (SELECT id FROM fabricante WHERE nombre = 'Asus');


-- 15. Muestra el precio m�ximo, precio m�nimo, precio medio y el número total de productoos que tiene el fabricante Crucial.
SELECT min(precio) AS precio_min , max(precio) AS precio_max, avg(precio) AS precio_medio, count(*) as total_productoos 
FROM producto
WHERE id_fabricante = (SELECT id FROM fabricante WHERE nombre = 'Crucial');


-- 16. Muestra el número total de productoos que tiene cada uno de los fabricantes. El listado tambi�n debe incluir los fabricantes que no tienen ning�n productoo. 
-- El resultado mostrar� dos columnas, una con el nombre del fabricante y otra con el número de productoos que tiene. Ordene el resultado descendentemente por el 
-- número de productoos.

 
SELECT fabricante.nombre AS nombre_fabricante, COUNT(producto.id) AS total_productoos
FROM fabricante
LEFT JOIN producto ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.nombre
ORDER BY total_productoos DESC;

-- 17. Muestra el precio máximo, precio mínimo y precio medio de los productoos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto
-- con los datos que se solicitan.

SELECT fabricante.nombre AS nombre_fabricante, 
       MAX(producto.precio) AS precio_maximo,
       MIN(producto.precio) AS precio_minimo,
       AVG(producto.precio) AS precio_promedio
FROM fabricante
LEFT JOIN producto ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.nombre;


--18. Muestra el precio máximo, precio mínimo, precio medio y el número total de productoos de los fabricantes que tienen un precio medio superior a 200€.
-- No es necesario mostrar el nombre del fabricante, con el identificador del fabricante es suficiente.


SELECT fabricante.id AS id_fabricante, 
       MAX(producto.precio) AS precio_maximo,
       MIN(producto.precio) AS precio_minimo,
       AVG(producto.precio) AS precio_promedio,
       COUNT(producto.id) AS total_productoos
FROM fabricante
LEFT JOIN producto
ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.id
HAVING AVG(producto.precio) > 200;

-- 19. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo,
-- precio medio y el número total de productoos de los fabricantes que tienen un precio medio superior a 200€. 
-- Es necesario mostrar el nombre del fabricante.

SELECT fabricante.nombre AS nombre_fabricante,
       MAX(producto.precio) AS precio_maximo,
       MIN(producto.precio) AS precio_minimo,
       AVG(producto.precio) AS precio_promedio,
       COUNT(producto.id) AS total_productoos
FROM fabricante
LEFT JOIN producto ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.nombre
HAVING AVG(producto.precio) > 200;


-- 20. Calcula el número de productoos que tienen un precio mayor o igual a 180€.

SELECT COUNT(*) AS numero_productoos, producto.nombre FROM producto 
where (producto.precio >= 180)
group by producto.nombre 
order by producto.nombre  desc;

--- 21. Calcula el número de productoos que tiene cada fabricante con un precio mayor o igual a 180€.

SELECT fabricante.nombre AS nombre_fabricante, COUNT(producto.id) AS total_productoos 
FROM fabricante
INNER JOIN producto ON fabricante.id = producto.id_fabricante
WHERE producto.precio >= 180
GROUP BY fabricante.nombre;

-- 22. Lista el precio medio los productoos de cada fabricante, mostrando solamente el identificador del fabricante.

SELECT fabricante.id AS id_fabricante, AVG(producto.precio) AS precio_medio
FROM fabricante
INNER JOIN producto ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.id;


-- 23. Lista el precio medio los productoos de cada fabricante, mostrando solamente el nombre del fabricante.

SELECT fabricante.nombre AS nombre_fabricante, AVG(producto.precio) AS precio_medio
FROM fabricante
INNER JOIN producto ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.nombre;


--24. Lista los nombres de los fabricantes cuyos productoos tienen un precio medio mayor o igual a 150€.

SELECT fabricante.nombre
FROM fabricante
INNER JOIN producto ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.nombre
HAVING AVG(producto.precio) >= 150;


--25. Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productoos.

SELECT fabricante.nombre
FROM fabricante
INNER JOIN producto ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.nombre
HAVING COUNT(producto.id) >= 2;

--26. Devuelve un listado con los nombres de los fabricantes y el número de productoos que tiene cada uno con un precio superior o igual a 220 €. 
-- No es necesario mostrar el nombre de los fabricantes que no tienen productoos que cumplan la condición.

SELECT fabricante.nombre, COUNT(producto.id) AS total_productoos
FROM fabricante
INNER JOIN producto ON fabricante.id = producto.id_fabricante
WHERE producto.precio >= 220
GROUP BY fabricante.nombre 
;

--27. Devuelve un listado con los nombres de los fabricantes y el número de productoos que tiene cada uno con un precio superior o igual a 220 €. 
--El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productoos con un precio superior o igual
-- a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productoos.

SELECT fabricante.nombre, COUNT(producto.id) AS total_productoos
FROM fabricante
LEFT JOIN producto ON fabricante.id = producto.id_fabricante AND producto.precio >= 220
GROUP BY fabricante.nombre;

--28 Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productoos es superior a 1000 €.


SELECT fabricante.nombre
FROM fabricante
INNER JOIN producto ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.nombre
HAVING SUM(producto.precio) > 1000;
-- La cláusula HAVING se usa a menudo con la cláusula GROUP BY para filtrar grupos en una lista específica de condiciones.


--29. Devuelve un listado con el nombre del productoo más caro que tiene cada fabricante. 
-- El resultado debe tener tres columnas: nombre del productoo, precio y nombre del fabricante. 
-- El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.

SELECT p.nombre AS nombre_productoo, p.precio, f.nombre AS nombre_fabricante
FROM producto p
INNER JOIN fabricante f 
ON p.id_fabricante = f.id
WHERE p.precio = (
    SELECT MAX(precio)
    FROM producto
    WHERE id_fabricante = f.id
)
ORDER BY f.nombre ASC;



create table pr_ejemplo(
	id_ejemplo INT IDENTITY(1,1) PRIMARY KEY,
	campo_uno varchar(100) not null
)

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'pr_ejemplo')
	DROP PROC dbo.pr_ejemplo
GO

CREATE PROC dbo.pr_ejemplo (
	@i_usuario					udt_login			= 'batch-usr',
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

	RETURN 0
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

	-- BEGIN: Consulta para versiones de SQL Server antiguas
	;WITH registros AS
	(
		SELECT	id_ejemplo				= a.id_ejemplo,
				campo_uno				= a.campo_uno,
				ROW_NUMBER() OVER
				(
					ORDER BY a.campo_uno
				) AS rn
		FROM	tabla_ejemplo a
		WHERE	a.campo_uno				LIKE '%' + ISNULL(@i_campo_uno,a.campo_uno) + '%'
	)

	SELECT	id_ejemplo,
			campo_uno
	FROM	registros
	WHERE	rn		>= @i_offset
		AND	rn		< @i_offset + @i_limit
	-- END

	RETURN 0
END

RAISERROR ('El código de la acción es incorrecto.',16,1)

GO
