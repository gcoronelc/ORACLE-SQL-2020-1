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


-- TABLA DERIVADA

/*
Mostrar los empleados que su salario es
menor que el salario promedio.
*/

select avg(salary) promedio
from HR.employees;

-- Usando subconsultas

select e.*, t.promedio
from HR.employees e
JOIN (select ROUND(avg(salary),2) PROMEDIO from HR.employees) T
ON e.salary < T.PROMEDIO;



/*
De cada departamento se necesita saber quien (con empates)
es el empleado con el menor salario.
*/

select * 
from HR.employees
where (department_id,salary) in ( select department_id, min(salary)
                                  from hr.employees
                                  where department_id is not null
                                  group by department_id );


with 
v1 as (
  select department_id, min(salary) salary
  from hr.employees
  where department_id is not null
  group by department_id 
)
select * 
from HR.employees e 
join v1 on e.department_id = v1.department_id and e.salary = v1.salary;


/*
Por departamento se necesita saber quiénes son los 
empleados que tienen mayor tiempo en la empresa.
*/


with 
v1 as (
  select department_id, min(hire_date) fecha
  from hr.employees
  where department_id is not null
  group by department_id 
)
select * 
from HR.employees e 
join v1 on e.department_id = v1.department_id and e.hire_date = v1.fecha;




-- Se necesita saber la cantidad de matriculados,
-- los ingresos y lo que falta cobrar por curso.
-- Esquema. EDUCA.

/*

CODIGO   NOMBRE                  INGRESO              FALTA
CURSO    CURSO    MATRICULADOS,  PROYECTADO  COBRADO  COBRAR
----------------------------------------------------------------

*/



