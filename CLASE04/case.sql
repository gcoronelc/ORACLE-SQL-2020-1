-- Ejemplo 1


select 
  case (8)
    when 1 then 'uno' 
    when 2 then 'dos'
    when 3 then 'tres'
    when 4 then 'cuatro'
    when 5 then 'cinco'
    else 'no se'
  end etiqueta
from dual;


-- Ejemplo 2

select 
  country_name, region_id,
  case region_id
    when 1 then 'Europa'
    when 2 then 'America'
    when 3 then 'Asia'
    else 'Otro'
  end as continente
from hr.countries
where country_name like 'B%';



-- Ejemplo 03

select first_name, department_id, salary,
  case
    when salary < 6000 then 'Bajo'
    when salary < 10000 then 'Regular'
    when salary >= 10000 then 'Alto'
  end as Categoría
from hr.employees
where department_id <= 30
order by first_name;


-- Ejemplo 04
/*
Se necesita saber cuantos empleados han ingresado
en cada año.
*/


select * from HR.employees;


select 
  TO_CHAR(HIRE_DATE, 'YYYY') "AÑO",
  COUNT(employee_id) "EMPS"
from HR.employees
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY') 
order by 1;

/*
Ejemplo 05
Saldos por sucursal.
*/

select * from eureka.cuenta;

select 
  c.chr_sucucodigo, s.vch_sucunombre,
  sum(CASE c.CHR_MONECODIGO WHEN '01' THEN c.dec_cuensaldo ELSE 0 END) SALDO_SOLES,
  sum(CASE c.CHR_MONECODIGO WHEN '02' THEN c.dec_cuensaldo ELSE 0 END) SALDO_DOLARES
from eureka.cuenta C
JOIN EUREKA.sucursal S ON c.chr_sucucodigo = s.chr_sucucodigo
group by c.chr_sucucodigo, s.vch_sucunombre;







