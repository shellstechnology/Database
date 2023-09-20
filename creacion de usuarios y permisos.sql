/* Creacion de los usuarios que accederan a la DB*/ 

create user administrador identified by 'SoyAdmin1234';
create user chofer identified by 'ToretoUnPoroto';
create user almacenero identified by 'LaCajaLaCaja';
create user buscar_paquetes identified by 'QuieroMiPaquete';

/*dar permisos admin*/
grant ALL privileges on *.* to administrador;

/* dar permisos a choferes*/
grant select on paquete_contiene_lote to chofer;
grant update, select on paquetes to chofer;
grant select on camion_lleva_lote to chofer;
grant select on chofer_conduce_camion to chofer;


/* dar permisos a almacenero */
grant all privileges on productos to chofer;
grant all privileges on paquetes to chofer;
grant all privileges on lotes to chofer;
grant all privileges on paquete_contiene_lote to chofer;
grant all privileges on camion_lleva_lote to chofer;

/* dar permisos a buscar_paquetes */
grant select on buscar_paquetes to paquetes;


