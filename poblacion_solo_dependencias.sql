insert into monedas (moneda) values ('pesos uruguayos'), ('dolares') ,('reales');
/* Inserts para pruebas unitarias en monedas */
insert into monedas (id, moneda) values (47,'listar'),(42,'modificar'),(74,'eliminar');
insert into caracteristicas (descripcion_caracteristica) values ('comestible'), ('electronicos'), ('inflamable'), ('explosivo');
insert into caracteristicas (id, descripcion_caracteristica) values (47,'listar caract'), (42,'modificar caract'), (74,'eliminar caratc');
insert into estados_p (descripcion_estado_p) values ('en almacen'), ('en camino'), ('entrgado');
/*insers pruebas unitarias estados_p*/
insert into estados_p (id, descripcion_estado_p) values (47,'estado p listar'), (42,'estado p Modificar'), (74,'estado p eliminar');
select * from productos;
select * from lugares_entrega;
select * from paquetes;
select * from lotes; 
select * from almacenes;
select * from paquete_contiene_lote;


   select * from almacenes;
   select * from camion_lleva_lote;
select * from camiones;
	select * from monedas;
	select * from caracteristicas;
    select * from lugares_entrega;
    select * from paquetes;
    select * from estados_p;
    select * from productos;
    select * from usuarios;
    select * from users;
    select * from estados_c;
    select * from camion_lleva_lote;
    select * from paquete_contiene_lote;