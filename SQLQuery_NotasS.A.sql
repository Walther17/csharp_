




CREATE TABLE materia (
  id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

create table nota (
 id INT IDENTITY(1,1) PRIMARY KEY,
  nota decimal NOT NULL,
   id_materia INT NOT NULL,
  FOREIGN KEY (id_materia) REFERENCES materia(id)
);

INSERT INTO nota (nota, id_materia) values (8,2)


INSERT INTO MATERIA (nombre) values ('Programación')

select * from materia

select * from nota