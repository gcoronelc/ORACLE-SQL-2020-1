-- TABLAS PARA LA DEMOSTRACION

CREATE TABLE SCOTT.HOMBRES(
  DNI CHAR(8) PRIMARY KEY,
  NOMBRE VARCHAR2(100),
  DISTRITO VARCHAR2(50),
  PROFESION VARCHAR2(20)
);


INSERT INTO SCOTT.HOMBRES VALUES('54679823','GUSTAVO','LOS OLIVOS','INFORMATICO');
INSERT INTO SCOTT.HOMBRES VALUES('65784356','PEDRO','MIRAFLORES','DOCTOR');
INSERT INTO SCOTT.HOMBRES VALUES('56431290','MANUEL','SJL','QUIMICO');
INSERT INTO SCOTT.HOMBRES VALUES('87345623','CARLOS','COMAS','CIENCIAS');
INSERT INTO SCOTT.HOMBRES VALUES('98234546','SERGIO','INDEPENDENCIA','CIVIL');
INSERT INTO SCOTT.HOMBRES VALUES('96756438','ERNESTO','SMP','ECONIMISTA');
INSERT INTO SCOTT.HOMBRES VALUES('78657843','JUAN','SMP','QUIMICO');
INSERT INTO SCOTT.HOMBRES VALUES('89654329','FERNANDO','LOS OLIVOS','CIVIL');

COMMIT;


CREATE TABLE SCOTT.MUJERES(
  DNI CHAR(8) PRIMARY KEY,
  NOMBRE VARCHAR2(100),
  DISTRITO VARCHAR2(50),
  PROFESION VARCHAR2(20)
);


INSERT INTO SCOTT.MUJERES VALUES('12345678','LISBETH','LOS OLIVOS','ENFERMERA');
INSERT INTO SCOTT.MUJERES VALUES('16587234','LEONOR','SJM','DOCTOR');
INSERT INTO SCOTT.MUJERES VALUES('19834657','LAURA','SJL','CONTADORA');
INSERT INTO SCOTT.MUJERES VALUES('18967453','MERIEL','SURCO','CIENCIAS');
INSERT INTO SCOTT.MUJERES VALUES('16743896','ALEJANDRA','INDEPENDENCIA','CIANCIA DE DATOS');
INSERT INTO SCOTT.MUJERES VALUES('19054684','SUSANA','SAN MIGUEL','ECONIMISTA');
INSERT INTO SCOTT.MUJERES VALUES('17854234','KARLA','SURCO','ENFERMERA');
INSERT INTO SCOTT.MUJERES VALUES('16324598','LORENA','SJL','CIENCIAS');


COMMIT;



SELECT * FROM SCOTT.HOMBRES;
SELECT * FROM SCOTT.MUJERES;

-- JOIN - ON

SELECT * 
FROM SCOTT.hombres H
JOIN SCOTT.mujeres M ON h.distrito = m.distrito; 

SELECT h.nombre, m.nombre, h.distrito 
FROM SCOTT.hombres H
JOIN SCOTT.mujeres M ON h.distrito = m.distrito
order by 1; 

SELECT h.nombre, m.nombre, h.profesion
FROM SCOTT.hombres H
JOIN SCOTT.mujeres M ON h.profesion = m.profesion
order by 1; 


-- LEFT OUTER

SELECT * 
FROM SCOTT.hombres H
LEFT JOIN SCOTT.mujeres M ON h.distrito = m.distrito; 

-- RIGHT OUTER

SELECT * 
FROM SCOTT.hombres H
RIGHT JOIN SCOTT.mujeres M ON h.distrito = m.distrito;


-- FULL OUTER

SELECT * 
FROM SCOTT.hombres H
FULL JOIN SCOTT.mujeres M ON h.distrito = m.distrito
ORDER BY 1;


-- CROSS JOIN

SELECT * 
FROM SCOTT.hombres H
CROSS JOIN SCOTT.mujeres
ORDER BY 1;



/*
SE NECESITA SABER LA CANTIDAD DE EMPLEADOS Y 
EL IMPORTE DE LA PLANILLA POR DEPARTAMENTO.
*/

SELECT 
  d.deptno, d.dname,
  COUNT(1) EMPLEADOS,
  SUM(e.sal) PLANILLA,
  SUM(e.sal + NVL(e.comm,0)) PLANILLA2
FROM SCOTT.dept D
JOIN SCOTT.emp E ON d.deptno = e.deptno
GROUP BY d.deptno, d.dname;








-- Se necesita saber la cantidad de matriculados,
-- los ingresos y lo que falta cobrar por curso.
-- Esquema. EDUCA.

/*

CODIGO   NOMBRE                  INGRESO              FALTA
CURSO    CURSO    MATRICULADOS,  PROYECTADO  COBRADO  COBRAR
----------------------------------------------------------------

*/





