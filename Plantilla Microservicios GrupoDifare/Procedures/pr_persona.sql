/****************************************************************************
 *	Archivo Físico:		pr_persona.sql										*
 *	Stored Procedure:	pr_persona											*
 *	Base de Datos:		[Nombre Base Datos]									*
 *	Producto:			[Nombre Producto]									*
 *	Elaborado por:		[Desarrollador]										*
 *--------------------------------------------------------------------------*
 *							AVISO IMPORTANTE								*
 *	Este archivo contiene codigo fuente que forma parte integral de los		*
 *	sistemas que son propiedad intelectual de GRUPO DIFARE.					*
 *	La utilizacion, modificacion, distribucion o duplicacion en forma total	*
 *	o parcial del contenido de este archivo, sin la respectiva licencia o	*
 *	permiso emitido por la Gerencia de GRUPO DIFARE, será considerada como	*
 *	una grave violación a las leyes de propiedad intelectual de este código	*
 *	y los infractores pueden ser sujetos a demandas judiciales y todas las	*
 *	acciones permitidas bajo el marco de la ley.							*
 *--------------------------------------------------------------------------*
 *						DESCRIPCION DEL PROCEDIMIENTO						*
 *	Operaciones de ingreso, modificación, eliminación y consulta de persona	*
 *--------------------------------------------------------------------------*
 *						BITACORA DE MODIFICACIONES							*
 *	FECHA		AUTOR				RAZON									*
 *	DD/MM/YYYY	[Desarrollador]		Versión inicial							* 
 *--------------------------------------------------------------------------*/

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
			id ,
			nombre, apellido, domicilio, edad
	)
	VALUES (
			@i_id ,
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
	WHERE	a.id_persona			= @i_id_persona

	RETURN 0
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
