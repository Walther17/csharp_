

drop table Usuarios;
create table Usuarios(
Id_Usuario int identity,
Nombre varchar(40),
Edad int,
Correo varchar(max),
Fecha_Nacimiento date,
Status varchar(10)
);

drop procedure sp_Load
create procedure sp_Load
as begin
SELECT * FROM Usuarios where status = 'Activo';
End

Update Usuarios SET status = 'Activo';
--
drop procedure sp_creat
create procedure sp_creat
@Nombre varchar(40),
@Edad int,
@Correo varchar(max),
@Fecha_Nacimiento date,
@Status varchar(10)
as begin
insert into Usuarios values (@Nombre, @Edad, @Correo, @Fecha_Nacimiento, @Status);
End

---
drop procedure sp_read
create procedure sp_read
@Id int
as begin
SELECT * FROM Usuarios where Id_Usuario = @Id
End
----
drop procedure sp_update
create procedure sp_update
@Id int,
@Nombre varchar(40),
@Edad int,
@Correo varchar(max),
@Fecha_Nacimiento date,
@Status varchar(10)
as begin
update Usuarios set  Nombre = @Nombre, Edad = @Edad, Correo =@Correo, Fecha_Nacimiento = @Fecha_Nacimiento , status = @Status where Id_Usuario = @Id
End

---

drop procedure sp_delete
create procedure sp_delete
@Id int
as begin
Update Usuarios SET status = 'Inactivo' where Id_Usuario = @Id
End


Update Usuarios SET status = 'Activo' where Id_Usuario = 2
SELECT * FROM UsuarioS;
