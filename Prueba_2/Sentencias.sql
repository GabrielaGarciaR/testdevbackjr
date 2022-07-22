CREATE DATABASE test_empleados;
USE test_empleados;

CREATE TABLE usuarios(
userId int, 
Login varchar(100),
Nombre varchar(100),
Paterno varchar(100),
Materno varchar(100),
PRIMARY KEY (Login));

CREATE TABLE empleados( 
Sueldo float,
FechaIngreso date,
LoginEmp varchar(100),
FOREIGN KEY (LoginEmp) REFERENCES usuarios (Login));
  
INSERT INTO usuarios (userId,Login,Nombre,Paterno,Materno) VALUES
(1,'user01','BERE','NARANJO','GONZALEZ'),
(2,'user02','ALEXIS','CAMPOS','NARANJO'),
(3,'user03','SERGIO ALEJANDRO','CAMPOS','HERNANDEZ'),
(4,'user04','DIEGO ISMAEL','BERUMEN','CEDILLO' ),
(5, 'user05','AURORA','ESCALANTE',' PALAFOX'),
(6,'user06' ,'JOYCELENE FABIOLA','ESTRADA','BARBA'),
(7,'user07','FRANCISCO','ESTRADA','GOMEZ'),
(8,'user08','LEONARDO DANIEL','FARIAS','ROSAS'),
(9,'user09','RAMON ANDRES','FIERROS','ROBLES'),
(10,'user10','EDGAR ANDRES','FLORES','OLIVARES'),
(11,'user11','MARIA FERNANDA','FRANCO','ESQUIVEL'),
(12,'user12','ALEJANDRO','GALVAN','MUÑIZ'),
(13,'user13','MARTHA ALICIA','GUTIERREZ','ORTIZ'),
(14,'user14','JOSAFAT GERARDO','HERNANDEZ','SAUCEDO'),
(15,'user15','ROSALIA','JIMENEZ','GONZALEZ'),
(16,'user16','ULEICA ELIZABETH','JIMENEZ','RIOS'),
(17,'user17','ANGELICA','LOPEZ','CORTES'),
(18,'user18','CRISTIAN IVAN','LOPEZ','GOMEZ'),
(19,'user19','MARLENE GABRIELA','LOPEZ','MEZA'),
(20,'user20','ALEJANDRA','MEDINA','IBARRA'),
(21,'user21','CONSUELO YURIDIANA THALIA','MEJIA','ALVAREZ'),
(22,'user22','JAVIER ADRIAN','MEJIA','ALVAREZ'),
(23,'user23','JUAN CARLOS EVARISTO','PEÑA','GUTIERREZ'),
(24,'user24','JAZMIN ALEJANDRA','PEREZ','VELEZ'),
(25,'user25','GUSTAVO','RAMIREZ','RIVERA'),
(26,'user26','CARLOS NIVARDO','RODRIGUEZ','ASCENCIO'),
(27,'user27','KARLA JOHANA','ROMERO','LUEVANOS'),
(28,'user28','YESSICA YOSELINNE','RUIZ','HERNANDEZ'),
(29,'user29','CHRISTIAN EDUARDO','SALAS','SANCHEZ'),
(30,'user30','LUIS ROBERTO','SALDAÑA','ESPINOZA'),
(31,'user31','ADRIAN','SANCHEZ','ORTIZ'),
(32,'user32','EDUARDO YAIR','SUAREZ','HERNANDEZ'),
(33,'user33','JUAN FRANCISCO','TABAREZ','GARCIA'),
(34,'user34','ZULEICA ELIZABETH','TERAN','TORRES'),
(35,'user35','ADRIANA YUNUHEN','VARGAS','AYALA'),
(36,'user36','OSCAR URIEL','VELAZQUEZ','ALVAREZ'),
(37,'user37','ERICK DE JESUS','CORONA','DIAZ'),
(38,'user38','MARIA GUADALUPE','RAMOS','HERNANDEZ'),
(39,'user39','JESSICA NOEMI','JIMENEZ','VENTURA'),
(40,'user40','FLOR MARGARITA','ROJAS','HERNANDEZ'),
(41,'user41','LUIS ANTONIO','ALVARADO','VALENCIA'),
(42,'user42','EDGAR IVAN','AGUILAR','PADILLA'),
(43,'user43','LUIS ALFONSO','MICHEL','SANCHEZ'),
(44,'user44','JOSE CARLOS','SILVA','ROCHA'),
(45,'user45','JUDITH','RODRIGUEZ','REYES'),
(46,'user46','BRENDA SORAYA','CHAVEZ','GARCIA'),
(47,'user47','ALMA ROSA','MARQUEZ','AGUILA');

INSERT INTO empleados (Sueldo,FechaIngreso,LoginEmp) VALUES
(8837,'2000-01-11','user01'),
(8837,'2000-01-11','user02'),
(15000,'2000-01-11','user03'),
(15000,'2000-01-11','user04'),
(7812,'2000-01-18','user05'),
(7812,'2000-01-18','user06'),
(10200,'2000-01-18','user07'),
(10200,'2000-01-18','user08'),
(13800,'2001-05-20','user09'),
(13800,'2001-05-20','user10'),
(18880,'2001-05-20','user11'),
(18880,'2001-05-20','user12'),
(8000,'2001-07-13','user13'),
(8000,'2001-07-13','user14'),
(6000,'2001-07-13','user15'),
(19470,'2001-07-13','user16'),
(19470,'2001-07-13','user17'),
(10200,'2001-07-16','user18'),
(10200,'2001-07-16','user19'),
(25000,'2001-07-16','user20'),
(7812,'2001-07-16','user21'),
(7812,'2001-07-16','user22'),
(12210,'2001-11-24','user23'),
(12210,'2001-11-24','user24'),
(7500,'2001-11-24','user25'),
(15020,'2001-11-24','user26'),
(15020,'2001-11-24','user27'),
(25000,'2001-11-24','user28'),
(7812,'2001-11-24','user29'),
(15020,'2001-12-12','user30'),
(15020,'2001-12-12','user31'),
(12210,'2001-12-12','user32'),
(12210,'2001-12-12','user33'),
(19470,'2008-08-17','user34'),
(19470,'2008-08-17','user35'),
(8000,'2008-08-17','user36'),
(8000,'2008-08-17','user37'),
(18880,'2009-06-11','user38'),
(18880,'2009-06-11','user39'),
(14000,'2009-06-11','user40'),
(13800,'2009-06-11','user41'),
(13800,'2009-06-11','user42'),
(15000,'2009-10-06','user43'),
(15000,'2009-10-06','user44'),
(13000,'2009-10-06','user45'),
(8837,'2009-10-06','user46');


/*1. Depurar solo los ID diferentes de 6,7,9 y 10 de la tabla usuarios*/
SELECT u.userId 
FROM usuarios AS u
WHERE u.userId  IN (6,7,9,10);

/*2. Actualizar el dato Sueldo en un 10 porciento a los empleados que tienen fechas entre el año 2000 y 2001*/
UPDATE empleados 
SET Sueldo = Sueldo + Sueldo * 0.10
WHERE FechaIngreso BETWEEN '2000-01-01' AND '2001-12-31';

/*3.Realiza una consulta para traer el nombre de usuario y fecha de ingreso de los usuarios que gananen mas de 10000 y su apellido comience con T ordernado del mas reciente al mas antiguo*/
SELECT u.Nombre,u.Paterno, e.FechaIngreso, e.Sueldo
FROM usuarios AS u INNER JOIN empleados AS e on u.Login = e.LoginEmp 
WHERE u.Paterno LIKE 'T%' AND e.Sueldo >= 10000
ORDER BY e.FechaIngreso DESC;

/*4. Realiza una consulta donde agrupes a los empleados por sueldo, un grupo con los que ganan menos de 1200 y uno mayor o igual a 1200, cuantos hay en cada grupo*/

SELECT COUNT(e.Sueldo) as Mayores_a_1200 
from empleados as e
WHERE Sueldo > 1200
order by Mayores_a_1200;

SELECT COUNT(e.Sueldo) as Menores_a_1200 
from empleados as e
WHERE Sueldo < 1200
order by Menores_a_1200




