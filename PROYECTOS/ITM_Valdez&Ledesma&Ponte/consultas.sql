--COSULTAS SIMPLES

-- 1 - SE NECESITA SABER LA CANTIDAD DE TICKETES ATENDIDOS EN TODAS LAS OFICINAS
select COUNT(*) TICKETS_ATENDIDOS
from ITM_TICKET T
WHERE T.STATUS = '1';

-- 2 - Mostrar los clientes que pertenecen a la oficina de reliability
-- y software factory
select DISTINCT( c.description ) AS CLIENTE, o.description as OFICINA
from itm_clixoffxare coa
join itm_client c on c.clientid=coa.clientid
join itm_office o on o.officeid=coa.officeid
where coa.officeid in (100,300)
order by OFICINA;

-- 3 - mostrar cantidad de clientes que pertenecen al area de systems qa 
--y tienen un estado activo
select count(*) 
from itm_clixoffxare coa
join itm_client c on c.clientid=coa.clientid
where coa.areaid=1 and c.status=1;

-- 4 - mostrar los dispositivos que se vendieron en el rango de $2000 - $ 2500
select * 
from itm_device
where soldby BETWEEN 2000 and 2500;

-- 5 - MOSTRAR LOS DISPOSITIVOS POR LOS CUALES SE PAGO UN MONTO MAYOR A 2400
-- Y SEAN TIPO SERVIDOR
SELECT *
FROM itm_device D
WHERE d.devicetype= 'SERVIDOR' and d.soldby>2400;


-- 6 - MOSTRAR LOS TICKETS PENDIENTES POR CLIENTE
select C.DESCRIPTION, T.TICKETID
from ITM_TICKET T
    LEFT JOIN ITM_CLIENT C
        ON T.CLIENTID = C.CLIENTID
WHERE T.STATUS = '0';

-- 7 - MOSTRAR CLIENTES QUE SE REGISTRARON DESPUES DEL 05/01/20 CON STATUS ACTIVO
select * from itm_client
where DATE_I >=to_date('05/01/2020', 'DD/MM/YYYY') 
      AND status=1;
      
-- 8 - MOSTRAR LOS TICKETS QUE TIENEN UNA DESCRIPCION DE URGENCIA
select * 
from itm_ticket
where summary like '%URGENTE%' and priority='ALTA';


-- 9 - mostrar el valor de las propiedades de las instalaciones las cuales 
--dieron un timeout mayor a 15 seg.
select i.installation, i.description, i.platform, iprop.value
from itm_installation i
join itm_installationproperty iprop on iprop.installation = i.installation
where i.timeout>30
;
-- 10 - mostrar el historial de los tickets que se atenderon como reclamos
select t.ticketid, t.summary,th.oldvalue, th.newvalue
from itm_ticket t
join itm_tickethistory th on th.ticketid = t.ticketid 
where th.field='RECLAMO' AND t.status=1;



--COSULTAS COMPLEJAS
-- 1 - SE NECESITA SABER LA CANTIDAD DE TICKETS ATENDIDOS EN OFICINA FBI TEAM Y OFICINA RELIABILITY
select O.DESCRIPTION, T.STATUS, COUNT(*) TICKETS
from ITM_TICKET T
    LEFT JOIN ITM_OFFICE O
        ON T.OFFICEID = O.OFFICEID
WHERE T.OFFICEID IN ('100', '200') AND T.STATUS = '1'
GROUP BY O.DESCRIPTION, T.STATUS;

-- 2 - SE NECESITA SABER LA CANTIDAD DE TICKETS PENDIENTES POR AREA
select  A.AREAID,a.description, T.STATUS, COUNT(*) TICKETS
from ITM_TICKET T
    LEFT JOIN ITM_AREA A
        ON T.AREAID = A.AREAID
WHERE T.STATUS = '0'
GROUP BY  A.AREAID,a.description, T.STATUS;


-- 3 - POR CADA OFICINA SE REQUIERE SABER CUANTOS TICKETS SE HAN GENERADO DE 
--UN PROYECTO
select O.DESCRIPTION OFFICE, P.DESCRIPTION PROJECT , COUNT(*) TICKETS
from ITM_TICKET T
    LEFT JOIN ITM_OFFICE O
        ON T.OFFICEID = O.OFFICEID
    LEFT JOIN ITM_PROJECT P
        ON T.OFFICEID = P.OFFICEID AND T.PROJECTID = P.PROJECTID
GROUP BY O.DESCRIPTION, P.DESCRIPTION;

-- 4 - MOSTRAR LOS CLIENTES QUE SUS TICKETS FUERON ATENDIDOS
select UNIQUE(C.DESCRIPTION)
from ITM_TICKET T
    LEFT JOIN ITM_CLIENT C
        ON T.CLIENTID = C.CLIENTID
WHERE T.STATUS = '1';


