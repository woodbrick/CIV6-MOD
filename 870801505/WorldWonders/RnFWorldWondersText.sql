--Expansion Wonders
UPDATE LocalizedText SET Text="+15% faster growth and 3 Loyalty per turn for cities on your original [ICON_Capital] Capital's continent. +25% [ICON_Gold] Gold and +10% [ICON_Production] Production for cities on your original [ICON_Capital] Capital's continent with two or more specialty districts. Must be built on the coast adjacent to the City Center." WHERE Tag='LOC_BUILDING_STATUE_LIBERTY_DESCRIPTION' AND Language='en_US';
UPDATE LocalizedText SET Text="+100% [ICON_Tourism] Religious Tourism in your cities. +1 [ICON_Food] Food, +1 [ICON_Production] Production, and +1 [ICON_Culture] Culture on all Tundra tiles for this city. Must be built on a tundra tile and adjacent to the City Center." WHERE Tag='LOC_BUILDING_ST_BASILS_CATHEDRAL_DESCRIPTION' AND Language='en_US';
UPDATE LocalizedText SET Text="+1 Era Score from Historic Moment earned after this wonder is complete if that Moment is usually worth 2 or more Era Score. During a [ICON_GLORY_GOLDEN_AGE] Golden Age, this city gets +20% [ICON_Production] Production and Growth, as well as +15% [ICON_Science] Science, [ICON_Culture] Culture, [ICON_Gold] Gold, and [ICON_Faith] Faith. Must be built next to a river." WHERE Tag='LOC_BUILDING_TAJ_MAHAL_DESCRIPTION' AND Language='en_US';
UPDATE LocalizedText SET Text="Grants 4 Warrior Monks. Receive a Warrior Monk when you finish building a Holy Site district. Your Warrior Monks get +6 [ICON_Strength] Combat Strength and +50% Experience points. [NEWLINE][NEWLINE]Must be built adjacent to a Holy Site district with a Temple. Warrior Monks can only be received if player has founded a religion or if there is a majority religion for this player or city." WHERE Tag='LOC_BUILDING_KOTOKU_IN_DESCRIPTION' AND Language='en_US';

--Base Game Wonders
UPDATE LocalizedText SET Text="Triggers the [ICON_TechBoosted] Eureka moment for a random technology when another player recruits a [ICON_GreatScientist] Great Scientist and when you recruit a [ICON_GreatWriter] Great Writer. +1 [ICON_GreatWriter] Great Writer point per turn in each of your Campus districts with Libraries. Must be built on flat land adjacent to a Campus district with a Library." WHERE Tag='LOC_BUILDING_GREAT_LIBRARY_DESCRIPTION' AND Language='en_US';
UPDATE LocalizedText SET Text="+1 Wildcard policy slot[NEWLINE][NEWLINE]All your cities within 6 tiles are always 100% Loyal.[NEWLINE][NEWLINE]Must be built on flat land adjacent to the City Center." WHERE Tag='LOC_BUILDING_FORBIDDEN_CITY_DESCRIPTION' AND Language='en_US';
UPDATE LocalizedText SET Text="Missionaries and Apostles can spread Religion 1 extra time. +20% [ICON_Faith] Faith to your cities within 6 tiles of Hagia Sophia. +2 [ICON_Science] Science to Holy Site districts for each building in the district. Must be built on flat land adjacent to a Holy Site district, and you must have founded a Religion." WHERE Tag='LOC_BUILDING_HAGIA_SOPHIA_DESCRIPTION' AND Language='en_US';
UPDATE LocalizedText SET Text="+20% [ICON_Culture] Culture to your cities within 6 tiles of Hermitage. +3 [ICON_Culture] Culture from [ICON_GreatWork_Landscape] Great Works of Art. Must be built along a River." WHERE Tag='LOC_BUILDING_HERMITAGE_DESCRIPTION' AND Language='en_US';
UPDATE LocalizedText SET Text="Awards 2 randomly-chosen free technologies when completed. +20% [ICON_Science] Science to your cities within 6 tiles of Oxford University. Must be built on Grassland or Plains adjacent to a Campus district with a University." WHERE Tag='LOC_BUILDING_OXFORD_UNIVERSITY_DESCRIPTION' AND Language='en_US';
UPDATE LocalizedText SET Text="+1 [ICON_Production] Production for each Mine, Quarry, and Lumbermill in your territory when the improvement is adjacent to a river. +20% [ICON_Production] Production to your cities within 6 tiles of Ruhr Valley. Must be built along a River adjacent to an Industrial Zone district with a Factory." WHERE Tag='LOC_BUILDING_RUHR_VALLEY_DESCRIPTION' AND Language='en_US';

--ModifierStrings
INSERT INTO LocalizedText (Tag, Text, Language) VALUES ('LOC_MAGIL_KOTOKU_IN_COMBAT_BONUS', "+6 [ICON_Strength] Strength from Kotoku-in", 'en_US');