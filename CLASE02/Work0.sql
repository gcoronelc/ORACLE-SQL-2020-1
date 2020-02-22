

select 
  department_id, 
  count(department_id) emps,
  round(avg(salary),0) salario_promedio
from HR.employees
where department_id is not null
group by department_id
order by 3;


select 
  to_char(hire_date,'YYYY') "AÑO",
  department_id "DEPARTAMENTO",
  count(1) "EMPLEADOS"
from HR.employees
WHERE department_id IS NOT NULL
GROUP BY to_char(hire_date,'YYYY'), department_id
ORDER BY 1,2;



select department_id, count(1) empleados 
from HR.employees
where department_id is not null
group by department_id
having count(1) > 10
order by 1;




