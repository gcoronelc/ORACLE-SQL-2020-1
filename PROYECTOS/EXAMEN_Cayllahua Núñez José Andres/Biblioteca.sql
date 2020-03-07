--creamos el usuario biblioteca
create user biblioteca identified by jose;
--Damos privilegios al usuario biblioteca
grant all privileges to biblioteca 
--creamos las tablas
create table biblioteca.autores(
idaut number(10) primary key,
nombre varchar2(25)
);

create table biblioteca.libros(
idlib number(10) primary key,
titulo varchar2(50),
lugar varchar2(25),
editorial varchar2(25),
idaut number(10),
constraint fk_librosautor foreign key (idaut) references biblioteca.autores(idaut)
);

create table biblioteca.proveedores(
idprov number(10) primary key,
nomprov varchar2(25),
direcprov varchar2(35)
);


create table biblioteca.pedido_libros(
idped number(10) primary key,
idlib number(10),
idprov number(10),
precio number,
cant number,
constraint fk_pedidolibro foreign key (idlib) references biblioteca.libros(idlib),
constraint fk_pedidoproveedor foreign key (idprov) references biblioteca.proveedores(idprov)
);


create table biblioteca.cliente(
idcliente number(10) primary key,
idlib number(10),
nombre varchar2(25),
direccion varchar2(50),
telefono number,
constraint fk_clientelibros foreign key (idlib) references biblioteca.libros(idlib)
)

create table biblioteca.boleta(
idboleta number(10) primary key,
idcliente number(10),
fecha date,
constraint fk_boletacliente foreign key (idcliente) references biblioteca.cliente(idcliente)
);

insert into biblioteca.autores values (1,'Cesar Vallejo');
insert into biblioteca.autores values (2,'Mario Vargas Llosa');
insert into biblioteca.autores values (3,'Clorinda Matto de toner');
insert into biblioteca.autores values (4,'Wiliam Shakespeare');

select * from biblioteca.autores;

insert into biblioteca.libros values(1,'Poemas humanos','Paris','Les éditions',1);
insert into biblioteca.libros values(2,'Trilce','Lima','libros peruanos',1);
insert into biblioteca.libros values(3,'Aves sin nido','Lima','Peisa',3);
insert into biblioteca.libros values(4,'El sueño de una noche de verano','Madrid','Alianza editorial',4);
insert into biblioteca.libros values(5,'La ciudad y los perros','Lima','Peisa',2);

select * from biblioteca.libros;

insert into biblioteca.proveedores values(1,'José Cayllahua','Bruselas223-Surquillo');
insert into biblioteca.proveedores values(2,'Pedro Suárez','Canarios789-San Luis');
insert into biblioteca.proveedores values(3,'Lucho Gonzáles','Los pedrales 456-Santa Anita');
insert into biblioteca.proveedores values(4,'Monica Sánchez','Arenales123-Ate Vitarte');

select * from biblioteca.proveedores;

insert into biblioteca.pedido_libros values(1,2,1,85,20);
insert into biblioteca.pedido_libros values(2,1,3,115,60);
insert into biblioteca.pedido_libros values(3,3,1,80,45);
insert into biblioteca.pedido_libros values(4,5,2,60,20);
insert into biblioteca.pedido_libros values(5,4,4,45,25);
insert into biblioteca.pedido_libros values(6,2,3,128,10);

select * from biblioteca.pedido_libros;

insert into biblioteca.cliente values(1,2,'Julieta Venegas','Astocolmo45-San Isidro',983654215);
insert into biblioteca.cliente values(2,1,'Marco Antonio Solis','Rubiales20-La molina',925624515);
insert into biblioteca.cliente values(3,3,'Dina Núñez Huamaní','Soliano12-Jesus Maria',983546327);
insert into biblioteca.cliente values(4,5,'Danitza Salcedo Calderón','Los jasminez',956842657);

select * from biblioteca.cliente;

insert into biblioteca.boleta values(1,2,'25/01/2020');
insert into biblioteca.boleta values(2,1,'15/02/2020');
insert into biblioteca.boleta values(3,4,'10/03/2020');
insert into biblioteca.boleta values(4,3,'14/03/2020');

select * from biblioteca.boleta;


--10 consultas basicas
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
--10 consultas dificeles
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
