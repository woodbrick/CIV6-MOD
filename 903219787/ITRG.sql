-- ITRG
-- Author: fodazd
-- DateCreated: 4/11/2017 5:21:44 PM
--------------------------------------------------------------

INSERT INTO DistrictModifiers (DistrictType, ModifierId) VALUES ('DISTRICT_CITY_CENTER', 'CITY_CENTER_INCOMING_TRADE_ROUTE_GOLD');
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId) VALUES ('CITY_CENTER_INCOMING_TRADE_ROUTE_GOLD', 'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FROM_OTHERS', '1', '1', NULL);
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('CITY_CENTER_INCOMING_TRADE_ROUTE_GOLD', 'YieldType', 'YIELD_GOLD'), ('CITY_CENTER_INCOMING_TRADE_ROUTE_GOLD', 'Amount', '2');
