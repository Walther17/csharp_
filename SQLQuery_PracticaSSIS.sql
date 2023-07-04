
create database practicassis;

use practicassis;

IF OBJECT_ID('fk_id_cliente', 'F') IS NOT NULL
	ALTER TABLE facturas DROP CONSTRAINT fk_id_cliente;

IF OBJECT_ID('fk_id_factura', 'F') IS NOT NULL
	ALTER TABLE detalle_facturas DROP CONSTRAINT fk_id_factura;

IF OBJECT_ID('detalle_facturas', 'U') IS NOT NULL
  DROP TABLE detalle_facturas; 

IF OBJECT_ID('facturas', 'U') IS NOT NULL
  DROP TABLE facturas; 

IF OBJECT_ID('clientes', 'U') IS NOT NULL
  DROP TABLE clientes;

IF OBJECT_ID('log_actividades', 'U') IS NOT NULL
  DROP TABLE log_actividades;

CREATE TABLE clientes (
	[id_cliente] [bigint] IDENTITY(1,1) NOT NULL primary key,
	[nombre] [varchar](20) NULL,
	[apellido] [varchar](20) NULL,
	[edad] [int] NULL,
	[domicilio] [varchar](100) NULL
);

CREATE TABLE facturas (
	[id_factura] [bigint] IDENTITY(1,1) NOT NULL primary key,
	[fecha_emision] [date] NOT NULL DEFAULT '1970-01-01',
	[total] [decimal](7,2) NOT NULL,
	[correo] [varchar](100) NOT NULL,
	[id_cliente] [bigint] NOT NULL,
	constraint fk_id_cliente foreign key (id_cliente)
	references clientes(id_cliente)
);

CREATE TABLE detalle_facturas (
	[id_detalle] [bigint] IDENTITY(1,1) NOT NULL primary key,
	[descripcion] [text] NOT NULL,
	[monto] [decimal](6, 2) NOT NULL,
	[id_factura] [bigint] NOT NULL,
	constraint fk_id_factura foreign key (id_factura)
	references facturas(id_factura)
);

CREATE TABLE log_actividades (
	[id_detalle] [bigint] IDENTITY(1,1) NOT NULL primary key,
	[titulo] [varchar](100) NOT NULL,
	[mensaje] [text] NOT NULL,
	[fecha] [datetime] NOT NULL DEFAULT getdate()
);

DROP PROCEDURE IF EXISTS pr_insert_log;
GO
CREATE PROCEDURE pr_insert_log(@titulo varchar(100), @mensaje text)
AS
BEGIN
	insert into log_actividades (titulo, mensaje) values (@titulo, @mensaje);
END
GO

-- # Usuarios
-- ###########################################################################
insert into clientes (nombre, apellido, edad, domicilio) values ('Brigg', 'Windle', 27, '5 Burning Wood Circle');
insert into clientes (nombre, apellido, edad, domicilio) values ('Gale', 'Boller', 18, '1 Scofield Alley');
insert into clientes (nombre, apellido, edad, domicilio) values ('Sherlocke', 'Wickham', 27, '1360 Fisk Trail');
insert into clientes (nombre, apellido, edad, domicilio) values ('Justis', 'Freckelton', 29, '2456 Mockingbird Circle');
insert into clientes (nombre, apellido, edad, domicilio) values ('Alfons', 'Deesly', 20, '25 Kennedy Point');
insert into clientes (nombre, apellido, edad, domicilio) values ('Baily', 'Tozer', 21, '0831 Independence Court');
insert into clientes (nombre, apellido, edad, domicilio) values ('Lyman', 'Gaffer', 21, '9 Canary Hill');
insert into clientes (nombre, apellido, edad, domicilio) values ('Reinold', 'Benny', 34, '92 Division Way');
insert into clientes (nombre, apellido, edad, domicilio) values ('Klement', 'Olivey', 34, '05 Algoma Street');
insert into clientes (nombre, apellido, edad, domicilio) values ('Amery', 'Iskow', 20, '08972 Fair Oaks Avenue');
insert into clientes (nombre, apellido, edad, domicilio) values ('Ermin', 'Chastagnier', 23, '11 Garrison Court');

-- # Facturas
-- ###########################################################################
insert into facturas (fecha_emision, total, correo, id_cliente) values ('2021-06-08', 3713.56, 'hadds0@amazonaws.com', 1);
insert into facturas (fecha_emision, total, correo, id_cliente) values ('2021-11-12', 3312.93, 'lmuress1@abc.net.au', 2);
insert into facturas (fecha_emision, total, correo, id_cliente) values ('2022-02-09', 991.55, 'kricharson2@godaddy.com', 3);
insert into facturas (fecha_emision, total, correo, id_cliente) values ('2021-08-25', 2912.59, 'ahelliar3@google.pl', 4);
insert into facturas (fecha_emision, total, correo, id_cliente) values ('2022-02-03', 1812.80, 'tbrownbridge4@baidu.com', 5);

-- # Detalle Facturas
-- ###########################################################################
insert into detalle_facturas (descripcion, monto, id_factura) values ('Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 3713.56, 1);
insert into detalle_facturas (descripcion, monto, id_factura) values ('Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 3312.93, 2);
insert into detalle_facturas (descripcion, monto, id_factura) values ('Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 991.55, 3);
insert into detalle_facturas (descripcion, monto, id_factura) values ('Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 2912.59, 4);
insert into detalle_facturas (descripcion, monto, id_factura) values ('Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 500.80, 5);
insert into detalle_facturas (descripcion, monto, id_factura) values ('Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 500.00, 5);
insert into detalle_facturas (descripcion, monto, id_factura) values ('Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 812, 5);


select * from facturas