select nombre, direccion from biblioteca.cliente;
select precio * cant total from biblioteca.pedido_libros;
select titulo from biblioteca.libros where lugar='Lima';
select precio from biblioteca.pedido_libros where precio<80;
select * from biblioteca.pedido_libros where precio<80 and cant<40;
select titulo from biblioteca.libros where (lugar = 'Paris' or lugar='Madrid');
select nombre from biblioteca.cliente where nombre like 'J%';
select avg(precio) promedio from biblioteca.pedido_libros;
select sum(cant) cantidad from biblioteca.pedido_libros;
select precio,cant cantidad from biblioteca.pedido_libros where IDLIB = 2;