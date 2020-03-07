--consultas dificiles 

with T_pedidos 
as(
select  l.idprov, l.precio * l.cant Total_pagar
from biblioteca.pedido_libros l)
select r.idprov, r.nomprov , r.direcprov, p.Total_pagar from biblioteca.proveedores r join T_pedidos p on r.idprov = p.idprov;


with t_libros
as(
select a.nombre Autor,
a.idaut
from biblioteca.autores a)
select l.lugar, t.Autor from biblioteca.libros l inner join t_libros t on l.idaut = t.idaut; 


with t_libros
as(
select a.nombre Autor,
a.idaut
from biblioteca.autores a)
select t.Autor, count(distinct l.lugar) lugares from biblioteca.libros l inner join t_libros t on l.idaut = t.idaut group by t.autor;


select c.nombre, b.fecha from biblioteca.boleta b join biblioteca.cliente c on b.IDCLIENTE = c.IDCLIENTE;


select c.nombre, c.direccion, c.idlib, e.fecha from biblioteca.boleta e join biblioteca.cliente c on c.idcliente  = e.idcliente;


with t_libros as(
select l.idlib,l.titulo titulo
from biblioteca.libros l
)select c.nombre, c.direccion, t.titulo, e.fecha from biblioteca.boleta e, biblioteca.cliente c, t_libros t where c.idcliente  = e.idcliente and t.idlib = c.idlib;


select p.nomprov, l.precio from biblioteca.proveedores p join biblioteca.pedido_libros l on p.idprov = l.idprov and l.precio>60;


select a.nombre, l.editorial from biblioteca.autores a join biblioteca.libros l on a.idaut = l.idaut;


select p.nomprov, sum(l.precio) Suma_libros from biblioteca.pedido_libros l join biblioteca.proveedores p on p.idprov = l.idprov group by p.NOMPROV;


select p.cant, count(1) cantidad from biblioteca.pedido_libros p join biblioteca.libros l on p.idlib = l.idlib group by p.cant having count(1)>0 order by 1;

