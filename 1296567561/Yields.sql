--============================================================
--LUXURY RESOURCES
--============================================================
INSERT INTO Resource_YieldChanges 
		(ResourceType,			YieldType,			YieldChange)
VALUES	('RESOURCE_TEA',		'YIELD_CULTURE',	1),
		('RESOURCE_TOBACCO',	'YIELD_CULTURE',	1),
		('RESOURCE_INCENSE',	'YIELD_CULTURE',	1),
		('RESOURCE_COFFEE',		'YIELD_PRODUCTION',	1),
		('RESOURCE_DYES',		'YIELD_GOLD',		2),
		('RESOURCE_SILK',		'YIELD_GOLD',		2),
		('RESOURCE_JADE',		'YIELD_FAITH',		1),
		('RESOURCE_MERCURY',	'YIELD_CULTURE',	1),
		('RESOURCE_MARBLE',		'YIELD_PRODUCTION',	1),
		('RESOURCE_PEARLS',		'YIELD_CULTURE',	1);

UPDATE Resource_YieldChanges SET YieldChange=2 WHERE ResourceType='RESOURCE_FURS' and YieldType='YIELD_GOLD';
UPDATE Resource_YieldChanges SET YieldChange=2 WHERE ResourceType='RESOURCE_IVORY' and YieldType='YIELD_GOLD';
UPDATE Resource_YieldChanges SET YieldChange=2 WHERE ResourceType='RESOURCE_SALT' and YieldType='YIELD_GOLD';
UPDATE Resource_YieldChanges SET YieldChange=2 WHERE ResourceType='RESOURCE_GYPSUM' and YieldType='YIELD_GOLD';
UPDATE Resource_YieldChanges SET YieldChange=2 WHERE ResourceType='RESOURCE_WINE' and YieldType='YIELD_GOLD';
UPDATE Resource_YieldChanges SET YieldChange=4 WHERE ResourceType='RESOURCE_COTTON' and YieldType='YIELD_GOLD';
UPDATE Resource_YieldChanges SET YieldChange=4 WHERE ResourceType='RESOURCE_COCOA' and YieldType='YIELD_GOLD';
UPDATE Resource_YieldChanges SET YieldChange=4 WHERE ResourceType='RESOURCE_SILVER' and YieldType='YIELD_GOLD';
UPDATE Resource_YieldChanges SET YieldChange=4 WHERE ResourceType='RESOURCE_DIAMONDS' and YieldType='YIELD_GOLD';
UPDATE Resource_YieldChanges SET YieldChange=4 WHERE ResourceType='RESOURCE_TRUFFLES' and YieldType='YIELD_GOLD';
UPDATE Resource_YieldChanges SET YieldChange=2 WHERE ResourceType='RESOURCE_STONE' and YieldType='YIELD_PRODUCTION';
UPDATE Resource_YieldChanges SET YieldChange=2 WHERE ResourceType='RESOURCE_OLIVES' and YieldType='YIELD_GOLD'; --Rise and Fall
UPDATE Resource_YieldChanges SET YieldChange=2 WHERE ResourceType='RESOURCE_CVS_ELECTRUM' and YieldType='YIELD_GOLD'; --Resources Expanded
UPDATE Resource_YieldChanges SET YieldChange=2 WHERE ResourceType='RESOURCE_CVS_CEDAR' and YieldType='YIELD_PRODUCTION'; --Resources Expanded



INSERT INTO Resource_YieldChanges (ResourceType, YieldType, YieldChange) SELECT 'RESOURCE_AMBER', 'YIELD_SCIENCE', '1' FROM Resources WHERE ResourceType='RESOURCE_AMBER' ;
INSERT INTO Resource_YieldChanges (ResourceType, YieldType, YieldChange) SELECT 'RESOURCE_TURTLES', 'YIELD_GOLD', '2' FROM Resources WHERE ResourceType='RESOURCE_TURTLES' ;
INSERT INTO Resource_YieldChanges (ResourceType, YieldType, YieldChange) SELECT 'RESOURCE_SUK_OBSIDIAN', 'YIELD_CULTURE', '1' FROM Resources WHERE ResourceType='RESOURCE_SUK_OBSIDIAN' ;
INSERT INTO Resource_YieldChanges (ResourceType, YieldType, YieldChange) SELECT 'RESOURCE_P0K_PENGUINS', 'YIELD_GOLD', '2' FROM Resources WHERE ResourceType='RESOURCE_P0K_PENGUINS' ;


--============================================================
--STRATEGIC RESOURCES
--============================================================
INSERT INTO Resource_YieldChanges 
		(ResourceType,			YieldType,			YieldChange)
VALUES	('RESOURCE_ALUMINUM',	'YIELD_PRODUCTION',	1),
		('RESOURCE_IRON',		'YIELD_PRODUCTION',	1);
