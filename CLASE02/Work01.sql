

select * from scott.emp
order by ename;


UPDATE "HR"."EMPLOYEES" 
SET HIRE_DATE = TO_DATE('1999-06-21 14:00:00', 'YYYY-MM-DD HH24:MI:SS') 
WHERE employee_id = 182;

commit;


select * from HR.employees
where hire_date BETWEEN '30/03/1999' and '21/06/1999'
order by hire_date;


variable fecha1 varchar2(100)
variable fecha2 varchar2(100)
EXEC :fecha1 := '30/03/1999'
EXEC :fecha2 := '21/06/1999'

print fecha1
print fecha2

select * from HR.employees
where hire_date BETWEEN to_date(:fecha1,'DD/MM/YYYY') 
  and to_date(:fecha2,'DD/MM/YYYY') + 1
order by hire_date;


select * from HR.employees
where hire_date >= to_date(:fecha1,'DD/MM/YYYY') 
  and hire_date < (to_date(:fecha2,'DD/MM/YYYY') + 1)
order by hire_date;


create table scott.algo(
  cola number(5,0),
  colb varchar2(20)
);

delete from scott.algo;

insert into scott.algo(cola, colb) values(20,'20');
insert into scott.algo(cola, colb) values(30,'30');
insert into scott.algo(cola, colb) values(null,null);
insert into scott.algo(cola, colb) values(40,'40');
insert into scott.algo(cola, colb) values(null,'null');

commit;


select avg(cola), avg(colb) from scott.algo;

select count(cola), count(colb) from scott.algo;

select max(cola), max(colb) from scott.algo;

select min(cola), min(colb) from scott.algo;

select sum(cola), sum(colb) from scott.algo;


