--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Types
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Types	
		(Type,							Kind)
VALUES	('UNIT_SUK_LAWSPEAKER',			'KIND_UNIT');
		--('BUILDING_SUK_LAWSPEAKER',		'KIND_BUILDING');
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
-- INSERT INTO Buildings	
-- 		(BuildingType,					Name,							Cost,		InternalOnly)
-- VALUES 	('BUILDING_SUK_LAWSPEAKER',		'LOC_BUILDING_PALACE_NAME',		1,			1);
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Units	
		(
			UnitType,
			Name,
			Description,
			TraitType,
			PrereqCivic,
			BaseMoves,
			Cost,
			AdvisorType,
			BaseSightRange,
			ZoneOfControl,
			Domain,
			FormationClass,
			--PurchaseYield,
			CanRetreatWhenCaptured,
			CostProgressionModel,
			CostProgressionParam1
		)
SELECT
			'UNIT_SUK_LAWSPEAKER',
			'LOC_UNIT_SUK_LAWSPEAKER_NAME',
			'LOC_UNIT_SUK_LAWSPEAKER_DESCRIPTION',
			'TRAIT_CIVILIZATION_UNIT_SUK_LAWSPEAKER',
			'CIVIC_RECORDED_HISTORY',
			3,
			100,
			'ADVISOR_GENERIC',
			BaseSightRange,
			ZoneOfControl,
			Domain,
			FormationClass,
			--PurchaseYield,
			1,
			CostProgressionModel,
			100

FROM Units WHERE UnitType = 'UNIT_SETTLER';
-----------------------------------------------------------------------------------
-- UnitAiInfos
-----------------------------------------------------------------------------------
INSERT INTO UnitAiInfos
			(UnitType,						AiType)
VALUES 		('UNIT_SUK_LAWSPEAKER',			'UNITTYPE_CIVILIAN');
-----------------------------------------------------------------------------------
-- Unit_BuildingPrereqs
-----------------------------------------------------------------------------------					
INSERT INTO Unit_BuildingPrereqs			
		(Unit,								PrereqBuilding)
VALUES	('UNIT_SUK_LAWSPEAKER',				'BUILDING_PALACE');
-----------------------------------------------------------------------------------
-- TypeTags
-----------------------------------------------------------------------------------
INSERT INTO TypeTags
			(Type,							Tag)
VALUES		('UNIT_SUK_LAWSPEAKER',			'CLASS_LANDCIVILIAN'),
			('UNIT_SUK_LAWSPEAKER',			'CLASS_SUK_LAWSPEAKER'),
			('ABILITY_SUK_LAWSPEAKER',		'CLASS_SUK_LAWSPEAKER');
-----------------------------------------------------------------------------------
-- Tags
-----------------------------------------------------------------------------------
INSERT INTO Tags
			(Tag,							Vocabulary)
VALUES		('CLASS_SUK_LAWSPEAKER',		'ABILITY_CLASS');
--==========================================================================================================================
-- Abilities
--==========================================================================================================================
-- Types
-----------------------------------------------------------------------------------	
INSERT INTO Types	
		(Type,									Kind)
VALUES	('ABILITY_SUK_LAWSPEAKER',				'KIND_ABILITY');
-------------------------------------
-- UnitAbilities
-------------------------------------					
INSERT INTO UnitAbilities			
		(UnitAbilityType,						Name,									Description)
VALUES	('ABILITY_SUK_LAWSPEAKER',				'LOC_UNIT_SUK_LAWSPEAKER_NAME',			'LOC_UNIT_SUK_LAWSPEAKER_DESCRIPTION');
-------------------------------------
-- UnitAbilityModifiers
-------------------------------------
INSERT INTO UnitAbilityModifiers			
		(UnitAbilityType,						ModifierId)
SELECT	'ABILITY_SUK_LAWSPEAKER',				'SUK_LAWSPEAKER_' || DistrictType
FROM Districts WHERE DistrictType IN ('DISTRICT_CAMPUS', 'DISTRICT_HOLY_SITE', 'DISTRICT_COMMERCIAL_HUB', 'DISTRICT_HARBOR', 'DISTRICT_THEATER', 'DISTRICT_INDUSTRIAL_ZONE');

INSERT INTO UnitAbilityModifiers	
		(UnitAbilityType,						ModifierId)
VALUES	('ABILITY_SUK_LAWSPEAKER',				'SUK_LAWSPEAKER_DISTRICT_SUK_TORFBAEIR_FOOD'),
		('ABILITY_SUK_LAWSPEAKER',				'SUK_LAWSPEAKER_DISTRICT_SUK_TORFBAEIR_PROD'),
		('ABILITY_SUK_LAWSPEAKER',				'SUK_LAWSPEAKER_CITY_CENTER_LOYALTY');

--==========================================================================================================================
-- MODIFIERS 
--==========================================================================================================================
-- Modifiers
-------------------------------------					
-- INSERT INTO Modifiers			
-- 		(ModifierId,																ModifierType,											OwnerRequirementSetId)
-- SELECT	'SUK_LAWSPEAKER_' || DistrictType || "_" || GreatPersonClassType,			'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS',			'SUK_LAWSPEAKER_ON_' || DistrictType
-- FROM District_GreatPersonPoints WHERE DistrictType NOT IN(SELECT CivUniqueDistrictType FROM DistrictReplaces);

INSERT INTO Modifiers			
		(ModifierId,								ModifierType,																SubjectRequirementSetId)
SELECT	'SUK_LAWSPEAKER_' || DistrictType,			'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',							'SUK_LAWSPEAKER_ON_' || DistrictType
FROM Districts WHERE DistrictType IN ('DISTRICT_CAMPUS', 'DISTRICT_HOLY_SITE', 'DISTRICT_COMMERCIAL_HUB', 'DISTRICT_HARBOR', 'DISTRICT_THEATER', 'DISTRICT_INDUSTRIAL_ZONE');

INSERT INTO Modifiers			
		(ModifierId,									ModifierType,												SubjectRequirementSetId)
VALUES	('SUK_LAWSPEAKER_DISTRICT_SUK_TORFBAEIR_FOOD',	'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',			'SUK_LAWSPEAKER_ON_DISTRICT_SUK_TORFBAEIR'),
		('SUK_LAWSPEAKER_DISTRICT_SUK_TORFBAEIR_PROD',	'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',			'SUK_LAWSPEAKER_ON_DISTRICT_SUK_TORFBAEIR');
-------------------------------------
-- ModifierArguments
-------------------------------------
-- INSERT INTO ModifierArguments
-- 		(ModifierId,																		Name,						Value)
-- SELECT	'SUK_LAWSPEAKER_' || DistrictType || "_" || GreatPersonClassType,					'GreatPersonClassType',		GreatPersonClassType
-- FROM District_GreatPersonPoints WHERE DistrictType NOT IN(SELECT CivUniqueDistrictType FROM DistrictReplaces);

-- INSERT INTO ModifierArguments
-- 		(ModifierId,																		Name,						Value)
-- SELECT	'SUK_LAWSPEAKER_' || DistrictType || "_" || GreatPersonClassType,					'Amount',					2
-- FROM District_GreatPersonPoints WHERE DistrictType NOT IN(SELECT CivUniqueDistrictType FROM DistrictReplaces);

INSERT INTO ModifierArguments
		(ModifierId,										Name,						Value)
VALUES	('SUK_LAWSPEAKER_DISTRICT_CAMPUS',					'YieldType',				'YIELD_SCIENCE'),
		('SUK_LAWSPEAKER_DISTRICT_HOLY_SITE',				'YieldType',				'YIELD_FAITH'),
		('SUK_LAWSPEAKER_DISTRICT_COMMERCIAL_HUB',			'YieldType',				'YIELD_GOLD'),
		('SUK_LAWSPEAKER_DISTRICT_HARBOR',					'YieldType',				'YIELD_GOLD'),
		('SUK_LAWSPEAKER_DISTRICT_THEATER',					'YieldType',				'YIELD_CULTURE'),
		('SUK_LAWSPEAKER_DISTRICT_INDUSTRIAL_ZONE',			'YieldType',				'YIELD_PRODUCTION'),

		('SUK_LAWSPEAKER_DISTRICT_SUK_TORFBAEIR_FOOD',		'YieldType',				'YIELD_FOOD'),
		('SUK_LAWSPEAKER_DISTRICT_SUK_TORFBAEIR_FOOD',		'Amount',					50),

		('SUK_LAWSPEAKER_DISTRICT_SUK_TORFBAEIR_PROD',		'YieldType',				'YIELD_PRODUCTION'),
		('SUK_LAWSPEAKER_DISTRICT_SUK_TORFBAEIR_PROD',		'Amount',					50);



INSERT INTO ModifierArguments
		(ModifierId,										Name,						Value)
SELECT	'SUK_LAWSPEAKER_' || DistrictType,					'Amount',					50
FROM Districts WHERE DistrictType IN ('DISTRICT_CAMPUS', 'DISTRICT_HOLY_SITE', 'DISTRICT_COMMERCIAL_HUB', 'DISTRICT_HARBOR', 'DISTRICT_THEATER', 'DISTRICT_INDUSTRIAL_ZONE');
--======================================================================================================================
-- Requirements
--==========================================================================================================================
-- RequirementSets
-------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId, 											RequirementSetType)
SELECT	'SUK_LAWSPEAKER_ON_' || DistrictType,						'REQUIREMENTSET_TEST_ALL'		
FROM Districts WHERE DistrictType IN ('DISTRICT_CAMPUS', 'DISTRICT_HOLY_SITE', 'DISTRICT_COMMERCIAL_HUB', 'DISTRICT_HARBOR', 'DISTRICT_THEATER', 'DISTRICT_INDUSTRIAL_ZONE', 'DISTRICT_SUK_TORFBAEIR');
-------------------------------------
-- RequirementSetRequirements
-------------------------------------	
INSERT INTO RequirementSetRequirements
		(RequirementSetId,											RequirementId)
SELECT	'SUK_LAWSPEAKER_ON_' || DistrictType,						'SUK_LAWSPEAKER_ON_' || DistrictType || '_REQUIREMENT'
FROM Districts WHERE DistrictType IN ('DISTRICT_CAMPUS', 'DISTRICT_HOLY_SITE', 'DISTRICT_COMMERCIAL_HUB', 'DISTRICT_HARBOR', 'DISTRICT_THEATER', 'DISTRICT_INDUSTRIAL_ZONE', 'DISTRICT_SUK_TORFBAEIR');

INSERT INTO RequirementSetRequirements
		(RequirementSetId,											RequirementId)
SELECT	'SUK_LAWSPEAKER_ON_' || DistrictType,						'SUK_LAWSPEAKER_IS_IN_CITY_REQUIREMENT'
FROM Districts WHERE DistrictType IN ('DISTRICT_CAMPUS', 'DISTRICT_HOLY_SITE', 'DISTRICT_COMMERCIAL_HUB', 'DISTRICT_HARBOR', 'DISTRICT_THEATER', 'DISTRICT_INDUSTRIAL_ZONE', 'DISTRICT_SUK_TORFBAEIR');
-------------------------------------
-- Requirements
-------------------------------------
INSERT INTO Requirements
		(RequirementId, 														RequirementType)
SELECT	'SUK_LAWSPEAKER_ON_' || DistrictType || '_REQUIREMENT',					'REQUIREMENT_PLOT_DISTRICT_TYPE_MATCHES'		
FROM Districts WHERE DistrictType IN ('DISTRICT_CAMPUS', 'DISTRICT_HOLY_SITE', 'DISTRICT_COMMERCIAL_HUB', 'DISTRICT_HARBOR', 'DISTRICT_THEATER', 'DISTRICT_INDUSTRIAL_ZONE', 'DISTRICT_SUK_TORFBAEIR');
-------------------------------------
-- RequirementArguments
-------------------------------------
INSERT INTO RequirementArguments
		(RequirementId, 													Name,					Value)
SELECT	'SUK_LAWSPEAKER_ON_' || DistrictType || '_REQUIREMENT', 			'DistrictType',			DistrictType
FROM Districts WHERE DistrictType IN ('DISTRICT_CAMPUS', 'DISTRICT_HOLY_SITE', 'DISTRICT_COMMERCIAL_HUB', 'DISTRICT_HARBOR', 'DISTRICT_THEATER', 'DISTRICT_INDUSTRIAL_ZONE', 'DISTRICT_SUK_TORFBAEIR');
--==========================================================================================================================
-- MODIFIERS 
--==========================================================================================================================
-- Modifiers
-------------------------------------
INSERT INTO Modifiers	
		(ModifierId,								ModifierType,											SubjectRequirementSetId)
VALUES	('SUK_LAWSPEAKER_CITY_CENTER_LOYALTY',		'MODIFIER_PLAYER_CITIES_ADJUST_IDENTITY_PER_TURN',		'SUK_LAWSPEAKER_IS_IN_CITY');
-------------------------------------
-- ModifierArguments
-------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,								Name,							Value)
VALUES	('SUK_LAWSPEAKER_CITY_CENTER_LOYALTY',		'Amount',						3);	
--======================================================================================================================
-- Requirements
--==========================================================================================================================
-- RequirementSets
-------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,									RequirementSetType)
VALUES	('SUK_LAWSPEAKER_IS_IN_CITY',						'REQUIREMENTSET_TEST_ALL');	
-------------------------------------
-- RequirementSetRequirements
-------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,									RequirementId)
VALUES	('SUK_LAWSPEAKER_IS_IN_CITY',						'SUK_LAWSPEAKER_IS_IN_CITY_REQUIREMENT');
-------------------------------------
-- Requirements
-------------------------------------
INSERT INTO Requirements
		(RequirementId, 										RequirementType)
VALUES	('SUK_LAWSPEAKER_IS_IN_CITY_REQUIREMENT',				'REQUIREMENT_PLOT_ADJACENT_TO_OWNER');
-------------------------------------
-- RequirementArguments
-------------------------------------
INSERT INTO RequirementArguments
		(RequirementId, 										Name,						Value)
VALUES	('SUK_LAWSPEAKER_IS_IN_CITY_REQUIREMENT', 				'MinDistance',				0),
		('SUK_LAWSPEAKER_IS_IN_CITY_REQUIREMENT', 				'MaxDistance',				0);
-------------------------------------
-- MomentIllustrations
-------------------------------------
INSERT INTO MomentIllustrations
		(MomentIllustrationType, 					MomentDataType,				GameDataType,				Texture)
VALUES	('MOMENT_ILLUSTRATION_UNIQUE_UNIT', 		'MOMENT_DATA_UNIT',			'UNIT_SUK_LAWSPEAKER',		'Moment_UniqueUnit_Suk_Iceland.dds');
--==========================================================================================================================
--==========================================================================================================================