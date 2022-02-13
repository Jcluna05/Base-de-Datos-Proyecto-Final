-- Borrar si existe una versión anterior (re-crear el procedimiento)
DROP PROCEDURE IF EXISTS Json2Relational_production_companies ;
DELIMITER //
CREATE PROCEDURE Json2Relational_production_companies()
BEGIN
	DECLARE a INT Default 0 ;
	
	-- crear tabla temporal para almacenar datos de pdocuction_companies que están en JSON
	DROP TABLE IF EXISTS tmp_production_companies ;
	CREATE TABlE tmp_production_companies (id_movie INT, id_production_company INT, name_production_company VARCHAR (100) );
	
	-- ciclo repetitivo para ir cargando datos desde el arreglo JSON hacia la tabla temporal
  simple_loop: LOOP
-- cargando datos del objeto JSON en la tabla temporal 
		INSERT INTO tmp_production_companies (id_movie, id_production_company, name_production_company)  
		SELECT id as id_Movie, 
			JSON_EXTRACT(CONVERT(production_companies using utf8mb4), CONCAT("$[",a,"].id")) AS id_production_company,
			JSON_EXTRACT(CONVERT(production_companies using utf8mb4), CONCAT("$[",a,"].name")) AS id_production_company
		FROM movie_dataset m ; 
			SET a=a+1;	
     	IF a=10 THEN
            LEAVE simple_loop;
      END IF;
   END LOOP simple_loop;
   -- limpieza de registros nulos
   -- 43820 tuplas en tmp_production_companies
   DELETE FROM tmp_production_companies WHERE id_production_company IS NULL ;
   -- 12156 tuplas en tmp_production_companies
END //
DELIMITER ;

-- llamada al procedimiento
Call Json2Relational_production_companies();