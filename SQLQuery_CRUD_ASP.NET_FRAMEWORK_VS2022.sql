


create table Usuarios(
Id_Usuario int identity,
Nombre varchar(40),
Edad int,
Correo varchar(max),
Fecha_Nacimiento date
);

create procedure sp_Load
as begin
SELECT * FROM Usuarios
End

--
create procedure sp_creat
@Nombre varchar(40),
@Edad int,
@Correo varchar(max),
@Fecha_Nacimiento date
as begin
insert into Usuarios values (@Nombre, @Edad, @Correo, @Fecha_Nacimiento);
End

---
create procedure sp_read
@Id int
as begin
SELECT * FROM Usuarios where Id_Usuario = @Id
End
----

create procedure sp_update
@Id int,
@Nombre varchar(40),
@Edad int,
@Correo varchar(max),
@Fecha_Nacimiento date
as begin
update Usuarios set  Nombre = @Nombre, Edad = @Edad, Correo =@Correo, Fecha_Nacimiento = @Fecha_Nacimiento where Id_Usuario = @Id
End

---

create procedure sp_delete
@Id int
as begin
delete FROM Usuarios where Id_Usuario = @Id
End