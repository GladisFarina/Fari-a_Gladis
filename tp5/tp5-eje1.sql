SELECT * FROM sistema.departamentos;
select apellido from empleados;    /*punto 1*/
SELECT DISTINCT APELLIDO FROM EMPLEADOS;    /*punto 2*/
SELECT * FROM EMPLEADOS;  /*punto 3*/
SELECT NOMBRE, APELLIDO FROM EMPLEADOS;     /*punto 4*/
SELECT CUIL_CUIT FROM EMPLEADOS;          /*punto 5*/
SELECT  concat_ws('',NOMBRE,APELLIDO) AS NOMBRE_COMPLETO from empleados;		/*punto 6*/
SELECT  upper(concat_ws('',NOMBRE,APELLIDO)) AS NOMBRE_COMPLETO from empleados;  /*punto 7*/
SELECT  lower(concat_ws('',NOMBRE,APELLIDO)) AS NOMBRE_COMPLETO from empleados;  /*punto 8*/
select nombre from sistema.departamentos order by presupuesto asc; 				/*punto 9/
select nombre from sistema.departamentos order by nombre asc; 					/*punto 10*/
select nombre from sistema.departamentos order by nombre desc; 					/*punto 11*/
select apellido,nombre from sistema.empleados order by apellido asc; 			/*punto 12*/
select nombre,presupuesto from sistema.departamentos order by presupuesto desc limit 3; /*punto 13*/
select nombre,presupuesto from sistema.departamentos order by presupuesto asc limit 3;  /*punto 14*/
select nombre,presupuesto from sistema.departamentos where presupuesto >= 150000;       /*punto 15*/
select nombre,presupuesto from sistema.departamentos where (presupuesto >=100000 and  presupuesto <= 200000);/*punto 16*/
select nombre,presupuesto from sistema.departamentos where not (presupuesto >=100000 and  presupuesto <= 200000);/*punto 17*/
select nombre,presupuesto from sistema.departamentos where presupuesto between 100000 and 200000;        /*punto 18*/
select nombre,presupuesto from sistema.departamentos where not presupuesto between 100000 and 200000;	/*punto 19*/
select empleados.nombre,apellido ,departamentos.nombre from empleados,departamentos where iddepartamento = id_departamento; /*punto 20*/
select empleados.nombre,apellido ,departamentos.nombre from empleados,departamentos where iddepartamento = id_departamento order by departamentos.nombre asc,empleados.apellido,empleados.nombre asc; /*punto 21*/
