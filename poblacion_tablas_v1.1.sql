/* poblacion de algunas tablas para pruebas unitarias y de funcionalidades */

insert into monedas (moneda) values ('pesos uruguayos'), ('dolares') ,('reales');
select * from monedas;

insert into productos values (1, 'quesos cremosos', 60, 100, 1);
insert into productos values (2, 'pan artesanal', 100, 20, 1);
insert into productos values (3,'mouse logitech',700,5,1);
insert into productos values (4,'teclado razer',2000,10,1);
insert into productos values (47,'Proyecto2023',9999,1,1);

insert into caracteristicas (descripcion_caracteristica) values ('comestible'), ('electronicos'), ('inflamable'), ('explosivo');

insert into lugares_entrega (longitud, latitud, direccion) values (99,99,'La vieja china'), (120, 30, 'mi casita');
insert into lugares_entrega (longitud, latitud, direccion) values (47,47, 'almacen 47');

insert into estados_p (descripcion_estado_p) values ('en almacen'), ('en camino'), ('entrgado');

insert into paquetes (nombre, volumen_l, peso_kg, id_estado_p, id_caracteristica_paquete, id_producto, id_lugar_entrega, nombre_destinatario, nombre_remitente) values 
('queso cremoco',0.50,0.60,1,1,1,2,'matias',' elmati2');

/* inserts para pruebas unitarias en paquete*/
insert into paquetes (id, nombre, volumen_l, peso_kg, id_estado_p, id_caracteristica_paquete, id_producto, id_lugar_entrega, nombre_destinatario, nombre_remitente) values 
(47,'proyecto2023',9.9,9.9,1,4,47,2,'shells tech', 'shells tech tambien'), (74,'paquete a eliminar',9.9,9.9,1,4,47,2,'pseudoshell', 'shell al cuadrado'),
(42,'paquete a modificar', 9.9,9.9,1,4,47,2,'shells tech', 'shells tech la venganza del programador');
select * from paquetes;

delete from paquete_contiene_lote where id_paquete=47;
delete from paquetes where id=42;

insert into lotes (id, volumen_l, peso_kg) values (1, 10, 10), (2,20,20);
insert into lotes (id, volumen_l, peso_kg) values (47, 47, 47);

insert into almacenes (id, id_lugar_entrega) values (47,3);

insert into paquete_contiene_lote (id_paquete, id_lote, id_almacen) values (47,47,47);

