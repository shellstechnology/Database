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

insert into estados_p (descripcion_estado_p) values ('en almacen'), ('en camino'), ('entrgado');

insert into paquetes (nombre, volumen_l, peso_kg, id_estado_p, id_caracteristica_paquete, id_producto, id_lugar_entrega, nombre_destinatario, nombre_remitente) values 
('queso cremoco',0.50,0.60,1,1,1,2,'matias',' elmati2');

insert into paquetes (id, nombre, volumen_l, peso_kg, id_estado_p, id_caracteristica_paquete, id_producto, id_lugar_entrega, nombre_destinatario, nombre_remitente) values (47,'proyecto2023',9.9,9.9,1,4,47,2,'shells tech', 'shells tech tambien');
select * from paquetes;
