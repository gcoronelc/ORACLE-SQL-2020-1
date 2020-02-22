select distinct 
  cantidad_empleado,department_id 
from (
    select to_char(hire_date,'YYYY') Año,count(0) cantidad_empleado, department_id 
 from hr.employees
 group by to_char(hire_date,'YYYY'),department_id
 order by 1,2)
 where cantidad_empleado>10;
 