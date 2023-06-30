
create database cursos_sa


CREATE TABLE materia (
  id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);


create table estudiante(
 id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
	  edad int NOT NULL

);


create table profesor(
 id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,

);


create table curso(
 id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
   
   id_profesor INT NOT NULL,
  FOREIGN KEY (id_profesor) REFERENCES profesor(id),


   id_estudiante INT NOT NULL,
  FOREIGN KEY (id_estudiante) REFERENCES estudiante(id)

);


-----------


insert into estudiantes (nombre, apellido, edad, id_curso) values ('Dev','Joander',20, 1)
insert into profesores (nombre, apellido ) values ('Cesar','Alcivar')
insert into cursos (nombre, descripcion, id_profesor ) values ('English', 'hdxjgfxdjhrtgshtrs',  1)

select * from estudiantes

select * from profesores


select * from cursos


CREATE TABLE profesores (
    id INT identity PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    apellido NVARCHAR(100) NOT NULL
);

CREATE TABLE cursos (
    id INT identity PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(500) NOT NULL,

    id_profesor INT  ,
    CONSTRAINT FK_ID_PROFESOR FOREIGN KEY (id_profesor) REFERENCES profesores(id)
);

create TABLE estudiantes (
    id INT identity PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    apellido NVARCHAR(100) NOT NULL,
    edad INT,
    id_curso INT 

  CONSTRAINT FK_ID_CURSO  FOREIGN KEY (id_curso) REFERENCES cursos(id)
);


drop table profesores
drop table cursos
drop table estudiantes


create database cursos_sa2


-- Scaffold-DbContext "Server=localhost; DataBase=cursos_sa2; Integrated Security=true; TrustServerCertificate=True" Microsoft.EntityFrameworkCore.SqlServer -OutPutDir Models



CREATE TABLE EstudiantesCursos (
    IdEstudiante INT,
    IdCurso INT,
    PRIMARY KEY (IdEstudiante, IdCurso),
    FOREIGN KEY (IdEstudiante) REFERENCES Estudiantes(IdEstudiante),
    FOREIGN KEY (IdCurso) REFERENCES Cursos(IdCurso)
);

