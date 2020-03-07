

insert into scott.emp(empno,ename,sal)
values(5555,'gustavo',8888);

commit;

select * from scott.emp
where empno = 5555;


update scott.emp 
set sal = 9999
WHERE empno = 5555;

commit;


delete from scott.emp;

ROLLBACK;

SELECT * FROM SCOTT.EMP;

delete from scott.emp
WHERE empno = 5555;


create table eureka.resumen as
select 
  c.chr_sucucodigo, s.vch_sucunombre,
  sum(CASE c.CHR_MONECODIGO WHEN '01' THEN c.dec_cuensaldo ELSE 0 END) SALDO_SOLES,
  sum(CASE c.CHR_MONECODIGO WHEN '02' THEN c.dec_cuensaldo ELSE 0 END) SALDO_DOLARES
from eureka.cuenta C
JOIN EUREKA.sucursal S ON c.chr_sucucodigo = s.chr_sucucodigo
group by c.chr_sucucodigo, s.vch_sucunombre;


select * from eureka.resumen;

