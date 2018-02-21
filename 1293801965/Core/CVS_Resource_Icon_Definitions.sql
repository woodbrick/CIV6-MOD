-- IconTextureAtlases
-------------------------------------	
INSERT INTO IconTextureAtlases	
		(Name,										IconSize,	IconsPerRow,	IconsPerColumn,		Filename)
VALUES  ('ICON_ATLAS_CVS_RESOURCES',				256,	 	8,				8,					'CVS_Resource_Atlas_256.dds'),
		('ICON_ATLAS_CVS_RESOURCES',				64,	 		8,				8,					'CVS_Resource_Atlas_64.dds'),
		('ICON_ATLAS_CVS_RESOURCES_FOW',			64,	 		8,				8,					'CVS_Resource_Atlas_FOW.dds'),
		('ICON_ATLAS_CVS_RESOURCES',				50,	 		8,				8,					'CVS_Resource_Atlas_50.dds'),
		('ICON_ATLAS_CVS_RESOURCES',				38,	 		8,				8,					'CVS_Resource_Atlas_38.dds');

INSERT INTO IconTextureAtlases	
		(Name,										Baseline,	IconSize,	IconsPerRow,	IconsPerColumn,		Filename)
VALUES  ('ICON_ATLAS_CVS_RESOURCES',				6,			22,	 		8,				8,					'CVS_Resource_Atlas_22.dds');		
-------------------------------------
-- IconDefinitions
-------------------------------------	
INSERT INTO IconDefinitions	
		(Name,												Atlas, 									'Index')
VALUES  ('ICON_RESOURCE_P0K_PENGUINS',						'ICON_ATLAS_CVS_RESOURCES',				1),
		('RESOURCE_P0K_PENGUINS',							'ICON_ATLAS_CVS_RESOURCES',				1),
		('ICON_RESOURCE_P0K_PENGUINS_FOW',					'ICON_ATLAS_CVS_RESOURCES_FOW',			1),
		('ICON_RESOURCE_CVS_POMEGRANATES',					'ICON_ATLAS_CVS_RESOURCES',				2),
		('RESOURCE_CVS_POMEGRANATES',						'ICON_ATLAS_CVS_RESOURCES',				2),
		('ICON_RESOURCE_CVS_POMEGRANATES_FOW',				'ICON_ATLAS_CVS_RESOURCES_FOW',			2),
		('ICON_RESOURCE_CVS_ELECTRUM',						'ICON_ATLAS_CVS_RESOURCES',				3),
		('RESOURCE_CVS_ELECTRUM',							'ICON_ATLAS_CVS_RESOURCES',				3),
		('ICON_RESOURCE_CVS_ELECTRUM_FOW',					'ICON_ATLAS_CVS_RESOURCES_FOW',			3),
		('ICON_RESOURCE_CVS_CEDAR',							'ICON_ATLAS_CVS_RESOURCES',				4),
		('RESOURCE_CVS_CEDAR',								'ICON_ATLAS_CVS_RESOURCES',				4),
		('ICON_RESOURCE_CVS_CEDAR_FOW',						'ICON_ATLAS_CVS_RESOURCES_FOW',			4);