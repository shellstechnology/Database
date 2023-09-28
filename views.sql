 /* principios de view */
 
 create view productos_mas_caros_que_el_promedio as
 select nombre, precio
 from productos
 where precio > (select AVG(precio) from productos);


create view paquetes_llevados_por_choferes as
select paquetes.nombre, productos.precio, usuarios.nombre_de_usuario
from
productos inner join paquetes on productos.id = paquetes.id_producto
inner join paquete_contiene_lote on paquete_contiene_lote.id_paquete =  paquetes.id
inner join lotes on lotes.id = paquete_contiene_lote.id_lote
inner join camion_lleva_lote on camion_lleva_lote.id_lote = lotes.id
inner join camiones on camiones.matricula = camion_lleva_lote.matricula
inner join chofer_conduce_camion on chofer_conduce_camion.matricula_camion = camiones.matricula
inner join choferes on choferes.id_usuarios = chofer_conduce_camion.id_chofer
inner join usuarios on usuarios.id = choferes.id_usuarios;


 select * from productos_mas_caros_que_el_promedio;
 
 select * from paquetes_llevados_por_choferes;