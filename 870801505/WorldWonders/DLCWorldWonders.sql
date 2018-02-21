--Huey Teocalli 
INSERT INTO Modifiers
	(ModifierId, ModifierType)
SELECT	
	'MAGIL_HUEY_LAKE_FOOD', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER'
		FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_AZTEC';
		
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
SELECT	
	'MAGIL_HUEY_LAKE_FOOD', 'ModifierId', 'HUEY_LAKE_FOOD_MODIFIER'
		FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_AZTEC';		
		
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='HUEY_LAKE_FOOD_MODIFIER' AND Name='Amount';		
		
INSERT INTO Modifiers
	(ModifierId, ModifierType)
SELECT	
	'MAGIL_HUEY_LAKE_CULTURE', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER'
		FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_AZTEC';
		
INSERT INTO ModifierArguments
	(ModifierId, Name, Value)
SELECT	
	'MAGIL_HUEY_LAKE_CULTURE', 'ModifierId', 'HUEY_LAKE_PRODUCTION_MODIFIER'
		FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_AZTEC';		

UPDATE ModifierArguments SET Value='YIELD_CULTURE' WHERE ModifierId='HUEY_LAKE_PRODUCTION_MODIFIER' AND Name='YieldType';						
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='HUEY_LAKE_PRODUCTION_MODIFIER' AND Name='Amount';		

UPDATE BuildingModifiers SET ModifierId='MAGIL_HUEY_LAKE_FOOD' WHERE BuildingType='BUILDING_HUEY_TEOCALLI' AND ModifierId='HUEY_LAKE_FOOD';	
UPDATE BuildingModifiers SET ModifierId='MAGIL_HUEY_LAKE_CULTURE' WHERE BuildingType='BUILDING_HUEY_TEOCALLI' AND ModifierId='HUEY_LAKE_PRODUCTION';	

INSERT INTO BuildingModifiers
	(BuildingType,	ModifierId)
SELECT	
	'BUILDING_HUEY_TEOCALLI', 'MAGIL_HUEY_HOLYSITE'
		FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_AZTEC';
		
INSERT INTO BuildingModifiers
	(BuildingType,	ModifierId)
SELECT	
	'BUILDING_HUEY_TEOCALLI', 'MAGIL_HUEY_CAMPUS'
		FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_AZTEC';
		
INSERT INTO BuildingModifiers
	(BuildingType,	ModifierId)
SELECT	
	'BUILDING_HUEY_TEOCALLI', 'MAGIL_HUEY_COMMERCIALHUB'
		FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_AZTEC';
		
INSERT INTO BuildingModifiers
	(BuildingType,	ModifierId)
SELECT	
	'BUILDING_HUEY_TEOCALLI', 'MAGIL_HUEY_THEATER'
		FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_AZTEC';
		
INSERT INTO BuildingModifiers
	(BuildingType,	ModifierId)
SELECT	
	'BUILDING_HUEY_TEOCALLI', 'MAGIL_HUEY_INDUSTRIALZONE'
		FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_AZTEC';

--BuildingModifiers
DELETE FROM BuildingModifiers WHERE BuildingType='BUILDING_APADANA' AND ModifierId='APADANA_AWARD_TWO_INFLUENCE_TOKEN';

INSERT INTO BuildingModifiers
	(BuildingType,	ModifierId)
SELECT	
	'BUILDING_APADANA', 'MAGIL_APADANA_AWARD_WONDER_INFLUENCE_TOKEN'
		FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_PERSIA';

INSERT INTO BuildingModifiers
	(BuildingType,	ModifierId)
SELECT	
	'BUILDING_APADANA', 'MAGIL_APADANA_AWARD_EXTRA_INFLUENCE_TOKEN'
		FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_PERSIA';		
		
INSERT INTO BuildingModifiers
	(BuildingType,	ModifierId)
SELECT	
	'BUILDING_APADANA', 'MAGIL_APADANA_INFLUENCE_PER_TURN'
		FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_PERSIA';	

INSERT INTO BuildingModifiers
	(BuildingType,	ModifierId)
SELECT	
	'BUILDING_HALICARNASSUS_MAUSOLEUM', 'MAGIL_HALICARNASSUS_MAUSOLEUM_ATTACH_ABILITY'
		FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_MACEDON';

INSERT INTO BuildingModifiers
	(BuildingType,	ModifierId)
SELECT	
	'BUILDING_JEBEL_BARKAL', 'MAGIL_JEBEL_BARKAL_ATTACH_MODIFIER'
		FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_NUBIA';		
		
INSERT INTO BuildingModifiers
	(BuildingType,	ModifierId)
SELECT	
	'BUILDING_ANGKOR_WAT', 'MAGIL_ANGKOR_WAT_LUXURY_EXTRA_AMENITIES'
		FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_KHMER';			
		
--Building_GreatPersonPoints		
INSERT INTO Building_GreatPersonPoints
	(BuildingType,	GreatPersonClassType,	PointsPerTurn)
SELECT	
	'BUILDING_HALICARNASSUS_MAUSOLEUM', 'GREAT_PERSON_CLASS_ENGINEER', '1'
		FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_MACEDON';		

INSERT INTO Building_GreatPersonPoints
	(BuildingType,	GreatPersonClassType,	PointsPerTurn)
SELECT	
	'BUILDING_HALICARNASSUS_MAUSOLEUM', 'GREAT_PERSON_CLASS_ADMIRAL', '1'
		FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_MACEDON';
		
--Recognizes Prasat as Temple
INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
SELECT	
	'MAGIL_CITY_HAS_TEMPLE_REQUIREMENTSET', 'MAGIL_REQUIRES_CITY_HAS_PRASAT'
		FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_INDONESIA';
		
INSERT INTO Requirements
	(RequirementId,	RequirementType)
SELECT	
	'MAGIL_REQUIRES_CITY_HAS_PRASAT', 'REQUIREMENT_CITY_HAS_BUILDING'
		FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_INDONESIA';		
		
INSERT INTO RequirementArguments
	(RequirementId,	Name,	Value)
SELECT	
	'MAGIL_REQUIRES_CITY_HAS_PRASAT', 'BuildingType', 'BUILDING_PRASAT'
		FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_INDONESIA';