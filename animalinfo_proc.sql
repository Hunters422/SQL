
CREATE PROC getANIMAL_INFO

@animalName varchar(50)
AS
BEGIN
	SELECT
		a1.species_name, a2.animalia_type, 
		a3.class_type, a4.order_type, a5.habitat_type, 
		a6.nutrition_type, a7.care_type
		FROM tbl_species AS a1
		INNER JOIN tbl_animalia AS a2 ON a2.animalia_id = a1.species_animalia
		INNER JOIN tbl_class AS a3 ON a3.class_id = a1.species_class
		INNER JOIN tbl_order AS a4 ON a4.order_id = a1.species_order
		INNER JOIN tbl_habitat AS a5 ON a5.habitat_id = a1.species_habitat
		INNER JOIN tbl_nutrition AS a6 ON a6.nutrition_id = a1.species_nutrition
		INNER JOIN tbl_care AS a7 ON a7.care_id = a1.species_care
		WHERE species_name = @animalName
	;

END
