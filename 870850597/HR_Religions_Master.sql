--***********************************************************************************************************************************************************************************************
--***********************************************************************************************************************************************************************************************
--HR_Config
--***********************************************************************************************************************************************************************************************
--***********************************************************************************************************************************************************************************************

--==========================================================================================================================	
--==========================================================================================================================	
-- IMPORTANT
--
-- Changing any other aspect of this file aside from the specified value settings will likely prevent the mod from functioning correctly.
--
-- If using this mod in multiplayer, all players must have identical value settings for all entries in the configuration tables.
--
-- You should disable this mod before playing any scenario which makes its own changes to the religion system to prevent conflicts.
--==========================================================================================================================	
--==========================================================================================================================	

CREATE TABLE IF NOT EXISTS 
HR_Denominations (
	Type	text		default		null,
	Value	integer		default		  0); -- DO NOT TOUCH!!

--==========================================================================================================================	
--==========================================================================================================================	
-- DENOMINATION PACKS
--
-- The file may be used to toggle the included denomination packs on or off by changing their value setting to 1 or 0, respectively.
-- The denomination packs are toggled on by default.
--	
-- Note: The Christian denominations can be fully disabled by setting 'HR_CHRISTIAN_DENOMINATIONS' to 1. However, as both Protestantism and 
-- Eastern Orthodoxy are included in the base game, this may cause conflicts with any modded civilization which prefers either of these religions 
-- and does not include support for the Historical Religions mod. Make sure to modify such civilizations before disabling the Christian denominations.
--
-- Denomination packs described as "_EXTENDED" require their base denomination pack to be active (i.e. 'HR_CHRISTIAN_EXTENDED' can only 
-- be activated if 'HR_CHRISTIAN_DENOMINATIONS' is also set to 1).
--==========================================================================================================================	
--==========================================================================================================================	
--
-- Note: Since the July 2017 patch, the pedia entries for some religions may not properly update after disabling certain denominations 
-- (i.e. "Buddhism" may still show the "Theravada" pedia entry even if the Buddhist denominations are disabled). I am looking into correcting this; 
-- however, the issue is mostly aesthetic and does not impact gameplay. The names of the religions will still update properly.
--
--==========================================================================================================================	
--==========================================================================================================================	

INSERT INTO HR_Denominations
		(Type,					Value)
VALUES		('HR_CHRISTIAN_DENOMINATIONS',		    1); -- [0: Christianity <-> 1: Catholicism, Eastern Orthodoxy, Protestantism]
	
INSERT INTO HR_Denominations
		(Type,					Value)
VALUES		('HR_CHRISTIAN_EXTENDED',		    1), -- [0: (No Change) <-> 1: (Adds) Nestorianism, Oriental Orthodoxy, Anglicanism, Restorationism]
		('HR_HERESIES_EXTENDED',		    1), -- [0: (No Change) <-> 1: (Adds) Arianism, Catharism]
		('HR_PROTESTANT_EXTENDED',		    1), -- [0: Protestantism <-> 1: Lutheranism, Calvinism, Baptist Christianity, Methodism, Adventism, Pentecostalism]
		('HR_RESTORATIONISM_EXTENDED',		    1); -- [0: Restorationism <-> 1: Mormonism]
	
INSERT INTO HR_Denominations
		(Type,					Value)
VALUES		('HR_ISLAMIC_DENOMINATIONS',		    1);	-- [0: Islam <-> 1: Sunni, Shia, Ibadi]

INSERT INTO HR_Denominations
		(Type,					Value)
VALUES		('HR_ISLAMIC_EXTENDED',		    	    1); -- [0: (No Change) <-> 1: (Adds) Druze, Ahmadi]
	
INSERT INTO HR_Denominations
		(Type,					Value)
VALUES		('HR_ANDEAN_DENOMINATIONS',	    	    1), -- [0: Pachaism <-> 1: Pachaism, Intiism, Chiminigagua]
		('HR_BALTO_SLAVIC_DENOMINATIONS',	    1), -- [0: Rodnovery <-> 1: Rodnovery, Romuva]
		('HR_BUDDHIST_DENOMINATIONS',		    1), -- [0: Buddhism <-> 1: Theravada, Mahayana, Vajrayana]
		('HR_EGYPTIAN_DENOMINATIONS',		    1), -- [0: Pesedjet <-> 1: Amanaiism, Pesedjet, Atenism]
		('HR_GRECO_ROMAN_DENOMINATIONS',	    1), -- [0: Hellenism <-> 1: Atanodjuwaja Cult, Mysteries, Dodekatheism, Neoplatonism, Numenism, Imperial Cult, Mithraism, Heros Cult]
		('HR_HINDU_DENOMINATIONS',		    1), -- [0: Hinduism <-> 1: Vedism, Shaivism, Shaktism, Vaishnavism, Smartism]	
		('HR_MESOAMERICAN_DENOMINATIONS',	    1), -- [0: Tlateomatiliztli <-> 1: Tzolk'in, Tlateomatiliztli]
		('HR_MESOPOTAMIAN_DENOMINATIONS',	    1), -- [0: Chaldaeanism <-> 1: Chaldaeanism, Ashurism, Napir-tuniis]
		('HR_POLYNESIAN_DENOMINATIONS',	    	    1), -- [0: Puata Tupuna <-> 1: Tala-e-Fonua, Puata Tupuna, Tangata Manu]
		('HR_URALIC_DENOMINATIONS',	    	    1), -- [0: Noaidevuohta <-> 1: Noaidevuohta, Suomenusko]
		('HR_YORUBA_DENOMINATIONS',	    	    1); -- [0: Ifa <-> 1: Ifa, Santeria]

--==========================================================================================================================	
--==========================================================================================================================	
-- HISTORICAL RELIGIONS LIGHT
--
-- Setting 'HR_LIGHT_MODE' to 1 will prompt the mod to load with only a minimum of new religions to represent the officially included leaders.
-- To enable this option, you only need to edit the 'HR_LIGHT_MODE' value and may leave the denomination values as is.
--
-- Note: Historical Religions Light is not customizable with the above denomination packs and will override the individual values set above.
-- However, custom icons may still be toggled on or off with the options below. The custom icon packs are toggled on by default.
--==========================================================================================================================
--==========================================================================================================================		


-- NOTE: I AM CURRENTLY IN THE PROCESS OF UPDATING ALL 140 ICONS FOR COMPATIBILITY WITH RISE AND FALL AND THE RELIGION LENS. LIGHT MODE WILL BE ENABLED BY DEFAULT UNTIL THIS IS COMPLETE.


INSERT INTO HR_Denominations
		(Type,					Value)
VALUES		('HR_LIGHT_MODE',		            1); -- [0: (Loads) All + Set Denominations <-> 1: (Loads) Amatongo, Chaldaeanism, Hellenism, Pesedjet, Sairimaism, Tengriism, Tlateomatiliztli, Wakan Tanka, Witran Mapu]

--==========================================================================================================================	
--==========================================================================================================================	
-- CUSTOM ICONS
--
-- Custom icons (religions without a pre-set name) may be toggled on or off by editing the below value setting to 1 or 0, respectively. 
--
-- This option is available in two sets reflecting the custom icons included in the base game ('HR_CUSTOM_ICONS_BASE') 
-- and the custom icons added by the Historical Religions mod ('HR_CUSTOM_ICONS_EXTRA').
--==========================================================================================================================
--==========================================================================================================================	

INSERT INTO HR_Denominations
		(Type,					Value)
VALUES		('HR_CUSTOM_ICONS_BASE',		    1), -- [0: (Removes) <-> 1: (Adds) the 12 Custom icons included in the base game.]
		('HR_CUSTOM_ICONS_EXTRA',		    0);	-- [0: (Removes) <-> 1: (Adds) the 22 Custom icons added by the Historical Religions mod.]

INSERT INTO HR_Denominations
		(Type,					Value)
VALUES		('HR_CUSTOM_ICONS_UNUSED',		    0), -- [Misc.]
		('HR_CUSTOM_ICONS_SCENARIO',		    0); -- [Scenario Icons]

--==========================================================================================================================	
--==========================================================================================================================	
-- RANDOM RELIGIOUS PREFERENCES
--
-- Setting 'HR_RANDOM_PREFERENCES' to 1 will delete the religious preferences of all leaders, 
-- and leaders will choose a random religion from the list when founding a religion. 
--==========================================================================================================================
--==========================================================================================================================

INSERT INTO HR_Denominations
		(Type,					Value)
VALUES		('HR_RANDOM_PREFERENCES',		    0); -- [0: (Leaders will prefer a historical religion) <-> 1: (Leaders will choose a random religion) when founding a religion.]

--==========================================================================================================================	
--==========================================================================================================================	

--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

--***********************************************************************************************************************************************************************************************
--***********************************************************************************************************************************************************************************************
--HR_Religions
--***********************************************************************************************************************************************************************************************
--***********************************************************************************************************************************************************************************************

---------------------------------------------------------------------------
---------------------------------------------------------------------------

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_AGAKKUNNGURNIQ'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_ANKATTU'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_BAHAI'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_BIRD_FIGURE_CULT'),  				('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_BMUNTU'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_CNAANISM'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_DRUIDISM'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_ITANG'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_JAINISM'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_KACHINA'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_LAIBONI'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_LIIM_DINGIRMES'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_MLAGAN'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_MNDAENISM'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_MANICHAEISM'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_MUISM'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_MSHRIKUN'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_NUM'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_ONYAMESOM'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_OENDA'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_PJELANCA'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_RAZANA'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_SMANISM'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_PHI'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_SGAANAANG'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_SOUTHERN_CULT'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_TMAUKELISM'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_TJUKURPA'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_VOODOO'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_YAZDANISM'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_ZEMIISM'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_POHAKANTENNA'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_MHOMA'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_FAT_ROOG'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_AITO'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_MWARI'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_FORN_SIDR'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_NZAMBIISM'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_MIDEWIWIN'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

INSERT INTO Types
		(Type, 										           Kind)
VALUES	('RELIGION_AMATONGO',  								'KIND_RELIGION'),	
		('RELIGION_SAIRIMAISM',  							'KIND_RELIGION'),
		('RELIGION_TENGRIISM',  							'KIND_RELIGION'),
		('RELIGION_WAKAN_TANKA',  							'KIND_RELIGION'),
		('RELIGION_WITRAN_MAPU',  							'KIND_RELIGION');

---------------------------------------------------------------------------
---------------------------------------------------------------------------

----
--Buddhism Extended
----

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_B1_MAHAYANA'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_BUDDHIST_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_B2_VAJRAYANA'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_BUDDHIST_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

----
--Christianity Extended
----

DELETE FROM Types WHERE Type = 'RELIGION_ORTHODOXY' 
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 0);

DELETE FROM Types WHERE Type = 'RELIGION_PROTESTANTISM' 
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_C1_ORIENTAL'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_C2_NESTORIANISM'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_C3_ANGLICANISM'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_C4_RESTORATIONISM'),  				('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

----
--Protestantism Extended
----

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_P1_CALVINISM'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_PROTESTANT_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_P2_BAPTIST'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_PROTESTANT_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_P3_METHODISM'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_PROTESTANT_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_P5_ADVENTISM'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_PROTESTANT_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_P4_PENTECOSTALISM'),  				('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_PROTESTANT_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

----
--Heresies Extended
----

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_C5_ARIANISM'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_HERESIES_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_C6_CATHARISM'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_HERESIES_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

----
--Hinduism Extended
----

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_H1_VEDISM'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_HINDU_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_H2_VAISHNAVISM'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_HINDU_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_H3_SHAIVISM'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_HINDU_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_H4_SHAKTISM'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_HINDU_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

----
--Islam Extended
----

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_I1_SHIA'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_ISLAMIC_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_I2_IBADI'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_ISLAMIC_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_I3_DRUZE'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_ISLAMIC_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_ISLAMIC_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_I4_AHMADI'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_ISLAMIC_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_ISLAMIC_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

----
--Egyptian Extended
----

INSERT INTO Types
		(Type, 										           Kind)
VALUES  	('RELIGION_PESEDJET',  								'KIND_RELIGION');

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_E1_AMANAIISM'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_EGYPTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_E2_ATENISM'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_EGYPTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

----
--GrecoRoman Extended
----

INSERT INTO Types
		(Type, 										           Kind)
VALUES  	('RELIGION_HELLENISM',  						        'KIND_RELIGION');

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_R1_ATANODJUWAJA_CULT'),  				('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_GRECO_ROMAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_R2_MYSTERIES'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_GRECO_ROMAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_R3_NEOPLATONISM'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_GRECO_ROMAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_R4_NUMENISM'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_GRECO_ROMAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_R5_IMPERIAL_CULT'),  				('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_GRECO_ROMAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_R6_MITHRAISM'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_GRECO_ROMAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_R7_HEROS_CULT'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_GRECO_ROMAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

----
--Mesopotamian Extended
----

INSERT INTO Types
		(Type, 										           Kind)
VALUES  	('RELIGION_CHALDAENISM',  							'KIND_RELIGION');

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_M1_ASHURISM'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_MESOPOTAMIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_M2_NAPIR'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_MESOPOTAMIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

----
--Andean Extended
----

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_PCHAISM'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_A1_INTIISM'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_ANDEAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_A2_CHIMINIGAGUA'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_ANDEAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

----
--Mesoamerican Extended
----

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_TZOLKIN'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_MESOAMERICAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types
		(Type, 										           Kind)
VALUES  	('RELIGION_TLATEOMATILIZTLI',  							'KIND_RELIGION');

---------------------------------------------------------------------------
---------------------------------------------------------------------------

----
--Polynesian Extended
----

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_O2_TALA_FONUA'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_POLYNESIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_PUATA_TUPUNA'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_O1_TANGATA_MANU'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_POLYNESIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

----
--Balto-Slavic Extended
----

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_RODNOVERY'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_S1_ROMUVA'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_BALTO_SLAVIC_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

----
--Uralic Extended
----

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_NOAIDEVUOHTA'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_U1_SUOMENUSKO'),  					('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_URALIC_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

----
--Yoruba Extended
----

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_IFA'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_SNTERIA'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_YORUBA_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

----
--Custom Icons Base
----

DELETE FROM Types WHERE Type = 'RELIGION_CUSTOM_1' 
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_BASE' AND Value = 0);

DELETE FROM Types WHERE Type = 'RELIGION_CUSTOM_2' 
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_BASE' AND Value = 0);

DELETE FROM Types WHERE Type = 'RELIGION_CUSTOM_3' 
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_BASE' AND Value = 0);

DELETE FROM Types WHERE Type = 'RELIGION_CUSTOM_4' 
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_BASE' AND Value = 0);

DELETE FROM Types WHERE Type = 'RELIGION_CUSTOM_5' 
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_BASE' AND Value = 0);

DELETE FROM Types WHERE Type = 'RELIGION_CUSTOM_6' 
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_BASE' AND Value = 0);

DELETE FROM Types WHERE Type = 'RELIGION_CUSTOM_7' 
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_BASE' AND Value = 0);

DELETE FROM Types WHERE Type = 'RELIGION_CUSTOM_8' 
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_BASE' AND Value = 0);

DELETE FROM Types WHERE Type = 'RELIGION_CUSTOM_9' 
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_BASE' AND Value = 0);

DELETE FROM Types WHERE Type = 'RELIGION_CUSTOM_10' 
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_BASE' AND Value = 0);

DELETE FROM Types WHERE Type = 'RELIGION_CUSTOM_11' 
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_BASE' AND Value = 0);

DELETE FROM Types WHERE Type = 'RELIGION_CUSTOM_12' 
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_BASE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

----
--Custom Icons Extra
----

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_G1'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_G2'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_G3'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_G4'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_G5'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_X8'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_X1'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_G6'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_X2'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_X9'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_X0'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_X3'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_X6'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_X4'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_X5'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_G9'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_X7'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_G7'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_G8'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_Q3'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_Q4'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_Q1'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_UNUSED' AND Value = 1);

INSERT INTO Types 
		(Type, 										           Kind)
SELECT  	('RELIGION_Q2'),  						('KIND_RELIGION')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_UNUSED' AND Value = 1);

--INSERT INTO Types 
--		(Type, 										           Kind)
--SELECT  	('RELIGION_Q5'),  						('KIND_RELIGION')
--WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_UNUSED' AND Value = 1);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

DELETE FROM Religions WHERE ReligionType = 'RELIGION_BUDDHISM';
DELETE FROM Religions WHERE ReligionType = 'RELIGION_CATHOLICISM';
DELETE FROM Religions WHERE ReligionType = 'RELIGION_CONFUCIANISM';
DELETE FROM Religions WHERE ReligionType = 'RELIGION_HINDUISM';
DELETE FROM Religions WHERE ReligionType = 'RELIGION_ISLAM';
DELETE FROM Religions WHERE ReligionType = 'RELIGION_JUDAISM';
DELETE FROM Religions WHERE ReligionType = 'RELIGION_ORTHODOXY';
DELETE FROM Religions WHERE ReligionType = 'RELIGION_PROTESTANTISM';
DELETE FROM Religions WHERE ReligionType = 'RELIGION_SHINTO';
DELETE FROM Religions WHERE ReligionType = 'RELIGION_SIKHISM';
DELETE FROM Religions WHERE ReligionType = 'RELIGION_TAOISM';
DELETE FROM Religions WHERE ReligionType = 'RELIGION_ZOROASTRIANISM';

DELETE FROM Religions WHERE ReligionType = 'RELIGION_CUSTOM_1';
DELETE FROM Religions WHERE ReligionType = 'RELIGION_CUSTOM_2';
DELETE FROM Religions WHERE ReligionType = 'RELIGION_CUSTOM_3';
DELETE FROM Religions WHERE ReligionType = 'RELIGION_CUSTOM_4';
DELETE FROM Religions WHERE ReligionType = 'RELIGION_CUSTOM_5';
DELETE FROM Religions WHERE ReligionType = 'RELIGION_CUSTOM_6';
DELETE FROM Religions WHERE ReligionType = 'RELIGION_CUSTOM_7';
DELETE FROM Religions WHERE ReligionType = 'RELIGION_CUSTOM_8';
DELETE FROM Religions WHERE ReligionType = 'RELIGION_CUSTOM_9';
DELETE FROM Religions WHERE ReligionType = 'RELIGION_CUSTOM_10';
DELETE FROM Religions WHERE ReligionType = 'RELIGION_CUSTOM_11';
DELETE FROM Religions WHERE ReligionType = 'RELIGION_CUSTOM_12';

---------------------------------------------------------------------------
---------------------------------------------------------------------------

INSERT OR REPLACE INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
VALUES  	('RELIGION_AMATONGO',			'LOC_RELIGION_AMATONGO',  			'Am',			0,				    'COLOR_RELIGION_AMATONGO');

---------------------------------------------------------------------------
---------------------------------------------------------------------------

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_AGAKKUNNGURNIQ'),		('LOC_RELIGION_AGAKKUNNGURNIQ'),  		('Ag'),			0,				      ('COLOR_RELIGION_AGAKKUNNGURNIQ')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_AITO'),			('LOC_RELIGION_AITO'),  			('Ai'),			0,				      ('COLOR_RELIGION_AITO')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_ANKATTU'),			('LOC_RELIGION_ANKATTU'),  			('An'),			0,				    ('COLOR_RELIGION_ANKATTU')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_BAHAI'),			('LOC_RELIGION_BAHAI'),  			('Ba'),			0,				      ('COLOR_RELIGION_BAHAI')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_BIRD_FIGURE_CULT'),		('LOC_RELIGION_BIRD_FIGURE_CULT'),  		('Bi'),			0,				('COLOR_RELIGION_BIRD_FIGURE_CULT')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

----
--Buddhism Extended
----

----------------------------------
----------------------------------

INSERT OR REPLACE INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
VALUES  	('RELIGION_BUDDHISM',			'LOC_RELIGION_BUDDHISM',  			'Bu',			0,				    'COLOR_RELIGION_BUDDHISM');

----------------------------------
----------------------------------

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_B1_MAHAYANA'),		('LOC_RELIGION_B1_MAHAYANA'),  			('B1'),			0,				    ('COLOR_RELIGION_B1_MAHAYANA')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_BUDDHIST_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
SELECT  	('RELIGION_B2_VAJRAYANA'),		('LOC_RELIGION_B2_VAJRAYANA'),  		('B2'),			0,				  ('COLOR_RELIGION_B2_VAJRAYANA')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_BUDDHIST_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_BMUNTU'),			('LOC_RELIGION_BMUNTU'),  			('Bm'),			0,				       ('COLOR_RELIGION_BMUNTU')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_CNAANISM'),			('LOC_RELIGION_CNAANISM'),  			('Cn'),			0,				  ('COLOR_RELIGION_CNAANISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

----
--Mesopotamian Extended
----

----------------------------------
----------------------------------

INSERT INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
VALUES 		('RELIGION_CHALDAENISM',		'LOC_RELIGION_CHALDAENISM',			'Ch',			0,				       'COLOR_RELIGION_CHALDAENISM');

----------------------------------
----------------------------------

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_M1_ASHURISM'),		('LOC_RELIGION_M1_ASHURISM'),  			('M1'),			0,				      ('COLOR_RELIGION_M1_ASHURISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_MESOPOTAMIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_M2_NAPIR'),			('LOC_RELIGION_M2_NAPIR'),  			('M2'),			0,				       ('COLOR_RELIGION_M2_NAPIR')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_MESOPOTAMIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);
		
---------------------------------------------------------------------------
---------------------------------------------------------------------------

----
--Christianity Denominations Plus
----

----------------------------------
----------------------------------

INSERT OR REPLACE INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
VALUES 		('RELIGION_CATHOLICISM',		'LOC_RELIGION_CATHOLICISM',			'Ca',			0,			   'COLOR_RELIGION_CATHOLICISM');

----------------------------------
----------------------------------

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
SELECT  	('RELIGION_C5_ARIANISM'),		('LOC_RELIGION_C5_ARIANISM'),  			('C5'),			0,				   ('COLOR_RELIGION_C5_ARIANISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_HERESIES_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
SELECT  	('RELIGION_C2_NESTORIANISM'),		('LOC_RELIGION_C2_NESTORIANISM'),  		('C2'),			0,				  ('COLOR_RELIGION_C2_NESTORIANISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,		                  Color)
SELECT  	('RELIGION_C1_ORIENTAL'),		('LOC_RELIGION_C1_ORIENTAL'),  			('C1'),			0,			             ('COLOR_RELIGION_C1_ORIENTAL')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

----------------------------------
----------------------------------

INSERT OR REPLACE INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
SELECT  	('RELIGION_ORTHODOXY'),			('LOC_RELIGION_ORTHODOXY'),  			('Or'),			0,			   ('COLOR_RELIGION_ORTHODOXY')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1);

----------------------------------
----------------------------------

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
SELECT  	('RELIGION_C6_CATHARISM'),		('LOC_RELIGION_C6_CATHARISM'),  		('C6'),			0,				  ('COLOR_RELIGION_C6_CATHARISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_HERESIES_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

----------------------------------
----------------------------------

INSERT OR REPLACE INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
SELECT  	('RELIGION_PROTESTANTISM'),		('LOC_RELIGION_PROTESTANTISM'),  		('Pr'),			0,			      ('COLOR_RELIGION_PROTESTANTISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1);

----------------------------------
----------------------------------

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,		                  Color)
SELECT  	('RELIGION_P1_CALVINISM'),		('LOC_RELIGION_P1_CALVINISM'),  		('P1'),			0,			          ('COLOR_RELIGION_P1_CALVINISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_PROTESTANT_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,		                  Color)
SELECT  	('RELIGION_C3_ANGLICANISM'),		('LOC_RELIGION_C3_ANGLICANISM'),  		('C3'),			0,			           ('COLOR_RELIGION_C3_ANGLICANISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,		                  Color)
SELECT  	('RELIGION_P2_BAPTIST'),		('LOC_RELIGION_P2_BAPTIST'),  			('P2'),			0,			            ('COLOR_RELIGION_P2_BAPTIST')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_PROTESTANT_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,		                  Color)
SELECT  	('RELIGION_P3_METHODISM'),		('LOC_RELIGION_P3_METHODISM'),  		('P3'),			0,			          ('COLOR_RELIGION_P3_METHODISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_PROTESTANT_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,		                  Color)
SELECT  	('RELIGION_P5_ADVENTISM'),		('LOC_RELIGION_P5_ADVENTISM'),  		('P5'),			0,			             ('COLOR_RELIGION_P5_ADVENTISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_PROTESTANT_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_C4_RESTORATIONISM'),		('LOC_RELIGION_C4_RESTORATIONISM'),  		('C4'),			0,				     ('COLOR_RELIGION_C4_RESTORATIONISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);	

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,		                  Color)
SELECT  	('RELIGION_P4_PENTECOSTALISM'),		('LOC_RELIGION_P4_PENTECOSTALISM'),  		('P4'),			0,			          ('COLOR_RELIGION_P4_PENTECOSTALISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_PROTESTANT_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

INSERT OR REPLACE INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
VALUES 		('RELIGION_CONFUCIANISM',		'LOC_RELIGION_CONFUCIANISM',			'Co',			0,			        'COLOR_RELIGION_CONFUCIANISM');

----------------------------------
----------------------------------

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_TJUKURPA'),			('LOC_RELIGION_TJUKURPA'),  			('Tj'),			0,			           ('COLOR_RELIGION_TJUKURPA')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_DRUIDISM'),			('LOC_RELIGION_DRUIDISM'),  			('Dr'),			0,				   ('COLOR_RELIGION_DRUIDISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_FAT_ROOG'),			('LOC_RELIGION_FAT_ROOG'),  			('Fa'),			0,				      ('COLOR_RELIGION_FAT_ROOG')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_FORN_SIDR'),			('LOC_RELIGION_FORN_SIDR'),  			('Fo'),			0,				      ('COLOR_RELIGION_FORN_SIDR')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

----
--GrecoRoman Extended
----

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
SELECT  	('RELIGION_R1_ATANODJUWAJA_CULT'),	('LOC_RELIGION_R1_ATANODJUWAJA_CULT'),  	('R1'),			0,				     ('COLOR_RELIGION_R1_ATANODJUWAJA_CULT')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_GRECO_ROMAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
SELECT  	('RELIGION_R2_MYSTERIES'),		('LOC_RELIGION_R2_MYSTERIES'),  		('R2'),			0,				  ('COLOR_RELIGION_R2_MYSTERIES')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_GRECO_ROMAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

----------------------------------
----------------------------------

INSERT INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
VALUES 		('RELIGION_HELLENISM',			'LOC_RELIGION_HELLENISM',			'He',			0,			           'COLOR_RELIGION_HELLENISM');

----------------------------------
----------------------------------

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
SELECT  	('RELIGION_R3_NEOPLATONISM'),		('LOC_RELIGION_R3_NEOPLATONISM'),  		('R3'),			0,			       ('COLOR_RELIGION_R3_NEOPLATONISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_GRECO_ROMAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
SELECT  	('RELIGION_R4_NUMENISM'),		('LOC_RELIGION_R4_NUMENISM'),  			('R4'),			0,				      ('COLOR_RELIGION_R4_NUMENISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_GRECO_ROMAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
SELECT  	('RELIGION_R5_IMPERIAL_CULT'),		('LOC_RELIGION_R5_IMPERIAL_CULT'),  		('R5'),			0,				   ('COLOR_RELIGION_R5_IMPERIAL_CULT')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_GRECO_ROMAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
SELECT  	('RELIGION_R6_MITHRAISM'),		('LOC_RELIGION_R6_MITHRAISM'),  		('R6'),			0,				    ('COLOR_RELIGION_R6_MITHRAISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_GRECO_ROMAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
SELECT  	('RELIGION_R7_HEROS_CULT'),		('LOC_RELIGION_R7_HEROS_CULT'),  		('R7'),			0,				     ('COLOR_RELIGION_R7_HEROS_CULT')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_GRECO_ROMAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

----
--Hinduism Extended
----

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
SELECT  	('RELIGION_H1_VEDISM'),			('LOC_RELIGION_H1_VEDISM'),  			('H1'),			0,				      ('COLOR_RELIGION_H1_VEDISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_HINDU_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_H3_SHAIVISM'),		('LOC_RELIGION_H3_SHAIVISM'),  			('H3'),			0,				      ('COLOR_RELIGION_H3_SHAIVISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_HINDU_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_H4_SHAKTISM'),		('LOC_RELIGION_H4_SHAKTISM'),  			('H4'),			0,				     ('COLOR_RELIGION_H4_SHAKTISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_HINDU_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_H2_VAISHNAVISM'),		('LOC_RELIGION_H2_VAISHNAVISM'),  		('H2'),			0,				     ('COLOR_RELIGION_H2_VAISHNAVISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_HINDU_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

----------------------------------
----------------------------------

INSERT OR REPLACE INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
VALUES		('RELIGION_HINDUISM',			'LOC_RELIGION_HINDUISM',			'Hi',			0,			               'COLOR_RELIGION_HINDUISM');

---------------------------------------------------------------------------
---------------------------------------------------------------------------

----
--Yoruba Extended
----

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_IFA'),			('LOC_RELIGION_IFA'),  				('If'),			0,				       ('COLOR_RELIGION_IFA')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_SNTERIA'),			('LOC_RELIGION_SNTERIA'),  			('Sn'),			0,				   ('COLOR_RELIGION_SNTERIA')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_YORUBA_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_ITANG'),			('LOC_RELIGION_ITANG'),  			('It'),			0,				      ('COLOR_RELIGION_ITANG')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------
	
----
--Islam Extended
----

----------------------------------
----------------------------------

INSERT OR REPLACE INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
VALUES		('RELIGION_ISLAM',			'LOC_RELIGION_ISLAM',				'Is',			0,			               'COLOR_RELIGION_ISLAM');

----------------------------------
----------------------------------
		
INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_I1_SHIA'),			('LOC_RELIGION_I1_SHIA'),  			('I1'),			0,				       ('COLOR_RELIGION_I1_SHIA')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_ISLAMIC_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_I2_IBADI'),			('LOC_RELIGION_I2_IBADI'),  			('I2'),			0,				      ('COLOR_RELIGION_I2_IBADI')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_ISLAMIC_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_I3_DRUZE'),			('LOC_RELIGION_I3_DRUZE'),  			('I3'),			0,				     ('COLOR_RELIGION_I3_DRUZE')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_ISLAMIC_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_ISLAMIC_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_I4_AHMADI'),			('LOC_RELIGION_I4_AHMADI'),  			('I4'),			0,				     ('COLOR_RELIGION_I4_AHMADI')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_ISLAMIC_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_ISLAMIC_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_JAINISM'),			('LOC_RELIGION_JAINISM'),  			('Ja'),			0,				    ('COLOR_RELIGION_JAINISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

----------------------------------
----------------------------------

INSERT OR REPLACE INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
VALUES		('RELIGION_JUDAISM',			'LOC_RELIGION_JUDAISM',				'Ju',			0,			              'COLOR_RELIGION_JUDAISM');

----------------------------------
----------------------------------

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_KACHINA'),			('LOC_RELIGION_KACHINA'),  			('Ka'),			0,				    ('COLOR_RELIGION_KACHINA')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_LAIBONI'),			('LOC_RELIGION_LAIBONI'),  			('La'),			0,				     ('COLOR_RELIGION_LAIBONI')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_LIIM_DINGIRMES'),		('LOC_RELIGION_LIIM_DINGIRMES'),  		('Li'),			0,				    ('COLOR_RELIGION_LIIM_DINGIRMES')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_MHOMA'),			('LOC_RELIGION_MHOMA'),  			('Mh'),			0,				     ('COLOR_RELIGION_MHOMA')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_MLAGAN'),			('LOC_RELIGION_MLAGAN'),  			('Ml'),			0,				     ('COLOR_RELIGION_MLAGAN')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_MNDAENISM'),			('LOC_RELIGION_MNDAENISM'),  			('Mn'),			0,				    ('COLOR_RELIGION_MNDAENISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_MANICHAEISM'),			('LOC_RELIGION_MANICHAEISM'),  		('Ma'),			0,				('COLOR_RELIGION_MANICHAEISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_MIDEWIWIN'),			('LOC_RELIGION_MIDEWIWIN'),  		('Mi'),			0,				('COLOR_RELIGION_MIDEWIWIN')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_MUISM'),			('LOC_RELIGION_MUISM'),  			('Mu'),			0,				      ('COLOR_RELIGION_MUISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_MSHRIKUN'),			('LOC_RELIGION_MSHRIKUN'),  			('Ms'),			0,				  ('COLOR_RELIGION_MSHRIKUN')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_MWARI'),			('LOC_RELIGION_MWARI'),  			('Mw'),			0,				      ('COLOR_RELIGION_MWARI')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

----
--Uralic Extended
----

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_NOAIDEVUOHTA'),		('LOC_RELIGION_NOAIDEVUOHTA'),  		('No'),			0,				       ('COLOR_RELIGION_NOAIDEVUOHTA')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);


INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_U1_SUOMENUSKO'),		('LOC_RELIGION_U1_SUOMENUSKO'),  		('U1'),			0,				    ('COLOR_RELIGION_U1_SUOMENUSKO')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_URALIC_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_NUM'),			('LOC_RELIGION_NUM'),  				('Nu'),			0,				        ('COLOR_RELIGION_NUM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_NZAMBIISM'),			('LOC_RELIGION_NZAMBIISM'),  				('Nz'),			0,				        ('COLOR_RELIGION_NZAMBIISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_ONYAMESOM'),			('LOC_RELIGION_ONYAMESOM'),  			('On'),			0,				       ('COLOR_RELIGION_ONYAMESOM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_OENDA'),			('LOC_RELIGION_OENDA'),  			('Oe'),			0,				     ('COLOR_RELIGION_OENDA')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------
	
----
--Andean Extended
----

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_PCHAISM'),			('LOC_RELIGION_PCHAISM'),  			('Pc'),			0,				   ('COLOR_RELIGION_PCHAISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_A1_INTIISM'),		('LOC_RELIGION_A1_INTIISM'),  			('A1'),			0,				       ('COLOR_RELIGION_A1_INTIISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_ANDEAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_A2_CHIMINIGAGUA'),		('LOC_RELIGION_A2_CHIMINIGAGUA'),  		('A2'),			0,				     ('COLOR_RELIGION_A2_CHIMINIGAGUA')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_ANDEAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_PJELANCA'),			('LOC_RELIGION_PJELANCA'),  			('Pj'),			0,				  ('COLOR_RELIGION_PJELANCA')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

----
--Egyptian Extended
----

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_E1_AMANAIISM'),		('LOC_RELIGION_E1_AMANAIISM'),  		('E1'),			0,				      ('COLOR_RELIGION_E1_AMANAIISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_EGYPTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

----------------------------------
----------------------------------

INSERT INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
VALUES		('RELIGION_PESEDJET',			'LOC_RELIGION_PESEDJET',			'Pe',			0,			            'COLOR_RELIGION_PESEDJET');

----------------------------------
----------------------------------

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_E2_ATENISM'),		('LOC_RELIGION_E2_ATENISM'),  			('E2'),			0,				       ('COLOR_RELIGION_E2_ATENISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_EGYPTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_POHAKANTENNA'),		('LOC_RELIGION_POHAKANTENNA'),  		('Po'),			0,				      ('COLOR_RELIGION_POHAKANTENNA')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

----
--Polynesian Extended
----

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_O2_TALA_FONUA'),		('LOC_RELIGION_O2_TALA_FONUA'),  		('O2'),			0,			     ('COLOR_RELIGION_O2_TALA_FONUA')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_POLYNESIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_PUATA_TUPUNA'),		('LOC_RELIGION_PUATA_TUPUNA'),  		('Pu'),			0,				  ('COLOR_RELIGION_PUATA_TUPUNA')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_O1_TANGATA_MANU'),		('LOC_RELIGION_O1_TANGATA_MANU'),  		('O1'),			0,			      ('COLOR_RELIGION_O1_TANGATA_MANU')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_POLYNESIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_RAZANA'),			('LOC_RELIGION_RAZANA'),  			('Ra'),			0,				     ('COLOR_RELIGION_RAZANA')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

----
--Balto-Slavic Extended
----

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_RODNOVERY'),			('LOC_RELIGION_RODNOVERY'),  			('Ro'),			0,				 ('COLOR_RELIGION_RODNOVERY')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_S1_ROMUVA'),			('LOC_RELIGION_S1_ROMUVA'),  			('S1'),			0,			             ('COLOR_RELIGION_S1_ROMUVA')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_BALTO_SLAVIC_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

----------------------------------
----------------------------------

INSERT INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
VALUES		('RELIGION_SAIRIMAISM',			'LOC_RELIGION_SAIRIMAISM',			'Sa',			0,			             'COLOR_RELIGION_SAIRIMAISM');

----------------------------------
----------------------------------

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_SMANISM'),			('LOC_RELIGION_SMANISM'),  			('Sm'),			0,				      ('COLOR_RELIGION_SMANISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_PHI'),			('LOC_RELIGION_PHI'),  				('Ph'),			0,				('COLOR_RELIGION_PHI')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_SGAANAANG'),			('LOC_RELIGION_SGAANAANG'),  			('Sg'),			0,				  ('COLOR_RELIGION_SGAANAANG')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

----------------------------------
----------------------------------

INSERT OR REPLACE INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
VALUES		('RELIGION_SHINTO',			'LOC_RELIGION_SHINTO',				'Sh',			0,			              'COLOR_RELIGION_SHINTO'),
		('RELIGION_SIKHISM',			'LOC_RELIGION_SIKHISM',				'Si',			0,			                'COLOR_RELIGION_SIKHISM');

----------------------------------
----------------------------------

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_SOUTHERN_CULT'),		('LOC_RELIGION_SOUTHERN_CULT'),  		('So'),			0,			      ('COLOR_RELIGION_SOUTHERN_CULT')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

----------------------------------
----------------------------------

INSERT OR REPLACE INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
VALUES		('RELIGION_TAOISM',			'LOC_RELIGION_TAOISM',				'Ta',			0,			              'COLOR_RELIGION_TAOISM');

----------------------------------
----------------------------------

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_TMAUKELISM'),		('LOC_RELIGION_TMAUKELISM'),  			('Tm'),			0,			        ('COLOR_RELIGION_TMAUKELISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

INSERT INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
VALUES		('RELIGION_TENGRIISM',		'LOC_RELIGION_TENGRIISM',		'Te',			0,			    'COLOR_RELIGION_TENGRIISM');

---------------------------------------------------------------------------
---------------------------------------------------------------------------

----
--Mesoamerican Extended
----

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_TZOLKIN'),			('LOC_RELIGION_TZOLKIN'),  			('TZ'),			0,			   	       ('COLOR_RELIGION_TZOLKIN')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_MESOAMERICAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);
		
----------------------------------
----------------------------------

INSERT INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
VALUES		('RELIGION_TLATEOMATILIZTLI',		'LOC_RELIGION_TLATEOMATILIZTLI',		'Tl',			0,			    'COLOR_RELIGION_TLATEOMATILIZTLI');

---------------------------------------------------------------------------
---------------------------------------------------------------------------

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_VOODOO'),			('LOC_RELIGION_VOODOO'),  			('Vo'),			0,				     ('COLOR_RELIGION_VOODOO')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

INSERT OR REPLACE INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
VALUES  	('RELIGION_WAKAN_TANKA',			'LOC_RELIGION_WAKAN_TANKA',  			'Wa',			0,				    'COLOR_RELIGION_WAKAN_TANKA');

INSERT OR REPLACE INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
VALUES  	('RELIGION_WITRAN_MAPU',			'LOC_RELIGION_WITRAN_MAPU',  			'Wi',			0,				    'COLOR_RELIGION_WITRAN_MAPU');

---------------------------------------------------------------------------
---------------------------------------------------------------------------

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_YAZDANISM'),			('LOC_RELIGION_YAZDANISM'),  			('Ya'),			0,				    ('COLOR_RELIGION_YAZDANISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_ZEMIISM'),			('LOC_RELIGION_ZEMIISM'),  			('Ze'),			0,				      ('COLOR_RELIGION_ZEMIISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

----------------------------------
----------------------------------

INSERT OR REPLACE INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
VALUES		('RELIGION_ZOROASTRIANISM',		'LOC_RELIGION_ZOROASTRIANISM',			'Zo',			0,			      'COLOR_RELIGION_ZOROASTRIANISM');

---------------------------------------------------------------------------
---------------------------------------------------------------------------

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_G1'),			('LOC_RELIGION_G1'),  				('G1'),			1,				      ('COLOR_RELIGION_G1')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

----------------------------------
----------------------------------

INSERT OR REPLACE INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
SELECT   	('RELIGION_CUSTOM_2'),			('LOC_RELIGION_CUSTOM'),  			('02'),			1,				       ('COLOR_RELIGION_CUSTOM_2')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_BASE' AND Value = 1);

----------------------------------
----------------------------------

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				 Color)
SELECT  	('RELIGION_G2'),			('LOC_RELIGION_G2'),  				('G2'),			1,				      ('COLOR_RELIGION_G2')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

----------------------------------
----------------------------------

INSERT OR REPLACE INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
SELECT   	('RELIGION_CUSTOM_1'),			('LOC_RELIGION_CUSTOM'),  			('01'),			1,				     ('COLOR_RELIGION_CUSTOM_1')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_BASE' AND Value = 1);

INSERT OR REPLACE INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
SELECT   	('RELIGION_CUSTOM_4'),			('LOC_RELIGION_CUSTOM'),  			('04'),			1,				        ('COLOR_RELIGION_CUSTOM_4')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_BASE' AND Value = 1);

INSERT OR REPLACE INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
SELECT   	('RELIGION_CUSTOM_8'),			('LOC_RELIGION_CUSTOM'),  			('08'),			1,				      ('COLOR_RELIGION_CUSTOM_8')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_BASE' AND Value = 1);

----------------------------------
----------------------------------

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_G3'),			('LOC_RELIGION_G3'),  				('G3'),			1,				      ('COLOR_RELIGION_G3')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

----------------------------------
----------------------------------

INSERT OR REPLACE INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
SELECT   	('RELIGION_CUSTOM_6'),			('LOC_RELIGION_CUSTOM'),  			('06'),			1,				    ('COLOR_RELIGION_CUSTOM_6')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_BASE' AND Value = 1);

----------------------------------
----------------------------------

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_G4'),			('LOC_RELIGION_G4'),  				('G4'),			1,				        ('COLOR_RELIGION_G4')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_G5'),			('LOC_RELIGION_G5'),  				('G5'),			1,				  ('COLOR_RELIGION_G5')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

----------------------------------
----------------------------------

INSERT OR REPLACE INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
SELECT   	('RELIGION_CUSTOM_9'),			('LOC_RELIGION_CUSTOM'),  			('09'),			1,				      ('COLOR_RELIGION_CUSTOM_9')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_BASE' AND Value = 1);

INSERT OR REPLACE INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
SELECT   	('RELIGION_CUSTOM_5'),			('LOC_RELIGION_CUSTOM'),  			('05'),			1,				     ('COLOR_RELIGION_CUSTOM_5')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_BASE' AND Value = 1);

INSERT OR REPLACE INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
SELECT   	('RELIGION_CUSTOM_7'),			('LOC_RELIGION_CUSTOM'),  			('07'),			1,				      ('COLOR_RELIGION_CUSTOM_7')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_BASE' AND Value = 1);

----------------------------------
----------------------------------

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_X8'),			('LOC_RELIGION_X8'),  				('X8'),			1,				('COLOR_RELIGION_X8')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_X1'),			('LOC_RELIGION_X1'),  				('X1'),			1,				     ('COLOR_RELIGION_X1')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

----------------------------------
----------------------------------
	
INSERT OR REPLACE INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
SELECT   	('RELIGION_CUSTOM_10'),			('LOC_RELIGION_CUSTOM'),  			('10'),			1,				  ('COLOR_RELIGION_CUSTOM_10')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_BASE' AND Value = 1);

----------------------------------
----------------------------------

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_G6'),			('LOC_RELIGION_G6'),  				('G6'),			1,				      ('COLOR_RELIGION_G6')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

----------------------------------
----------------------------------

INSERT OR REPLACE INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
SELECT   	('RELIGION_CUSTOM_12'),			('LOC_RELIGION_CUSTOM'),  			('12'),			1,				     ('COLOR_RELIGION_CUSTOM_12')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_BASE' AND Value = 1);

INSERT OR REPLACE INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
SELECT   	('RELIGION_CUSTOM_3'),			('LOC_RELIGION_CUSTOM'),  			('03'),			1,				   ('COLOR_RELIGION_CUSTOM_3')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_BASE' AND Value = 1);

INSERT OR REPLACE INTO Religions
		(ReligionType,				Name,						IconString,		RequiresCustomName,			          Color)
SELECT   	('RELIGION_CUSTOM_11'),			('LOC_RELIGION_CUSTOM'),  			('11'),			1,				  ('COLOR_RELIGION_CUSTOM_11')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_BASE' AND Value = 1);
	
----------------------------------
----------------------------------

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_X2'),			('LOC_RELIGION_X2'),  				('X2'),			1,				       ('COLOR_RELIGION_X2')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_X3'),			('LOC_RELIGION_X3'),  				('X3'),			1,				      ('COLOR_RELIGION_X3')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_X6'),			('LOC_RELIGION_X6'),  				('X6'),			1,				  ('COLOR_RELIGION_X6')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_X9'),			('LOC_RELIGION_X9'),  				('X9'),			1,				      ('COLOR_RELIGION_X9')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_X0'),			('LOC_RELIGION_X0'),  				('X0'),			1,				        ('COLOR_RELIGION_X0')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_X4'),			('LOC_RELIGION_X4'),  				('X4'),			1,				 ('COLOR_RELIGION_X4')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_X5'),			('LOC_RELIGION_X5'),  				('X5'),			1,				  ('COLOR_RELIGION_X5')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_G9'),			('LOC_RELIGION_G9'),  				('G9'),			1,				   ('COLOR_RELIGION_G9')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_Q1'),			('LOC_RELIGION_Q1'),  				('Q1'),			1,				     ('COLOR_RELIGION_Q1')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_UNUSED' AND Value = 1);

--INSERT INTO Religions 
--		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
--SELECT  	('RELIGION_Q5'),			('LOC_RELIGION_Q5'),  				('Q5'),			1,				      ('COLOR_RELIGION_Q5')
--WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_UNUSED' AND Value = 1);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_Q3'),			('LOC_RELIGION_Q3'),  				('Q3'),			1,				       ('COLOR_RELIGION_Q3')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_Q4'),			('LOC_RELIGION_Q4'),  				('Q4'),			1,				      ('COLOR_RELIGION_Q4')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_Q2'),			('LOC_RELIGION_Q2'),  				('Q2'),			1,				      ('COLOR_RELIGION_Q2')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_UNUSED' AND Value = 1);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_X7'),			('LOC_RELIGION_X7'),  				('X7'),			1,				     ('COLOR_RELIGION_X7')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_G7'),			('LOC_RELIGION_G7'),  				('G7'),			1,				      ('COLOR_RELIGION_G7')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

INSERT INTO Religions 
		(ReligionType,				Name,						IconString,		RequiresCustomName,				  Color)
SELECT  	('RELIGION_G8'),			('LOC_RELIGION_G8'),  				('G8'),			1,				       ('COLOR_RELIGION_G8')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CUSTOM_ICONS_EXTRA' AND Value = 1);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

--***********************************************************************************************************************************************************************************************
--***********************************************************************************************************************************************************************************************
--HR_Religions_Moments
--***********************************************************************************************************************************************************************************************
--***********************************************************************************************************************************************************************************************


INSERT OR REPLACE INTO MomentIllustrations
		(MomentIllustrationType,				MomentDataType,				GameDataType,					Texture)
VALUES	('MOMENT_ILLUSTRATION_RELIGION',		'MOMENT_DATA_RELIGION',		'RELIGION_AMATONGO',			'HM_Religion_Amatongo.dds'),
		('MOMENT_ILLUSTRATION_RELIGION',		'MOMENT_DATA_RELIGION',		'RELIGION_CHALDAENISM',			'HM_Religion_Chaldaeanism.dds'),
		('MOMENT_ILLUSTRATION_RELIGION',		'MOMENT_DATA_RELIGION',		'RELIGION_HELLENISM',			'HM_Religion_Hellenism.dds'),
		('MOMENT_ILLUSTRATION_RELIGION',		'MOMENT_DATA_RELIGION',		'RELIGION_PESEDJET',			'HM_Religion_Pesedjet.dds'),
		('MOMENT_ILLUSTRATION_RELIGION',		'MOMENT_DATA_RELIGION',		'RELIGION_SAIRIMAISM',			'HM_Religion_Sairimaism.dds'),
		('MOMENT_ILLUSTRATION_RELIGION',		'MOMENT_DATA_RELIGION',		'RELIGION_TENGRIISM',			'HM_Religion_Tengriism.dds'),
		('MOMENT_ILLUSTRATION_RELIGION',		'MOMENT_DATA_RELIGION',		'RELIGION_TLATEOMATILIZTLI',	'HM_Religion_Tlateomatiliztli.dds'),
		('MOMENT_ILLUSTRATION_RELIGION',		'MOMENT_DATA_RELIGION',		'RELIGION_WAKAN_TANKA',			'HM_Religion_Wakan_Tanka.dds'),
		('MOMENT_ILLUSTRATION_RELIGION',		'MOMENT_DATA_RELIGION',		'RELIGION_WITRAN_MAPU',			'HM_Religion_Witran_Mapu.dds');

-------------------
-------------------

--INSERT OR REPLACE INTO MomentIllustrations
--			(MomentIllustrationType,				MomentDataType,				GameDataType,					Texture)
--VALUES	('MOMENT_ILLUSTRATION_RELIGION',		'MOMENT_DATA_RELIGION',		'RELIGION_E0_PESEDJET',			'HM_Religion_E0_Pesedjet.dds'),

-------------------
-------------------

INSERT OR REPLACE INTO MomentIllustrations
			(MomentIllustrationType,					MomentDataType,							GameDataType,						Texture)
SELECT  	('MOMENT_ILLUSTRATION_RELIGION'),			('MOMENT_DATA_RELIGION'),  				('RELIGION_E0_PESEDJET'),				('HM_Religion_E0_Pesedjet.dds')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT OR REPLACE INTO MomentIllustrations
			(MomentIllustrationType,					MomentDataType,							GameDataType,						Texture)
SELECT  	('MOMENT_ILLUSTRATION_RELIGION'),			('MOMENT_DATA_RELIGION'),  				('RELIGION_MIDEWIWIN'),				('HM_Religion_Midewiwin.dds')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

--***********************************************************************************************************************************************************************************************
--***********************************************************************************************************************************************************************************************
--HR_Religions_Text_Update
--***********************************************************************************************************************************************************************************************
--***********************************************************************************************************************************************************************************************

--
--

UPDATE Religions
SET Name = 'LOC_RELIGION_THERAVADA'
WHERE ReligionType = 'RELIGION_BUDDHISM'
AND EXISTS (SELECT * FROM Religions WHERE ReligionType = 'RELIGION_BUDDHISM')
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_BUDDHIST_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

--
--

UPDATE Religions
SET Name = 'LOC_RELIGION_CHRISTIANITY'
WHERE ReligionType = 'RELIGION_CATHOLICISM'
AND EXISTS (SELECT * FROM Religions WHERE ReligionType = 'RELIGION_CATHOLICISM')
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 0);

--
--

UPDATE Religions
SET Name = 'LOC_RELIGION_LUTHERANISM'
WHERE ReligionType = 'RELIGION_PROTESTANTISM'
AND EXISTS (SELECT * FROM Religions WHERE ReligionType = 'RELIGION_PROTESTANTISM')
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_PROTESTANT_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

--
--

UPDATE Religions
SET Name = 'LOC_RELIGION_SMARTISM'
WHERE ReligionType = 'RELIGION_HINDUISM'
AND EXISTS (SELECT * FROM Religions WHERE ReligionType = 'RELIGION_HINDUISM')
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_HINDU_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

--
--

UPDATE Religions
SET Name = 'LOC_RELIGION_SUNNI'
WHERE ReligionType = 'RELIGION_ISLAM'
AND EXISTS (SELECT * FROM Religions WHERE ReligionType = 'RELIGION_ISLAM')
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_ISLAMIC_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

--
--

UPDATE Religions
SET Name = 'LOC_RELIGION_DODEKATHEON'
WHERE ReligionType = 'RELIGION_HELLENISM'
AND EXISTS (SELECT * FROM Religions WHERE ReligionType = 'RELIGION_HELLENISM')
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_GRECO_ROMAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

--
--

UPDATE Religions
SET Name = 'LOC_RELIGION_MORMONISM'
WHERE ReligionType = 'RELIGION_C4_RESTORATIONISM'
AND EXISTS (SELECT * FROM Religions WHERE ReligionType = 'RELIGION_C4_RESTORATIONISM')
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_RESTORATIONISM_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

--
--

--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

--***********************************************************************************************************************************************************************************************
--***********************************************************************************************************************************************************************************************
--HR_Religions_Set
--***********************************************************************************************************************************************************************************************
--***********************************************************************************************************************************************************************************************

---------------------------------------------------------------------------
---------------------------------------------------------------------------

DELETE FROM FavoredReligions WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_RANDOM_PREFERENCES' AND Value = 1);

CREATE TRIGGER HRRandomPreferences
AFTER INSERT ON FavoredReligions
BEGIN
	DELETE FROM FavoredReligions WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_RANDOM_PREFERENCES' AND Value = 1);
END;

---------------------------------------------------------------------------
---------------------------------------------------------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_QIN';
DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_GILGAMESH';
DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_TOMYRIS';

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 								 	ReligionType)
VALUES 	('LEADER_QIN',  								'RELIGION_TAOISM'),
		('LEADER_GILGAMESH',  							'RELIGION_CHALDAENISM'),
		('LEADER_TOMYRIS',  							'RELIGION_SAIRIMAISM');

---------------------------------------------------------------------------
---------------------------------------------------------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_MONTEZUMA' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_MONTEZUMA');

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 								 	ReligionType)
SELECT  	('LEADER_MONTEZUMA'),  						    		('RELIGION_TLATEOMATILIZTLI')
WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_MONTEZUMA');

-----
-----

CREATE TRIGGER DLCMontezumaHR
AFTER INSERT ON Leaders WHEN 'LEADER_MONTEZUMA' = NEW.LeaderType
BEGIN
	DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_MONTEZUMA' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_MONTEZUMA');

	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 								ReligionType)
	VALUES  	('LEADER_MONTEZUMA',  					  		'RELIGION_TLATEOMATILIZTLI');
END;

---------------------------------------------------------------------------
---------------------------------------------------------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_CATHERINE_DE_MEDICI';
DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_BARBAROSSA';

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
VALUES  ('LEADER_CATHERINE_DE_MEDICI',  				'RELIGION_CATHOLICISM'),
		('LEADER_BARBAROSSA',  							'RELIGION_CATHOLICISM');

-------------------------
-------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_HARDRADA';

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_HARDRADA'),  								('RELIGION_CATHOLICISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 0);

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 								 	ReligionType)
SELECT  	('LEADER_HARDRADA'),  								('RELIGION_ORTHODOXY')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1);

-------------------------
-------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_JADWIGA' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_JADWIGA');

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_JADWIGA'),  								('RELIGION_CATHOLICISM')
WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_JADWIGA');

------
------

--CREATE TRIGGER DLCJadwigaHR
--AFTER INSERT ON FavoredReligions WHEN 'LEADER_JADWIGA' = NEW.LeaderType
--BEGIN
--	INSERT OR REPLACE INTO FavoredReligions 
--			(LeaderType, 								ReligionType)
--	VALUES  	('LEADER_JADWIGA',  					  		'RELIGION_CATHOLICISM');
--END;

-------------------------
-------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_JOHN_CURTIN' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_JOHN_CURTIN');

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_JOHN_CURTIN'),  					     		('RELIGION_CATHOLICISM')
WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_JOHN_CURTIN')
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 0)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_JOHN_CURTIN'),  					     		('RELIGION_PROTESTANTISM')
WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_JOHN_CURTIN')
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_PROTESTANT_EXTENDED' AND Value = 0)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_JOHN_CURTIN'),  					     		('RELIGION_P1_CALVINISM')
WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_JOHN_CURTIN')
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_PROTESTANT_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

----
----

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_JOHN_CURTIN'),  					     		('RELIGION_CATHOLICISM')
WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_JOHN_CURTIN')
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 0)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 1);

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_JOHN_CURTIN'),  					     		('RELIGION_PROTESTANTISM')
WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_JOHN_CURTIN')
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 1);

------
------

CREATE TRIGGER DLCCurtinHR
AFTER INSERT ON Leaders WHEN 'LEADER_JOHN_CURTIN' = NEW.LeaderType
BEGIN

	DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_JOHN_CURTIN' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_JOHN_CURTIN');

	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 								ReligionType)
	SELECT  	('LEADER_JOHN_CURTIN'),  					     	('RELIGION_CATHOLICISM')
	WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_JOHN_CURTIN')
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 0)
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 								ReligionType)
	SELECT  	('LEADER_JOHN_CURTIN'),  					     	('RELIGION_PROTESTANTISM')
	WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_JOHN_CURTIN')
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_PROTESTANT_EXTENDED' AND Value = 0)
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 								ReligionType)
	SELECT  	('LEADER_JOHN_CURTIN'),  					     	('RELIGION_P1_CALVINISM')
	WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_JOHN_CURTIN')
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_PROTESTANT_EXTENDED' AND Value = 1)
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

	----
	----

	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 									ReligionType)
	SELECT  	('LEADER_JOHN_CURTIN'),  					     		('RELIGION_CATHOLICISM')
	WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_JOHN_CURTIN')
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 0)
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 1);
	
	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 									ReligionType)
	SELECT  	('LEADER_JOHN_CURTIN'),  					     		('RELIGION_PROTESTANTISM')
	WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_JOHN_CURTIN')
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 1);
END;

-------------------------
-------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_MVEMBA';
DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_PEDRO';

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
VALUES  ('LEADER_MVEMBA',  					  			'RELIGION_CATHOLICISM'),
		('LEADER_PEDRO',  					  			'RELIGION_CATHOLICISM');

-------------------------
-------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_PETER_GREAT';

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_PETER_GREAT'),  							('RELIGION_CATHOLICISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 0);

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 								 	ReligionType)
SELECT  	('LEADER_PETER_GREAT'),  							('RELIGION_ORTHODOXY')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1);

-------------------------
-------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_PHILIP_II';

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
VALUES  ('LEADER_PHILIP_II',  					  		'RELIGION_CATHOLICISM');

-------------------------
-------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_ROBERT_THE_BRUCE' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_ROBERT_THE_BRUCE');

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  ('LEADER_ROBERT_THE_BRUCE'),  					('RELIGION_CATHOLICISM')
WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_ROBERT_THE_BRUCE');

---
---

CREATE TRIGGER DLCRobertHR
AFTER INSERT ON HistoricalAgendas WHEN 'LEADER_ROBERT_THE_BRUCE' = NEW.LeaderType
BEGIN
	
	DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_ROBERT_THE_BRUCE' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_ROBERT_THE_BRUCE');
	
	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 									ReligionType)
	SELECT  ('LEADER_ROBERT_THE_BRUCE'),  					('RELIGION_CATHOLICISM')
	WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_ROBERT_THE_BRUCE');

END;

-------------------------
-------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_T_ROOSEVELT';

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_T_ROOSEVELT'),  							('RELIGION_CATHOLICISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 0)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 								 	ReligionType)
SELECT  	('LEADER_T_ROOSEVELT'),  							('RELIGION_PROTESTANTISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_PROTESTANT_EXTENDED' AND Value = 0)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 								 	ReligionType)
SELECT  	('LEADER_T_ROOSEVELT'),  							('RELIGION_P1_CALVINISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_PROTESTANT_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

----
----

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_T_ROOSEVELT'),  							('RELIGION_CATHOLICISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 0)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 1);

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_T_ROOSEVELT'),  							('RELIGION_PROTESTANTISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 1);

-------------------------
-------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_TAMAR' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_TAMAR');

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_TAMAR'),  							('RELIGION_CATHOLICISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 0)
AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_TAMAR');

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 								 	ReligionType)
SELECT  	('LEADER_TAMAR'),  							('RELIGION_ORTHODOXY')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_TAMAR');

---
---

CREATE TRIGGER DLCTamarHR
AFTER INSERT ON HistoricalAgendas WHEN 'LEADER_TAMAR' = NEW.LeaderType
BEGIN
	
	DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_TAMAR' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_TAMAR');

	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 									ReligionType)
	SELECT  	('LEADER_TAMAR'),  							('RELIGION_CATHOLICISM')
	WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 0)
	AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_TAMAR');

	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 								 	ReligionType)
	SELECT  	('LEADER_TAMAR'),  							('RELIGION_ORTHODOXY')
	WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
	AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_TAMAR');

END;

-------------------------
-------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_VICTORIA';

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_VICTORIA'),  								('RELIGION_CATHOLICISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 0)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_VICTORIA'),  								('RELIGION_PROTESTANTISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_EXTENDED' AND Value = 0)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_VICTORIA'),  								('RELIGION_C3_ANGLICANISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

----
----

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_VICTORIA'),  								('RELIGION_CATHOLICISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 0)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 1);

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_VICTORIA'),  								('RELIGION_PROTESTANTISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 1);

-------------------------
-------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_WILHELMINA' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_WILHELMINA');

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_WILHELMINA'),  					     		('RELIGION_CATHOLICISM')
WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_WILHELMINA')
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 0)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_WILHELMINA'),  					     		('RELIGION_PROTESTANTISM')
WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_WILHELMINA')
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_PROTESTANT_EXTENDED' AND Value = 0)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_WILHELMINA'),  					     		('RELIGION_P1_CALVINISM')
WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_WILHELMINA')
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_PROTESTANT_EXTENDED' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

----
----

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_WILHELMINA'),  					     		('RELIGION_CATHOLICISM')
WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_WILHELMINA')
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 0)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 1);

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_WILHELMINA'),  					     		('RELIGION_PROTESTANTISM')
WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_WILHELMINA')
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 1);

---
---

CREATE TRIGGER DLCWilhelminaHR
AFTER INSERT ON HistoricalAgendas WHEN 'LEADER_WILHELMINA' = NEW.LeaderType
BEGIN
	
	DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_WILHELMINA' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_WILHELMINA');

	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 									ReligionType)
	SELECT  	('LEADER_WILHELMINA'),  					     		('RELIGION_CATHOLICISM')
	WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_WILHELMINA')
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 0)
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 									ReligionType)
	SELECT  	('LEADER_WILHELMINA'),  					     		('RELIGION_PROTESTANTISM')
	WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_WILHELMINA')
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_PROTESTANT_EXTENDED' AND Value = 0)
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 									ReligionType)
	SELECT  	('LEADER_WILHELMINA'),  					     		('RELIGION_P1_CALVINISM')
	WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_WILHELMINA')
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_PROTESTANT_EXTENDED' AND Value = 1)
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

	----
	----

	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 									ReligionType)
	SELECT  	('LEADER_WILHELMINA'),  					     		('RELIGION_CATHOLICISM')
	WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_WILHELMINA')
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 0)
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 1);

	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 									ReligionType)
	SELECT  	('LEADER_WILHELMINA'),  					     		('RELIGION_PROTESTANTISM')
	WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_WILHELMINA')
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_CHRISTIAN_DENOMINATIONS' AND Value = 1)
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 1);

END;

---------------------------------------------------------------------------
---------------------------------------------------------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_SALADIN';

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
VALUES  	('LEADER_SALADIN',  								'RELIGION_ISLAM');

---------------------------------------------------------------------------
---------------------------------------------------------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_CHANDRAGUPTA' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_CHANDRAGUPTA');

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_CHANDRAGUPTA'),  								('RELIGION_JAINISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0)
AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_CHANDRAGUPTA');

---
---

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_CHANDRAGUPTA'),  								('RELIGION_HINDUISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 1)
AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_CHANDRAGUPTA');

---
---

CREATE TRIGGER DLCChandraguptaHR
AFTER INSERT ON HistoricalAgendas WHEN 'LEADER_CHANDRAGUPTA' = NEW.LeaderType
BEGIN
	
	DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_CHANDRAGUPTA' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_CHANDRAGUPTA');
	
	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 									ReligionType)
	SELECT  	('LEADER_CHANDRAGUPTA'),  								('RELIGION_JAINISM')
	WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0)
	AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_CHANDRAGUPTA');
	
	---
	---
	
	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 									ReligionType)
	SELECT  	('LEADER_CHANDRAGUPTA'),  								('RELIGION_HINDUISM')
	WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 1)
	AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_CHANDRAGUPTA');

END;

-------------------------
-------------------------


DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_GANDHI';

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_GANDHI'),  								('RELIGION_HINDUISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_HINDU_DENOMINATIONS' AND Value = 0)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 								 	ReligionType)
SELECT  	('LEADER_GANDHI'),  								('RELIGION_H2_VAISHNAVISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_HINDU_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---
---

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_GANDHI'),  								('RELIGION_HINDUISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 1);

-------------------------
-------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_GITARJA' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_GITARJA');

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_GITARJA'),  								('RELIGION_HINDUISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_HINDU_DENOMINATIONS' AND Value = 0)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0)
AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_GITARJA');

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 								 	ReligionType)
SELECT  	('LEADER_GITARJA'),  								('RELIGION_H3_SHAIVISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_HINDU_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0)
AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_GITARJA');

---
---

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_GITARJA'),  								('RELIGION_HINDUISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 1)
AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_GITARJA');

---
---

CREATE TRIGGER DLCGitarjaHR
AFTER INSERT ON HistoricalAgendas WHEN 'LEADER_GITARJA' = NEW.LeaderType
BEGIN

	DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_GITARJA' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_GITARJA');
	
	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 									ReligionType)
	SELECT  	('LEADER_GITARJA'),  								('RELIGION_HINDUISM')
	WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_HINDU_DENOMINATIONS' AND Value = 0)
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0)
	AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_GITARJA');
	
	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 								 	ReligionType)
	SELECT  	('LEADER_GITARJA'),  								('RELIGION_H3_SHAIVISM')
	WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_HINDU_DENOMINATIONS' AND Value = 1)
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0)
	AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_GITARJA');
	
	---
	---
	
	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 									ReligionType)
	SELECT  	('LEADER_GITARJA'),  								('RELIGION_HINDUISM')
	WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 1)
	AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_GITARJA');

END;

---------------------------------------------------------------------------
---------------------------------------------------------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_HOJO';

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_HOJO'),  								('RELIGION_BUDDHISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_BUDDHIST_DENOMINATIONS' AND Value = 0)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_HOJO'),  								('RELIGION_B1_MAHAYANA')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_BUDDHIST_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

---
---

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  ('LEADER_HOJO'),  								('RELIGION_BUDDHISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 1);

-------------------------
-------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_JAYAVARMAN' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_JAYAVARMAN');

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_JAYAVARMAN'),  							('RELIGION_BUDDHISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_BUDDHIST_DENOMINATIONS' AND Value = 0)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0)
AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_JAYAVARMAN');

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_JAYAVARMAN'),  							('RELIGION_B1_MAHAYANA')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_BUDDHIST_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0)
AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_JAYAVARMAN');

---
---

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_JAYAVARMAN'),  							('RELIGION_BUDDHISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 1)
AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_JAYAVARMAN');

---
---

CREATE TRIGGER DLCJayavarmanHR
AFTER INSERT ON HistoricalAgendas WHEN 'LEADER_JAYAVARMAN' = NEW.LeaderType
BEGIN

	DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_JAYAVARMAN' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_JAYAVARMAN');
	
	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 									ReligionType)
	SELECT  	('LEADER_JAYAVARMAN'),  							('RELIGION_BUDDHISM')
	WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_BUDDHIST_DENOMINATIONS' AND Value = 0)
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0)
	AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_JAYAVARMAN');
	
	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 									ReligionType)
	SELECT  	('LEADER_JAYAVARMAN'),  							('RELIGION_B1_MAHAYANA')
	WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_BUDDHIST_DENOMINATIONS' AND Value = 1)
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0)
	AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_JAYAVARMAN');
	
	---
	---
	
	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 									ReligionType)
	SELECT  	('LEADER_JAYAVARMAN'),  							('RELIGION_BUDDHISM')
	WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 1)
	AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_JAYAVARMAN');
	
END;

-------------------------
-------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_SEONDEOK' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_SEONDEOK');

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_SEONDEOK'),  							('RELIGION_BUDDHISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_BUDDHIST_DENOMINATIONS' AND Value = 0)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0)
AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_SEONDEOK');

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_SEONDEOK'),  							('RELIGION_B1_MAHAYANA')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_BUDDHIST_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0)
AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_SEONDEOK');

---
---

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_SEONDEOK'),  							('RELIGION_BUDDHISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 1)
AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_SEONDEOK');

---
---

CREATE TRIGGER DLCSeondeokHR
AFTER INSERT ON HistoricalAgendas WHEN 'LEADER_SEONDEOK' = NEW.LeaderType
BEGIN

	DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_SEONDEOK' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_SEONDEOK');
	
	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 									ReligionType)
	SELECT  	('LEADER_SEONDEOK'),  							('RELIGION_BUDDHISM')
	WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_BUDDHIST_DENOMINATIONS' AND Value = 0)
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0)
	AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_SEONDEOK');
	
	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 									ReligionType)
	SELECT  	('LEADER_SEONDEOK'),  							('RELIGION_B1_MAHAYANA')
	WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_BUDDHIST_DENOMINATIONS' AND Value = 1)
	AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0)
	AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_SEONDEOK');

	---
	---
	
	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 									ReligionType)
	SELECT  	('LEADER_SEONDEOK'),  							('RELIGION_BUDDHISM')
	WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 1)
	AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_SEONDEOK');
	
END;

---------------------------------------------------------------------------
---------------------------------------------------------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_ALEXANDER' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_ALEXANDER');

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 								 	ReligionType)
SELECT  	('LEADER_ALEXANDER'),  						    		('RELIGION_HELLENISM')
WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_ALEXANDER');

-----
-----

CREATE TRIGGER DLCAlexanderHR
AFTER INSERT ON Leaders WHEN 'LEADER_ALEXANDER' = NEW.LeaderType
BEGIN

	DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_ALEXANDER' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_ALEXANDER');

	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 								 	ReligionType)
	SELECT  	('LEADER_ALEXANDER'),  						    		('RELIGION_HELLENISM')
	WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_ALEXANDER');

END;

-------------------------
-------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_GORGO';
DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_PERICLES';

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 								 	ReligionType)
VALUES 		('LEADER_GORGO',  								'RELIGION_HELLENISM'),
		('LEADER_PERICLES',  								'RELIGION_HELLENISM');

-------------------------
-------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_TRAJAN';

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_TRAJAN'),  								('RELIGION_HELLENISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_GRECO_ROMAN_DENOMINATIONS' AND Value = 0)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 								 	ReligionType)
SELECT  	('LEADER_TRAJAN'),  								('RELIGION_R5_IMPERIAL_CULT')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_GRECO_ROMAN_DENOMINATIONS' AND Value = 1)
AND EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 0);

----
----

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  	('LEADER_TRAJAN'),  								('RELIGION_HELLENISM')
WHERE EXISTS (SELECT * FROM HR_Denominations WHERE Type = 'HR_LIGHT_MODE' AND Value = 1);

---------------------------------------------------------------------------
---------------------------------------------------------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_CYRUS' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_CYRUS');

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 									ReligionType)
SELECT  ('LEADER_CYRUS'),  								('RELIGION_ZOROASTRIANISM')
WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_CYRUS');

------
------

--CREATE TRIGGER DLCCyrusHR
--AFTER INSERT ON FavoredReligions WHEN 'LEADER_CYRUS' = NEW.LeaderType
--BEGIN
--	INSERT OR REPLACE INTO FavoredReligions 
--			(LeaderType, 								ReligionType)
--	VALUES  	('LEADER_CYRUS',  					  		'RELIGION_ZOROASTRIANISM');
--END;

---------------------------------------------------------------------------
---------------------------------------------------------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_AMANITORE' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_AMANITORE');

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 								 	ReligionType)
SELECT  ('LEADER_AMANITORE'),  						    ('RELIGION_PESEDJET')
WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_AMANITORE');

-----
-----

CREATE TRIGGER DLCAmanitoreHR
AFTER INSERT ON Leaders WHEN 'LEADER_AMANITORE' = NEW.LeaderType
BEGIN

	DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_AMANITORE' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_AMANITORE');
	
	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 								 	ReligionType)
	SELECT  ('LEADER_AMANITORE'),  						    ('RELIGION_PESEDJET')
	WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_AMANITORE');

END;

-------------------------
-------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_CLEOPATRA';

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 								 	ReligionType)
VALUES 	('LEADER_CLEOPATRA',  							'RELIGION_PESEDJET');

---------------------------------------------------------------------------
---------------------------------------------------------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_GENGHIS_KHAN' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_GENGHIS_KHAN');

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 								 	ReligionType)
SELECT  ('LEADER_GENGHIS_KHAN'),  						    ('RELIGION_TENGRIISM')
WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_GENGHIS_KHAN');

-----
-----

CREATE TRIGGER DLCGenghisHR
AFTER INSERT ON Leaders WHEN 'LEADER_GENGHIS_KHAN' = NEW.LeaderType
BEGIN

	DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_GENGHIS_KHAN' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_GENGHIS_KHAN');

	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 								 	ReligionType)
	SELECT  ('LEADER_GENGHIS_KHAN'),  						    ('RELIGION_TENGRIISM')
	WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_GENGHIS_KHAN');

END;

---------------------------------------------------------------------------
---------------------------------------------------------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_LAUTARO' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_LAUTARO');

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 								 	ReligionType)
SELECT  ('LEADER_LAUTARO'),  						    ('RELIGION_WITRAN_MAPU')
WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_LAUTARO');

-----
-----

CREATE TRIGGER DLCLautaroHR
AFTER INSERT ON Leaders WHEN 'LEADER_LAUTARO' = NEW.LeaderType
BEGIN

	DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_LAUTARO' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_LAUTARO');

	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 								 	ReligionType)
	SELECT  ('LEADER_LAUTARO'),  						    ('RELIGION_WITRAN_MAPU')
	WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_LAUTARO');

END;

---------------------------------------------------------------------------
---------------------------------------------------------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_POUNDMAKER' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_POUNDMAKER');

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 								 	ReligionType)
SELECT  ('LEADER_POUNDMAKER'),  						    ('RELIGION_WAKAN_TANKA')
WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_POUNDMAKER');

-----
-----

CREATE TRIGGER DLCPoundHR
AFTER INSERT ON Leaders WHEN 'LEADER_POUNDMAKER' = NEW.LeaderType
BEGIN

	DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_POUNDMAKER' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_POUNDMAKER');

	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 								 	ReligionType)
	SELECT  ('LEADER_POUNDMAKER'),  						    ('RELIGION_WAKAN_TANKA')
	WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_POUNDMAKER');

END;

---------------------------------------------------------------------------
---------------------------------------------------------------------------

DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_SHAKA' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_SHAKA');

INSERT OR REPLACE INTO FavoredReligions 
		(LeaderType, 								 	ReligionType)
SELECT  ('LEADER_SHAKA'),  						    ('RELIGION_AMATONGO')
WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_SHAKA');

-----
-----

CREATE TRIGGER DLCShakaHR
AFTER INSERT ON Leaders WHEN 'LEADER_SHAKA' = NEW.LeaderType
BEGIN

	DELETE FROM FavoredReligions WHERE LeaderType = 'LEADER_SHAKA' AND EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_SHAKA');

	INSERT OR REPLACE INTO FavoredReligions 
			(LeaderType, 								 	ReligionType)
	SELECT  ('LEADER_SHAKA'),  						    ('RELIGION_AMATONGO')
	WHERE EXISTS (SELECT * FROM Leaders WHERE LeaderType = 'LEADER_SHAKA');

END;

---------------------------------------------------------------------------
---------------------------------------------------------------------------

--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
--$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$