insert into biblioteca.autores values (1,'Cesar Vallejo');
insert into biblioteca.autores values (2,'Mario Vargas Llosa');
insert into biblioteca.autores values (3,'Clorinda Matto de toner');
insert into biblioteca.autores values (4,'Wiliam Shakespeare');

--select * from biblioteca.autores;

insert into biblioteca.libros values(1,'Poemas humanos','Paris','Les éditions',1);
insert into biblioteca.libros values(2,'Trilce','Lima','libros peruanos',1);
insert into biblioteca.libros values(3,'Aves sin nido','Lima','Peisa',3);
insert into biblioteca.libros values(4,'El sueño de una noche de verano','Madrid','Alianza editorial',4);
insert into biblioteca.libros values(5,'La ciudad y los perros','Lima','Peisa',2);

--select * from biblioteca.libros;

insert into biblioteca.proveedores values(1,'José Cayllahua','Bruselas223-Surquillo');
insert into biblioteca.proveedores values(2,'Pedro Suárez','Canarios789-San Luis');
insert into biblioteca.proveedores values(3,'Lucho Gonzáles','Los pedrales 456-Santa Anita');
insert into biblioteca.proveedores values(4,'Monica Sánchez','Arenales123-Ate Vitarte');

--select * from biblioteca.proveedores;

insert into biblioteca.pedido_libros values(1,2,1,85,20);
insert into biblioteca.pedido_libros values(2,1,3,115,60);
insert into biblioteca.pedido_libros values(3,3,1,80,45);
insert into biblioteca.pedido_libros values(4,5,2,60,20);
insert into biblioteca.pedido_libros values(5,4,4,45,25);
insert into biblioteca.pedido_libros values(6,2,3,128,10);

--select * from biblioteca.pedido_libros;

insert into biblioteca.cliente values(1,2,'Julieta Venegas','Astocolmo45-San Isidro',983654215);
insert into biblioteca.cliente values(2,1,'Marco Antonio Solis','Rubiales20-La molina',925624515);
insert into biblioteca.cliente values(3,3,'Dina Núñez Huamaní','Soliano12-Jesus Maria',983546327);
insert into biblioteca.cliente values(4,5,'Danitza Salcedo Calderón','Los jasminez',956842657);

--select * from biblioteca.cliente;

insert into biblioteca.boleta values(1,2,'25/01/2020');
insert into biblioteca.boleta values(2,1,'15/02/2020');
insert into biblioteca.boleta values(3,4,'10/03/2020');
insert into biblioteca.boleta values(4,3,'14/03/2020');
