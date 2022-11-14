
/*------EJERCICIO 1----------*/
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

/*-----------EJERCICIO 2-------------*/

CREATE SCHEMA IF NOT EXISTS ejercicio2 DEFAULT CHARACTER SET utf8 ;
USE ejercicio2 ;

CREATE TABLE IF NOT EXISTS pais(
  Id_pais INT NOT NULL AUTO_INCREMENT,
  nombre_pais VARCHAR(45) NOT NULL,
  PRIMARY KEY (Id_pais),
  UNIQUE INDEX nombre_pais_UNIQUE (nombre_pais ASC) VISIBLE);


CREATE TABLE IF NOT EXISTS provincia (
  Id_provincia INT NOT NULL AUTO_INCREMENT,
  nombre_provincia VARCHAR(45) NOT NULL,
  Id_pais INT NOT NULL,
  PRIMARY KEY (Id_provincia),
  INDEX Id_pais_idx (Id_pais ASC) INVISIBLE,
  CONSTRAINT Id_pais
    FOREIGN KEY (Id_pais)
    REFERENCES pais (Id_pais)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS localidad (
  Id_localidad INT NOT NULL AUTO_INCREMENT,
  nombre_localidad VARCHAR(45) NOT NULL,
  cod_postal INT NOT NULL,
  Id_provincia INT NOT NULL,
  UNIQUE INDEX cod_postal_UNIQUE (cod_postal ASC) VISIBLE,
  PRIMARY KEY (Id_localidad),
  INDEX Id_provincia_idx (Id_provincia ASC) VISIBLE,
  CONSTRAINT Id_provincia
    FOREIGN KEY (Id_provincia)
    REFERENCES provincia (Id_provincia)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



CREATE TABLE IF NOT EXISTS empleado (
  Id_empleado INT NOT NULL AUTO_INCREMENT,
  dni INT NOT NULL,
  nombrel VARCHAR(45) NOT NULL,
  telefono INT NOT NULL,
  email VARCHAR(45) NOT NULL,
  fecha_alta DATE NOT NULL,
  Id_localidad INT NOT NULL,
  INDEX Id_localidad_idx (Id_localidad ASC) VISIBLE,
  PRIMARY KEY (Id_empleado),
  CONSTRAINT Id_localidad
    FOREIGN KEY (Id_localidad)
    REFERENCES localidad (Id_localidad)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    /*cargando datos a pais*/
    INSERT INTO pais values(1,'Argentina');
	INSERT INTO pais values(2,'Brasil');
	INSERT INTO pais values(3,'Uruguay');
    
    /*cargando datos a provincia*/
    INSERT INTO provincia VALUES(1,'Misiones',1);
    INSERT INTO provincia VALUES(2,'Parana',2);
    INSERT INTO provincia VALUES(3,'Montevideo',3);
    

	/*cargando datos a localidad*/
    INSERT INTO localidad VALUES(1,'Iguazu',3370,1);
    INSERT INTO localidad VALUES(2,'Foz do Iguazu',5423,2);
    INSERT INTO localidad VALUES(3,'Psadas',3476,1);
    
    /*cargando datos a empleados*/
    INSERT INTO empleado VALUES(1,24589635,'Cristian Perez',548953,'cristian@gmail.com',12/05/2008,1);
	INSERT INTO empleado VALUES(2,24589635,'Raquel Mendoza',375748,'raquel45@gmail.com',12/05/2008,3);
    INSERT INTO empleado VALUES(3,24589635,'Diego Bravo',748931,'diegobravo@gmail.com',12/05/2008,3);
    
    
    /*----------EJERCICIO 3--------------*/
    
    CREATE SCHEMA IF NOT EXISTS ejercicio3 DEFAULT CHARACTER SET utf8 ;
USE ejercicio3 ;


CREATE TABLE IF NOT EXISTS reservas (
  idreserva INT NOT NULL AUTO_INCREMENT,
  fecha_inicio DATE NOT NULL,
  fecha_final DATE NOT NULL,
  precio_x_hora INT NOT NULL,
  num_reserva INT NOT NULL,
  PRIMARY KEY (idreserva));




CREATE TABLE IF NOT EXISTS cliente (
  idcliente INT NOT NULL AUTO_INCREMENT,
  dni INT NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  direcccion VARCHAR(45) NOT NULL,
  telefono INT NOT NULL,
  codigo_cliente VARCHAR(45) NOT NULL,
  idreserva INT NOT NULL,
  PRIMARY KEY (idcliente),
  UNIQUE INDEX codigo_cliente_UNIQUE (codigo_cliente ASC) VISIBLE,
  INDEX idreserva_idx (idreserva ASC) VISIBLE,
  CONSTRAINT idreserva
    FOREIGN KEY (idreserva)
    REFERENCES reservas (idreserva)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS vehiculos (
  idvehiculo INT NOT NULL AUTO_INCREMENT,
  matricula_vehiculo INT NOT NULL,
  modelo VARCHAR(45) NOT NULL,
  color VARCHAR(45) NOT NULL,
  marca VARCHAR(45) NOT NULL,
  idreserva INT NOT NULL,
  PRIMARY KEY (idvehiculo),
    FOREIGN KEY (idreserva)
    REFERENCES reservas (idreserva)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS reserva_cliente (
  idreserva_cliente INT NOT NULL AUTO_INCREMENT,
  idcliente INT NOT NULL,
  codigo_reserva VARCHAR(45) NOT NULL,
  PRIMARY KEY (idreserva_cliente),
  INDEX idcliente_idx (idcliente ASC) VISIBLE,
  CONSTRAINT idcliente
    FOREIGN KEY (idcliente)
    REFERENCES cliente (idcliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);




CREATE TABLE IF NOT EXISTS vehiculo_reserva (
  idvehiculo_reserva INT NOT NULL AUTO_INCREMENT,
  num_reserva INT NOT NULL,
  cantidad INT NOT NULL,
  cantidad_gasolina INT NOT NULL,
  matricula_vehiculo INT NOT NULL,
  idvehiculo INT NOT NULL,
  PRIMARY KEY (idvehiculo_reserva),
  INDEX idvehiculo_idx (idvehiculo ASC) VISIBLE,
  CONSTRAINT idvehiculo
    FOREIGN KEY (idvehiculo)
    REFERENCES vehiculos (idvehiculo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
    /*Cargando datos a Cliente*/
    INSERT INTo cliente VALUES(1,47854256,'Carla Galeano','los alpes 43',451258,'A325K',1);
    INSERT INTo cliente VALUES(2,45124789,'Julio Caceres','rawson 541',789524,'B451M',2);
    INSERT INTo cliente VALUES(3,41258922,'Romina Bosch','Eldorado 412',412368,'C632V',1);
    
    /*Cargando datos a reservas*/
    INSERT INTO reservas VALUES(1,09/10/2022,12/10/2022,1200,542612);
    INSERT INTO reservas VALUES(2,20/09/2022,23/09/2022,1100,524586);
    INSERT INTO reservas VALUES(3,05/10/2022,07/10/2022,1500,654125);
    
    /*cargando datos a vehiculos*/
    INSERT INTO vehiculos VALUES(1,'AA117NF','2016','gris','chevrolet',2);
    INSERT INTO vehiculos VALUES(2,'AB452MN','2017','rojo','fiat',1);
    INSERT INTO vehiculos VALUES(3,'OMP425','2015','azul','renault',3);
    
    /*cargando datos a vehiculo_reserva*/
    INSERT INTO vehiculo_reserva VALUES(1,reserva_clientereserva_cliente524586,1,25,'AB452MN',2);
	INSERT INTO vehiculo_reserva VALUES(2,542612,3,15,'AA117NF',1);
	INSERT INTO vehiculo_reserva VALUES(3,654125,1,25,'OMP425',3);

/*cargando datos a reserva_cliente*/
INSERT INTO reserva_cliente VALUES(1,2,451258);
INSERT INTO reserva_cliente VALUES(2,1,854789);
INSERT INTO reserva_cliente VALUES(3,3,258963);




