-- Ejercicio
/*
Mostrar los empleados que su salario es
menor que el salario promedio.
*/

select avg(salary) promedio
from HR.employees;

-- Usando subconsultas

select 
  e.*,
  round((select avg(salary) from HR.employees),2) promedio
from HR.employees e
where salary < (select avg(salary) from HR.employees);


-- Usando with

with
v1 as (select round(avg(salary),2) promedio from HR.employees)
select e.*,(select promedio from v1) promedio
from HR.employees e
where salary < (select promedio from v1);


/*
SE NECESITA SABER LA CANTIDAD DE EMPLEADOS Y 
EL IMPORTE DE LA PLANILLA POR DEPARTAMENTO.
*/

with 
v1 as (
  SELECT 
    deptno,
    COUNT(1) EMPLEADOS,
    SUM(sal) PLANILLA,
    SUM(sal + NVL(e.comm,0)) PLANILLA2
  FROM SCOTT.emp e
  GROUP BY deptno
)
select d.deptno, d.dname, v1.planilla, v1.planilla2
from scott.dept d 
join v1 on d.deptno = v1.deptno;





-- Se necesita saber la cantidad de matriculados,
-- los ingresos y lo que falta cobrar por curso.
-- Esquema. EDUCA.

/*

CODIGO   NOMBRE                  INGRESO              FALTA
CURSO    CURSO    MATRICULADOS,  PROYECTADO  COBRADO  COBRAR
----------------------------------------------------------------

*/



/*
Por departamento se necesita saber quiénes son los 
empleados que tienen mayor tiempo en la empresa.
*/