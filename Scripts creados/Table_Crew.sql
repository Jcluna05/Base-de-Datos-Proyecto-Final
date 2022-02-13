-- Borrar si existe una versión anterior (re-crear el procedimiento)
DROP PROCEDURE IF EXISTS Json2Relational_crew ;
DELIMITER //
CREATE PROCEDURE Json2Relational_crew()
BEGIN
	DECLARE a INT Default 0 ;
	
	-- crear tabla temporal para almacenar datos de pdocuction_companies que están en JSON
	DROP TABLE IF EXISTS tmp_crew;
	CREATE TABlE tmp_crew 
	  (id_movie INT, id_crew INT, job VARCHAR (200), name VARCHAR (400), gender INT, credit_id VARCHAR (50), department VARCHAR (50) );
	
	-- ciclo repetitivo para ir cargando datos desde el arreglo JSON hacia la tabla temporal
simple_loop: LOOP

    -- cargando datos del objeto JSON en la tabla temporal 
		INSERT INTO tmp_crew (id_movie, id_crew, job, name, gender, credit_id, department)  
		SELECT id as id_Movie, 
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].id")) AS id_crew,
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].job")) AS job,
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].name")) AS name,
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].gender")) AS gender,
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].credit_id")) AS credit_id,
			JSON_EXTRACT(CONVERT(crew using utf8mb4), CONCAT("$[",a,"].department")) AS department
		FROM movie_dataset_cleaned m 
		WHERE id IN (SELECT id FROM movie_dataset_cleaned WHERE a <= JSON_LENGTH (crew) );
        SET a=a+1;
     	IF a=436 THEN
            LEAVE simple_loop;
      END IF;
   END LOOP simple_loop;
   -- limpieza de registros nulos
   -- xyz tuplas en tmp_crew
   DELETE FROM tmp_crew WHERE id_crew IS NULL ;
   --  tuplas en tmp_crew
END //
DELIMITER ;
Call Json2Relational_crew();