--Remove full Religious Tourism from Cristo Redentor--this is a function of the Apostolic Palace in the combined mod
DELETE FROM BuildingModifiers WHERE BuildingType="BUILDING_CRISTO_REDENTOR" AND ModifierId="CRISTOREDENTOR_FULLRELIGIOUSTOURISM";

--Remove GPP from Districts from Oracle--this is a function of the National Epic in the combined mod. Replace with +20 GPP towards all current and future Great People
DELETE FROM BuildingModifiers WHERE BuildingType="BUILDING_ORACLE" AND ModifierId="ORACLE_GREATGENERALPOINTS";
DELETE FROM BuildingModifiers WHERE BuildingType="BUILDING_ORACLE" AND ModifierId="ORACLE_GREATADMIRALPOINTS";
DELETE FROM BuildingModifiers WHERE BuildingType="BUILDING_ORACLE" AND ModifierId="ORACLE_GREATENGINEERPOINTS";
DELETE FROM BuildingModifiers WHERE BuildingType="BUILDING_ORACLE" AND ModifierId="ORACLE_GREATMERCHANTPOINTS";
DELETE FROM BuildingModifiers WHERE BuildingType="BUILDING_ORACLE" AND ModifierId="ORACLE_GREATPROPHETPOINTS";
DELETE FROM BuildingModifiers WHERE BuildingType="BUILDING_ORACLE" AND ModifierId="ORACLE_GREATSCIENTISTPOINTS";
DELETE FROM BuildingModifiers WHERE BuildingType="BUILDING_ORACLE" AND ModifierId="ORACLE_GREATWRITERPOINTS";

INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES	('BUILDING_ORACLE', 'MAGIL_ORACLE_CURRENT_AND_FUTURE_GPP');


