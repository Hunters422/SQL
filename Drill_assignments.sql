USE db_zoo

SELECT * FROM tbl_habitat

SELECT * FROM tbl_species

SELECT * FROM tbl_specialist

SELECT * FROM tbl_care

SELECT * FROM tbl_nutrition


SELECT species_name FROM tbl_species
	WHERE species_order = 3

SELECT nutrition_type FROM tbl_nutrition
	WHERE nutrition_cost <= 600.00

SELECT species_name FROM tbl_species
	INNER JOIN tbl_nutrition ON tbl_nutrition.nutrition_id = tbl_species.species_nutrition
	WHERE nutrition_id BETWEEN 2202 and 2206;

SELECT species_name AS 'Species Name:', nutrition_type AS 'Nutrition Type:' FROM tbl_species
	INNER JOIN tbl_nutrition ON tbl_nutrition.nutrition_id = tbl_species.species_nutrition


SELECT species_name, specialist_fname, specialist_lname, specialist_contact FROM tbl_specialist, tbl_species
	WHERE species_name = 'penguin'
;