--Alcazars: DEFAULT +2 culture, +4 Defense Strength + fortification bonus for units on tile. Add +0.5 housing, increase to +3 culture, double tourism when Flight is researched (like other cultural improvements). Cannot build next to one another.
UPDATE Improvements SET Housing = '1', TilesRequired = '2', SameAdjacentValid = '0' WHERE ImprovementType = 'IMPROVEMENT_ALCAZAR' ;
UPDATE Improvement_YieldChanges SET YieldChange = '3' WHERE ImprovementType = 'IMPROVEMENT_ALCAZAR' ;

--Colossal heads: DEFAULT +2 faith, +1 culture with Humanism. Add flat +1 culture. Cannot build next to one another.
UPDATE Improvement_YieldChanges SET YieldChange = '1' WHERE ImprovementType = 'IMPROVEMENT_COLOSSAL_HEAD' AND YieldType = 'YIELD_CULTURE' ;
UPDATE Improvements SET SameAdjacentValid = '0' WHERE ImprovementType = 'IMPROVEMENT_COLOSSAL_HEAD' ;

--Chateaux: DEFAULT +2 culture, +2 culture if next to Wonder, +1 gold if next to luxury. Add +0.5 housing, remove river requirement, and change to +2 gold if next to luxury. +2 food with Scientific Theory.
UPDATE Improvements SET Housing = '1', TilesRequired = '2', RequiresRiver = '0' WHERE ImprovementType = 'IMPROVEMENT_CHATEAU' ;
UPDATE ModifierArguments SET Value = '2' WHERE ModifierId = 'CHATEAU_LUXURYADJACENCY_GOLD' AND Name = 'Amount' ;
INSERT INTO Improvement_YieldChanges (ImprovementType, YieldType, YieldChange) VALUES ('IMPROVEMENT_CHATEAU', 'YIELD_FOOD', '0') ;
INSERT INTO Improvement_BonusYieldChanges (ImprovementType, YieldType, BonusYieldChange, PrereqTech) VALUES ('IMPROVEMENT_CHATEAU', 'YIELD_FOOD', '2', 'TECH_SCIENTIFIC_THEORY') ;

--Great Wall: DEFAULT +4 strength for occupying unit, +1 gold adjacency (with Masonry), +1 culture adjacency (with Castles). Add 0.25 housing. Allows it to be built outside your territory and on forest, marsh, and floodplains.
UPDATE Improvements SET Housing = '1', TilesRequired = '4' WHERE ImprovementType = 'IMPROVEMENT_GREAT_WALL' ;
UPDATE Improvements SET CanBuildOutsideTerritory = '1' WHERE ImprovementType = 'IMPROVEMENT_GREAT_WALL' ;
INSERT INTO Improvement_ValidFeatures (ImprovementType, FeatureType) VALUES ('IMPROVEMENT_GREAT_WALL', 'FEATURE_FOREST') ;
INSERT INTO Improvement_ValidFeatures (ImprovementType, FeatureType) VALUES ('IMPROVEMENT_GREAT_WALL', 'FEATURE_MARSH') ;
INSERT INTO Improvement_ValidFeatures (ImprovementType, FeatureType) VALUES ('IMPROVEMENT_GREAT_WALL', 'FEATURE_FLOODPLAINS') ;

--Kurgan: DEFAULT +1 gold, +1 faith, +1 faith from adjacent pastures, +1 gold from Guilds, and +1 gold from Capitalism. Add +1 culture from Natural History and double tourism when Flight is researched (like other cultural improvements). Increase to +2 gold. Can no longer build two next to one another.
INSERT INTO Improvement_YieldChanges (ImprovementType, YieldType, YieldChange) VALUES ('IMPROVEMENT_KURGAN', 'YIELD_CULTURE', '0') ;
UPDATE Improvement_YieldChanges SET YieldChange = '2' WHERE ImprovementType = 'IMPROVEMENT_KURGAN' AND YieldType = 'YIELD_GOLD' ;
INSERT INTO Improvement_BonusYieldChanges (ImprovementType, YieldType, BonusYieldChange, PrereqCivic) VALUES ('IMPROVEMENT_KURGAN', 'YIELD_CULTURE', '1', 'CIVIC_NATURAL_HISTORY') ;
INSERT INTO Improvement_Tourism (ImprovementType, TourismSource, PrereqTech, ScalingFactor) VALUES ('IMPROVEMENT_KURGAN', 'TOURISMSOURCE_CULTURE', 'TECH_FLIGHT', '100') ;
UPDATE Improvements SET SameAdjacentValid ='0' WHERE ImprovementType = 'IMPROVEMENT_KURGAN' ;

--Mission: DEFAULT +2 faith, +2 faith if on a different continent, +1 science if next to campus, +2 science with Cultural Heritage. Add +0.5 housing, +1 gold with Colonialism, and +1 production with Colonialism.. Cannot build next to one another.
UPDATE Improvements SET Housing = '1', TilesRequired = '2', SameAdjacentValid = '0' WHERE ImprovementType = 'IMPROVEMENT_MISSION' ;
INSERT INTO Improvement_YieldChanges (ImprovementType, YieldType, YieldChange) VALUES ('IMPROVEMENT_MISSION', 'YIELD_GOLD', '0') ;
INSERT INTO Improvement_YieldChanges (ImprovementType, YieldType, YieldChange) VALUES ('IMPROVEMENT_MISSION', 'YIELD_PRODUCTION', '0') ;
INSERT INTO Improvement_BonusYieldChanges (ImprovementType, YieldType, BonusYieldChange, PrereqCivic) VALUES ('IMPROVEMENT_MISSION', 'YIELD_GOLD', '1', 'CIVIC_COLONIALISM') ;
INSERT INTO Improvement_BonusYieldChanges (ImprovementType, YieldType, BonusYieldChange, PrereqCivic) VALUES ('IMPROVEMENT_MISSION', 'YIELD_PRODUCTION', '1', 'CIVIC_COLONIALISM') ;

--Monastery: Default +2 faith. Make it +3 faith. Add 0.5 housing. Cannot build next to one another.
UPDATE Improvements SET Housing = '1', TilesRequired = '2', SameAdjacentValid = '0' WHERE ImprovementType = 'IMPROVEMENT_MONASTERY' ;
UPDATE Improvement_YieldChanges SET YieldChange = '3' WHERE ImprovementType = 'IMPROVEMENT_MONASTERY' ;

--Sphinx: Default +1 faith, +1 culture, +2 faith next to wonder, +1 culture with Natural History. Add +1 production if built on flat desert, +1 gold to surrounding tiles.
INSERT INTO Requirements (RequirementId, RequirementType) VALUES ('P_REQUIRES_TERRAIN_IS_DESERT', 'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES') ;
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES ('P_REQUIRES_TERRAIN_IS_DESERT', 'TerrainType', 'TERRAIN_DESERT') ;
INSERT INTO Requirements (RequirementId, RequirementType) VALUES ('P_REQUIRES_TERRAIN_IS_DESERT_HILLS', 'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES') ;
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES ('P_REQUIRES_TERRAIN_IS_DESERT_HILLS', 'TerrainType', 'TERRAIN_DESERT_HILLS') ;
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('P_TERRAIN_IS_DESERT', 'REQUIREMENTSET_TEST_ANY') ;
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('P_TERRAIN_IS_DESERT', 'P_REQUIRES_TERRAIN_IS_DESERT') ;
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('P_TERRAIN_IS_DESERT', 'P_REQUIRES_TERRAIN_IS_DESERT_HILLS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('P_SPHINX_DESERT_PROD', 'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS', 'P_TERRAIN_IS_DESERT') ;
INSERT INTO ImprovementModifiers (ImprovementType, ModifierID) VALUES ('IMPROVEMENT_SPHINX', 'P_SPHINX_DESERT_PROD') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('P_SPHINX_DESERT_PROD', 'YieldType', 'YIELD_PRODUCTION') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('P_SPHINX_DESERT_PROD', 'Amount', '1') ;

INSERT INTO Requirements (RequirementId, RequirementType) VALUES ('POK_REQUIRES_ADJACENT_TO_SPHINX', 'REQUIREMENT_PLOT_ADJACENT_IMPROVEMENT_TYPE_MATCHES');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES ('POK_REQUIRES_ADJACENT_TO_SPHINX', 'ImprovementType', 'IMPROVEMENT_SPHINX');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('POK_PLOT_ADJACENT_TO_SPHINX', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetREquirements (RequirementSetId, RequirementId) VALUES ('POK_PLOT_ADJACENT_TO_SPHINX', 'POK_REQUIRES_ADJACENT_TO_SPHINX');

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('P_SPHINX_GOLD', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'POK_PLOT_ADJACENT_TO_SPHINX') ;
INSERT INTO TraitModifiers (TraitType, ModifierID) VALUES ('TRAIT_CIVILIZATION_ITERU', 'P_SPHINX_GOLD') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('P_SPHINX_GOLD', 'YieldType', 'YIELD_GOLD') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('P_SPHINX_GOLD', 'Amount', '1') ;

--Stepwell: Default +1 housing, +1 food, +1 food if next to farm, +1 faith if next to Holy Site, +1 housing with Sanitation, +1 faith with Feudalism, +1 food with Professional Sports. Add base +1 faith, increase food by 1. Cannot build next to one another.
UPDATE Improvement_YieldChanges SET YieldChange = '1' WHERE ImprovementType = 'IMPROVEMENT_STEPWELL' AND YieldType ='YIELD_FAITH' ;
UPDATE Improvements SET SameAdjacentValid = '0' WHERE ImprovementType = 'IMPROVEMENT_STEPWELL' ;

--Ziggurats: DEFAULT +2 science, +1 culture next to river, +1 culture w/ Natural History. Remove river adjacency in favor of a flat +1 culture to free up river tiles for better uses. Add +0.5 housing, +1 gold. +1 faith on desert tiles. Cannot build next to one another.
DELETE FROM ImprovementModifiers WHERE ImprovementType = 'IMPROVEMENT_ZIGGURAT' ;
INSERT INTO Improvement_YieldChanges (ImprovementType, YieldType, YieldChange) VALUES ('IMPROVEMENT_ZIGGURAT', 'YIELD_GOLD', '1') ;
UPDATE Improvement_YieldChanges SET YieldChange = '1' WHERE ImprovementType = 'IMPROVEMENT_ZIGGURAT' AND YieldType = 'YIELD_CULTURE'  ;
UPDATE Improvements SET SameAdjacentValid = '0' WHERE ImprovementType = 'IMPROVEMENT_ZIGGURAT' ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('P_ZIG_DESERT_FAITH', 'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS', 'P_TERRAIN_IS_DESERT') ;
INSERT INTO ImprovementModifiers (ImprovementType, ModifierID) VALUES ('IMPROVEMENT_ZIGGURAT', 'P_ZIG_DESERT_FAITH') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('P_ZIG_DESERT_FAITH', 'YieldType', 'YIELD_FAITH') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('P_ZIG_DESERT_FAITH', 'Amount', '1') ;

--Pairidaeza: DEFAULT +2 gold, +1 culture, +2 appeal, +1 culture for adjacent Holy Site and Theater Square, +1 gold for each Commercial Hub and City Center, +1 culture with Diplomatic Service, Tourism = Culture with Flight. Add +1 gold next to Wonders, +1 faith next to Holy Site with Theology.
INSERT INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentWonder) SELECT 'Pairidaeza_WonderGold2Adjacency', 'Placeholder', 'YIELD_GOLD', '1', '1', '1' WHERE EXISTS (SELECT * FROM CivilizationLeaders WHERE CivilizationType = 'CIVILIZATION_PERSIA') ;
INSERT INTO Improvement_Adjacencies (ImprovementType, YieldChangeId) SELECT 'IMPROVEMENT_PAIRIDAEZA', 'Pairidaeza_WonderGold2Adjacency' WHERE EXISTS (SELECT * FROM CivilizationLeaders WHERE CivilizationType = 'CIVILIZATION_PERSIA') ;
INSERT INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentNaturalWonder) SELECT 'Pairidaeza_WonderFaithAdjacency', 'Placeholder', 'YIELD_FAITH', '1', '1', '1' WHERE EXISTS (SELECT * FROM CivilizationLeaders WHERE CivilizationType = 'CIVILIZATION_PERSIA') ;
INSERT INTO Improvement_Adjacencies (ImprovementType, YieldChangeId) SELECT 'IMPROVEMENT_PAIRIDAEZA', 'Pairidaeza_WonderFaithAdjacency' WHERE EXISTS (SELECT * FROM CivilizationLeaders WHERE CivilizationType = 'CIVILIZATION_PERSIA') ;

--Outback Station: Add +1 gold flat, and +1 gold for every adjacent Plantation.
INSERT INTO Improvement_YieldChanges (ImprovementType, YieldType, YieldChange) SELECT 'IMPROVEMENT_OUTBACK_STATION', 'YIELD_GOLD', '1' WHERE EXISTS (SELECT * FROM CivilizationLeaders WHERE CivilizationType = 'CIVILIZATION_AUSTRALIA') ;
INSERT INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentImprovement) SELECT 'Outback_Plantation_Gold', 'Placeholder', 'YIELD_GOLD', '1', '1', 'IMPROVEMENT_PLANTATION' WHERE EXISTS (SELECT * FROM CivilizationLeaders WHERE CivilizationType = 'CIVILIZATION_AUSTRALIA') ;
INSERT INTO Improvement_Adjacencies (ImprovementType, YieldChangeId) SELECT 'IMPROVEMENT_OUTBACK_STATION', 'Outback_Plantation_Gold' WHERE EXISTS (SELECT * FROM CivilizationLeaders WHERE CivilizationType = 'CIVILIZATION_AUSTRALIA') ;

--Nubian Pyramid: Add 1 more faith, can be built on plains and grasslands.
INSERT INTO Improvement_ValidTerrains (ImprovementType, TerrainType) SELECT 'IMPROVEMENT_PYRAMID', 'TERRAIN_GRASS' WHERE EXISTS (SELECT * FROM CivilizationLeaders WHERE CivilizationType = 'CIVILIZATION_NUBIA') ;
INSERT INTO Improvement_ValidTerrains (ImprovementType, TerrainType) SELECT 'IMPROVEMENT_PYRAMID', 'TERRAIN_GRASS_HILLS' WHERE EXISTS (SELECT * FROM CivilizationLeaders WHERE CivilizationType = 'CIVILIZATION_NUBIA') ;
INSERT INTO Improvement_ValidTerrains (ImprovementType, TerrainType) SELECT 'IMPROVEMENT_PYRAMID', 'TERRAIN_PLAINS' WHERE EXISTS (SELECT * FROM CivilizationLeaders WHERE CivilizationType = 'CIVILIZATION_NUBIA') ;
INSERT INTO Improvement_ValidTerrains (ImprovementType, TerrainType) SELECT 'IMPROVEMENT_PYRAMID', 'TERRAIN_PLAINS_HILLS' WHERE EXISTS (SELECT * FROM CivilizationLeaders WHERE CivilizationType = 'CIVILIZATION_NUBIA') ;
UPDATE Improvement_YieldChanges SET YieldChange='2' WHERE ImprovementType='IMPROVEMENT_PYRAMID' AND YieldType='YIELD_FAITH';

--Kampung: Add +1 gold for adjacent Fishing Boats.
INSERT INTO Improvement_YieldChanges (ImprovementType, YieldType, YieldChange) SELECT 'IMPROVEMENT_KAMPUNG', 'YIELD_GOLD', '0' WHERE EXISTS (SELECT * FROM CivilizationLeaders WHERE CivilizationType = 'CIVILIZATION_INDONESIA') ;
INSERT INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentImprovement) SELECT 'Pok_Kampung_BoatGoldAdjacency', 'Placeholder', 'YIELD_GOLD', '1', '1', 'IMPROVEMENT_FISHING_BOATS' WHERE EXISTS (SELECT * FROM CivilizationLeaders WHERE CivilizationType = 'CIVILIZATION_INDONESIA') ;
INSERT INTO Improvement_Adjacencies (ImprovementType, YieldChangeId) SELECT 'IMPROVEMENT_KAMPUNG', 'Pok_Kampung_BoatGoldAdjacency' WHERE EXISTS (SELECT * FROM CivilizationLeaders WHERE CivilizationType = 'CIVILIZATION_INDONESIA') ;
