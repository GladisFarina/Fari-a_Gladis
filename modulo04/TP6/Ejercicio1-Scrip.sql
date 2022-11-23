DROP DATABASE IF EXISTS elsistema;
CREATE DATABASE elsistema CHARACTER SET utf8mb4;
USE elsistema;
CREATE TABLE departamentos (
iddepartamento INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
presupuesto DOUBLE UNSIGNED NOT NULL,
estado boolean NOT NULL
);
CREATE TABLE empleados (
idemplaedo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cuil_cuit VARCHAR(15) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL,
apellido VARCHAR(100) NOT NULL,
id_departamento INT UNSIGNED,
estado BOOLEAN,
FOREIGN KEY (id_departamento) REFERENCES departamentos(iddepartamento)
);
CREATE TABLE clientes (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
ciudad VARCHAR(100),
categoría INT UNSIGNED
);
CREATE TABLE vendedores (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
cuitcuil VARCHAR(20),
comisión FLOAT
);
CREATE TABLE pedidos (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
cantidad DOUBLE NOT NULL,
fecha DATE,
id_cliente INT UNSIGNED NOT NULL,
id_vendedor INT UNSIGNED NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id),
FOREIGN KEY (id_vendedor) REFERENCES vendedores(id)
);

/*--punto 1--*/
CREATE TABLE paises (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL);

CREATE TABLE provincias (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
id_pais INT NOT NULL,
FOREIGN KEY (id_pais) REFERENCES paises(id));

CREATE TABLE localidades (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
cp INT NOT NULL,
id_provincia INT NOT NULL,
FOREIGN KEY (id_provincia) REFERENCES provincias(id));

/*--punto 2--*/
ALTER TABLE empleados ADD direccion VARCHAR(30);
ALTER TABLE empleados ADD id_localidad INT;
ALTER TABLE empleados ADD CONSTRAINT id_localidad FOREIGN KEY (id_localidad) REFERENCES localidades(id);
ALTER TABLE empleados ADD email VARCHAR(30);
ALTER TABLE empleados ADD telefono INT;
ALTER TABLE empleados ADD fecha_ingreso DATE;
ALTER TABLE empleados ADD tms TIMESTAMP;

/*--punto 3--*/
ALTER TABLE departamentos ADD gasto DOUBLE;
ALTER TABLE departamentos ADD tms TIMESTAMP;

/*--punto 4--*/
INSERT INTO paises VALUES (1, 'Argentina');
INSERT INTO paises VALUES (2, 'Brasil');
INSERT INTO paises VALUES (3, 'Paraguay');
INSERT INTO paises VALUES (4, 'Colombia');
INSERT INTO paises VALUES (5, 'Uruguay');

INSERT INTO provincias VALUES (1,'Misiones',1);
INSERT INTO provincias VALUES (2,'Parana',2);
INSERT INTO provincias VALUES (3,'Encarnacion',3);
INSERT INTO provincias VALUES (4,'Corrientes',1);
INSERT INTO provincias VALUES (5,'Santa catarina',2);

INSERT INTO localidades VALUES (1,'Foz do Iguazu',4578,2);
INSERT INTO localidades VALUES (2,'Posadas',3764,1);
INSERT INTO localidades VALUES (3,'Camboriu',2548,5);
INSERT INTO localidades VALUES (4,'Puerto Iguazu',3370,1);
INSERT INTO localidades VALUES (5,'Santa teresita',2587,2);

INSERT INTO departamentos (nombre,presupuesto,estado,gasto)VALUES ('sistemas',1880534.00,1,60452.89);
INSERT INTO departamentos (nombre,presupuesto,estado,gasto)VALUES ('recursos humanos',552641.00,0,145789.90);
INSERT INTO departamentos (nombre,presupuesto,estado,gasto)VALUES ('contabilidad',520145.75,1,6210190.90);
INSERT INTO departamentos (nombre,presupuesto,estado,gasto)VALUES ('administracion',450790.10,1,75540.50);
INSERT INTO departamentos (nombre,presupuesto,estado,gasto)VALUES ('gerencia',1750400.00,1,125850.90);

INSERT INTO empleados (cuil_cuit,nombre,apellido,id_departamento,direccion,email,telefono,fecha_ingreso) VALUES ('24-45789548-8','Juan','Gomez',2,'los alpes 239','juangomez@gmail.com',15425896,'2009-02-04');
INSERT INTO empleados (cuil_cuit,nombre,apellido,id_departamento,estado,direccion,id_localidad,email,telefono,fecha_ingreso) VALUES ('20-20147258-7','Jacinto','Ferreira',1,0,'avenida brasil 219',4,'jacintoferreira@gmail.com',15958745,'2000-08-12');
INSERT INTO empleados (cuil_cuit,nombre,apellido,id_departamento,estado,direccion,id_localidad,email,telefono,fecha_ingreso) VALUES ('23-18789541-2','Maria','Herrea',4,1,'San lorenzo 125',3,'mariaherrera@gmail.com',15547123,'1998-11-20');
INSERT INTO empleados (cuil_cuit,nombre,apellido,id_departamento,estado,direccion,id_localidad,email,telefono,fecha_ingreso) VALUES ('20-28541236-9','Paola','Borges',3,1,'antartida arg 478',5,'paola2022@gmail.com',15423547,'2015-07-10');
INSERT INTO empleados (cuil_cuit,nombre,apellido,id_departamento,estado,direccion,id_localidad,email,telefono,fecha_ingreso) VALUES ('20-42789456-7','Pedro','Ramiraz',5,1,'cataratas 1456',1,'pedro41@gmail.com',15454123,'2020-05-16');

/*--punto 5--*/
RENAME TABLE pedidos TO movimientos;

/*--punto 6--*/
CREATE TABLE proveedores (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
razon_social VARCHAR(50) NOT NULL,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
naturaleza VARCHAR(30) NOT NULL,
cuit VARCHAR(30) NOT NULL,
id_localidad INT NOT NULL,
estado BOOLEAN,
tms TIMESTAMP,
FOREIGN KEY (id_localidad) REFERENCES localidades(id));

CREATE TABLE marcas (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
descripcion VARCHAR(30) NOT NULL,
imagen BLOB,
id_proveedor INT NOT NULL,
estado BOOLEAN,
tms TIMESTAMP,
FOREIGN KEY (id_proveedor) REFERENCES proveedores(id));

CREATE TABLE productos (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
descripcion VARCHAR(30) NOT NULL,
id_marca INT NOT NULL,
stock INT NOT NULL,
precio DOUBLE NOT NULL,
estado BOOLEAN,
tms TIMESTAMP,
FOREIGN KEY (id_marca) REFERENCES marcas(id));

CREATE TABLE cajas (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
hora_inicio DATETIME NOT NULL,
hora_cierre DATETIME NOT NULL,
estado BOOLEAN,
tms TIMESTAMP);

/*--punto 7--*/
INSERT INTO proveedores VALUES (1,'comestibles', 'Hector','Campos','fisica','30-1458795-9',2,1,'2022-07-18-04:10:45');
INSERT INTO proveedores VALUES (2,'bebidas en general', 'roque','Frutos','fisica','30-895258-4',4,1,'2022-10-10-00:10:25');
INSERT INTO proveedores VALUES (3,'distribuidor de todo', 'julio','montoya','juridica','30-358741-4',5,0,'2022-11-05-11:10:45');
INSERT INTO proveedores VALUES (4,'autopartes daniel', 'marcos','matos','juridica','30-41259631-7',3,1,'2022-03-20-09:14:01');
INSERT INTO proveedores VALUES (5,'mayorista el sol', 'Sergio','Ferreira','fisica','30-14895471-8',3,0,'2022-02-18-04:11:45');

INSERT INTO marcas (nombre,descripcion,id_proveedor)VALUES ('pepsi','bedida con gas',2);
INSERT INTO marcas (nombre,descripcion,id_proveedor)VALUES ('cofra','fiambre por pieza',3);
INSERT INTO marcas (nombre,descripcion,id_proveedor)VALUES ('El mejor','aceite para motor',4);
INSERT INTO marcas (nombre,descripcion,id_proveedor)VALUES ('ilolay','leche por pack',5);
INSERT INTO marcas (nombre,descripcion,id_proveedor)VALUES ('La cocina','aceite comestible',3);

INSERT INTO productos (nombre,descripcion,id_marca,stock,precio,estado) VALUES('jamon','fiambres',2,650,2500.00,1);
INSERT INTO productos (nombre,descripcion,id_marca,stock,precio,estado) VALUES('aceite','aceites',5,324,1500.00,1);
INSERT INTO productos (nombre,descripcion,id_marca,stock,precio,estado) VALUES('filtro','filtro para auto',3,1235.00,3500.50,0);
INSERT INTO productos (nombre,descripcion,id_marca,stock,precio,estado) VALUES('gaseosa','bebidas',1,1500.90,530.50,1);
INSERT INTO productos (nombre,descripcion,id_marca,stock,precio,estado) VALUES('leche','lacteos en general',5,400,250.00,1);

INSERT INTO cajas (hora_inicio,hora_cierre,estado) VALUES ('2021-12-12-07:10:45','2021-12-12-20:00:00',1);
INSERT INTO cajas (hora_inicio,hora_cierre,estado) VALUES ('2021-12-21-07:10:00','2021-12-21-20:00:00',1);
INSERT INTO cajas (hora_inicio,hora_cierre,estado) VALUES ('2022-02-11-07:00:30','2022-02-12-20:00:00',0);
INSERT INTO cajas (hora_inicio,hora_cierre,estado) VALUES ('2022-05-20-07:30:45','2022-05-20-20:10:00',1);
INSERT INTO cajas (hora_inicio,hora_cierre,estado) VALUES ('2022-10-30-07:20:00','2022-10-30-20:00:00',1);

/*--punto 8--*/
SELECT nombre, presupuesto, gasto, (presupuesto - gasto) AS diferencia FROM departamentos WHERE estado=1;

/*--punto 9--*/
SELECT  paises.nombre,localidades.nombre FROM localidades INNER JOIN paises WHERE id_provincia = paises.id group by paises.nombre;

/*--PUNTO 10--*/
UPDATE empleados SET telefono =18409075 WHERE idemplaedo=2;
UPDATE  empleados SET fecha_ingreso='2021-05-20', id_localidad=2 WHERE idemplaedo= 4;

/*--PUNTO 11--*/
INSERT INTO vendedores VALUES (1,'Carlos','Romero','2035874523-5',0.20);
INSERT INTO vendedores VALUES (2,'Mario','Sosa','20-42785423-5',0.25);
INSERT INTO vendedores VALUES (3,'Alicia','Funes','2729852369-9',0.30);
INSERT INTO vendedores VALUES (4,'Esteban','Martinez','24-74125636-6',0.20);
INSERT INTO vendedores VALUES (5,'Marcela','Vargas','27-32456987-9',0.25);

/*--PUNTO 12--*/
ALTER TABLE movimientos ADD id_producto INT NOT NULL;
ALTER TABLE movimientos ADD estado BOOLEAN;
ALTER TABLE movimientos ADD tms TIMESTAMP; 
ALTER TABLE movimientos ADD tipo_movimiento VARCHAR(30);
ALTER TABLE movimientos ADD CONSTRAINT id_producto FOREIGN KEY (id_producto) REFERENCES productos(id);

/*--PUNTO 13--*/
/*modifiqué el campo id_cliente en la tabla movimientos a NOT NULL para poder ingresar los siguientes registros*/
INSERT INTO movimientos (cantidad,fecha,id_vendedor,id_producto,estado,tipo_movimiento) VALUES (1250.50,'2021-05-10',1,2,1,'ingreso');
INSERT INTO movimientos (cantidad,fecha,id_vendedor,id_producto,estado,tipo_movimiento) VALUES (1045.00,'2021-07-11',2,3,0,'egreso');
INSERT INTO movimientos (cantidad,fecha,id_vendedor,id_producto,estado,tipo_movimiento) VALUES (2589.00,'2022-02-25',4,5,0,'pedido');
INSERT INTO movimientos (cantidad,fecha,id_vendedor,id_producto,estado,tipo_movimiento) VALUES (3400.00,'2021-08-20',3,1,1,'ingreso');
INSERT INTO movimientos (cantidad,fecha,id_vendedor,id_producto,estado,tipo_movimiento) VALUES (2600.00,'2022-10-10',1,2,1,'ingreso');

/*--PUNTO 14--*/
UPDATE movimientos SET estado =0 WHERE id=3;
UPDATE movimientos SET estado =0 WHERE id=1;

/*--PUNTO 15--*/
UPDATE productos SET stock=1900.5 WHERE id=1;
UPDATE productos SET stock=1574.5 WHERE id=2;
UPDATE productos SET stock=1045 WHERE id=3;
UPDATE productos SET stock=4090 WHERE id=4;
UPDATE productos SET stock=3800 WHERE id=5;


/*--PUNTO 16--*/
CREATE TABLE parametros (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
tms TIMESTAMP,
cosas JSON,
id_usuario INT);

/*--PUNTO 17--*/
INSERT INTO parametros (id, cosas, id_usuario)
VALUES 
(1,'{"idDeLaCosa": 101, "permisos": "PUT, GET"}','1'),
(2,'{"vistasPermitidas": "menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente", "grupo": "ventas"}','2'),
(3,'{"zonaHoraria": "America/Argentina/BuenosAires"}','3'),
(4,'{"fechaInicioActividades": "01/01/2019", "mesAperturaCaja": "Enero", "mesCierreCaja": "Diciembre"}','4'),
(5,'{"balancesAniosAnteriores": {"2019": {"ingreso": "7374901.93", "egreso": "3732538.75"}, "2020":{"ingreso": "27442665.12", "egreso": "8522331.82"},"2021": {"ingreso":"31634912.57", "egreso": "9757142.66"}}}','5');