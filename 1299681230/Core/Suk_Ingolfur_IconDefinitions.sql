--==========================================================================================================================
-- ICONS
--==========================================================================================================================
-- IconTextureAtlases
-------------------------------------	
INSERT INTO IconTextureAtlases	
		(Name,										IconSize,	IconsPerRow,	IconsPerColumn,		Filename)
VALUES  ('ICON_ATLAS_SUK_ICELAND',					256,	 	5,				1,					'Suk_Iceland_Atlas_256.dds'),
		('ICON_ATLAS_SUK_ICELAND',					200,	 	5,				1,					'Suk_Iceland_Atlas_200.dds'),
		('ICON_ATLAS_SUK_ICELAND',					128,	 	5,				1,					'Suk_Iceland_Atlas_128.dds'),
		('ICON_ATLAS_SUK_ICELAND',					95,	 		5,				1,					'Suk_Iceland_Atlas_95.dds'),
		('ICON_ATLAS_SUK_ICELAND',					80,	 		5,				1,					'Suk_Iceland_Atlas_80.dds'),
		('ICON_ATLAS_SUK_ICELAND',					70,	 		5,				1,					'Suk_Iceland_Atlas_70.dds'),
		('ICON_ATLAS_SUK_ICELAND',					64,	 		5,				1,					'Suk_Iceland_Atlas_64.dds'),
		('ICON_ATLAS_SUK_ICELAND',					55,	 		5,				1,					'Suk_Iceland_Atlas_55.dds'),
		('ICON_ATLAS_SUK_ICELAND',					50,	 		5,				1,					'Suk_Iceland_Atlas_50.dds'),
		('ICON_ATLAS_SUK_ICELAND',					48,	 		5,				1,					'Suk_Iceland_Atlas_48.dds'),
		('ICON_ATLAS_SUK_ICELAND',					45,	 		5,				1,					'Suk_Iceland_Atlas_45.dds'),
		('ICON_ATLAS_SUK_ICELAND',					40,	 		5,				1,					'Suk_Iceland_Atlas_40.dds'),
		('ICON_ATLAS_SUK_ICELAND',					38,	 		5,				1,					'Suk_Iceland_Atlas_38.dds'),
		('ICON_ATLAS_SUK_ICELAND',					36,	 		5,				1,					'Suk_Iceland_Atlas_36.dds'),
		('ICON_ATLAS_SUK_ICELAND',					32,	 		5,				1,					'Suk_Iceland_Atlas_32.dds'),
		('ICON_ATLAS_SUK_ICELAND',					30,	 		5,				1,					'Suk_Iceland_Atlas_30.dds'),
		('ICON_ATLAS_SUK_ICELAND',					22,	 		5,				1,					'Suk_Iceland_Atlas_22.dds');	
-------------------------------------
-- IconDefinitions
-------------------------------------	
INSERT INTO IconDefinitions	
		(Name,												Atlas, 									'Index')
VALUES  ('ICON_CIVILIZATION_SUK_ICELAND',					'ICON_ATLAS_SUK_ICELAND',				0),
		('ICON_LEADER_SUK_INGOLFUR',						'ICON_ATLAS_SUK_ICELAND',				1),
		('ICON_DISTRICT_SUK_TORFBAEIR',						'ICON_ATLAS_SUK_ICELAND',				2),
		('ICON_UNIT_SUK_LAWSPEAKER',						'ICON_ATLAS_SUK_ICELAND',				4),
		('ICON_BUILDING_SUK_LAWSPEAKER',					'ICON_ATLAS_BUILDINGS',					1),

		('ICON_UNIT_SUK_LAWSPEAKER_PORTRAIT',						'ICON_ATLAS_SUK_ICELAND',			3),
		('ICON_ETHNICITY_AFRICAN_UNIT_SUK_LAWSPEAKER_PORTRAIT',		'ICON_ATLAS_SUK_ICELAND',			3),
		('ICON_ETHNICITY_SOUTHAM_UNIT_SUK_LAWSPEAKER_PORTRAIT',		'ICON_ATLAS_SUK_ICELAND',			3),
		('ICON_ETHNICITY_MEDIT_UNIT_SUK_LAWSPEAKER_PORTRAIT',		'ICON_ATLAS_SUK_ICELAND',			3),
		('ICON_ETHNICITY_ASIAN_UNIT_SUK_LAWSPEAKER_PORTRAIT',		'ICON_ATLAS_SUK_ICELAND',			3);
--=============================================================================================	============================
--==========================================================================================================================