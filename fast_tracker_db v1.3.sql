drop database fast_tracker_db;
 create database fast_tracker_db;
use fast_tracker_db;
/* drop database fast_tracker_db; */

	create table monedas(
    id int primary key auto_increment,
    moneda varchar(30),
	created_at datetime,
	updated_at datetime,
	deleted_at datetime
    );

    create table productos(
    id int primary key auto_increment,
    nombre varchar (50) not null,
    precio float(8) not null,
    stock int not null,
    id_moneda int not null,
    constraint fk_id_moneda foreign key (id_moneda) references monedas(id),
	created_at datetime,
    updated_at datetime,
	deleted_at datetime
    );

    create table caracteristicas(
    id int primary key auto_increment,
    descripcion_caracteristica varchar(50) not null,
	created_at datetime,
    updated_at datetime,
	deleted_at datetime
    );
    

    
    create table lugares_entrega(
    id int primary key auto_increment,
    longitud float(16) not null,
    latitud float(16) not null,
    direccion varchar(100),
	created_at datetime,
    updated_at datetime,
	deleted_at datetime
    );
   
    create table estados_p(
    id int primary key auto_increment,
    descripcion_estado_p varchar(100),
	created_at datetime,
    updated_at datetime,
	deleted_at datetime
    );

 
    CREATE TABLE paquetes(
        id int primary key auto_increment,
        nombre varchar(50) not null,
        volumen_l float(8) not null,
        peso_kg float (8) not null,
        id_estado_p int not null,
        id_caracteristica_paquete int not null,
        id_producto int not null,
        id_lugar_entrega int not null,
        nombre_destinatario varchar(100) not null,
        nombre_remitente varchar(100) not null,
        fecha_de_entrega datetime DEFAULT null,
        created_at datetime,
        updated_at datetime,
        deleted_at datetime,
        constraint fk_id_estado_p foreign key (id_estado_p) references estados_p(id),
        constraint fk_id_caracteristica_paquete foreign key (id_caracteristica_paquete) references caracteristicas(id),
        constraint fk_id_lugar_entrega_p foreign key (id_lugar_entrega) references lugares_entrega(id),
        constraint fk_id_producto foreign key (id_producto) references productos(id)
    );

    create table almacenes(
    id int primary key auto_increment,
    id_lugar_entrega int not null,
	created_at datetime,
    updated_at datetime,
	deleted_at datetime,
    constraint fk_id_lugar_entrega_a foreign key (id_lugar_entrega) references lugares_entrega(id)
    );
    

   create table lotes(
   id int primary key auto_increment,
   volumen_l float(16),
   peso_kg float (16),
   created_at datetime,
   updated_at datetime,
   deleted_at datetime
   );

   create table paquete_contiene_lote(
   id_paquete int primary key not null,
   id_lote int not null,
   id_almacen int not null,
   created_at datetime,
   updated_at datetime,
   deleted_at datetime,
   constraint fk_id_paquete foreign key (id_paquete) references paquetes (id),
   constraint fk_id_lote_p foreign key (id_lote) references lotes (id),
   constraint fk_id_almacen foreign key (id_almacen) references almacenes (id)
   );

   create table marcas(
   id int primary key auto_increment,
   marca varchar(50) not null,
	created_at datetime,
    updated_at datetime,
	deleted_at datetime
   );

   create table modelos(
   id int primary key auto_increment,
   modelo varchar (50) not null,
   id_marca int not null,
	created_at datetime,
    updated_at datetime,
	deleted_at datetime,
   constraint fk_id_marca foreign key (id_marca) references marcas(id)
   );
  

   create table estados_c(
   id int primary key auto_increment,
   descripcion_estado_c varchar (100) not null,
	created_at datetime,
    updated_at datetime,
	deleted_at datetime
   );

   create table camiones(
   matricula varchar(10) primary key not null,
   id_estado_c int not null,
   id_modelo_marca int not null,
   volumen_max_l float not null,
   peso_max_kg float not null,
   created_at datetime,
   updated_at datetime,
   deleted_at datetime,
   constraint fk_id_estado_c foreign key (id_estado_c) references estados_c(id),
   constraint fk_id_modelo_marca foreign key (id_modelo_marca) references modelos (id)
   );

   create table camion_lleva_lote(
   id_lote int primary key not null,
   matricula varchar(10) not null,
   constraint fk_id_lote_c foreign key (id_lote) references lotes(id),
	created_at datetime,
    updated_at datetime,
	deleted_at datetime,
   constraint fk_matricula_c foreign key (matricula)references camiones(matricula)
   );

  create table users (
    id int auto_increment primary key,
    name varchar(255) unique not null,
    email varchar(255) unique not null,
    email_verified_at timestamp null,
    password varchar(255) not null,
    remember_token varchar(100) null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
    deleted_at timestamp null
);


   create table telefonos_usuarios(
   id_usuarios int not null,
   telefono varchar(15) unique,
   created_at datetime,
   updated_at datetime,
   deleted_at datetime,
   constraint primary key (id_usuarios, telefono),
   constraint fk_id_usuarios_t foreign key (id_usuarios) references users(id)
   );

 
   create table choferes(
   id_usuarios int primary key not null,
   licencia_de_conducir varchar (10) unique, 
   created_at datetime,
   updated_at datetime,
   deleted_at datetime,
   constraint fk_id_usuarios_c foreign key (id_usuarios) references users(id)
  );
 
 
   create table almaceneros(
   id_usuarios int primary key not null,
   created_at datetime,
   updated_at datetime,
   deleted_at datetime,
   constraint fk_id_usuarios_a foreign key (id_usuarios) references users(id)
  );

  create table clientes(
   id_usuarios int primary key not null,
   created_at datetime,
   updated_at datetime,
   deleted_at datetime,
   constraint fk_id_usuarios_cl foreign key (id_usuarios) references users(id)
  );

  CREATE TABLE administradores (
    id_usuarios INT PRIMARY KEY NOT NULL,
    created_at datetime,
    updated_at datetime,
    deleted_at datetime,
    CONSTRAINT fk_id_usuarios_admin FOREIGN KEY (id_usuarios)
        REFERENCES users (id)
);

  create table chofer_conduce_camion(
  id_chofer int primary key not null,
  matricula_camion varchar(10) not null unique,
  fecha_y_hora datetime,
   created_at datetime,
   updated_at datetime,
   deleted_at datetime,
  constraint fk_id_chofer foreign key (id_chofer) references choferes(id_usuarios),
  constraint fk_matricula_camion foreign key (matricula_camion) references camiones(matricula)
  );

DELIMITER //

CREATE TRIGGER ingresar_peso_lote
AFTER INSERT ON paquete_contiene_lote
FOR EACH ROW
BEGIN
    DECLARE nuevo_peso INT;
    DECLARE nuevo_volumen INT;
    SELECT peso_kg, volumen_l INTO nuevo_peso, nuevo_volumen FROM paquetes WHERE id = NEW.id_paquete;
    UPDATE lotes SET peso_kg = peso_kg + nuevo_peso, volumen_l = volumen_l + nuevo_volumen WHERE id = NEW.id_lote;
END;
//
DELIMITER ;

DELIMITER //

CREATE TRIGGER modificar_peso_lote
AFTER UPDATE ON paquete_contiene_lote
FOR EACH ROW
BEGIN
        DECLARE viejo_peso FLOAT8;
        DECLARE viejo_volumen FLOAT8;
        DECLARE nuevo_peso FLOAT8;
        DECLARE nuevo_volumen FLOAT8;
		IF NEW.deleted_at IS NULL AND OLD.deleted_at IS NULL THEN
			SELECT peso_kg, volumen_l INTO viejo_peso, viejo_volumen FROM paquetes WHERE id = OLD.id_paquete;
			SELECT peso_kg, volumen_l INTO nuevo_peso, nuevo_volumen FROM paquetes WHERE id = NEW.id_paquete;
			UPDATE lotes SET peso_kg = peso_kg - viejo_peso, volumen_l = volumen_l - viejo_volumen WHERE id = OLD.id_lote;
			UPDATE lotes SET peso_kg = peso_kg + nuevo_peso, volumen_l = volumen_l + nuevo_volumen WHERE id = NEW.id_lote;
		ELSE
			IF OLD.deleted_at IS NULL AND NEW.deleted_at IS NOT NULL THEN
				SELECT peso_kg, volumen_l INTO viejo_peso, viejo_volumen FROM paquetes WHERE id = OLD.id_paquete;
				UPDATE lotes SET peso_kg = peso_kg - viejo_peso, volumen_l = volumen_l - viejo_volumen WHERE id = OLD.id_lote;
				ELSE 
					IF OLD.deleted_at IS NOT NULL AND NEW.deleted_at IS NULL THEN
						SELECT peso_kg, volumen_l INTO nuevo_peso, nuevo_volumen FROM paquetes WHERE id = OLD.id_paquete;
                    	UPDATE lotes SET peso_kg = peso_kg + nuevo_peso, volumen_l = volumen_l + nuevo_volumen WHERE id = OLD.id_lote;
                    END IF;
                END IF;
		END IF;
END;
//
DELIMITER ;
select * from lotes;