--==========================================================================================================================
-- CONFIG DATA
--==========================================================================================================================
-- Players
-------------------------------------	
INSERT INTO Players	
		(
			CivilizationType,
			Portrait,
			PortraitBackground,

			LeaderType,
			LeaderName,
			LeaderIcon,
			
			LeaderAbilityName,
			LeaderAbilityDescription,
			LeaderAbilityIcon,

			CivilizationName,
			CivilizationIcon,
			CivilizationAbilityName,
			CivilizationAbilityDescription,
			CivilizationAbilityIcon,

			Domain)

VALUES	(
			'CIVILIZATION_SUK_ICELAND',
			'LEADER_SUK_INGOLFUR_NEUTRAL',
			'LEADER_SUK_INGOLFUR_BACKGROUND',

			'LEADER_SUK_INGOLFUR',
			'LOC_LEADER_SUK_INGOLFUR_NAME',
			'ICON_LEADER_SUK_INGOLFUR',

			'LOC_TRAIT_LEADER_SUK_BOOK_OF_SETTLEMENTS_NAME',
			'LOC_TRAIT_LEADER_SUK_BOOK_OF_SETTLEMENTS_DESCRIPTION',
			'ICON_LEADER_SUK_INGOLFUR',

			'LOC_CIVILIZATION_SUK_ICELAND_NAME',
			'ICON_CIVILIZATION_SUK_ICELAND',
			'LOC_TRAIT_CIVILIZATION_SUK_SAGAS_OF_THE_ICELANDERS_NAME',
			'LOC_TRAIT_CIVILIZATION_SUK_SAGAS_OF_THE_ICELANDERS_DESCRIPTION',
			'ICON_CIVILIZATION_SUK_ICELAND',

			'Players:Expansion1_Players');
-------------------------------------
-- PlayerItems
-------------------------------------	
INSERT INTO PlayerItems	
		(CivilizationType,				Domain,							LeaderType,				Type,								Icon,									Name,									 	Description,									  	SortIndex)
VALUES	('CIVILIZATION_SUK_ICELAND',	'Players:Expansion1_Players',	'LEADER_SUK_INGOLFUR',	'DISTRICT_SUK_TORFBAEIR',			'ICON_DISTRICT_SUK_TORFBAEIR',			'LOC_DISTRICT_SUK_TORFBAEIR_NAME',			'LOC_DISTRICT_SUK_TORFBAEIR_DESCRIPTION',			20),
		('CIVILIZATION_SUK_ICELAND',	'Players:Expansion1_Players',	'LEADER_SUK_INGOLFUR',	'UNIT_SUK_LAWSPEAKER',				'ICON_UNIT_SUK_LAWSPEAKER',				'LOC_UNIT_SUK_LAWSPEAKER_NAME',				'LOC_UNIT_SUK_LAWSPEAKER_DESCRIPTION',				10);
--==========================================================================================================================
--==========================================================================================================================