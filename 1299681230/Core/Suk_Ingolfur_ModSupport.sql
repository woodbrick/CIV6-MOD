--==========================================================================================================================
-- JFD RULE WITH FAITH
--==========================================================================================================================
-- Civilization_Titles 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Civilization_Titles (
	CivilizationType  										text 		 																			default null,
	GovernmentType											text 	REFERENCES Governments(GovernmentType) ON DELETE CASCADE ON UPDATE CASCADE		default null,
	LeaderTitle												text																					default null,
	PolicyType  											text 		 																			default null,
	IsNoSpace												boolean																					default 0,
	IsSuffix												boolean																					default 0);	
	
INSERT INTO Civilization_Titles
		(CivilizationType, 					GovernmentType, 							PolicyType,				LeaderTitle)
VALUES	('CIVILIZATION_SUK_ICELAND',		'GOVERNMENT_CHIEFDOM',						null,					'LOC_GOVERNMENT_JFD_CHIEFDOM_LEADER_TITLE_SUK_ICELAND'),						
		('CIVILIZATION_SUK_ICELAND',		'GOVERNMENT_JFD_HORDE',						null,					'LOC_GOVERNMENT_JFD_HORDE_LEADER_TITLE_SUK_ICELAND'),						
		('CIVILIZATION_SUK_ICELAND',		'GOVERNMENT_JFD_POLIS',						null,					'LOC_GOVERNMENT_JFD_POLIS_LEADER_TITLE_SUK_ICELAND'),						
		('CIVILIZATION_SUK_ICELAND',		'GOVERNMENT_AUTOCRACY',						null,					'LOC_GOVERNMENT_JFD_AUTOCRACY_LEADER_TITLE_NORWAY'),					
		('CIVILIZATION_SUK_ICELAND',		'GOVERNMENT_OLIGARCHY',						null,					'LOC_GOVERNMENT_JFD_OLIGARCHY_LEADER_TITLE_SUK_ICELAND'),					
		('CIVILIZATION_SUK_ICELAND',		'GOVERNMENT_CLASSICAL_REPUBLIC',			null,					'LOC_GOVERNMENT_JFD_CLASSICAL_DEMOCRACY_LEADER_TITLE_SUK_ICELAND'),			
		('CIVILIZATION_SUK_ICELAND',		'GOVERNMENT_MERCHANT_REPUBLIC',				null,					'LOC_GOVERNMENT_JFD_MERCHANT_REPUBLIC_LEADER_TITLE_SUK_ICELAND'),			
		('CIVILIZATION_SUK_ICELAND',		'GOVERNMENT_MONARCHY',						null,					'LOC_GOVERNMENT_JFD_FEUDAL_MONARCHY_LEADER_TITLE_SUK_ICELAND'),						
		('CIVILIZATION_SUK_ICELAND',		'GOVERNMENT_JFD_ABSOLUTE_MONARCHY',			null,					'LOC_GOVERNMENT_JFD_MONARCHY_LEADER_TITLE_SUK_ICELAND'),						
		('CIVILIZATION_SUK_ICELAND',		'GOVERNMENT_JFD_CONSTITUTIONAL_MONARCHY',	null,					'LOC_GOVERNMENT_JFD_FEUDAL_MONARCHY_LEADER_TITLE_SUK_ICELAND'),						
		('CIVILIZATION_SUK_ICELAND',		'GOVERNMENT_JFD_NOBLE_REPUBLIC',			null,					'LOC_GOVERNMENT_JFD_NOBLE_REPUBLIC_LEADER_TITLE_SUK_ICELAND'),				
		('CIVILIZATION_SUK_ICELAND',		'GOVERNMENT_DEMOCRACY',						null,					'LOC_GOVERNMENT_JFD_LIBERAL_DEMOCRACY_LEADER_TITLE_SUK_ICELANDLOC_GOVERNMENT_JFD_MILITARY_GUARDIANSHIP_LEADER_TITLE_SUK_ICELAND'),			
		('CIVILIZATION_SUK_ICELAND',		'GOVERNMENT_COMMUNISM',						null,					'LOC_GOVERNMENT_JFD_PEOPLES_REPUBLIC_LEADER_TITLE_SUK_ICELAND'),				
		('CIVILIZATION_SUK_ICELAND',		'GOVERNMENT_FASCISM',						null,					'LOC_GOVERNMENT_JFD_MILITARY_GUARDIANSHIP_LEADER_TITLE_SUK_ICELAND'),		
		('CIVILIZATION_SUK_ICELAND',		null,										'POLICY_JFD_EMPIRE',	'LOC_GOVERNMENT_JFD_MONARCHY_LEADER_TITLE_SUK_ICELAND');

DELETE FROM Civilization_Titles 
WHERE CivilizationType = 'CIVILIZATION_SUK_ICELAND' AND GovernmentType IS NOT null
AND GovernmentType NOT IN (SELECT GovernmentType FROM Governments);

DELETE FROM Civilization_Titles 
WHERE CivilizationType = 'CIVILIZATION_SUK_ICELAND' AND PolicyType IS NOT null
AND PolicyType NOT IN (SELECT PolicyType FROM Policies);
--==========================================================================================================================
--==========================================================================================================================