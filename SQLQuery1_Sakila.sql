
-- Primer ejercicio:
--Realizar una consulta que extraiga todas las películas alquiladas por un usuario,
--dicho reporte deberá tener los datos del cliente, película, la tienda de la que fue
--alquilada, la persona del staff que atendió el arrendamiento y el actor principal
--(top 1) que participo en la película alquilada.
select 
c.first_name as Nombre_del_Cliente,
c.last_name as Apellido_del_Cliente,
c.email as Correo_del_Cliente,
film.title as Pelicula,
R.customer_id AS ID_CLIENTE,
st.store_id as Tienda_id,
s.first_name as Vendedor,
fa.actor_id
from film , customer c , store st, staff s,  film_actor fa, rental R,

INNER JOIN  



ON 


where rating = 'R'


SELECT
  c.first_name AS Nombre_del_Cliente,
  c.last_name AS Apellido_del_Cliente,
  c.email AS Correo_del_Cliente,
  f.title AS Pelicula,
  R.customer_id AS ID_CLIENTE,
  st.store_id AS Tienda_id,
  s.first_name AS Vendedor,
  fa.actor_id AS IDActorPrincipal
FROM
  customer c
  INNER JOIN rental R ON c.customer_id = R.customer_id
  INNER JOIN inventory i ON R.inventory_id = i.inventory_id
  INNER JOIN film f ON i.film_id = f.film_id
  INNER JOIN store st ON i.store_id = st.store_id
  INNER JOIN staff s ON R.staff_id = s.staff_id
  INNER JOIN film_actor fa ON f.film_id = fa.film_id
WHERE
  c.customer_id = 5
 

 -- Procedimientos almacenados

 create procedure conteo(@total int output)
 as 
 begin
		select @total = count(*) from customer
end
go
	
	declare @total int
	exec conteo @total output
	select @total as 'Clientes totales'

	select count(*) as total_clientes from customer

--INNER JOIN

select 
*
from film 
INNER JOIN 
film_actor
ON 
film.film_id = film_actor.film_id where rating = 'R'

select * from store



CREATE TABLE fabricante (
  id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio FLOAT NOT NULL,

  id_fabricante INT NOT NULL,
  FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)
);
