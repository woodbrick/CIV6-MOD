--Recognizes Prasat as Temple
INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
SELECT	
	'MAGIL_CITY_HAS_TEMPLE_REQUIREMENTSET2', 'MAGIL_REQUIRES_CITY_HAS_PRASAT2'
		FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_INDONESIA';
		
INSERT INTO Requirements
	(RequirementId,	RequirementType)
SELECT	
	'MAGIL_REQUIRES_CITY_HAS_PRASAT2', 'REQUIREMENT_CITY_HAS_BUILDING'
		FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_INDONESIA';		
		
INSERT INTO RequirementArguments
	(RequirementId,	Name,	Value)
SELECT	
	'MAGIL_REQUIRES_CITY_HAS_PRASAT2', 'BuildingType', 'BUILDING_PRASAT'
		FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_INDONESIA';		