-- Unit Types
INSERT INTO Types
		(Type,						Kind)
VALUES	('UNIT_MOTORISED_INFANTRY',	'KIND_UNIT'),
		('UNIT_COMPOSITE_BOWMAN',	'KIND_UNIT'),
		('UNIT_CULVERIN',			'KIND_UNIT'),
		('UNIT_FIELD_GUN',			'KIND_UNIT'),
		('UNIT_ASSAULT_GUN',		'KIND_UNIT'),
		('UNIT_SP_GUN',				'KIND_UNIT'),
		('UNIT_HEAVY_INFANTRY',		'KIND_UNIT'),
		('UNIT_TANK_DESTROYER',		'KIND_UNIT'),
		('UNIT_LANCER',				'KIND_UNIT'),
		('UNIT_ARMORED_CAVALRY',	'KIND_UNIT'),
		('UNIT_GUNSHIP',			'KIND_UNIT'),
		('UNIT_ARMORED_HORSEMAN',	'KIND_UNIT'),
		('UNIT_REITER',				'KIND_UNIT'),
		('UNIT_LANDSHIP',			'KIND_UNIT'),
		('UNIT_WW1_BOMBER',			'KIND_UNIT'),
		('UNIT_STEALTH_BOMBER',		'KIND_UNIT'),
		('UNIT_STEALTH_FIGHTER',	'KIND_UNIT'),
		('UNIT_WW1_GROUND_ATTACK',	'KIND_UNIT'),
		('UNIT_GROUND_ATTACK',		'KIND_UNIT'),
		('UNIT_JET_GROUND_ATTACK',	'KIND_UNIT'),
		('UNIT_STEALTH_ATTACK',		'KIND_UNIT'),
		('UNIT_CORVETTE',			'KIND_UNIT'),
		('UNIT_MISSILE_DESTROYER',	'KIND_UNIT'),
		('UNIT_SUPERCARRIER',		'KIND_UNIT'),
		('UNIT_GALLEASS',			'KIND_UNIT'),
		('UNIT_ARMORED_CRUISER',	'KIND_UNIT'),
		('UNIT_BATTLECRUISER',		'KIND_UNIT'),
		('UNIT_GALLEON',			'KIND_UNIT'),
		('UNIT_SHIP_OF_THE_LINE',	'KIND_UNIT'),
		('UNIT_PRE_DREADNOUGHT',	'KIND_UNIT'),
		('UNIT_ATTACK_SUBMARINE',	'KIND_UNIT'),
		('UNIT_INDUSTRIAL_MARINE',	'KIND_UNIT'),
		('UNIT_WW2_MARINE',			'KIND_UNIT'),
		('UNIT_MODERN_MARINE',		'KIND_UNIT'),
		('UNIT_FIELD_HOWITZER',		'KIND_UNIT'),
		('UNIT_SP_HVY_ATILLERY',	'KIND_UNIT');
		
-- Unit AI Infos
INSERT INTO UnitAIInfos
		(UnitType,					AiType)
VALUES	('UNIT_MOTORISED_INFANTRY',	'UNITAI_COMBAT'),
		('UNIT_MOTORISED_INFANTRY',	'UNITAI_EXPLORE'),
		('UNIT_MOTORISED_INFANTRY',	'UNITTYPE_MELEE'),
		('UNIT_MOTORISED_INFANTRY',	'UNITTYPE_LAND_COMBAT'),
		('UNIT_COMPOSITE_BOWMAN',	'UNITAI_COMBAT'),
		('UNIT_COMPOSITE_BOWMAN',	'UNITTYPE_RANGED'),
		('UNIT_COMPOSITE_BOWMAN',	'UNITTYPE_LAND_COMBAT'),
		('UNIT_CULVERIN',			'UNITAI_COMBAT'),
		('UNIT_CULVERIN',			'UNITTYPE_RANGED'),
		('UNIT_CULVERIN',			'UNITTYPE_LAND_COMBAT'),
		('UNIT_FIELD_GUN',			'UNITAI_COMBAT'),
		('UNIT_FIELD_GUN',			'UNITTYPE_RANGED'),
		('UNIT_FIELD_GUN',			'UNITTYPE_LAND_COMBAT'),
		('UNIT_ASSAULT_GUN',		'UNITAI_COMBAT'),
		('UNIT_ASSAULT_GUN',		'UNITTYPE_RANGED'),
		('UNIT_ASSAULT_GUN',		'UNITTYPE_LAND_COMBAT'),
		('UNIT_SP_GUN',				'UNITAI_COMBAT'),
		('UNIT_SP_GUN',				'UNITTYPE_RANGED'),
		('UNIT_SP_GUN',				'UNITTYPE_LAND_COMBAT'),
		('UNIT_HEAVY_INFANTRY',		'UNITAI_COMBAT'),
		('UNIT_HEAVY_INFANTRY',		'UNITAI_EXPLORE'),
		('UNIT_HEAVY_INFANTRY',		'UNITTYPE_MELEE'),
		('UNIT_HEAVY_INFANTRY',		'UNITTYPE_LAND_COMBAT'),
		('UNIT_TANK_DESTROYER',		'UNITAI_COMBAT'),
		('UNIT_TANK_DESTROYER',		'UNITAI_EXPLORE'),
		('UNIT_TANK_DESTROYER',		'UNITTYPE_MELEE'),
		('UNIT_TANK_DESTROYER',		'UNITTYPE_LAND_COMBAT'),
		('UNIT_LANCER',				'UNITAI_COMBAT'),
		('UNIT_LANCER',				'UNITAI_EXPLORE'),
		('UNIT_LANCER',				'UNITTYPE_CAVALRY'),
		('UNIT_LANCER',				'UNITTYPE_MELEE'),
		('UNIT_LANCER',				'UNITTYPE_LAND_COMBAT'),
		('UNIT_ARMORED_CAVALRY',	'UNITAI_COMBAT'),
		('UNIT_ARMORED_CAVALRY',	'UNITAI_EXPLORE'),
		('UNIT_ARMORED_CAVALRY',	'UNITTYPE_CAVALRY'),
		('UNIT_ARMORED_CAVALRY',	'UNITTYPE_MELEE'),
		('UNIT_ARMORED_CAVALRY',	'UNITTYPE_LAND_COMBAT'),
		('UNIT_GUNSHIP',			'UNITAI_COMBAT'),
		('UNIT_GUNSHIP',			'UNITAI_EXPLORE'),
		('UNIT_GUNSHIP',			'UNITTYPE_CAVALRY'),
		('UNIT_GUNSHIP',			'UNITTYPE_MELEE'),
		('UNIT_GUNSHIP',			'UNITTYPE_LAND_COMBAT'),
		('UNIT_ARMORED_HORSEMAN',	'UNITAI_COMBAT'),
		('UNIT_ARMORED_HORSEMAN',	'UNITTYPE_MELEE'),
		('UNIT_ARMORED_HORSEMAN',	'UNITTYPE_CAVALRY'),
		('UNIT_ARMORED_HORSEMAN',	'UNITTYPE_LAND_COMBAT'),
		('UNIT_REITER',				'UNITAI_COMBAT'),
		('UNIT_REITER',				'UNITTYPE_MELEE'),
		('UNIT_REITER',				'UNITTYPE_CAVALRY'),
		('UNIT_REITER',				'UNITTYPE_LAND_COMBAT'),
		('UNIT_LANDSHIP',			'UNITAI_COMBAT'),
		('UNIT_LANDSHIP',			'UNITTYPE_MELEE'),
		('UNIT_LANDSHIP',			'UNITTYPE_CAVALRY'),
		('UNIT_LANDSHIP',			'UNITTYPE_LAND_COMBAT'),
		('UNIT_WW1_BOMBER',			'UNITAI_COMBAT'),
		('UNIT_WW1_BOMBER',			'UNITTYPE_AIR_SIEGE'),
		('UNIT_STEALTH_BOMBER',		'UNITAI_COMBAT'),
		('UNIT_STEALTH_BOMBER',		'UNITTYPE_NUCLEAR'),
		('UNIT_STEALTH_BOMBER',		'UNITTYPE_AIR_SIEGE'),
		('UNIT_STEALTH_FIGHTER',	'UNITAI_COMBAT'),
		('UNIT_STEALTH_FIGHTER',	'UNITTYPE_AIR'),
		('UNIT_WW1_GROUND_ATTACK',	'UNITAI_COMBAT'),
		('UNIT_WW1_GROUND_ATTACK',	'UNITTYPE_AIR'),
		('UNIT_WW1_GROUND_ATTACK',	'UNITTYPE_AIR_SIEGE'),
		('UNIT_GROUND_ATTACK',		'UNITAI_COMBAT'),
		('UNIT_GROUND_ATTACK',		'UNITTYPE_AIR'),
		('UNIT_GROUND_ATTACK',		'UNITTYPE_AIR_SIEGE'),
		('UNIT_JET_GROUND_ATTACK',	'UNITAI_COMBAT'),
		('UNIT_JET_GROUND_ATTACK',	'UNITTYPE_AIR'),
		('UNIT_JET_GROUND_ATTACK',	'UNITTYPE_AIR_SIEGE'),
		('UNIT_STEALTH_ATTACK',		'UNITAI_COMBAT'),
		('UNIT_STEALTH_ATTACK',		'UNITTYPE_AIR'),
		('UNIT_STEALTH_ATTACK',		'UNITTYPE_AIR_SIEGE'),
		('UNIT_CORVETTE',	   		'UNITAI_COMBAT'),
		('UNIT_CORVETTE',	   		'UNITAI_EXPLORE'),
		('UNIT_CORVETTE', 	   		'UNITTYPE_MELEE'),
		('UNIT_CORVETTE',	   		'UNITTYPE_NAVAL'),
		('UNIT_MISSILE_DESTROYER',	'UNITAI_COMBAT'),
		('UNIT_MISSILE_DESTROYER',	'UNITAI_EXPLORE'),
		('UNIT_MISSILE_DESTROYER',	'UNITTYPE_MELEE'),
		('UNIT_MISSILE_DESTROYER',	'UNITTYPE_NAVAL'),
		('UNIT_SUPERCARRIER',		'UNITAI_COMBAT'),
		('UNIT_SUPERCARRIER',		'UNITTYPE_NAVAL'),
		('UNIT_GALLEASS',			'UNITAI_COMBAT'),
		('UNIT_GALLEASS',			'UNITTYPE_RANGED'),
		('UNIT_GALLEASS',			'UNITTYPE_NAVAL'),
		('UNIT_ARMORED_CRUISER',	'UNITAI_COMBAT'),
		('UNIT_ARMORED_CRUISER',	'UNITTYPE_RANGED'),
		('UNIT_ARMORED_CRUISER',	'UNITTYPE_NAVAL'),
		('UNIT_BATTLECRUISER',		'UNITAI_COMBAT'),
		('UNIT_BATTLECRUISER',		'UNITTYPE_RANGED'),
		('UNIT_BATTLECRUISER',		'UNITTYPE_NAVAL'),
		('UNIT_GALLEON',	   		'UNITAI_COMBAT'),
		('UNIT_GALLEON',	   		'UNITTYPE_RANGED'),
		('UNIT_GALLEON',	   		'UNITTYPE_NAVAL'),
		('UNIT_SHIP_OF_THE_LINE',	'UNITAI_COMBAT'),
		('UNIT_SHIP_OF_THE_LINE',	'UNITTYPE_RANGED'),
		('UNIT_SHIP_OF_THE_LINE',	'UNITTYPE_NAVAL'),
		('UNIT_PRE_DREADNOUGHT',	'UNITAI_COMBAT'),
		('UNIT_PRE_DREADNOUGHT',	'UNITTYPE_RANGED'),
		('UNIT_PRE_DREADNOUGHT',	'UNITTYPE_NAVAL'),
		('UNIT_ATTACK_SUBMARINE',	'UNITAI_COMBAT'),
		('UNIT_ATTACK_SUBMARINE',	'UNITTYPE_RANGED'),
		('UNIT_ATTACK_SUBMARINE',	'UNITTYPE_NAVAL'),
		('UNIT_INDUSTRIAL_MARINE',	'UNITAI_COMBAT'),
		('UNIT_INDUSTRIAL_MARINE',	'UNITAI_EXPLORE'),
		('UNIT_INDUSTRIAL_MARINE',	'UNITTYPE_MELEE'),
		('UNIT_INDUSTRIAL_MARINE',	'UNITTYPE_LAND_COMBAT'),
		('UNIT_WW2_MARINE',			'UNITAI_COMBAT'),
		('UNIT_WW2_MARINE',			'UNITAI_EXPLORE'),
		('UNIT_WW2_MARINE',			'UNITTYPE_MELEE'),
		('UNIT_WW2_MARINE',			'UNITTYPE_LAND_COMBAT'),
		('UNIT_MODERN_MARINE',		'UNITAI_COMBAT'),
		('UNIT_MODERN_MARINE',		'UNITAI_EXPLORE'),
		('UNIT_MODERN_MARINE',		'UNITTYPE_MELEE'),
		('UNIT_MODERN_MARINE',		'UNITTYPE_LAND_COMBAT'),
		('UNIT_FIELD_HOWITZER',		'UNITAI_COMBAT'),
		('UNIT_FIELD_HOWITZER',		'UNITTYPE_RANGED'),
		('UNIT_FIELD_HOWITZER',		'UNITTYPE_SIEGE'),
		('UNIT_FIELD_HOWITZER',		'UNITTYPE_LAND_COMBAT'),
		('UNIT_SP_HVY_ATILLERY',	'UNITAI_COMBAT'),
		('UNIT_SP_HVY_ATILLERY',	'UNITTYPE_RANGED'),
		('UNIT_SP_HVY_ATILLERY',	'UNITTYPE_SIEGE'),
		('UNIT_SP_HVY_ATILLERY',	'UNITTYPE_LAND_COMBAT');

-- Class Type Tags
INSERT INTO TypeTags
		(Type,						Tag)
VALUES	('UNIT_MOTORISED_INFANTRY',	'CLASS_MELEE'),
		('UNIT_COMPOSITE_BOWMAN',	'CLASS_RANGED'),
		('UNIT_CULVERIN',			'CLASS_RANGED'),
		('UNIT_FIELD_GUN',			'CLASS_RANGED'),
		('UNIT_ASSAULT_GUN',		'CLASS_RANGED'),
		('UNIT_SP_GUN',				'CLASS_RANGED'),
		('UNIT_HEAVY_INFANTRY',		'CLASS_ANTI_CAVALRY'),
		('UNIT_TANK_DESTROYER',		'CLASS_ANTI_CAVALRY'),
		('UNIT_LANCER',				'CLASS_LIGHT_CAVALRY'),
		('UNIT_ARMORED_CAVALRY',	'CLASS_LIGHT_CAVALRY'),
		('UNIT_GUNSHIP',			'CLASS_LIGHT_CAVALRY'),
		('UNIT_GUNSHIP',			'CLASS_HELICOPTER'),
		('UNIT_ARMORED_HORSEMAN',	'CLASS_HEAVY_CAVALRY'),
		('UNIT_REITER',				'CLASS_HEAVY_CAVALRY'),
		('UNIT_LANDSHIP',			'CLASS_HEAVY_CAVALRY'),
		('UNIT_WW1_BOMBER',			'CLASS_AIRCRAFT'),
		('UNIT_STEALTH_BOMBER',		'CLASS_AIRCRAFT'),
		('UNIT_STEALTH_BOMBER',		'CLASS_STEALTH'),
		('UNIT_STEALTH_FIGHTER',	'CLASS_AIRCRAFT'),
		('UNIT_STEALTH_FIGHTER',	'CLASS_STEALTH'),
		('UNIT_WW1_GROUND_ATTACK',	'CLASS_AIRCRAFT'),
		('UNIT_GROUND_ATTACK',		'CLASS_AIRCRAFT'),
		('UNIT_JET_GROUND_ATTACK',	'CLASS_AIRCRAFT'),
		('UNIT_STEALTH_ATTACK',		'CLASS_AIRCRAFT'),
		('UNIT_STEALTH_ATTACK',		'CLASS_STEALTH'),
		('UNIT_CORVETTE',			'CLASS_NAVAL_MELEE'),
		('UNIT_MISSILE_DESTROYER',	'CLASS_NAVAL_MELEE'),
		('UNIT_MISSILE_DESTROYER',	'CLASS_REVEAL_STEALTH'),
		('UNIT_MISSILE_DESTROYER',	'CLASS_ANTI_AIR'),
		('UNIT_SUPERCARRIER',		'CLASS_NAVAL_CARRIER'),
		('UNIT_GALLEASS',			'CLASS_NAVAL_RANGED'),
		('UNIT_ARMORED_CRUISER',	'CLASS_NAVAL_RANGED'),
		('UNIT_BATTLECRUISER',		'CLASS_NAVAL_RANGED'),
		('UNIT_BATTLECRUISER',		'CLASS_ANTI_AIR'),
		('UNIT_GALLEON',			'CLASS_NAVAL_RANGED'),
		('UNIT_GALLEON',			'CLASS_NAVAL_BOMBARD'),
		('UNIT_SHIP_OF_THE_LINE',	'CLASS_NAVAL_RANGED'),
		('UNIT_SHIP_OF_THE_LINE',	'CLASS_NAVAL_BOMBARD'),
		('UNIT_PRE_DREADNOUGHT',	'CLASS_NAVAL_RANGED'),
		('UNIT_PRE_DREADNOUGHT',	'CLASS_NAVAL_BOMBARD'),
		('UNIT_BATTLESHIP',			'CLASS_NAVAL_BOMBARD'),
		('UNIT_ATTACK_SUBMARINE',	'CLASS_NAVAL_RAIDER'),
		('UNIT_ATTACK_SUBMARINE',	'CLASS_NAVAL_RANGED'),
		('UNIT_ATTACK_SUBMARINE',	'CLASS_STEALTH'),
		('UNIT_ATTACK_SUBMARINE',	'CLASS_REVEAL_STEALTH'),
		('UNIT_INDUSTRIAL_MARINE',	'CLASS_MELEE'),
		('UNIT_INDUSTRIAL_MARINE',	'CLASS_MARINE'),
		('UNIT_WW2_MARINE',			'CLASS_MELEE'),
		('UNIT_WW2_MARINE',			'CLASS_MARINE'),
		('UNIT_MODERN_MARINE',		'CLASS_MELEE'),
		('UNIT_MODERN_MARINE',		'CLASS_MARINE'),
		('UNIT_FIELD_HOWITZER',		'CLASS_SIEGE'),
		('UNIT_FIELD_HOWITZER',		'CLASS_FORWARD_OBSERVER'),
		('UNIT_SP_HVY_ATILLERY',	'CLASS_SIEGE'),
		('UNIT_SP_HVY_ATILLERY',	'CLASS_FORWARD_OBSERVER');

-- New Units
INSERT INTO Units
		(UnitType,					BaseMoves,	Cost,	AdvisorType,		BaseSightRange,	ZoneOfControl,	Domain,			FormationClass,					Name,								Description,								PurchaseYield,	PseudoYieldType,					PromotionClass,						Maintenance,	Combat,	RangedCombat,	Range,	Bombard,	StrategicResource,		PrereqTech,						MandatoryObsoleteTech,		CanTargetAir,	AntiAirCombat,	AirSlots,	IgnoreMoves,	Stackable,	PrereqDistrict,			CanCapture,	WMDCapable)
VALUES	('UNIT_MOTORISED_INFANTRY',	4,			540,	'ADVISOR_CONQUEST',	2,				'1',			'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_MOTORISED_INFANTRY_NAME',	'LOC_UNIT_MOTORISED_INFANTRY_DESCRIPTION',	'YIELD_GOLD',	null,								'PROMOTION_CLASS_MELEE',			7,				78,		0,				0,		0,			null,					'TECH_COMBINED_ARMS',			null,						'0',			0,				0,			'0',			'0',		null,					'1',		'0'),
		('UNIT_COMPOSITE_BOWMAN',	2,			85,		'ADVISOR_CONQUEST',	2,				'0',			'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_COMPOSITE_BOWMAN_NAME',	'LOC_UNIT_COMPOSITE_BOWMAN_DESCRIPTION',	'YIELD_GOLD',	null,								'PROMOTION_CLASS_RANGED',			2,				22,		32,				2,		0,			null,					'TECH_IRON_WORKING',			'TECH_MACHINERY',			'0',			0,				0,			'0',			'0',		null,					'1',		'0'),
		('UNIT_CULVERIN',			2,			230,	'ADVISOR_CONQUEST',	2,				'0',			'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_CULVERIN_NAME',			'LOC_UNIT_CULVERIN_DESCRIPTION',			'YIELD_GOLD',	null,								'PROMOTION_CLASS_RANGED',			4,				40,		50,				2,		0,			null,					'TECH_GUNPOWDER',				'TECH_BALLISTICS',			'0',			0,				0,			'0',			'0',		null,					'1',		'0'),
		('UNIT_FIELD_GUN',			2,			420,	'ADVISOR_CONQUEST',	2,				'0',			'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_FIELD_GUN_NAME',			'LOC_UNIT_FIELD_GUN_DESCRIPTION',			'YIELD_GOLD',	null,								'PROMOTION_CLASS_RANGED',			6,				58,		68,				2,		0,			null,					'TECH_REPLACEABLE_PARTS',		'TECH_ADVANCED_BALLISTICS',	'0',			0,				0,			'0',			'0',		null,					'1',		'0'),
		('UNIT_ASSAULT_GUN',		4,			530,	'ADVISOR_CONQUEST',	2,				'0',			'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_ASSAULT_GUN_NAME',		'LOC_UNIT_ASSAULT_GUN_DESCRIPTION',			'YIELD_GOLD',	null,								'PROMOTION_CLASS_RANGED',			7,				65,		75,				2,		0,			null,					'TECH_ADVANCED_BALLISTICS',		'TECH_TELECOMMUNICATIONS',	'0',			0,				0,			'0',			'0',		null,					'1',		'0'),
		('UNIT_SP_GUN',				4,			640,	'ADVISOR_CONQUEST',	2,				'0',			'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_SP_GUN_NAME',				'LOC_UNIT_SP_GUN_DESCRIPTION',				'YIELD_GOLD',	null,								'PROMOTION_CLASS_RANGED',			8,				72,		82,				2,		0,			null,					'TECH_TELECOMMUNICATIONS',		null,						'0',			0,				0,			'0',			'0',		null,					'1',		'0'),
		('UNIT_HEAVY_INFANTRY',		2,			95,		'ADVISOR_CONQUEST',	2,				'1',			'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_HEAVY_INFANTRY_NAME',		'LOC_UNIT_HEAVY_INFANTRY_DESCRIPTION',		'YIELD_GOLD',	null,								'PROMOTION_CLASS_ANTI_CAVALRY',		2,				33,		0,				0,		0,			null,					'TECH_CONSTRUCTION',			'TECH_MASS_PRODUCTION',		'0',			0,				0,			'0',			'0',		null,					'1',		'0'),
		('UNIT_TANK_DESTROYER',		4,			490,	'ADVISOR_CONQUEST',	2,				'1',			'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_TANK_DESTROYER_NAME',		'LOC_UNIT_TANK_DESTROYER_DESCRIPTION',		'YIELD_GOLD',	null,								'PROMOTION_CLASS_ANTI_CAVALRY',		6,				76,		0,				0,		0,			null,					'TECH_ADVANCED_BALLISTICS',		'TECH_COMPOSITES',			'0',			0,				0,			'0',			'0',		null,					'1',		'0'),
		('UNIT_LANCER',				5,			210,	'ADVISOR_CONQUEST',	2,				'1',			'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_LANCER_NAME',				'LOC_UNIT_LANCER_DESCRIPTION',				'YIELD_GOLD',	null,								'PROMOTION_CLASS_LIGHT_CAVALRY',	3,				53,		0,				0,		0,			'RESOURCE_HORSES',		'TECH_METAL_CASTING',			'TECH_COMBUSTION',			'0',			0,				0,			'0',			'0',		null,					'1',		'0'),
		('UNIT_ARMORED_CAVALRY',	5,			390,	'ADVISOR_CONQUEST',	2,				'1',			'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_ARMORED_CAVALRY_NAME',	'LOC_UNIT_ARMORED_CAVALRY_DESCRIPTION',		'YIELD_GOLD',	null,								'PROMOTION_CLASS_LIGHT_CAVALRY',	5,				68,		0,				0,		0,			'RESOURCE_OIL',			'TECH_COMBUSTION',				'TECH_COMPOSITES',			'0',			0,				0,			'0',			'0',		null,					'1',		'0'),
		('UNIT_GUNSHIP',			4,			600,	'ADVISOR_CONQUEST',	2,				'1',			'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_GUNSHIP_NAME',			'LOC_UNIT_GUNSHIP_DESCRIPTION',				'YIELD_GOLD',	null,								'PROMOTION_CLASS_LIGHT_CAVALRY',	7,				82,		0,				0,		0,			'RESOURCE_OIL',			'TECH_NANOTECHNOLOGY',			null,						'1',			0,				0,			'0',			'0',		null,					'1',		'0'),
		('UNIT_ARMORED_HORSEMAN',	4,			100,	'ADVISOR_CONQUEST',	2,				'1',			'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_ARMORED_HORSEMAN_NAME',	'LOC_UNIT_ARMORED_HORSEMAN_DESCRIPTION',	'YIELD_GOLD',	null,								'PROMOTION_CLASS_HEAVY_CAVALRY',	2,				40,		0,				0,		0,			'RESOURCE_HORSES',		'TECH_HORSEBACK_RIDING',		'TECH_STIRRUPS',			'0',			0,				0,			'0',			'0',		null,					'1',		'0'),
		('UNIT_REITER',				4,			240,	'ADVISOR_CONQUEST',	2,				'1',			'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_REITER_NAME',				'LOC_UNIT_REITER_DESCRIPTION',				'YIELD_GOLD',	null,								'PROMOTION_CLASS_HEAVY_CAVALRY',	4,				58,		0,				0,		0,			'RESOURCE_HORSES',		'TECH_GUNPOWDER',				'TECH_BALLISTICS',			'0',			0,				0,			'0',			'0',		null,					'1',		'0'),
		('UNIT_LANDSHIP',			4,			420,	'ADVISOR_CONQUEST',	2,				'1',			'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_LANDSHIP_NAME',			'LOC_UNIT_LANDSHIP_DESCRIPTION',			'YIELD_GOLD',	null,								'PROMOTION_CLASS_HEAVY_CAVALRY',	6,				73,		0,				0,		0,			'RESOURCE_OIL',			'TECH_COMBUSTION',				'TECH_COMPOSITES',			'0',			0,				0,			'0',			'0',		null,					'1',		'0'),
		('UNIT_WW1_BOMBER',			7,			450,	'ADVISOR_CONQUEST',	4,				'0',			'DOMAIN_AIR',	'FORMATION_CLASS_AIR',			'LOC_UNIT_WW1_BOMBER_NAME',			'LOC_UNIT_WW1_BOMBER_DESCRIPTION',			'YIELD_GOLD',	'PSEUDOYIELD_UNIT_AIR_COMBAT',		'PROMOTION_CLASS_AIR_BOMBER',		6,				50,		0,				7,		70,			null,					'TECH_FLIGHT',					'TECH_ADVANCED_FLIGHT',		'1',			0,				0,			'1',			'1',		'DISTRICT_AERODROME',	'0',		'0'),
		('UNIT_STEALTH_BOMBER',		15,			720,	'ADVISOR_CONQUEST',	5,				'0',			'DOMAIN_AIR',	'FORMATION_CLASS_AIR',			'LOC_UNIT_STEALTH_BOMBER_NAME',		'LOC_UNIT_STEALTH_BOMBER_DESCRIPTION',		'YIELD_GOLD',	'PSEUDOYIELD_UNIT_AIR_COMBAT',		'PROMOTION_CLASS_AIR_BOMBER',		8,				70,		0,				15,		100,		'RESOURCE_ALUMINUM',	'TECH_FUTURE_TECH',				null,						'1',			0,				0,			'1',			'1',		'DISTRICT_AERODROME',	'0',		'1'),
		('UNIT_STEALTH_FIGHTER',	10,			670,	'ADVISOR_CONQUEST',	5,				'0',			'DOMAIN_AIR',	'FORMATION_CLASS_AIR',			'LOC_UNIT_STEALTH_FIGHTER_NAME',	'LOC_UNIT_STEALTH_FIGHTER_DESCRIPTION',		'YIELD_GOLD',	'PSEUDOYIELD_UNIT_AIR_COMBAT',		'PROMOTION_CLASS_AIR_FIGHTER',		8,				90,		85,				10,		0,			'RESOURCE_ALUMINUM',	'TECH_FUTURE_TECH',				null,						'1',			0,				0,			'1',			'1',		'DISTRICT_AERODROME',	'0',		'0'),
		('UNIT_WW1_GROUND_ATTACK',	5,			440,	'ADVISOR_CONQUEST',	4,				'0',			'DOMAIN_AIR',	'FORMATION_CLASS_AIR',			'LOC_UNIT_WW1_GROUND_ATTACK_NAME',	'LOC_UNIT_WW1_GROUND_ATTACK_DESCRIPTION',	'YIELD_GOLD',	'PSEUDOYIELD_UNIT_AIR_COMBAT',		'PROMOTION_CLASS_AIR_ATTACK',		6,				55,		60,				5,		0,			null,					'TECH_FLIGHT',					'TECH_ADVANCED_FLIGHT',		'1',			0,				0,			'1',			'1',		'DISTRICT_AERODROME',	'0',		'0'),
		('UNIT_GROUND_ATTACK',		8,			540,	'ADVISOR_CONQUEST',	4,				'0',			'DOMAIN_AIR',	'FORMATION_CLASS_AIR',			'LOC_UNIT_GROUND_ATTACK_NAME',		'LOC_UNIT_GROUND_ATTACK_DESCRIPTION',		'YIELD_GOLD',	'PSEUDOYIELD_UNIT_AIR_COMBAT',		'PROMOTION_CLASS_AIR_ATTACK',		7,				72,		85,				8,		0,			'RESOURCE_ALUMINUM',	'TECH_ADVANCED_FLIGHT',			'TECH_LASERS',				'1',			0,				0,			'1',			'1',		'DISTRICT_AERODROME',	'0',		'0'),
		('UNIT_JET_GROUND_ATTACK',	10,			675,	'ADVISOR_CONQUEST',	5,				'0',			'DOMAIN_AIR',	'FORMATION_CLASS_AIR',			'LOC_UNIT_JET_GROUND_ATTACK_NAME',	'LOC_UNIT_JET_GROUND_ATTACK_DESCRIPTION',	'YIELD_GOLD',	'PSEUDOYIELD_UNIT_AIR_COMBAT',		'PROMOTION_CLASS_AIR_ATTACK',		8,				85,		90,				10,		0,			'RESOURCE_ALUMINUM',	'TECH_LASERS',					null,						'1',			0,				0,			'1',			'1',		'DISTRICT_AERODROME',	'0',		'0'),
		('UNIT_STEALTH_ATTACK',		10,			700,	'ADVISOR_CONQUEST',	5,				'0',			'DOMAIN_AIR',	'FORMATION_CLASS_AIR',			'LOC_UNIT_STEALTH_ATTACK_NAME',		'LOC_UNIT_STEALTH_ATTACK_DESCRIPTION',		'YIELD_GOLD',	'PSEUDOYIELD_UNIT_AIR_COMBAT',		'PROMOTION_CLASS_AIR_ATTACK',		8,				85,		95,				10,		0,			'RESOURCE_ALUMINUM',	'TECH_FUTURE_TECH',				null,						'1',			0,				0,			'1',			'1',		'DISTRICT_AERODROME',	'0',		'1'),
		('UNIT_CORVETTE',			4,			260,	'ADVISOR_CONQUEST',	3,				'1',			'DOMAIN_SEA',	'FORMATION_CLASS_NAVAL',		'LOC_UNIT_CORVETTE_NAME',			'LOC_UNIT_CORVETTE_DESCRIPTION',			'YIELD_GOLD',	'PSEUDOYIELD_UNIT_NAVAL_COMBAT',	'PROMOTION_CLASS_NAVAL_MELEE',		4,				50,		0,				0,		0,			null,					'TECH_SQUARE_RIGGING',			'TECH_STEAM_POWER',			'0',			0,				0,			'0',			'0',		null,					'1',		'0'),
		('UNIT_MISSILE_DESTROYER',	5,			660,	'ADVISOR_CONQUEST',	3,				'1',			'DOMAIN_SEA',	'FORMATION_CLASS_NAVAL',		'LOC_UNIT_MISSILE_DESTROYER_NAME',	'LOC_UNIT_MISSILE_DESTROYER_DESCRIPTION',	'YIELD_GOLD',	'PSEUDOYIELD_UNIT_NAVAL_COMBAT',	'PROMOTION_CLASS_NAVAL_MELEE',		8,				90,		0,				0,		0,			null,					'TECH_TELECOMMUNICATIONS',		null,						'1',			85,				0,			'0',			'0',		null,					'1',		'0'),
		('UNIT_SUPERCARRIER',		5,			680,	'ADVISOR_CONQUEST',	2,				'1',			'DOMAIN_SEA',	'FORMATION_CLASS_NAVAL',		'LOC_UNIT_SUPERCARRIER_NAME',		'LOC_UNIT_SUPERCARRIER_DESCRIPTION',		'YIELD_GOLD',	'PSEUDOYIELD_UNIT_NAVAL_COMBAT',	'PROMOTION_CLASS_NAVAL_CARRIER',	8,				80,		0,				0,		0,			'RESOURCE_URANIUM',		'TECH_STEALTH_TECHNOLOGY',		null,						'0',			0,				5,			'0',			'0',		null,					'1',		'0'),
		('UNIT_GALLEASS',			4,			240,	'ADVISOR_CONQUEST',	2,				'1',			'DOMAIN_SEA',	'FORMATION_CLASS_NAVAL',		'LOC_UNIT_GALLEASS_NAME',			'LOC_UNIT_GALLEASS_DESCRIPTION',			'YIELD_GOLD',	'PSEUDOYIELD_UNIT_NAVAL_COMBAT',	'PROMOTION_CLASS_NAVAL_RANGED',		3,				35,		45,				2,		0,			null,					'TECH_CARTOGRAPHY',				'TECH_SQUARE_RIGGING',		'0',			0,				0,			'0',			'0',		null,					'1',		'0'),
		('UNIT_ARMORED_CRUISER',	5,			400,	'ADVISOR_CONQUEST',	2,				'1',			'DOMAIN_SEA',	'FORMATION_CLASS_NAVAL',		'LOC_UNIT_ARMORED_CRUISER_NAME',	'LOC_UNIT_ARMORED_CRUISER_DESCRIPTION',		'YIELD_GOLD',	'PSEUDOYIELD_UNIT_NAVAL_COMBAT',	'PROMOTION_CLASS_NAVAL_RANGED',		5,				55,		65,				2,		0,			'RESOURCE_COAL',		'TECH_STEAM_POWER',				'TECH_RADIO',				'0',			0,				0,			'0',			'0',		null,					'1',		'0'),
		('UNIT_BATTLECRUISER',		5,			560,	'ADVISOR_CONQUEST',	2,				'1',			'DOMAIN_SEA',	'FORMATION_CLASS_NAVAL',		'LOC_UNIT_BATTLECRUISER_NAME',		'LOC_UNIT_BATTLECRUISER_DESCRIPTION',		'YIELD_GOLD',	'PSEUDOYIELD_UNIT_NAVAL_COMBAT',	'PROMOTION_CLASS_NAVAL_RANGED',		6,				65,		75,				2,		0,			null,					'TECH_RADIO',					'TECH_LASERS',				'1',			75,				0,			'0',			'0',		null,					'1',		'0'),
		('UNIT_GALLEON',			3,			280,	'ADVISOR_CONQUEST',	2,				'1',			'DOMAIN_SEA',	'FORMATION_CLASS_NAVAL',		'LOC_UNIT_GALLEON_NAME',			'LOC_UNIT_GALLEON_DESCRIPTION',				'YIELD_GOLD',	'PSEUDOYIELD_UNIT_NAVAL_COMBAT',	'PROMOTION_CLASS_NAVAL_BOMBARD',	4,				40,		0,				3,		50,			null,					'TECH_EDUCATION',				'TECH_ASTRONOMY',			'0',			0,				0,			'0',			'0',		null,					'1',		'0'),
		('UNIT_SHIP_OF_THE_LINE',	3,			320,	'ADVISOR_CONQUEST',	2,				'1',			'DOMAIN_SEA',	'FORMATION_CLASS_NAVAL',		'LOC_UNIT_SHIP_OF_THE_LINE_NAME',	'LOC_UNIT_SHIP_OF_THE_LINE_DESCRIPTION',	'YIELD_GOLD',	'PSEUDOYIELD_UNIT_NAVAL_COMBAT',	'PROMOTION_CLASS_NAVAL_BOMBARD',	4,				50,		0,				3,		60,			null,					'TECH_ASTRONOMY',				'TECH_STEAM_POWER',			'0',			0,				0,			'0',			'0',		null,					'1',		'0'),
		('UNIT_PRE_DREADNOUGHT',	4,			440,	'ADVISOR_CONQUEST',	2,				'1',			'DOMAIN_SEA',	'FORMATION_CLASS_NAVAL',		'LOC_UNIT_PRE_DREADNOUGHT_NAME',	'LOC_UNIT_PRE_DREADNOUGHT_DESCRIPTION',		'YIELD_GOLD',	'PSEUDOYIELD_UNIT_NAVAL_COMBAT',	'PROMOTION_CLASS_NAVAL_BOMBARD',	5,				60,		0,				3,		70,			'RESOURCE_COAL',		'TECH_RIFLING',					'TECH_STEEL',				'0',			0,				0,			'0',			'0',		null,					'1',		'0'),
		('UNIT_ATTACK_SUBMARINE',	4,			680,	'ADVISOR_CONQUEST',	2,				'0',			'DOMAIN_SEA',	'FORMATION_CLASS_NAVAL',		'LOC_UNIT_ATTACK_SUBMARINE_NAME',	'LOC_UNIT_ATTACK_SUBMARINE_DESCRIPTION',	'YIELD_GOLD',	'PSEUDOYIELD_UNIT_NAVAL_COMBAT',	'PROMOTION_CLASS_NAVAL_RAIDER',		8,				80,		90,				2,		0,			null,					'TECH_GUIDANCE_SYSTEMS',		null,						'0',			0,				0,			'0',			'0',		null,					'1',		'0'),
		('UNIT_INDUSTRIAL_MARINE',	2,			350,	'ADVISOR_CONQUEST',	2,				'1',			'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_INDUSTRIAL_MARINE_NAME',	'LOC_UNIT_INDUSTRIAL_MARINE_DESCRIPTION',	'YIELD_GOLD',	null,								'PROMOTION_CLASS_MARINE',			3,				61,		0,				0,		0,			null,					'TECH_BALLISTICS',				'TECH_CHEMISTRY',			'0',			0,				0,			'0',			'0',		'DISTRICT_HARBOR',		'1',		'0'),
		('UNIT_WW2_MARINE',			2,			430,	'ADVISOR_CONQUEST',	2,				'1',			'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_WW2_MARINE_NAME',			'LOC_UNIT_WW2_MARINE_DESCRIPTION',			'YIELD_GOLD',	null,								'PROMOTION_CLASS_MARINE',			5,				67,		0,				0,		0,			null,					'TECH_CHEMISTRY',				'TECH_SATELLITES',			'0',			0,				0,			'0',			'0',		'DISTRICT_HARBOR',		'1',		'0'),
		('UNIT_MODERN_MARINE',		4,			650,	'ADVISOR_CONQUEST',	2,				'1',			'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_MODERN_MARINE_NAME',		'LOC_UNIT_MODERN_MARINE_DESCRIPTION',		'YIELD_GOLD',	null,								'PROMOTION_CLASS_MARINE',			7,				82,		0,				0,		0,			null,					'TECH_SATELLITES',				null,						'0',			0,				0,			'0',			'0',		'DISTRICT_HARBOR',		'1',		'0'),
		('UNIT_FIELD_HOWITZER',		2,			360,	'ADVISOR_CONQUEST',	2,				'0',			'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_FIELD_HOWITZER_NAME',		'LOC_UNIT_FIELD_HOWITZER_DESCRIPTION',		'YIELD_GOLD',	null,								'PROMOTION_CLASS_SIEGE',			5,				53,		0,				2,		65,			null,					'TECH_RIFLING',					'TECH_STEEL',				'0',			0,				0,			'0',			'0',		null,					'1',		'0'),
		('UNIT_SP_HVY_ATILLERY',	3,			560,	'ADVISOR_CONQUEST',	2,				'0',			'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_SP_HVY_ATILLERY_NAME',	'LOC_UNIT_SP_HVY_ATILLERY_DESCRIPTION',		'YIELD_GOLD',	null,								'PROMOTION_CLASS_SIEGE',			7,				72,		0,				3,		88,			null,					'TECH_ADVANCED_BALLISTICS',		'TECH_GUIDANCE_SYSTEMS',	'0',			0,				0,			'0',			'0',		null,					'1',		'0');

-- Unit Upgrades
INSERT INTO UnitUpgrades
		(Unit,						UpgradeUnit)
VALUES	('UNIT_MOTORISED_INFANTRY',	'UNIT_MECHANIZED_INFANTRY'),
		('UNIT_COMPOSITE_BOWMAN',	'UNIT_CROSSBOWMAN'),
		('UNIT_CULVERIN',			'UNIT_FIELD_CANNON'),
		('UNIT_FIELD_GUN',			'UNIT_ASSAULT_GUN'),
		('UNIT_ASSAULT_GUN',		'UNIT_SP_GUN'),
		('UNIT_HEAVY_INFANTRY',		'UNIT_PIKEMAN'),
		('UNIT_TANK_DESTROYER',		'UNIT_MODERN_AT'),
		('UNIT_LANCER',				'UNIT_CAVALRY'),
		('UNIT_ARMORED_CAVALRY',	'UNIT_HELICOPTER'),
		('UNIT_HELICOPTER',			'UNIT_GUNSHIP'),
		('UNIT_ARMORED_HORSEMAN',	'UNIT_KNIGHT'),
		('UNIT_REITER',				'UNIT_CUIRASSIER'),
		('UNIT_LANDSHIP',			'UNIT_TANK'),
		('UNIT_WW1_BOMBER',			'UNIT_BOMBER'),
		('UNIT_JET_BOMBER',			'UNIT_STEALTH_BOMBER'),
		('UNIT_JET_FIGHTER',		'UNIT_STEALTH_FIGHTER'),
		('UNIT_WW1_GROUND_ATTACK',	'UNIT_GROUND_ATTACK'),
		('UNIT_GROUND_ATTACK',		'UNIT_JET_GROUND_ATTACK'),
		('UNIT_JET_GROUND_ATTACK',	'UNIT_STEALTH_ATTACK'),
		('UNIT_CORVETTE',			'UNIT_IRONCLAD'),
		('UNIT_DESTROYER',			'UNIT_MISSILE_DESTROYER'),
		('UNIT_AIRCRAFT_CARRIER',	'UNIT_SUPERCARRIER'),
		('UNIT_GALLEASS',			'UNIT_FRIGATE'),
		('UNIT_ARMORED_CRUISER',	'UNIT_BATTLECRUISER'),
		('UNIT_BATTLECRUISER',		'UNIT_MISSILE_CRUISER'),
		('UNIT_GALLEON',			'UNIT_SHIP_OF_THE_LINE'),
		('UNIT_SHIP_OF_THE_LINE',	'UNIT_PRE_DREADNOUGHT'),
		('UNIT_PRE_DREADNOUGHT',	'UNIT_BATTLESHIP'),
		('UNIT_INDUSTRIAL_MARINE',	'UNIT_WW2_MARINE'),
		('UNIT_WW2_MARINE',			'UNIT_MODERN_MARINE'),
		('UNIT_FIELD_HOWITZER',		'UNIT_ARTILLERY'),
		('UNIT_SP_HVY_ATILLERY',	'UNIT_ROCKET_ARTILLERY');
		
-- Unit Replaces
INSERT INTO UnitReplaces
		(CivUniqueUnitType,				ReplacesUnitType)
VALUES	('UNIT_INDIAN_VARU',			'UNIT_ARMORED_HORSEMAN'),
		('UNIT_AMERICAN_ROUGH_RIDER',	'UNIT_CUIRASSIER');
		
INSERT INTO UnitReplaces
		(CivUniqueUnitType,		ReplacesUnitType)
SELECT	'UNIT_POLISH_HUSSAR',	'UNIT_CUIRASSIER'
WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_POLISH_HUSSAR');

INSERT INTO UnitReplaces
		(CivUniqueUnitType,	ReplacesUnitType)
SELECT	'UNIT_CATAPHRACT',	'UNIT_ARMORED_HORSEMAN'
WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_CATAPHRACT');
		
-- Technology Boosts
INSERT INTO Boosts
		(TechnologyType,	Boost,	TriggerDescription,			TriggerLongDescription,					BoostClass,								Unit1Type,					NumItems)
VALUES	('TECH_MACHINERY',	50,		'LOC_BOOST_TRIGGER_BOWMAN',	'LOC_BOOST_TRIGGER_LONGDESC_BOWMAN',	'BOOST_TRIGGER_OWN_X_UNITS_OF_TYPE',	'UNIT_COMPOSITE_BOWMAN',	3);

-- Technology Prereqs
DELETE FROM TechnologyPrereqs WHERE Technology = 'TECH_MASS_PRODUCTION' AND PrereqTech = 'TECH_SHIPBUILDING';

INSERT INTO TechnologyPrereqs
		(Technology,				PrereqTech)
VALUES	('TECH_CARTOGRAPHY',		'TECH_MILITARY_TACTICS'),
		('TECH_MASS_PRODUCTION',	'TECH_CARTOGRAPHY'),
		('TECH_SQUARE_RIGGING',		'TECH_MASS_PRODUCTION'),
		('TECH_EDUCATION',			'TECH_MILITARY_TACTICS'),
		('TECH_ASTRONOMY',			'TECH_MASS_PRODUCTION');