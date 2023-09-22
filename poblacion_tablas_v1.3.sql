/* poblacion de algunas tablas para pruebas unitarias y de funcionalidades */

insert into monedas (moneda) values ('pesos uruguayos'), ('dolares') ,('reales');
/* Inserts para pruebas unitarias en monedas */
insert into monedas (id, moneda) values (47,'listar'),(42,'modificar'),(74,'eliminar');

/* Insert para las pruebas unitarias en productos */
insert into productos (id, nombre, precio, stock, id_moneda)  values (7,'tuercas',25,1,1);
insert into productos (id, nombre, precio, stock, id_moneda) values (47,'Proyecto2023',9999,1,1);
insert into productos (id, nombre, precio, stock, id_moneda)  values  (74,'proyecto 2',9999,1,1);
insert into productos (id, nombre, precio, stock, id_moneda)  values (42,'proyecto hector',9999,1,1);


insert into caracteristicas (descripcion_caracteristica) values ('comestible'), ('electronicos'), ('inflamable'), ('explosivo');

/* inserts caracteristicas pruebas unitarias */
insert into caracteristicas (id, descripcion_caracteristica) values (47,'listar caract'), (42,'modificar caract'), (74,'eliminar caratc');


insert into lugares_entrega (longitud, latitud, direccion) values (99,99,'La vieja china'), (120, 30, 'mi casita');
/* Inserts pruebas unitarias lugar_entrega */
insert into lugares_entrega (longitud, latitud, direccion) values (47,47, 'almacen 47 listar');
insert into lugares_entrega (longitud, latitud, direccion) values (42,42, 'almacen 42 modificar');
insert into lugares_entrega (longitud, latitud, direccion) values (74,74, 'almacen 74 eliminar');

insert into estados_p (descripcion_estado_p) values ('en almacen'), ('en camino'), ('entrgado');
/*insers pruebas unitarias estados_p*/
insert into estados_p (id, descripcion_estado_p) values (47,'estado p listar'), (42,'estado p Modificar'), (74,'estado p eliminar');

/* inserts para pruebas unitarias en paquete*/
insert into paquetes (id, nombre, volumen_l, peso_kg, id_estado_p, id_caracteristica_paquete, id_producto, id_lugar_entrega, nombre_destinatario, nombre_remitente) values 
(10,'tuercas',9.9,9.9,1,4,7,2,'a', 'b'),
(47,'proyecto2023',9.9,9.9,1,4,47,2,'shells tech', 'shells tech tambien'), (74,'paquete a eliminar',9.9,9.9,1,4,47,2,'pseudoshell', 'shell al cuadrado'),
(42,'paquete a modificar', 9.9,9.9,1,4,47,2,'shells tech', 'shells tech la venganza del programador');
select * from paquetes;


/* inserts para pruebas unitarias de Lotes*/
insert into lotes (id, volumen_l, peso_kg) values (1, 10, 10), (2,20,20);
insert into lotes (id, volumen_l, peso_kg) values (47, 47, 47);
insert into lotes (id, volumen_l, peso_kg) values (42,42,42),(74,74,74);
insert into lotes (id, volumen_l, peso_kg) values (20,20,20);
select * from lotes;

/* inserts para pruebas unitarias de almacenes */
insert into almacenes (id, id_lugar_entrega) values (47,3);
insert into almacenes (id, id_lugar_entrega) values (74,3);
insert into almacenes (id, id_lugar_entrega) values (42,3);

/* inserts para pruebas unitarias de paquete_contiene_lote */

insert into paquete_contiene_lote (id_paquete, id_lote, id_almacen) values (10,20,47);
insert into paquete_contiene_lote (id_paquete, id_lote, id_almacen) values (47,47,47);
insert into paquete_contiene_lote (id_paquete, id_lote, id_almacen) values (42,42,47);
insert into paquete_contiene_lote (id_paquete, id_lote, id_almacen) values (74,74,47);

/* inserts pruebas unitarias modelo camion*/
insert into modelos (id, modelo) values (47,'modelo listar'), (42, 'modelo update'), (74,'modelo eliminar');

/* insers pruebas unitarias marca camion*/
insert into marcas (id, marca, id_modelo) values (47,'marca listar',47), (42,'marca modificar',42) , (74,'marca eliminar',74);

/*insers pruebas unitarias caracteristica camion*/
insert into estados_c (id, descripcion_estado_c) values (47,'estado c listar'), (42,'estados c modificar'), (74,'estados c eliminar');

/*insers pruebas unitarias camiones*/
insert into camiones (matricula, id_estado_c, id_marca_modelo, volumen_max_l, peso_max_kg) values ('a20a',47,47,80,80), ('a47a',47,47,99,99), ('a42a',42,42,99,99), ('a74a',74,74,99,99);

/* insert pruebas unitarias camion lleva lote */
insert into camion_lleva_lote (id_lote,matricula) values (47,'a47a'), (42,'a42a'), (74,'a74a');

/*insert pruebas unitarias usuarios */ 
insert into usuarios (id, nombre_de_usuario, contrasenia) values (10,'toreto','ee'), (20,'choferprueba','dd'), (47,'usuario a listar','aaa'), (42,'usuario a modificar','bb'), (74,'usuario a eliminar','cc');

/* inserts pruebas unitarias telefonos usuarios*/
insert into telefonos_usuarios (id_usuarios, telefono) values (47,'tel list'), (42,'tel mod'), (74,'tel del');

/* insers pruebas unitarias mail usuarios*/ 
insert into mail_usuarios (id_usuarios,mail) values (10, 'torito@carrera'), (20, 'chofer@mail'), (47,'listar@mail.com'), (42,'modificar@mail.com'), (74,'eliminar@mail.com');

/* inserts pruebas unitarias choferes*/
insert into choferes (id_usuarios, licencia_de_conducir) values (10,'ninguna'), (20,'licencia'), (47,'lic list'), (42,'lic mod'), (74,'lic del');

/* inserts pruebas unitarias almaceneros */
insert into almaceneros (id_usuarios) values (47), (42), (74); 

/* inserts pruebas unitarias clientes */
insert into clientes (id_usuarios) values (47), (42), (74); 

/* inserts pruebas unitarias admin */
insert into administradores (id_usuarios) values (47), (42), (74); 

/*insers pruebas unitarias chofer conduce camion */
insert into chofer_conduce_camion (id_chofer,matricula_camion) values (10, 'a20a'), (47,'a47a'),(42,'a42a'),(74,'a74a');

/* Insert para la consulta indicada por el docente*/

insert into productos (id, nombre, precio, stock, id_moneda)  values (10, 'quesos cremosos', 60, 100, 1);
insert into productos (id, nombre, precio, stock, id_moneda)  values (11, 'pan artesanal', 100, 20, 1);
insert into productos (id, nombre, precio, stock, id_moneda)  values (12,'Jamon la constancia',700,5,1);
insert into productos (id, nombre, precio, stock, id_moneda) values (13,'tomate fresco',2000,10,1);

insert into paquetes
(id,nombre, volumen_l, peso_kg, id_estado_p, id_caracteristica_paquete, id_producto, id_lugar_entrega, nombre_destinatario, nombre_remitente) values
 (100,'quesos cremosos',100.2,100.1,1,1,10,1,'super de la esquina',' fiambreria gorillaz'),
 (101,'pan artesanal',100.1,100.1,1,1,11,1,'super de la esquina','fiambreria gorillaz'),
 (102,'Jamon la constancia',100,100,1,1,12,1,'super de la esquina','fiambreria gorillaz'),
 (103,'tomate fresco',100,100,1,1,13,1,'super de la esquina','fiambreria gorillaz'),
  (104,'paquete para lote',100,100,1,1,42,1,'nadie','nadie');


 insert into lotes 
 (id, volumen_l, peso_kg) values 
 (100, 10, 10);

 insert into paquete_contiene_lote
 (id_paquete, id_lote, id_almacen) values 
 (100,100,47),
 (101,100,47),
 (102,100,47),
 (103,100,47);
 
 insert into camion_lleva_lote 
 (id_lote,matricula) values 
 (100,'a47a');
 

 