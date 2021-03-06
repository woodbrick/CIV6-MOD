INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	
	--Great Library
	('MAGIL_GREAT_LIBRARY_GW_BOOST', 'MODIFIER_PLAYER_GRANT_BOOST_WITH_GREAT_PERSON', 0, 0, NULL, NULL),
	--Statue of Liberty
	('MAGIL_STATUE_LIBERTY_HOME_CONTINENT_LOYALTY', 'MODIFIER_PLAYER_CITIES_ADJUST_IDENTITY_PER_TURN', 0, 0, NULL, 'MAGIL_CITY_ON_HOME_CONTINENT_REQUIREMENTS'),
	('MAGIL_STATUE_LIBERTY_HOME_CONTINENT_GROWTH', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_GROWTH', 0, 0, NULL, 'MAGIL_CITY_ON_HOME_CONTINENT_REQUIREMENTS'),
	('MAGIL_STATUE_LIBERTY_HOME_CONTINENT_GOLD', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, NULL, 'MAGIL_CITY_ON_HOME_CONTINENT_WITH_2_DISTRICTS_REQUIREMENTS'),
	('MAGIL_STATUE_LIBERTY_HOME_CONTINENT_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, NULL, 'MAGIL_CITY_ON_HOME_CONTINENT_WITH_2_DISTRICTS_REQUIREMENTS'),
	--Forbidden City
	('MAGIL_FORBIDDEN_CITY_CITIES_ALWAYS_LOYAL', 'MODIFIER_PLAYER_CITIES_ADJUST_ALWAYS_LOYAL', 0, 0, NULL, 'MAGIL_FORBIDDEN_CITY_WITHIN_6_REQUIREMENTS'),
	--St. Basil's Cathedral
	('MAGIL_ST_BASILS_CATHEDRAL_ATTACH_MODIFIER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, NULL),
	--Ruhr Valley
	('MAGIL_RUHR_VALLEY_NEARBY_CITY_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, NULL, 'MAGIL_RUHR_VALLEY_WITHIN_6_REQUIREMENTS'),
	--Oxford University
	('MAGIL_OXFORD_UNIVERSITY_NEARBY_CITY_SCIENCE', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, NULL, 'MAGIL_OXFORD_UNIVERSITY_WITHIN_6_REQUIREMENTS'),	
	--Hagia Sophia
	('MAGIL_HAGIA_SOPHIA_NEARBY_CITY_FAITH', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, NULL, 'MAGIL_HAGIA_SOPHIA_WITHIN_6_REQUIREMENTS'),
	--Hermitage
	('MAGIL_HERMITAGE_NEARBY_CITY_CULTURE', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, NULL, 'MAGIL_HERMITAGE_WITHIN_6_REQUIREMENTS'),
	--Taj Mahal
	('MAGIL_TAJ_MAHAL_PRODUCTION_BONUS', 'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER', 0, 0, NULL, 'MAGIL_PLAYER_IS_IN_GOLDENAGE_REQUIREMENTS'),
	('MAGIL_TAJ_MAHAL_GOLD_BONUS', 'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER', 0, 0, NULL, 'MAGIL_PLAYER_IS_IN_GOLDENAGE_REQUIREMENTS'),
	('MAGIL_TAJ_MAHAL_SCIENCE_BONUS', 'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER', 0, 0, NULL, 'MAGIL_PLAYER_IS_IN_GOLDENAGE_REQUIREMENTS'),
	('MAGIL_TAJ_MAHAL_CULTURE_BONUS', 'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER', 0, 0, NULL, 'MAGIL_PLAYER_IS_IN_GOLDENAGE_REQUIREMENTS'),
	('MAGIL_TAJ_MAHAL_FAITH_BONUS', 'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER', 0, 0, NULL, 'MAGIL_PLAYER_IS_IN_GOLDENAGE_REQUIREMENTS'),
	('MAGIL_TAJ_MAHAL_GROWTH_BONUS', 'MODIFIER_SINGLE_CITY_ADJUST_CITY_GROWTH', 0, 0, NULL, 'MAGIL_PLAYER_IS_IN_GOLDENAGE_REQUIREMENTS'),
	--Kotoku-in
	('MAGIL_KOTOKU_IN_HOLYSITE_WARRIORMONKS', 'MODIFIER_PLAYER_DISTRICT_CREATE_UNIT', 0, 0, NULL, NULL),
	('MAGIL_KOTOKU_IN_WARRIORMONK_EXPERIENCE', 'MODIFIER_PLAYER_UNITS_ADJUST_UNIT_EXPERIENCE_MODIFIER', 0, 0, NULL, 'MAGIL_UNIT_IS_WARRIOR_MONK_REQUIREMENTS'),
	('MAGIL_KOTOKU_IN_WARRIORMONK_STRENGTH', 'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH', 0, 0, NULL, 'MAGIL_UNIT_IS_WARRIOR_MONK_REQUIREMENTS');
	
INSERT INTO ModifierArguments
	(ModifierId, Name, Value, Extra, SecondExtra)
VALUES	
	--Great Library
	('MAGIL_GREAT_LIBRARY_GW_BOOST', 'GreatPersonClass', 'GREAT_PERSON_CLASS_WRITER', NULL, NULL),
	('MAGIL_GREAT_LIBRARY_GW_BOOST', 'TechBoost', 1, NULL, NULL),
	('MAGIL_GREAT_LIBRARY_GW_BOOST', 'OtherPlayers', 0, NULL, NULL),
	--Statue of Liberty
	('MAGIL_STATUE_LIBERTY_HOME_CONTINENT_LOYALTY', 'Amount', '3', NULL, NULL),
	('MAGIL_STATUE_LIBERTY_HOME_CONTINENT_GROWTH', 'Amount', '15', NULL, NULL),
	('MAGIL_STATUE_LIBERTY_HOME_CONTINENT_GOLD', 'YieldType', 'YIELD_GOLD', NULL, NULL),
	('MAGIL_STATUE_LIBERTY_HOME_CONTINENT_GOLD', 'Amount', '25', NULL, NULL),
	('MAGIL_STATUE_LIBERTY_HOME_CONTINENT_PRODUCTION', 'YieldType', 'YIELD_PRODUCTION', NULL, NULL),
	('MAGIL_STATUE_LIBERTY_HOME_CONTINENT_PRODUCTION', 'Amount', '10', NULL, NULL),
	--Forbidden City
	('MAGIL_FORBIDDEN_CITY_CITIES_ALWAYS_LOYAL', 'AlwaysLoyal', 1, NULL, NULL),
	--St. Basil's Cathedral
	('MAGIL_ST_BASILS_CATHEDRAL_ATTACH_MODIFIER', 'ModifierId', 'STBASILS_ADDRELIGIOUSTOURISM', NULL, NULL),
	--Ruhr Valley
	('MAGIL_RUHR_VALLEY_NEARBY_CITY_PRODUCTION', 'YieldType', 'YIELD_PRODUCTION', NULL, NULL),
	('MAGIL_RUHR_VALLEY_NEARBY_CITY_PRODUCTION', 'Amount', '20', NULL, NULL),
	--Oxford University
	('MAGIL_OXFORD_UNIVERSITY_NEARBY_CITY_SCIENCE', 'YieldType', 'YIELD_SCIENCE', NULL, NULL),
	('MAGIL_OXFORD_UNIVERSITY_NEARBY_CITY_SCIENCE', 'Amount', '20', NULL, NULL),
	--Hagia Sophia
	('MAGIL_HAGIA_SOPHIA_NEARBY_CITY_FAITH', 'YieldType', 'YIELD_FAITH', NULL, NULL),
	('MAGIL_HAGIA_SOPHIA_NEARBY_CITY_FAITH', 'Amount', '20', NULL, NULL),
	--Hermitage
	('MAGIL_HERMITAGE_NEARBY_CITY_CULTURE', 'YieldType', 'YIELD_CULTURE', NULL, NULL),
	('MAGIL_HERMITAGE_NEARBY_CITY_CULTURE', 'Amount', '20', NULL, NULL),
	--Taj Mahal
	('MAGIL_TAJ_MAHAL_PRODUCTION_BONUS', 'YieldType', 'YIELD_PRODUCTION', NULL, NULL),
	('MAGIL_TAJ_MAHAL_PRODUCTION_BONUS', 'Amount', '20', NULL, NULL),	
	('MAGIL_TAJ_MAHAL_GOLD_BONUS', 'YieldType', 'YIELD_GOLD', NULL, NULL),
	('MAGIL_TAJ_MAHAL_GOLD_BONUS', 'Amount', '15', NULL, NULL),	
	('MAGIL_TAJ_MAHAL_SCIENCE_BONUS', 'YieldType', 'YIELD_SCIENCE', NULL, NULL),
	('MAGIL_TAJ_MAHAL_SCIENCE_BONUS', 'Amount', '15', NULL, NULL),	
	('MAGIL_TAJ_MAHAL_CULTURE_BONUS', 'YieldType', 'YIELD_CULTURE', NULL, NULL),
	('MAGIL_TAJ_MAHAL_CULTURE_BONUS', 'Amount', '15', NULL, NULL),	
	('MAGIL_TAJ_MAHAL_FAITH_BONUS', 'YieldType', 'YIELD_FAITH', NULL, NULL),
	('MAGIL_TAJ_MAHAL_FAITH_BONUS', 'Amount', '15', NULL, NULL),
	('MAGIL_TAJ_MAHAL_GROWTH_BONUS', 'Amount', '20', NULL, NULL),
	--Kotoku-in
	('MAGIL_KOTOKU_IN_HOLYSITE_WARRIORMONKS', 'DistrictType', 'DISTRICT_HOLY_SITE', NULL, NULL),
	('MAGIL_KOTOKU_IN_HOLYSITE_WARRIORMONKS', 'UnitType', 'UNIT_WARRIOR_MONK', NULL, NULL),
	('MAGIL_KOTOKU_IN_WARRIORMONK_EXPERIENCE', 'Amount', '50', NULL, NULL),
	('MAGIL_KOTOKU_IN_WARRIORMONK_STRENGTH', 'Amount', '6', NULL, NULL);

INSERT INTO BuildingModifiers
	(BuildingType, ModifierId)
VALUES	
	--Great Library
	('BUILDING_GREAT_LIBRARY', 'MAGIL_GREAT_LIBRARY_GW_BOOST'),
	--Statue of Liberty
	('BUILDING_STATUE_LIBERTY', 'MAGIL_STATUE_LIBERTY_HOME_CONTINENT_LOYALTY'),
	('BUILDING_STATUE_LIBERTY', 'MAGIL_STATUE_LIBERTY_HOME_CONTINENT_GROWTH'),
	('BUILDING_STATUE_LIBERTY', 'MAGIL_STATUE_LIBERTY_HOME_CONTINENT_GOLD'),
	('BUILDING_STATUE_LIBERTY', 'MAGIL_STATUE_LIBERTY_HOME_CONTINENT_PRODUCTION'),
	--Forbidden City
	('BUILDING_FORBIDDEN_CITY', 'MAGIL_FORBIDDEN_CITY_CITIES_ALWAYS_LOYAL'),
	--Taj Mahal
	('BUILDING_TAJ_MAHAL', 'MAGIL_TAJ_MAHAL_PRODUCTION_BONUS'),
	('BUILDING_TAJ_MAHAL', 'MAGIL_TAJ_MAHAL_GOLD_BONUS'),
	('BUILDING_TAJ_MAHAL', 'MAGIL_TAJ_MAHAL_SCIENCE_BONUS'),
	('BUILDING_TAJ_MAHAL', 'MAGIL_TAJ_MAHAL_CULTURE_BONUS'),
	('BUILDING_TAJ_MAHAL', 'MAGIL_TAJ_MAHAL_FAITH_BONUS'),
	('BUILDING_TAJ_MAHAL', 'MAGIL_TAJ_MAHAL_GROWTH_BONUS'),
	--Kotoku-in
	('BUILDING_KOTOKU_IN', 'MAGIL_KOTOKU_IN_HOLYSITE_WARRIORMONKS'),
	('BUILDING_KOTOKU_IN', 'MAGIL_KOTOKU_IN_WARRIORMONK_EXPERIENCE'),
	('BUILDING_KOTOKU_IN', 'MAGIL_KOTOKU_IN_WARRIORMONK_STRENGTH');
	
INSERT INTO Building_ValidTerrains
	(BuildingType, TerrainType)
VALUES	
	--St. Basil's Cathedral
	('BUILDING_ST_BASILS_CATHEDRAL', 'TERRAIN_TUNDRA'),	
	('BUILDING_ST_BASILS_CATHEDRAL', 'TERRAIN_TUNDRA_HILLS');	

--Updating and Deleting Other Modifiers
--Great Library	
DELETE FROM BuildingModifiers WHERE BuildingType='BUILDING_GREAT_LIBRARY' AND ModifierId='MAGIL_GREAT_LIBRARY_GREATWORK_BUFF';
DELETE FROM BuildingModifiers WHERE BuildingType='BUILDING_GREAT_LIBRARY' AND ModifierId='MAGIL_GREAT_LIBRARY_FREE_WRITER';
DELETE FROM Building_GreatPersonPoints WHERE BuildingType='BUILDING_GREAT_LIBRARY' AND GreatPersonClassType='GREAT_PERSON_CLASS_WRITER';
--Statue of Liberty
DELETE FROM BuildingModifiers WHERE BuildingType='BUILDING_STATUE_LIBERTY' AND ModifierId='STATUELIBERTY_GRANTSETTLERS';
DELETE FROM BuildingModifiers WHERE BuildingType='BUILDING_STATUE_LIBERTY' AND ModifierId='STATUELIBERTY_CITIES_ALWAYS_LOYAL';
UPDATE Buildings SET AdjacentDistrict='DISTRICT_CITY_CENTER' WHERE BuildingType='BUILDING_STATUE_LIBERTY' AND AdjacentDistrict='DISTRICT_HARBOR';
--Forbidden City
UPDATE Buildings SET RegionalRange='' WHERE BuildingType='BUILDING_FORBIDDEN_CITY';
UPDATE Building_YieldChanges SET YieldChange='5' WHERE BuildingType='BUILDING_FORBIDDEN_CITY' AND YieldType='YIELD_CULTURE';
--St. Basil's Cathedral
UPDATE Modifiers SET SubjectRequirementSetId=NULL WHERE ModifierId='STBASILS_ADDRELIGIOUSTOURISM';
UPDATE BuildingModifiers SET ModifierId='MAGIL_ST_BASILS_CATHEDRAL_ATTACH_MODIFIER' WHERE BuildingType='BUILDING_ST_BASILS_CATHEDRAL' AND ModifierId='STBASILS_ADDRELIGIOUSTOURISM';
--Ruhr Valley
UPDATE BuildingModifiers SET ModifierId='MAGIL_RUHR_VALLEY_NEARBY_CITY_PRODUCTION' WHERE BuildingType='BUILDING_RUHR_VALLEY' AND ModifierId='MAGIL_RUHR_VALLEY_INDUSTRIAL_ZONE_PRODUCTION';
--Oxford University
UPDATE BuildingModifiers SET ModifierId='MAGIL_OXFORD_UNIVERSITY_NEARBY_CITY_SCIENCE' WHERE BuildingType='BUILDING_OXFORD_UNIVERSITY' AND ModifierId='MAGIL_OXFORD_UNIVERSITY_SCIENCE_PER_CITY';
--Hagia Sophia
UPDATE BuildingModifiers SET ModifierId='MAGIL_HAGIA_SOPHIA_NEARBY_CITY_FAITH' WHERE BuildingType='BUILDING_HAGIA_SOPHIA' AND ModifierId='MAGIL_HAGIA_SOPHIA_FAITH_BONUS';
--Hermitage
UPDATE BuildingModifiers SET ModifierId='MAGIL_HERMITAGE_NEARBY_CITY_CULTURE' WHERE BuildingType='BUILDING_HERMITAGE' AND ModifierId='MAGIL_HERMITAGE_CULTURE';
--Kotoku-in
DELETE FROM BuildingModifiers WHERE BuildingType='BUILDING_KOTOKU_IN' AND ModifierId='KOTOKU_ADDFAITHYIELD';

--RequirementSets
INSERT INTO RequirementSets
	(RequirementSetId,	RequirementSetType)
VALUES	
	('MAGIL_CITY_ON_HOME_CONTINENT_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL'),
	('MAGIL_CITY_ON_HOME_CONTINENT_WITH_2_DISTRICTS_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL'),
	('MAGIL_FORBIDDEN_CITY_WITHIN_6_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL'),
	('MAGIL_PLAYER_IS_IN_GOLDENAGE_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL'),
	('MAGIL_UNIT_IS_WARRIOR_MONK_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL'),
	('MAGIL_RUHR_VALLEY_WITHIN_6_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL'),
	('MAGIL_OXFORD_UNIVERSITY_WITHIN_6_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL'),
	('MAGIL_HAGIA_SOPHIA_WITHIN_6_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL'),
	('MAGIL_HERMITAGE_WITHIN_6_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	
	('MAGIL_CITY_ON_HOME_CONTINENT_REQUIREMENTS', 'MAGIL_REQUIRES_CITY_ON_HOME_CONTINENT'),
	('MAGIL_CITY_ON_HOME_CONTINENT_WITH_2_DISTRICTS_REQUIREMENTS', 'MAGIL_REQUIRES_CITY_ON_HOME_CONTINENT'),
	('MAGIL_CITY_ON_HOME_CONTINENT_WITH_2_DISTRICTS_REQUIREMENTS', 'REQUIRES_CITY_HAS_2_SPECIALTY_DISTRICTS'),
	('MAGIL_FORBIDDEN_CITY_WITHIN_6_REQUIREMENTS', 'MAGIL_REQUIRES_FORBIDDEN_CITY_WITHIN_6'),
	('MAGIL_PLAYER_IS_IN_GOLDENAGE_REQUIREMENTS', 'REQUIRES_PLAYER_HAS_GOLDEN_AGE'),
	('MAGIL_UNIT_IS_WARRIOR_MONK_REQUIREMENTS', 'MAGIL_REQUIRES_UNIT_IS_WARRIOR_MONK'),
	('MAGIL_RUHR_VALLEY_WITHIN_6_REQUIREMENTS', 'MAGIL_REQUIRES_RUHR_VALLEY_WITHIN_6'),
	('MAGIL_OXFORD_UNIVERSITY_WITHIN_6_REQUIREMENTS', 'MAGIL_REQUIRES_OXFORD_UNIVERSITY_WITHIN_6'),
	('MAGIL_HAGIA_SOPHIA_WITHIN_6_REQUIREMENTS', 'MAGIL_REQUIRES_HAGIA_SOPHIA_WITHIN_6'),
	('MAGIL_HERMITAGE_WITHIN_6_REQUIREMENTS', 'MAGIL_REQUIRES_HERMITAGE_WITHIN_6');

--Requirements
INSERT INTO Requirements
	(RequirementId,	RequirementType,	Inverse)
VALUES	
	('MAGIL_REQUIRES_CITY_ON_HOME_CONTINENT', 'REQUIREMENT_CITY_IS_OWNER_CAPITAL_CONTINENT', 0),
	('MAGIL_REQUIRES_FORBIDDEN_CITY_WITHIN_6', 'REQUIREMENT_PLOT_ADJACENT_BUILDING_TYPE_MATCHES', 0),
	('MAGIL_REQUIRES_UNIT_IS_WARRIOR_MONK', 'REQUIREMENT_UNIT_TYPE_MATCHES', 0),
	('MAGIL_REQUIRES_RUHR_VALLEY_WITHIN_6', 'REQUIREMENT_PLOT_ADJACENT_BUILDING_TYPE_MATCHES', 0),
	('MAGIL_REQUIRES_OXFORD_UNIVERSITY_WITHIN_6', 'REQUIREMENT_PLOT_ADJACENT_BUILDING_TYPE_MATCHES', 0),
	('MAGIL_REQUIRES_HAGIA_SOPHIA_WITHIN_6', 'REQUIREMENT_PLOT_ADJACENT_BUILDING_TYPE_MATCHES', 0),
	('MAGIL_REQUIRES_HERMITAGE_WITHIN_6', 'REQUIREMENT_PLOT_ADJACENT_BUILDING_TYPE_MATCHES', 0);
	
INSERT INTO RequirementArguments
	(RequirementId,	Name,	Value,	Extra,	SecondExtra)
VALUES	
	('MAGIL_REQUIRES_FORBIDDEN_CITY_WITHIN_6', 'BuildingType', 'BUILDING_FORBIDDEN_CITY', NULL, NULL),	
	('MAGIL_REQUIRES_FORBIDDEN_CITY_WITHIN_6', 'MinRange', '0', NULL, NULL),	
	('MAGIL_REQUIRES_FORBIDDEN_CITY_WITHIN_6', 'MaxRange', '6', NULL, NULL),
	('MAGIL_REQUIRES_RUHR_VALLEY_WITHIN_6', 'BuildingType', 'BUILDING_RUHR_VALLEY', NULL, NULL),	
	('MAGIL_REQUIRES_RUHR_VALLEY_WITHIN_6', 'MinRange', '0', NULL, NULL),	
	('MAGIL_REQUIRES_RUHR_VALLEY_WITHIN_6', 'MaxRange', '6', NULL, NULL),
	('MAGIL_REQUIRES_OXFORD_UNIVERSITY_WITHIN_6', 'BuildingType', 'BUILDING_OXFORD_UNIVERSITY', NULL, NULL),	
	('MAGIL_REQUIRES_OXFORD_UNIVERSITY_WITHIN_6', 'MinRange', '0', NULL, NULL),	
	('MAGIL_REQUIRES_OXFORD_UNIVERSITY_WITHIN_6', 'MaxRange', '6', NULL, NULL),
	('MAGIL_REQUIRES_HAGIA_SOPHIA_WITHIN_6', 'BuildingType', 'BUILDING_HAGIA_SOPHIA', NULL, NULL),	
	('MAGIL_REQUIRES_HAGIA_SOPHIA_WITHIN_6', 'MinRange', '0', NULL, NULL),	
	('MAGIL_REQUIRES_HAGIA_SOPHIA_WITHIN_6', 'MaxRange', '6', NULL, NULL),
	('MAGIL_REQUIRES_HERMITAGE_WITHIN_6', 'BuildingType', 'BUILDING_HERMITAGE', NULL, NULL),	
	('MAGIL_REQUIRES_HERMITAGE_WITHIN_6', 'MinRange', '0', NULL, NULL),	
	('MAGIL_REQUIRES_HERMITAGE_WITHIN_6', 'MaxRange', '6', NULL, NULL),
	('MAGIL_REQUIRES_UNIT_IS_WARRIOR_MONK', 'UnitType', 'UNIT_WARRIOR_MONK', NULL, NULL);	

--ModifierStrings
INSERT INTO ModifierStrings
	(ModifierId, Context, Text)
VALUES	
	--Kotoku-in
	('MAGIL_KOTOKU_IN_WARRIORMONK_STRENGTH', 'Preview', 'LOC_MAGIL_KOTOKU_IN_COMBAT_BONUS');