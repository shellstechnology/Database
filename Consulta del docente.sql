select productos.nombre, productos.precio, monedas.moneda, lotes.id as lote, camion_lleva_lote.matricula as 'matricula del camion' from paquete_contiene_lote
inner join camion_lleva_lote on camion_lleva_lote.id_lote = paquete_contiene_lote.id_lote
inner join lotes on lotes.id = paquete_contiene_lote.id_lote
inner join paquetes on paquete_contiene_lote.id_paquete = paquetes.id
inner join productos on productos.id = paquetes.id_producto
inner join monedas on monedas.id = productos.id_moneda;
