--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
-- Types
-------------------------------------	
INSERT INTO Types	
		(Type,								Kind)
VALUES	('CIVILIZATION_SUK_ICELAND',		'KIND_CIVILIZATION');
-------------------------------------			
-- Civilizations			
-------------------------------------				
-- Types
-------------------------------------	
INSERT INTO Civilizations	
		(CivilizationType,				Name,									Description,									Adjective,									StartingCivilizationLevelType,	RandomCityNameDepth,	Ethnicity)
VALUES	('CIVILIZATION_SUK_ICELAND',	'LOC_CIVILIZATION_SUK_ICELAND_NAME',	'LOC_CIVILIZATION_SUK_ICELAND_DESCRIPTION',		'LOC_CIVILIZATION_SUK_ICELAND_ADJECTIVE',	'CIVILIZATION_LEVEL_FULL_CIV',	10,						'ETHNICITY_EURO');	
-------------------------------------			
-- CityNames			
-------------------------------------		
INSERT INTO CityNames
			(CivilizationType,								CityName)
VALUES		('CIVILIZATION_SUK_ICELAND',			'LOC_CITY_NAME_SUK_ICELAND_REYKJAVIK'),
			('CIVILIZATION_SUK_ICELAND',			'LOC_CITY_NAME_SUK_ICELAND_THINGVELLIR'),
			('CIVILIZATION_SUK_ICELAND',			'LOC_CITY_NAME_SUK_ICELAND_HUSAVIK'),
			('CIVILIZATION_SUK_ICELAND',			'LOC_CITY_NAME_SUK_ICELAND_SKALHOLT'),
			('CIVILIZATION_SUK_ICELAND',			'LOC_CITY_NAME_SUK_ICELAND_HOLAR'),
			('CIVILIZATION_SUK_ICELAND',			'LOC_CITY_NAME_SUK_ICELAND_AKUREYRI'),
			('CIVILIZATION_SUK_ICELAND',			'LOC_CITY_NAME_SUK_ICELAND_SEYTHISFJORTHUR'),
			('CIVILIZATION_SUK_ICELAND',			'LOC_CITY_NAME_SUK_ICELAND_GARTHABAER'),
			('CIVILIZATION_SUK_ICELAND',			'LOC_CITY_NAME_SUK_ICELAND_ISAFJORTHUR'),
			('CIVILIZATION_SUK_ICELAND',			'LOC_CITY_NAME_SUK_ICELAND_SAUTHARKROKUR'),
			('CIVILIZATION_SUK_ICELAND',			'LOC_CITY_NAME_SUK_ICELAND_BORGARNES'),
			('CIVILIZATION_SUK_ICELAND',			'LOC_CITY_NAME_SUK_ICELAND_GARTHUR'),
			('CIVILIZATION_SUK_ICELAND',			'LOC_CITY_NAME_SUK_ICELAND_AKRANES'),
			('CIVILIZATION_SUK_ICELAND',			'LOC_CITY_NAME_SUK_ICELAND_GRINDAVIK'),
			('CIVILIZATION_SUK_ICELAND',			'LOC_CITY_NAME_SUK_ICELAND_SELFOSS'),
			('CIVILIZATION_SUK_ICELAND',			'LOC_CITY_NAME_SUK_ICELAND_HAFNARFJORTHUR'),
			('CIVILIZATION_SUK_ICELAND',			'LOC_CITY_NAME_SUK_ICELAND_VESTMANNAEYJAR'),
			('CIVILIZATION_SUK_ICELAND',			'LOC_CITY_NAME_SUK_ICELAND_KOPAVOGUR'),
			('CIVILIZATION_SUK_ICELAND',			'LOC_CITY_NAME_SUK_ICELAND_KEFLAVIK'),
			('CIVILIZATION_SUK_ICELAND',			'LOC_CITY_NAME_SUK_ICELAND_EGILSSTATHIR'),
			('CIVILIZATION_SUK_ICELAND',			'LOC_CITY_NAME_SUK_ICELAND_NESKAUPSTATHUR'),
			('CIVILIZATION_SUK_ICELAND',			'LOC_CITY_NAME_SUK_ICELAND_STYKKISHOLMUR'),
			('CIVILIZATION_SUK_ICELAND',			'LOC_CITY_NAME_SUK_ICELAND_MOSFELLSBAER'),
			('CIVILIZATION_SUK_ICELAND',			'LOC_CITY_NAME_SUK_ICELAND_HVERAGERTHI'),
			('CIVILIZATION_SUK_ICELAND',			'LOC_CITY_NAME_SUK_ICELAND_THORLAKSHOFN'),
			('CIVILIZATION_SUK_ICELAND',			'LOC_CITY_NAME_SUK_ICELAND_ALFTANES'),
			('CIVILIZATION_SUK_ICELAND',			'LOC_CITY_NAME_SUK_ICELAND_HOFN'),
			('CIVILIZATION_SUK_ICELAND',			'LOC_CITY_NAME_SUK_ICELAND_SANDGERTHI');
-------------------------------------
-- CivilizationCitizenNames
-------------------------------------	
INSERT INTO CivilizationCitizenNames	
		(CivilizationType,						CitizenName,									Female,		Modern)
VALUES	('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MALE_1',				0,			0),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MALE_2',				0,			0),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MALE_3',				0,			0),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MALE_4',				0,			0),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MALE_5',				0,			0),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MALE_6',				0,			0),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MALE_7',				0,			0),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MALE_8',				0,			0),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MALE_9',				0,			0),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MALE_10',				0,			0),

		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_FEMALE_1',				1,			0),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_FEMALE_2',				1,			0),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_FEMALE_3',				1,			0),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_FEMALE_4',				1,			0),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_FEMALE_5',				1,			0),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_FEMALE_6',				1,			0),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_FEMALE_7',				1,			0),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_FEMALE_8',				1,			0),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_FEMALE_9',				1,			0),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_FEMALE_10',			1,			0),

		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MODERN_MALE_1',		0,			1),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MODERN_MALE_2',		0,			1),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MODERN_MALE_3',		0,			1),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MODERN_MALE_4',		0,			1),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MODERN_MALE_5',		0,			1),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MODERN_MALE_6',		0,			1),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MODERN_MALE_7',		0,			1),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MODERN_MALE_8',		0,			1),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MODERN_MALE_9',		0,			1),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MODERN_MALE_10',		0,			1),

		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MODERN_FEMALE_1',		1,			1),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MODERN_FEMALE_2',		1,			1),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MODERN_FEMALE_3',		1,			1),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MODERN_FEMALE_4',		1,			1),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MODERN_FEMALE_5',		1,			1),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MODERN_FEMALE_6',		1,			1),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MODERN_FEMALE_7',		1,			1),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MODERN_FEMALE_8',		1,			1),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MODERN_FEMALE_9',		1,			1),
		('CIVILIZATION_SUK_ICELAND',			'LOC_CITIZEN_SUK_ICELAND_MODERN_FEMALE_10',		1,			1);			
-------------------------------------			
-- StartBiasTerrains			
-------------------------------------	
INSERT INTO StartBiasTerrains	
		(CivilizationType,							TerrainType,		Tier)
VALUES	('CIVILIZATION_SUK_ICELAND',				'TERRAIN_COAST',	3);
-------------------------------------			
-- StartBiasFeatures			
-------------------------------------	
INSERT INTO StartBiasFeatures	
		(CivilizationType,							FeatureType,		Tier)
SELECT	'CIVILIZATION_SUK_ICELAND',					FeatureType,		1
FROM Features WHERE NaturalWonder = 1;
-- -------------------------------------			
-- -- StartBiasResources			
-- -------------------------------------	
-- INSERT INTO StartBiasResources	
-- 		(CivilizationType,							ResourceType,			Tier)
-- VALUES	('CIVILIZATION_SUK_ICELAND',				'RESOURCE_WHALES',		3),
-- 		('CIVILIZATION_SUK_ICELAND',				'RESOURCE_PEARLS',		3);
-------------------------------------			
-- CivilizationInfo			
-------------------------------------		
INSERT INTO CivilizationInfo	
			(CivilizationType,					Header,						Caption,									SortIndex)	
VALUES		('CIVILIZATION_SUK_ICELAND',		'LOC_CIVINFO_LOCATION',		'LOC_CIVINFO_SUK_ICELAND_LOCATION',			10),	
			('CIVILIZATION_SUK_ICELAND',		'LOC_CIVINFO_SIZE',			'LOC_CIVINFO_SUK_ICELAND_SIZE',				20),	
			('CIVILIZATION_SUK_ICELAND',		'LOC_CIVINFO_POPULATION',	'LOC_CIVINFO_SUK_ICELAND_POPULATION',		30),	
			('CIVILIZATION_SUK_ICELAND',		'LOC_CIVINFO_CAPITAL', 		'LOC_CIVINFO_SUK_ICELAND_CAPITAL',			40);
--==========================================================================================================================
-- TRAITS
--==========================================================================================================================
-- Types
-------------------------------------	
INSERT INTO Types	
		(Type,														Kind)
VALUES	('TRAIT_CIVILIZATION_SUK_SAGAS_OF_THE_ICELANDERS',			'KIND_TRAIT'),
		('TRAIT_CIVILIZATION_UNIT_SUK_LAWSPEAKER',					'KIND_TRAIT'),
		('TRAIT_CIVILIZATION_DISTRICT_SUK_TORFBAEIR',				'KIND_TRAIT');
-------------------------------------			
-- Traits			
-------------------------------------				
INSERT INTO Traits				
		(TraitType,												Name,															Description)
VALUES	('TRAIT_CIVILIZATION_SUK_SAGAS_OF_THE_ICELANDERS',		'LOC_TRAIT_CIVILIZATION_SUK_SAGAS_OF_THE_ICELANDERS_NAME',		'LOC_TRAIT_CIVILIZATION_SUK_SAGAS_OF_THE_ICELANDERS_DESCRIPTION'),
		('TRAIT_CIVILIZATION_UNIT_SUK_LAWSPEAKER',				'LOC_TRAIT_CIVILIZATION_UNIT_SUK_LAWSPEAKER_NAME',				null),
		('TRAIT_CIVILIZATION_DISTRICT_SUK_TORFBAEIR',			'LOC_TRAIT_CIVILIZATION_DISTRICT_SUK_TORFBAEIR_NAME',			null);
-------------------------------------
-- CivilizationTraits
-------------------------------------	
INSERT INTO CivilizationTraits	
		(TraitType,													CivilizationType)
VALUES	('TRAIT_CIVILIZATION_SUK_SAGAS_OF_THE_ICELANDERS',			'CIVILIZATION_SUK_ICELAND'),
		('TRAIT_CIVILIZATION_UNIT_SUK_LAWSPEAKER',					'CIVILIZATION_SUK_ICELAND'),
		('TRAIT_CIVILIZATION_DISTRICT_SUK_TORFBAEIR',				'CIVILIZATION_SUK_ICELAND');
-------------------------------------
-- TraitModifiers
-------------------------------------
INSERT INTO TraitModifiers			
		(TraitType,												ModifierId)
SELECT	'TRAIT_CIVILIZATION_SUK_SAGAS_OF_THE_ICELANDERS',		'SUK_SAGAS_OF_THE_ICELANDERS_' || Districts.DistrictType || '_' || Features.FeatureType
FROM Districts CROSS JOIN Features
WHERE Districts.DistrictType IN ("DISTRICT_CAMPUS", "DISTRICT_THEATER", "DISTRICT_COMMERCIAL_HUB") AND Features.NaturalWonder = 1;
--==========================================================================================================================
-- MODIFIERS
--==========================================================================================================================	
-- Modifiers
-------------------------------------	
INSERT INTO Modifiers
		(ModifierId,																				ModifierType)
SELECT	'SUK_SAGAS_OF_THE_ICELANDERS_' || Districts.DistrictType || '_' || Features.FeatureType,	'MODIFIER_PLAYER_CITIES_FEATURE_ADJACENCY'
FROM Districts CROSS JOIN Features
WHERE Districts.DistrictType IN ("DISTRICT_CAMPUS", "DISTRICT_THEATER", "DISTRICT_COMMERCIAL_HUB") AND Features.NaturalWonder = 1;
-------------------------------------
-- ModifierArguments
-------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,																							Name,				Value)
SELECT	'SUK_SAGAS_OF_THE_ICELANDERS_' || Districts.DistrictType || '_' || Features.FeatureType,				'DistrictType',		Districts.DistrictType
FROM Districts CROSS JOIN Features
WHERE Districts.DistrictType IN ("DISTRICT_CAMPUS", "DISTRICT_THEATER", "DISTRICT_COMMERCIAL_HUB") AND Features.NaturalWonder = 1;

INSERT INTO ModifierArguments
		(ModifierId,																							Name,				Value)
SELECT	'SUK_SAGAS_OF_THE_ICELANDERS_' || Districts.DistrictType || '_' || Features.FeatureType,				'FeatureType',		Features.FeatureType
FROM Districts CROSS JOIN Features
WHERE Districts.DistrictType IN ("DISTRICT_CAMPUS", "DISTRICT_THEATER", "DISTRICT_COMMERCIAL_HUB") AND Features.NaturalWonder = 1;

INSERT INTO ModifierArguments
		(ModifierId,																							Name,				Value)
SELECT	'SUK_SAGAS_OF_THE_ICELANDERS_' || Districts.DistrictType || '_' || Features.FeatureType,				'Amount',			2
FROM Districts CROSS JOIN Features
WHERE Districts.DistrictType IN ("DISTRICT_CAMPUS", "DISTRICT_THEATER", "DISTRICT_COMMERCIAL_HUB") AND Features.NaturalWonder = 1;

INSERT INTO ModifierArguments
		(ModifierId,																							Name,				Value)
SELECT	'SUK_SAGAS_OF_THE_ICELANDERS_' || Districts.DistrictType || '_' || Features.FeatureType,				'YieldType',		CASE
	WHEN Districts.DistrictType = 'DISTRICT_CAMPUS' THEN 'YIELD_SCIENCE'
	WHEN Districts.DistrictType = 'DISTRICT_THEATER' THEN 'YIELD_CULTURE'
	WHEN Districts.DistrictType = 'DISTRICT_COMMERCIAL_HUB' THEN 'YIELD_GOLD'
	ELSE 'YIELD_CULTURE' END AS YieldType
FROM Districts CROSS JOIN Features
WHERE Districts.DistrictType IN ("DISTRICT_CAMPUS", "DISTRICT_THEATER", "DISTRICT_COMMERCIAL_HUB") AND Features.NaturalWonder = 1;

INSERT INTO ModifierArguments
		(ModifierId,																							Name,				Value)
SELECT	'SUK_SAGAS_OF_THE_ICELANDERS_' || Districts.DistrictType || '_' || Features.FeatureType,				'Description',		CASE
	WHEN Districts.DistrictType = 'DISTRICT_CAMPUS' THEN 'LOC_TRAIT_CIVILIZATION_SUK_SAGAS_OF_THE_ICELANDERS_SCIENCE'
	WHEN Districts.DistrictType = 'DISTRICT_THEATER' THEN 'LOC_TRAIT_CIVILIZATION_SUK_SAGAS_OF_THE_ICELANDERS_CULTURE'
	WHEN Districts.DistrictType = 'DISTRICT_COMMERCIAL_HUB' THEN 'LOC_TRAIT_CIVILIZATION_SUK_SAGAS_OF_THE_ICELANDERS_GOLD'
	ELSE 'LOC_TRAIT_CIVILIZATION_SUK_SAGAS_OF_THE_ICELANDERS_CULTURE' END AS YieldType
FROM Districts CROSS JOIN Features
WHERE Districts.DistrictType IN ("DISTRICT_CAMPUS", "DISTRICT_THEATER", "DISTRICT_COMMERCIAL_HUB") AND Features.NaturalWonder = 1;
--==========================================================================================================================
--==========================================================================================================================