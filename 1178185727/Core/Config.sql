--Code created by Chrisy15
UPDATE Map_GreatPersonClasses SET MaxWorldInstances = (MIN(16, (SELECT COUNT(ReligionType) FROM Religions WHERE RequiresCustomName = 0 AND Pantheon = 0))) WHERE GreatPersonClassType = 'GREAT_PERSON_CLASS_PROPHET';

CREATE TRIGGER IF NOT EXISTS C15_Pok_ReligionIncreased
AFTER INSERT ON Religions
WHEN NEW.RequiresCustomName = 0 AND NEW.Pantheon = 0 AND (SELECT MAX(MaxWorldInstances) FROM Map_GreatPersonClasses WHERE GreatPersonClassType = 'GREAT_PERSON_CLASS_PROPHET') < 16
BEGIN
    --UPDATE Map_GreatPersonClasses SET MaxWorldInstances = (MIN(16, (SELECT COUNT(ReligionType) FROM Religions WHERE RequiresCustomName = 0))) WHERE GreatPersonClassType = 'GREAT_PERSON_CLASS_PROPHET';
    UPDATE Map_GreatPersonClasses SET MaxWorldInstances = (MIN(16, MaxWorldInstances + 1));
END;
    
