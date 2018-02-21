--==========================================================================================================================
-- RESOURCES
--==========================================================================================================================
-- Types
-------------------------------------	
INSERT INTO Types	
		(Type,							Kind)
VALUES	('RESOURCE_P0K_PENGUINS',		'KIND_RESOURCE'),
		('RESOURCE_CVS_POMEGRANATES',	'KIND_RESOURCE'),
		('RESOURCE_CVS_ELECTRUM',		'KIND_RESOURCE'),
		('RESOURCE_CVS_CEDAR',			'KIND_RESOURCE');
-------------------------------------
-- TypeTags
-------------------------------------
INSERT INTO TypeTags
			(Type,							Tag)
VALUES		('RESOURCE_P0K_PENGUINS',			'CLASS_GOLD'),
			('RESOURCE_P0K_PENGUINS',			'CLASS_SCIENCE'),
			('RESOURCE_P0K_PENGUINS',			'CLASS_PRODUCTION'),
			('RESOURCE_CVS_POMEGRANATES',		'CLASS_CULTURE'),
			('RESOURCE_CVS_POMEGRANATES',		'CLASS_FOOD'),
			('RESOURCE_CVS_POMEGRANATES',		'CLASS_GOLD'),
			('RESOURCE_CVS_POMEGRANATES',		'CLASS_ORAL_TRADITION'),
			('RESOURCE_CVS_ELECTRUM',			'CLASS_CULTURE'),
			('RESOURCE_CVS_ELECTRUM',			'CLASS_PRODUCTION'),
			('RESOURCE_CVS_ELECTRUM',			'CLASS_GOLD'),
			('RESOURCE_CVS_CEDAR',				'CLASS_CULTURE'),
			('RESOURCE_CVS_CEDAR',				'CLASS_PRODUCTION'),
			('RESOURCE_CVS_CEDAR',				'CLASS_GODDESS_OF_FESTIVALS');
-------------------------------------
-- Resources
-------------------------------------					
INSERT INTO Resources			
		(ResourceType,					Name,									ResourceClassType,			NoRiver,	Happiness,		Frequency)
VALUES	('RESOURCE_P0K_PENGUINS',		'LOC_RESOURCE_P0K_PENGUINS_NAME',		'RESOURCECLASS_BONUS',		0,			0,				4),
		('RESOURCE_CVS_POMEGRANATES',	'LOC_RESOURCE_CVS_POMEGRANATES_NAME',	'RESOURCECLASS_LUXURY',		0,			4,				2),
		('RESOURCE_CVS_ELECTRUM',		'LOC_RESOURCE_CVS_ELECTRUM_NAME',		'RESOURCECLASS_LUXURY',		0,			4,				2),
		('RESOURCE_CVS_CEDAR',			'LOC_RESOURCE_CVS_CEDAR_NAME',			'RESOURCECLASS_LUXURY',		0,			4,				2);
-------------------------------------
-- Resource_ValidTerrains
-------------------------------------	
INSERT INTO Resource_ValidTerrains
			(ResourceType,						TerrainType)
VALUES		('RESOURCE_P0K_PENGUINS',			'TERRAIN_TUNDRA'),
			('RESOURCE_P0K_PENGUINS',			'TERRAIN_TUNDRA_HILLS'),
			('RESOURCE_CVS_POMEGRANATES',		'TERRAIN_PLAINS'),
			('RESOURCE_CVS_POMEGRANATES',		'TERRAIN_PLAINS_HILLS'),
			('RESOURCE_CVS_POMEGRANATES',		'TERRAIN_GRASS'),
			('RESOURCE_CVS_ELECTRUM',			'TERRAIN_PLAINS'),
			('RESOURCE_CVS_ELECTRUM',			'TERRAIN_PLAINS_HILLS'),
			('RESOURCE_CVS_ELECTRUM',			'TERRAIN_DESERT'),
			('RESOURCE_CVS_ELECTRUM',			'TERRAIN_DESERT_HILLS'),
			('RESOURCE_CVS_CEDAR',				'TERRAIN_PLAINS'),
			('RESOURCE_CVS_CEDAR',				'TERRAIN_PLAINS_HILLS'),
			('RESOURCE_CVS_CEDAR',				'TERRAIN_GRASS'),
			('RESOURCE_CVS_CEDAR',				'TERRAIN_GRASS_HILLS');
-------------------------------------
-- Resource_YieldChanges
-------------------------------------	
INSERT INTO Resource_YieldChanges	
		(ResourceType,							YieldType,						YieldChange)
VALUES	('RESOURCE_P0K_PENGUINS',				'YIELD_SCIENCE',				1),
		('RESOURCE_CVS_POMEGRANATES',			'YIELD_CULTURE',				1),
		('RESOURCE_CVS_POMEGRANATES',			'YIELD_FOOD',					1),
		('RESOURCE_CVS_ELECTRUM',				'YIELD_CULTURE',				1),
		('RESOURCE_CVS_ELECTRUM',				'YIELD_GOLD',					1),
		('RESOURCE_CVS_CEDAR',					'YIELD_FAITH',					1),
		('RESOURCE_CVS_CEDAR',					'YIELD_PRODUCTION',				1);
-------------------------------------
-- Improvement_ValidResources
-------------------------------------	
INSERT INTO Improvement_ValidResources	
		(ImprovementType,				ResourceType,						MustRemoveFeature)
VALUES	('IMPROVEMENT_CAMP',			'RESOURCE_P0K_PENGUINS',			0),
		('IMPROVEMENT_PLANTATION',		'RESOURCE_CVS_POMEGRANATES',		0),
		('IMPROVEMENT_MINE',			'RESOURCE_CVS_ELECTRUM',			1),
		('IMPROVEMENT_LUMBER_MILL',		'RESOURCE_CVS_CEDAR',				0);
-------------------------------------
-- Resource_Harvests
-------------------------------------	
INSERT INTO Resource_Harvests
		(ResourceType,				YieldType,		Amount,	PrereqTech)
VALUES	('RESOURCE_P0K_PENGUINS',	'YIELD_GOLD',	50,		'TECH_ANIMAL_HUSBANDRY');