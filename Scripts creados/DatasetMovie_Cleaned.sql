-- Persistencia de movie_dataset formateando crew
DROP TABLE IF EXISTS movie_dataset_cleaned ;
CREATE TABLE movie_dataset_cleaned  AS
SELECT 
	`index`, budget, genres, homepage, id, keywords, original_language, original_title, overview, popularity, 
	 production_companies, production_countries, release_date, revenue, runtime, spoken_languages, `status`, 
	 tagline, title, vote_average, vote_count, cast, director,  
	CONVERT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(Crew,
	 		"""", "'"), 
	 		"', '", """, """), 
	 		"': '", """: """), 
	 		"': ", """: "), 
	 		", '", ", """), 
	 		"{'", "{""") 
	 	using utf8mb4) AS Crew
		FROM movie_dataset ;
ALTER TABLE movie_dataset_cleaned  ADD Primary Key (id) ;