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
