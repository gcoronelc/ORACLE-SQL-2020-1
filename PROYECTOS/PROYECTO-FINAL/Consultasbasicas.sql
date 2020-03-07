
-----Solicitudes de informacion (Consultas) basicas------
--1) Se desea conocer la cantidad de stock de todos lo productos

select productos.NOMBRE,productos.CANTIDADENSTOCK from productos

--2)Muestra la ciudad y el codigo postal de las oficinas de España.
select ciudad, codigopostal 
from OFICINAS 
where lower(pais) = 'españa';

--3) Mostrar el nombre y cargo de los empleados que no sean directores de oficina.

select nombre, puesto 
from empleados 
where lower(puesto) <> 'director oficina';

--4)Muestra el número de clientes norteamericanos.
select count(*) as "Num clientes" 
from clientes 
where upper(pais) = 'USA';

 --5)mustre el codigo , nombre, codigo oficina del empleado que no tenga jefe
select CODIGOEMPLEADO,NOMBRE,CODIGOOFICINA
from empleados 
where codigojefe is null
;

--6) Numeros de clientes de cada pais.
select pais, count(*) as "num clientes"
from clientes
group by pais;


--7)mustre el codigo , nombre, codigo oficina del empleado con los nombres de sus respectivos jefes
select e.CODIGOEMPLEADO,e.NOMBRE,e.CODIGOOFICINA ,h.NOMBRE
from empleados e
join empleados h
on e.codigojefe=h.codigoempleado;

--8) Mostrar los clientes y su pais que tengan codigo postal 28904, 24006 y 696969

select nombrecontacto || ' ' || apellidocontacto, pais,
codigopostal
from clientes
where codigopostal in (28904,24006,696969);

--9) mostrar la ganancia que se genera por cada producto
select nombre, gama , PRECIOVENTA-PRECIOPROVEEDOR as ganancia
from productos;

--10)Nombre de los clientes que hayan hecho un pago en 2007
select distinct c.nombrecliente 
from clientes c 
join pagos p on c.CODIGOCLIENTE=p.CODIGOCLIENTE 
where p.FECHAPAGO like '%/07';
