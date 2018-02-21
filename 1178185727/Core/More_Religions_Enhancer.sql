--===========================
--REQUIREMENTS
--===========================
INSERT INTO Requirements (RequirementId, RequirementType) VALUES ('P_REQUIRES_RELIGIOUS_UNIT', 'REQUIREMENT_UNIT_TAG_MATCHES') ;
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES ('P_REQUIRES_RELIGIOUS_UNIT', 'Tag', 'P_CLASS_RELIGIOUS') ;
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('P_RELIGIOUS_UNIT', 'REQUIREMENTSET_TEST_ALL') ;
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('P_RELIGIOUS_UNIT', 'P_REQUIRES_RELIGIOUS_UNIT') ;

INSERT INTO Types (Type, Kind) VALUES ('P_MODIFIER_PLAYER_UNITS_ADJUST_SIGHT_2', 'KIND_MODIFIER') ;
INSERT INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('P_MODIFIER_PLAYER_UNITS_ADJUST_SIGHT_2', 'COLLECTION_PLAYER_UNITS', 'EFFECT_ADJUST_UNIT_SIGHT') ;

--====
--TAGS
--====
INSERT INTO Tags (Tag, Vocabulary)
	VALUES
		('P_CLASS_RELIGIOUS', 'ABILITY_CLASS'),
		('P_CLASS_SETTLER_RELIGIOUS', 'ABILITY_CLASS');

--=========
--TYPE TAGS
--=========
INSERT INTO TypeTags (Type, Tag)
	VALUES
		('UNIT_APOSTLE', 'P_CLASS_RELIGIOUS'),
		('UNIT_MISSIONARY', 'P_CLASS_RELIGIOUS'),
		('UNIT_INQUISITOR', 'P_CLASS_RELIGIOUS'),
		('UNIT_GURU', 'P_CLASS_RELIGIOUS'),
		('UNIT_SETTLER', 'P_CLASS_SETTLER_RELIGIOUS');

--=====
--TYPES
--=====
INSERT INTO Types (Type, Kind)
	VALUES
		('P_BELIEF_DIVINE_MESSENGERS', 'KIND_BELIEF'),
		('P_BELIEF_RELIGIOUS_ESPIONAGE', 'KIND_BELIEF'),
		('P_BELIEF_EPISTLES', 'KIND_BELIEF'),
		('P_BELIEF_VISIONS', 'KIND_BELIEF'),
		('P_BELIEF_WITCH_TRIALS', 'KIND_BELIEF'),
		('P_BELIEF_VICARIATES', 'KIND_BELIEF'),
		('P_BELIEF_BY_THE_SWORD', 'KIND_BELIEF'),
		('P_MODIFIER_PLAYER_UNITS_ADJUST_SPREAD_CHARGES', 'KIND_MODIFIER'),
		('P_MODIFIER_PLAYER_DISTRICTS_CREATE_UNIT', 'KIND_MODIFIER'),
		('POK_MODIFIER_PLAYER_UNITS_ADJUST_CITY_ON_CAPTURE', 'KIND_MODIFIER');

--=================
--DYNAMIC MODIFIERS
--=================
INSERT INTO DynamicModifiers (ModifierType, CollectionType, EffectType)
	VALUES
		('P_MODIFIER_PLAYER_UNITS_ADJUST_SPREAD_CHARGES', 'COLLECTION_PLAYER_UNITS', 'EFFECT_ADJUST_UNIT_SPREAD_CHARGES'),
		('POK_MODIFIER_PLAYER_UNITS_ADJUST_CITY_ON_CAPTURE', 'COLLECTION_PLAYER_UNITS', 'EFFECT_ADJUST_CITY_RELIGION_ON_CAPTURE');


--=======
--BELIEFS
--=======
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	VALUES
		('P_BELIEF_DIVINE_MESSENGERS', 'LOC_P_BELIEF_DIVINE_MESSENGERS_NAME', 'LOC_P_BELIEF_DIVINE_MESSENGERS_DESCRIPTION', 'BELIEF_CLASS_ENHANCER'),
		('P_BELIEF_EPISTLES', 'LOC_P_BELIEF_EPISTLES_NAME', 'LOC_P_BELIEF_EPISTLES_DESCRIPTION', 'BELIEF_CLASS_ENHANCER'),
		('P_BELIEF_VISIONS', 'LOC_P_BELIEF_VISIONS_NAME', 'LOC_P_BELIEF_VISIONS_DESCRIPTION', 'BELIEF_CLASS_ENHANCER'),
		('P_BELIEF_WITCH_TRIALS', 'LOC_P_BELIEF_WITCH_TRIALS_NAME', 'LOC_P_BELIEF_WITCH_TRIALS_DESCRIPTION', 'BELIEF_CLASS_ENHANCER'),
		('P_BELIEF_VICARIATES', 'LOC_P_BELIEF_VICARIATES_NAME', 'LOC_P_BELIEF_VICARIATES_DESCRIPTION', 'BELIEF_CLASS_ENHANCER'),
		('P_BELIEF_RELIGIOUS_ESPIONAGE', 'LOC_P_BELIEF_RELIGIOUS_ESPIONAGE_NAME', 'LOC_P_BELIEF_RELIGIOUS_ESPIONAGE_DESCRIPTION', 'BELIEF_CLASS_ENHANCER'),
		('P_BELIEF_BY_THE_SWORD', 'LOC_P_BELIEF_BY_THE_SWORD_NAME', 'LOC_P_BELIEF_BY_THE_SWORD_DESCRIPTION', 'BELIEF_CLASS_ENHANCER');


--===============
--BELIEF MODIFIERS
--===============
INSERT INTO BeliefModifiers (BeliefType, ModifierId) 
	VALUES
		('P_BELIEF_DIVINE_MESSENGERS', 'P_BELIEF_DIVINE_MESSENGERS_EXTRA_APOSTLE'),
		('P_BELIEF_EPISTLES', 'P_BELIEF_EPISTLES_CHARGES'),
		('P_BELIEF_VISIONS', 'P_BELIEF_VISIONS_UNIT_SIGHT'),
		('P_BELIEF_WITCH_TRIALS', 'P_BELIEF_WITCH_TRIALS_INQUISITOR_DISCOUNT'),
		('P_BELIEF_WITCH_TRIALS', 'P_BELIEF_WITCH_TRIALS_GURU_DISCOUNT'),
		('P_BELIEF_BY_THE_SWORD', 'P_BELIEF_BY_THE_SWORD_CITY_CONVERT'),
		('P_BELIEF_RELIGIOUS_ESPIONAGE', 'P_BELIEF_RELIGIOUS_ESPIONAGE_SCIENTIST'),
		('P_BELIEF_VICARIATES', 'P_BELIEF_VICARIATES_ENGINEER');

--===============
--MODIFIERS
--===============
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
	VALUES
		('P_BELIEF_DIVINE_MESSENGERS_EXTRA_APOSTLE', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_FOUNDED_RELIGION_REQUIREMENTS'),
		('P_BELIEF_DIVINE_MESSENGERS_EXTRA_APOSTLE_MODIFIER', 'MODIFIER_PLAYER_DISTRICT_CREATE_UNIT', NULL),
		('P_BELIEF_RELIGIOUS_ESPIONAGE_SCIENTIST', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_FOUNDED_RELIGION_REQUIREMENTS'),
		('P_BELIEF_RELIGIOUS_ESPIONAGE_SCIENTIST_MODIFIER', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_GREAT_PERSON_POINTS', 'DISTRICT_IS_HOLY_SITE'),
		('P_BELIEF_EPISTLES_CHARGES', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_FOUNDED_RELIGION_REQUIREMENTS'),
		('P_BELIEF_EPISTLES_CHARGES_MODIFIER', 'P_MODIFIER_PLAYER_UNITS_ADJUST_SPREAD_CHARGES', 'MOSQUE_RELIGIOUS_UNIT'),
		('P_BELIEF_VISIONS_UNIT_SIGHT', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_FOUNDED_RELIGION_REQUIREMENTS'),
		('P_BELIEF_VISIONS_UNIT_SIGHT_MODIFIER', 'P_MODIFIER_PLAYER_UNITS_ADJUST_SIGHT_2', 'P_RELIGIOUS_UNIT'),
		('P_BELIEF_WITCH_TRIALS_INQUISITOR_DISCOUNT', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_FOUNDED_RELIGION_REQUIREMENTS'),
		('P_BELIEF_WITCH_TRIALS_INQUISITOR_DISCOUNT_MODIFIER', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST', NULL),
		('P_BELIEF_WITCH_TRIALS_GURU_DISCOUNT', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_FOUNDED_RELIGION_REQUIREMENTS'),
		('P_BELIEF_WITCH_TRIALS_GURU_DISCOUNT_MODIFIER', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST', NULL),

		('P_BELIEF_BY_THE_SWORD_CITY_CONVERT', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_FOUNDED_RELIGION_REQUIREMENTS'),		
		('P_BELIEF_BY_THE_SWORD_CITY_CONVERT_MODIFIER', 'POK_MODIFIER_PLAYER_UNITS_ADJUST_CITY_ON_CAPTURE', NULL),	
		('P_BELIEF_VICARIATES_ENGINEER', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_FOUNDED_RELIGION_REQUIREMENTS'),
		('P_BELIEF_VICARIATES_ENGINEER_MODIFIER', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_GREAT_PERSON_POINTS', 'DISTRICT_IS_HOLY_SITE');

--==================
--MODIFIER ARGUMENTS
--==================
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	VALUES
		('P_BELIEF_DIVINE_MESSENGERS_EXTRA_APOSTLE', 'ModifierId', 'P_BELIEF_DIVINE_MESSENGERS_EXTRA_APOSTLE_MODIFIER'),
		('P_BELIEF_DIVINE_MESSENGERS_EXTRA_APOSTLE_MODIFIER', 'UnitType', 'UNIT_APOSTLE'),
		('P_BELIEF_DIVINE_MESSENGERS_EXTRA_APOSTLE_MODIFIER', 'DistrictType', 'DISTRICT_HOLY_SITE'),
		('P_BELIEF_EPISTLES_CHARGES', 'ModifierId', 'P_BELIEF_EPISTLES_CHARGES_MODIFIER'),
		('P_BELIEF_EPISTLES_CHARGES_MODIFIER', 'Amount', '1'),
		('P_BELIEF_VISIONS_UNIT_SIGHT', 'ModifierId', 'P_BELIEF_VISIONS_UNIT_SIGHT_MODIFIER'),
		('P_BELIEF_VISIONS_UNIT_SIGHT_MODIFIER', 'Amount', '2'),
		('P_BELIEF_WITCH_TRIALS_INQUISITOR_DISCOUNT', 'ModifierId', 'P_BELIEF_WITCH_TRIALS_INQUISITOR_DISCOUNT_MODIFIER'),
		('P_BELIEF_WITCH_TRIALS_INQUISITOR_DISCOUNT_MODIFIER', 'UnitType', 'UNIT_INQUISITOR'),
		('P_BELIEF_WITCH_TRIALS_INQUISITOR_DISCOUNT_MODIFIER', 'Amount', '50'),
		('P_BELIEF_WITCH_TRIALS_GURU_DISCOUNT', 'ModifierId', 'P_BELIEF_WITCH_TRIALS_GURU_DISCOUNT_MODIFIER'),
		('P_BELIEF_WITCH_TRIALS_GURU_DISCOUNT_MODIFIER', 'UnitType', 'UNIT_GURU'),
		('P_BELIEF_WITCH_TRIALS_GURU_DISCOUNT_MODIFIER', 'Amount', '50'),
		
		('P_BELIEF_BY_THE_SWORD_CITY_CONVERT', 'ModifierId', 'P_BELIEF_BY_THE_SWORD_CITY_CONVERT_MODIFIER'),
		('P_BELIEF_BY_THE_SWORD_CITY_CONVERT_MODIFIER', 'Enable', '1'),
		('P_BELIEF_VICARIATES_ENGINEER', 'ModifierId', 'P_BELIEF_VICARIATES_ENGINEER_MODIFIER'),
		('P_BELIEF_VICARIATES_ENGINEER_MODIFIER', 'GreatPersonClassType', 'GREAT_PERSON_CLASS_GENERAL'),
		('P_BELIEF_VICARIATES_ENGINEER_MODIFIER', 'Amount', '2'),
		('P_BELIEF_RELIGIOUS_ESPIONAGE_SCIENTIST', 'ModifierId', 'P_BELIEF_RELIGIOUS_ESPIONAGE_SCIENTIST_MODIFIER'),
		('P_BELIEF_RELIGIOUS_ESPIONAGE_SCIENTIST_MODIFIER', 'GreatPersonClassType', 'GREAT_PERSON_CLASS_ADMIRAL'),
		('P_BELIEF_RELIGIOUS_ESPIONAGE_SCIENTIST_MODIFIER', 'Amount', '2');