
-- EJERCICIO 16
-- Se necesita saber cuáles son los departamentos que tienen más de 10

select DEPARTMENT_ID,  COUNT (1) "EMPLEADOS"
from HR.EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(1)>10;
