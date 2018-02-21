--==========================================================================================================================
-- Districts
--==========================================================================================================================
-- Types
-----------------------------------------------------------------------------------	
INSERT INTO Types	
		(Type,								Kind)
VALUES	('DISTRICT_SUK_TORFBAEIR',			'KIND_DISTRICT');
-----------------------------------------------------------------------------------
-- Districts
-----------------------------------------------------------------------------------
INSERT INTO Districts
			(DistrictType,						Name,										Description,								Cost,		TraitType,										PrereqTech,		Appeal,	Housing,	Aqueduct,		PlunderType,		PlunderAmount,		AdvisorType,		CostProgressionModel,		CostProgressionParam1,		RequiresPlacement,		RequiresPopulation,		NoAdjacentCity,		InternalOnly,		ZOC,		CaptureRemovesBuildings,		CaptureRemovesCityDefenses,		MilitaryDomain,		TravelTime,		CityStrengthModifier)
SELECT		'DISTRICT_SUK_TORFBAEIR',			'LOC_DISTRICT_SUK_TORFBAEIR_NAME',			'LOC_DISTRICT_SUK_TORFBAEIR_DESCRIPTION',	Cost,		'TRAIT_CIVILIZATION_DISTRICT_SUK_TORFBAEIR',	PrereqTech,		1,		3,			0,				PlunderType,		PlunderAmount,		AdvisorType,		CostProgressionModel,		CostProgressionParam1,		RequiresPlacement,		RequiresPopulation,		NoAdjacentCity,		InternalOnly,		ZOC,		CaptureRemovesBuildings,		CaptureRemovesCityDefenses,		MilitaryDomain,		TravelTime,		CityStrengthModifier
FROM Districts WHERE DistrictType = 'DISTRICT_BATH';
-----------------------------------------------------------------------------------
-- DistrictReplaces
-----------------------------------------------------------------------------------
INSERT INTO DistrictReplaces
			(CivUniqueDistrictType,					ReplacesDistrictType)
VALUES		('DISTRICT_SUK_TORFBAEIR',				'DISTRICT_AQUEDUCT');
-----------------------------------------------------------------------------------
-- District_ValidTerrains
-----------------------------------------------------------------------------------
INSERT INTO District_ValidTerrains
			(DistrictType,								TerrainType)
VALUES 		('DISTRICT_SUK_TORFBAEIR',					'TERRAIN_PLAINS'),
			('DISTRICT_SUK_TORFBAEIR',					'TERRAIN_PLAINS_HILLS'),
			('DISTRICT_SUK_TORFBAEIR',					'TERRAIN_GRASS'),
			('DISTRICT_SUK_TORFBAEIR',					'TERRAIN_GRASS_HILLS'),
			('DISTRICT_SUK_TORFBAEIR',					'TERRAIN_TUNDRA'),
			('DISTRICT_SUK_TORFBAEIR',					'TERRAIN_TUNDRA_HILLS'),
			('DISTRICT_SUK_TORFBAEIR',					'TERRAIN_SNOW'),			
			('DISTRICT_SUK_TORFBAEIR',					'TERRAIN_SNOW_HILLS');
-----------------------------------------------------------------------------------
-- AppealHousingChanges
-----------------------------------------------------------------------------------
INSERT INTO AppealHousingChanges
		(DistrictType,							MinimumValue,	AppealChange,	Description)
VALUES	('DISTRICT_SUK_TORFBAEIR',				4,				2,				'LOC_DISTRICT_SUK_TORFBAEIR_APPEAL_HOUSING_BREATHTAKING'),
		('DISTRICT_SUK_TORFBAEIR',				2,				1,				'LOC_DISTRICT_SUK_TORFBAEIR_APPEAL_HOUSING_CHARMING'),
		('DISTRICT_SUK_TORFBAEIR',				-100,			0,				'LOC_DISTRICT_SUK_TORFBAEIR_APPEAL_HOUSING_BASE');
-----------------------------------------------------------------------------------
-- DistrictModifiers
-----------------------------------------------------------------------------------
INSERT INTO DistrictModifiers
			(DistrictType,							ModifierId)
SELECT 		'DISTRICT_SUK_TORFBAEIR',			ModifierId
FROM DistrictModifiers WHERE DistrictType = 'DISTRICT_AQUEDUCT';
--==========================================================================================================================
-- Food and Production
--==========================================================================================================================
-- DistrictModifiers/TraitModifiers
-------------------------------------
INSERT INTO DistrictModifiers
		(DistrictType,						ModifierId)
VALUES	('DISTRICT_SUK_TORFBAEIR', 			'DISTRICT_SUK_TORFBAEIR_BASE_FOOD'),
		('DISTRICT_SUK_TORFBAEIR', 			'DISTRICT_SUK_TORFBAEIR_BASE_PROD');

INSERT INTO TraitModifiers			
		(TraitType,												ModifierId)
VALUES	('TRAIT_CIVILIZATION_DISTRICT_SUK_TORFBAEIR', 			'DISTRICT_SUK_TORFBAEIR_CHARMING_FOOD'),
		('TRAIT_CIVILIZATION_DISTRICT_SUK_TORFBAEIR', 			'DISTRICT_SUK_TORFBAEIR_CHARMING_PROD'),
		
		('TRAIT_CIVILIZATION_DISTRICT_SUK_TORFBAEIR', 			'DISTRICT_SUK_TORFBAEIR_BREATHTAKING_FOOD'),
		('TRAIT_CIVILIZATION_DISTRICT_SUK_TORFBAEIR', 			'DISTRICT_SUK_TORFBAEIR_BREATHTAKING_PROD');
-------------------------------------
-- Modifiers
-------------------------------------
INSERT INTO Modifiers	
		(ModifierId,											ModifierType,															SubjectRequirementSetId)
VALUES	('DISTRICT_SUK_TORFBAEIR_BASE_FOOD',					'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE',					NULL),
		('DISTRICT_SUK_TORFBAEIR_BASE_PROD',					'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE',					NULL),

		('DISTRICT_SUK_TORFBAEIR_CHARMING_FOOD',				'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_BASED_ON_APPEAL',				NULL),
		('DISTRICT_SUK_TORFBAEIR_CHARMING_PROD',				'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_BASED_ON_APPEAL',				NULL),

		('DISTRICT_SUK_TORFBAEIR_BREATHTAKING_FOOD',			'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_BASED_ON_APPEAL',				NULL),
		('DISTRICT_SUK_TORFBAEIR_BREATHTAKING_PROD',			'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_BASED_ON_APPEAL',				NULL);
-------------------------------------
-- ModifierArguments
-------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,										Name,							Value)
VALUES	('DISTRICT_SUK_TORFBAEIR_BASE_FOOD',				'YieldType',					'YIELD_FOOD'),
		('DISTRICT_SUK_TORFBAEIR_BASE_FOOD',				'Amount',						1),
		('DISTRICT_SUK_TORFBAEIR_BASE_FOOD',				'Description',					'LOC_DISTRICT_SUK_TORFBAEIR_APPEAL_FOOD'),

		('DISTRICT_SUK_TORFBAEIR_BASE_PROD',				'YieldType',					'YIELD_PRODUCTION'),
		('DISTRICT_SUK_TORFBAEIR_BASE_PROD',				'Amount',						1),
		('DISTRICT_SUK_TORFBAEIR_BASE_PROD',				'Description',					'LOC_DISTRICT_APPEAL_PRODUCTION'),

		('DISTRICT_SUK_TORFBAEIR_CHARMING_FOOD',			'YieldType',					'YIELD_FOOD'),
		('DISTRICT_SUK_TORFBAEIR_CHARMING_FOOD',			'YieldChange',					1),
		('DISTRICT_SUK_TORFBAEIR_CHARMING_FOOD',			'Description',					'LOC_DISTRICT_SUK_TORFBAEIR_APPEAL_FOOD'),
		('DISTRICT_SUK_TORFBAEIR_CHARMING_FOOD',			'DistrictType',					'DISTRICT_SUK_TORFBAEIR'),
		('DISTRICT_SUK_TORFBAEIR_CHARMING_FOOD',			'RequiredAppeal',				2),		

		('DISTRICT_SUK_TORFBAEIR_CHARMING_PROD',			'YieldType',					'YIELD_PRODUCTION'),
		('DISTRICT_SUK_TORFBAEIR_CHARMING_PROD',			'YieldChange',					1),
		('DISTRICT_SUK_TORFBAEIR_CHARMING_PROD',			'Description',					'LOC_DISTRICT_APPEAL_PRODUCTION'),
		('DISTRICT_SUK_TORFBAEIR_CHARMING_PROD',			'DistrictType',					'DISTRICT_SUK_TORFBAEIR'),
		('DISTRICT_SUK_TORFBAEIR_CHARMING_PROD',			'RequiredAppeal',				2),		

		('DISTRICT_SUK_TORFBAEIR_BREATHTAKING_FOOD',		'YieldType',					'YIELD_FOOD'),
		('DISTRICT_SUK_TORFBAEIR_BREATHTAKING_FOOD',		'YieldChange',					1),
		('DISTRICT_SUK_TORFBAEIR_BREATHTAKING_FOOD',		'Description',					'LOC_DISTRICT_SUK_TORFBAEIR_APPEAL_FOOD'),
		('DISTRICT_SUK_TORFBAEIR_BREATHTAKING_FOOD',		'DistrictType',					'DISTRICT_SUK_TORFBAEIR'),
		('DISTRICT_SUK_TORFBAEIR_BREATHTAKING_FOOD',		'RequiredAppeal',				4),		

		('DISTRICT_SUK_TORFBAEIR_BREATHTAKING_PROD',		'YieldType',					'YIELD_PRODUCTION'),
		('DISTRICT_SUK_TORFBAEIR_BREATHTAKING_PROD',		'YieldChange',					1),
		('DISTRICT_SUK_TORFBAEIR_BREATHTAKING_PROD',		'Description',					'LOC_DISTRICT_APPEAL_PRODUCTION'),
		('DISTRICT_SUK_TORFBAEIR_BREATHTAKING_PROD',		'DistrictType',					'DISTRICT_SUK_TORFBAEIR'),		
		('DISTRICT_SUK_TORFBAEIR_BREATHTAKING_PROD',		'RequiredAppeal',				4);
-------------------------------------
-- MomentIllustrations
-------------------------------------
INSERT INTO MomentIllustrations
		(MomentIllustrationType, 						MomentDataType,					GameDataType,					Texture)
VALUES	('MOMENT_ILLUSTRATION_UNIQUE_DISTRICT', 		'MOMENT_DATA_DISTRICT',			'DISTRICT_SUK_TORFBAEIR',		'Moment_Infrastructure_Suk_Iceland.dds');		
--==========================================================================================================================
--==========================================================================================================================