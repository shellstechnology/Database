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
