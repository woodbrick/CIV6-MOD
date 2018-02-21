-- Unit Ability's - Includes Automatic Guns created by Laurana Kanan

-----------------------------------------------
-- Tags
-----------------------------------------------

INSERT INTO Tags
		(Tag,								Vocabulary)
VALUES	('CLASS_NAVAL_BOMBARD',				'ABILITY_CLASS'),
		('CLASS_MARINE',					'ABILITY_CLASS'),
		('CLASS_LK_AUTOMATIC_GUN_CAV',		'ABILITY_CLASS'),
		('CLASS_LK_AUTOMATIC_GUN_ANTICAV',	'ABILITY_CLASS'),
		('CLASS_LK_AUTOMATIC_GUN_MELEE',	'ABILITY_CLASS');

-----------------------------------------------
-- Types
-----------------------------------------------

INSERT INTO Types
		(Type,											Kind)
VALUES	('ABILITY_NAVAL_BOMBARD',						'KIND_ABILITY'),
		('ABILITY_MARINE',								'KIND_ABILITY'),
		('ABILITY_LK_AUTOMATIC_GUN_CAV', 				'KIND_ABILITY'),
		('ABILITY_LK_AUTOMATIC_GUN_ANTICAV', 			'KIND_ABILITY'),
		('ABILITY_LK_AUTOMATIC_GUN_MELEE', 				'KIND_ABILITY'),
		('MODTYPE_LK_AUTOMATIC_GUN_ADJUST_STRENGTH',	'KIND_MODIFIER'),
		('MODTYPE_LK_AUTOMATIC_GUN_ATTACH_MODIFIER',	'KIND_MODIFIER');

-----------------------------------------------
-- TypeTags
-----------------------------------------------		

INSERT INTO TypeTags
		(Type,									Tag)
VALUES	('ABILITY_NAVAL_BOMBARD',				'CLASS_NAVAL_BOMBARD'),
		('ABILITY_MARINE',						'CLASS_MARINE'),
		('ABILITY_LK_AUTOMATIC_GUN_CAV',		'CLASS_LK_AUTOMATIC_GUN_CAV'),
		('ABILITY_LK_AUTOMATIC_GUN_ANTICAV', 	'CLASS_LK_AUTOMATIC_GUN_ANTICAV'),
		('ABILITY_LK_AUTOMATIC_GUN_MELEE', 		'CLASS_LK_AUTOMATIC_GUN_MELEE');

INSERT INTO TypeTags (Type,		Tag)
SELECT 	UnitType,	'CLASS_LK_AUTOMATIC_GUN_CAV'
FROM 	Units
WHERE	PromotionClass IN ('PROMOTION_CLASS_LIGHT_CAVALRY', 'PROMOTION_CLASS_HEAVY_CAVALRY');

INSERT INTO TypeTags (Type,		Tag)
SELECT 	UnitType,	'CLASS_LK_AUTOMATIC_GUN_ANTICAV'
FROM 	Units
WHERE	PromotionClass = 'PROMOTION_CLASS_ANTI_CAVALRY';

INSERT INTO TypeTags (Type,		Tag)
SELECT 	UnitType,	'CLASS_LK_AUTOMATIC_GUN_MELEE'
FROM 	Units
WHERE	PromotionClass = 'PROMOTION_CLASS_MELEE';

-----------------------------------------------
-- UnitAbilities
-----------------------------------------------

INSERT INTO UnitAbilities
		(UnitAbilityType,						Name,									Description)
VALUES	('ABILITY_NAVAL_BOMBARD',				'LOC_ABILITY_NAVAL_BOMBARD_NAME',		'LOC_ABILITY_NAVAL_BOMBARD_DESCRIPTION'),
		('ABILITY_MARINE',						'LOC_ABILITY_MARINE_NAME',				'LOC_ABILITY_MARINE_DESCRIPTION'),
		('ABILITY_LK_AUTOMATIC_GUN_CAV', 		'LOC_ABILITY_LK_AUTOMATIC_GUN_NAME', 	'LOC_ABILITY_LK_AUTOMATIC_GUN_DESCRIPTION'),
		('ABILITY_LK_AUTOMATIC_GUN_ANTICAV', 	'LOC_ABILITY_LK_AUTOMATIC_GUN_NAME', 	'LOC_ABILITY_LK_AUTOMATIC_GUN_DESCRIPTION'),
		('ABILITY_LK_AUTOMATIC_GUN_MELEE', 		'LOC_ABILITY_LK_AUTOMATIC_GUN_NAME', 	'LOC_ABILITY_LK_AUTOMATIC_GUN_DESCRIPTION');

-----------------------------------------------
-- UnitAbilityModifiers
-----------------------------------------------
		
INSERT INTO UnitAbilityModifiers
		(UnitAbilityType,						ModifierId)
VALUES	('ABILITY_NAVAL_BOMBARD',				'ADJUST_NAVAL_BOMBARD'),
		('ABILITY_MARINE',						'AMPHIBIOUS_BONUS_IGNORE_RIVERS'),
		('ABILITY_MARINE',						'AMPHIBIOUS_BONUS_IGNORE_SHORES'),
		('ABILITY_MARINE',						'AMPHIBIOUS_ASSAULT'),
		('ABILITY_LK_AUTOMATIC_GUN_CAV', 		'MODIFIER_LK_AUTOMATIC_GUN_CAV'),
		('ABILITY_LK_AUTOMATIC_GUN_ANTICAV', 	'MODIFIER_LK_AUTOMATIC_GUN_ANTICAV'),
		('ABILITY_LK_AUTOMATIC_GUN_MELEE', 		'MODIFIER_LK_AUTOMATIC_GUN_MELEE');

-----------------------------------------------
-- DynamicModifiers
-----------------------------------------------

INSERT INTO	DynamicModifiers
		(ModifierType,									CollectionType,				EffectType)
VALUES	('MODTYPE_LK_AUTOMATIC_GUN_ADJUST_STRENGTH',	'COLLECTION_UNIT_COMBAT', 	'EFFECT_ADJUST_PLAYER_STRENGTH_MODIFIER'),
		('MODTYPE_LK_AUTOMATIC_GUN_ATTACH_MODIFIER',	'COLLECTION_PLAYER_UNITS', 	'EFFECT_ATTACH_MODIFIER');

-----------------------------------------------
-- Modifiers
-----------------------------------------------

INSERT INTO Modifiers
		(ModifierId,				ModifierType)
VALUES	('ADJUST_NAVAL_BOMBARD',	'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH');

INSERT INTO Modifiers
		(ModifierId,							ModifierType,								SubjectRequirementSetId)
VALUES	('AMPHIBIOUS_ASSAULT',					'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',		'MARINE_PLOT_IS_COAST_REQUIREMENT'),
		('MODIFIER_LK_AUTOMATIC_GUN_CAV', 		'MODTYPE_LK_AUTOMATIC_GUN_ADJUST_STRENGTH',	'REQSET_LK_AUTOMATIC_GUN_ADJ_CAV'),
		('MODIFIER_LK_AUTOMATIC_GUN_ANTICAV', 	'MODTYPE_LK_AUTOMATIC_GUN_ADJUST_STRENGTH',	'REQSET_LK_AUTOMATIC_GUN_ADJ_ANTICAV'),
		('MODIFIER_LK_AUTOMATIC_GUN_MELEE', 	'MODTYPE_LK_AUTOMATIC_GUN_ADJUST_STRENGTH',	'REQSET_LK_AUTOMATIC_GUN_ADJ_MELEE');

-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
		
INSERT INTO ModifierArguments
		(ModifierId,							Name,		Value)
VALUES	('ADJUST_NAVAL_BOMBARD',				'Amount',	17),
		('AMPHIBIOUS_ASSAULT',					'Amount',	15),
		('MODIFIER_LK_AUTOMATIC_GUN_CAV', 		'Amount', 	4),
		('MODIFIER_LK_AUTOMATIC_GUN_ANTICAV', 	'Amount', 	4),
		('MODIFIER_LK_AUTOMATIC_GUN_MELEE', 	'Amount', 	2);

-----------------------------------------------
-- RequirementSetRequirements
-----------------------------------------------

INSERT INTO RequirementSetRequirements
		(RequirementSetId,						RequirementId)
VALUES	('MARINE_PLOT_IS_COAST_REQUIREMENT',	'REQUIRES_UNIT_ON_COASTAL_LAND'),
		('REQSET_LK_AUTOMATIC_GUN_ADJ_CAV', 	'REQ_LK_AUTOMATIC_GUN_ADJACENT'), 
		('REQSET_LK_AUTOMATIC_GUN_ADJ_CAV', 	'REQ_LK_AUTOMATIC_GUN_ATTACKING'),
		('REQSET_LK_AUTOMATIC_GUN_ADJ_ANTICAV', 'REQ_LK_AUTOMATIC_GUN_ADJACENT'),
		('REQSET_LK_AUTOMATIC_GUN_ADJ_ANTICAV', 'REQ_LK_AUTOMATIC_GUN_DEFENDING'),
		('REQSET_LK_AUTOMATIC_GUN_ADJ_MELEE', 	'REQ_LK_AUTOMATIC_GUN_ADJACENT');

-----------------------------------------------
-- RequirementSets
-----------------------------------------------
		
INSERT INTO RequirementSets
		(RequirementSetId,						RequirementSetType)
VALUES	('MARINE_PLOT_IS_COAST_REQUIREMENT',	'REQUIREMENTSET_TEST_ANY'),
		('REQSET_LK_AUTOMATIC_GUN_ADJ_CAV', 	'REQUIREMENTSET_TEST_ALL'),
		('REQSET_LK_AUTOMATIC_GUN_ADJ_ANTICAV', 'REQUIREMENTSET_TEST_ALL'),
		('REQSET_LK_AUTOMATIC_GUN_ADJ_MELEE', 	'REQUIREMENTSET_TEST_ALL');

-----------------------------------------------
-- Requirements
-----------------------------------------------

INSERT INTO Requirements
		(RequirementId, 					RequirementType, 										Inverse)
VALUES	('REQ_LK_AUTOMATIC_GUN_ADJACENT', 	'REQUIREMENT_PLOT_ADJACENT_FRIENDLY_UNIT_TAG_MATCHES',	0),
		('REQ_LK_AUTOMATIC_GUN_ATTACKING', 	'REQUIREMENT_PLAYER_IS_ATTACKING',						0),
		('REQ_LK_AUTOMATIC_GUN_DEFENDING', 	'REQUIREMENT_PLAYER_IS_ATTACKING',						1);

-----------------------------------------------
-- RequirementArguments
-----------------------------------------------

INSERT INTO RequirementArguments
		(RequirementId, 					Name,	Value)
VALUES	('REQ_LK_AUTOMATIC_GUN_ADJACENT', 	'Tag',	'CLASS_AUTOMATIC_GUN');

-----------------------------------------------
-- ModifierStrings
-----------------------------------------------

INSERT INTO ModifierStrings
		(ModifierId,							Context,	Text)
VALUES	('ADJUST_NAVAL_BOMBARD',				'Preview',	'LOC_ABILITY_NAVAL_BOMBARD_COMBAT_MODIFIER_DESCRIPTION'),
		('AMPHIBIOUS_ASSAULT',					'Preview',	'LOC_ABILITY_AMPHIBIOUS_ASSAULT_COMBAT_MODIFIER_DESCRIPTION'),
		('MODIFIER_LK_AUTOMATIC_GUN_CAV', 		'Preview', 	'LOC_MODIFIER_LK_AUTOMATIC_GUN_CAV_DESCRIPTION'),
		('MODIFIER_LK_AUTOMATIC_GUN_ANTICAV', 	'Preview', 	'LOC_MODIFIER_LK_AUTOMATIC_GUN_ANTICAV_DESCRIPTION'),
		('MODIFIER_LK_AUTOMATIC_GUN_MELEE', 	'Preview', 	'LOC_MODIFIER_LK_AUTOMATIC_GUN_MELEE_DESCRIPTION');