CREATE SCHEMA IF NOT EXISTS ejercicio1 CHARACTER SET utf8mb4 ;
USE ejercicio1 ;

CREATE TABLE IF NOT EXISTS curso (
  idcurso INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  cod_curso VARCHAR(45) NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  idalumno_curso INT NOT NULL,
  idprofesor INT NOT NULL,
  FOREIGN KEY (idalumno_curso)
    REFERENCES alumno_curso (idalumno_curso)
);
 

CREATE TABLE IF NOT EXISTS alumno (
  idalumno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  cod_matricula VARCHAR(45) NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  dni INT NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  email VARCHAR(45) NOT NULL);




CREATE TABLE IF NOT EXISTS profesor (
  idprofesor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(45) NOT NULL,
  especialidad VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  idcurso INT NULL);


CREATE TABLE IF NOT EXISTS alumno_curso (
  idalumno_curso INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  idalumno INT NULL ,
  idcurso INT NULL,
   FOREIGN KEY (idalumno)
   REFERENCES alumno (idalumno));




CREATE TABLE IF NOT EXISTS curso_profesor (
  idcurso_profesor INT NOT NULL PRIMARY KEY,
  idprofesor INT NOT NULL,
  idcurso VARCHAR(45) NOT NULL,
   FOREIGN KEY (idprofesor)
    REFERENCES profesor (idprofesor));
  
/*CARGANDO DATOS A TABLA ALUMNOS*/
insert into alumno values(1,'mario padilla',189768,48895478,25/04/2002,'mario@gmail.com');
insert into alumno values(2,'maria lopez',369854,38541256,08/05/1995,'marialopez@gmail.com');
insert into alumno values(3,'mario padilla',189768,48895478,25/04/2002,'mario@gmail.com');

/*CARGANDO DATOS A ALUMNO_CURSO*/
insert into alumno_curso values(1,2,1);
insert into alumno_curso values(2,2,1);
insert into alumno_curso values(3,1,3);

/*CARGANDO DATOS A CURSO*/
insert into curso values (1,'165','literatura',1,2);
insert into curso values (2,'121','electricidad',2,3);
insert into curso values (3,'251','ingles',2,1);

/*CARGANDO DATOS A CURSO_PROFESOR*/
insert into  curso_profesor values(1,1,3);
insert into  curso_profesor values(2,2,1);
insert into  curso_profesor values(3,3,2);

/*CARGANDO DATOS A PROFESOR*/
insert into profesor values(1,'Jorge Lopez','ingles','jorgelopez@gmail.com',3);
insert into profesor values(2,'Lucia Sosa','literatura','lucia88@gmail.com',1);
insert into profesor values(3,'Marcos Acuña','electricidad','marcosacuña@gmail.com',2);


