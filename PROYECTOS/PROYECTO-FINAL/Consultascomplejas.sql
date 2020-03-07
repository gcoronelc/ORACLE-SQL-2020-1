--Consultas complejas--

--1)Muestra el nombre del cliente y el nombre de su representante de ventas (si lo tiene).
select c.nombrecliente as "Nombre cliente", e.nombre as "Nombre representante" 
from clientes c 
join empleados e on c.codigoempleadorepventas=e.CODIGOEMPLEADO;

--2)Mostrar la ganancia de todos los productos que se vendieron en el año 2007.

with 
v1 as (select P.fechaentrega, DP.codigoproducto, DP.cantidad
      from jardineria.pedidos P
      join jardineria.detallepedidos DP on P.codigopedido = DP.codigopedido
      Where P.fechaentrega like '%/07'
)
select v1.fechaentrega, PRO.nombre, (PRO.precioventa - PRO.precioproveedor)*v1.cantidad as "Ganancia"
from v1
join jardineria.productos PRO on v1.codigoproducto = PRO.codigoproducto;


--3) Muestra el código y la cantidad de veces que se ha pedido un producto al menos una vez.
select p.codigoproducto, sum(dp.cantidad) as "cantidad pedida"
from productos p 
join detallepedidos dp on p.codigoproducto = dp.codigoproducto 
group by p.codigoproducto;


--4) se necesita saber la cantida de productos de la gama aromaticos

select count(P.codigoproducto),GP.gama
from jardineria.PRODUCTOS P
join jardineria.GAMASPRODUCTOS GP on P.gama=GP.gama;
where GP.gama = 'Aromaticos'

--5)Nombre de los clientes que hayan hecho un pago en 2007

select distinct c.nombrecliente 
from clientes c, pagos p 
where c.CODIGOCLIENTE=p.CODIGOCLIENTE 
and p.FECHAPAGO like '%/07';
     
--6) realiza una vista que muestre el codigo de pedido y su total de euros
create or replace view pedidos_total as
select p.codigopedido, sum(dp.cantidad * dp.PRECIOUNIDAD) as total
from pedidos p, detallepedidos dp
where p.codigopedido =dp.codigopedido
group by p.codigopedido;

--7)Mostrar el precio final de cada pedido.
select p.codigopedido, sum(dp.cantidad * dp.PRECIOUNIDAD) as total
from pedidos p
join detallepedidos dp on p.codigopedido = dp.codigopedido
group by p.codigopedido;

--8) Mostrar el codigo de los pedidos donde se hayan vendido mas de 6 productos.
select pe.codigopedido
from pedidos pe
join detallepedidos dp on pe.codigopedido = dp.codigopedido
group by pe.codigopedido
having count(*)>=6;

--9) Se desea saber la oficna del empleado que atendio al cliente Jardin de Flores

with 
v1 as (select C.nombrecliente, E.codigooficina
      from jardineria.CLIENTES C
      join jardineria.EMPLEADOS E on C.codigoempleadorepventas = E.codigoempleado
      Where C.nombrecliente ='Jardin de Flores'
)
select *
from v1
join jardineria.OFICINAS OFI on v1.codigooficina = OFI.codigooficina;

--10)Se desa saber la gama de productos que se piederon en 19/01/06

with 
v1 as (select P.fechapedido, DP.codigoproducto
      from jardineria.pedidos P
      join jardineria.detallepedidos DP on P.codigopedido = DP.codigopedido 
      where P.fechapedido = '17/01/06'  
),
v2 as (select PD.codigoproducto, G.gama
      from jardineria.PRODUCTOS PD
      join jardineria.GAMASPRODUCTOS G on PD.Gama = G.Gama  
)
select *
from v1
join v2 on v1.codigoproducto=v2.codigoproducto;


