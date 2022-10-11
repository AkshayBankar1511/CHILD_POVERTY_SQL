--REPORT 2-- 
--DISPLAYING THE REGION VALUE 14 ONLY IN ETHIOPIA COUNTRY--
CREATE PROCEDURE SP_REGION
AS
BEGIN
	SELECT childid, panel, dint, region, chhealth FROM Ethiopia
	WHERE region=14;
END

EXEC SP_REGION

--DISPLAYING THE CHILD'S FIRST LANGUAGUE IN DESCENDING ORDER IN INDIA--
CREATE PROCEDURE SP_CHLANG
AS
BEGIN
	SELECT childid, chlang, dint, chsex, agemon, chethnic FROM India
	ORDER BY chlang DESC
END
EXEC SP_CHLANG


--DISPLAYING THE AGE OF HOUSEHOLD HEAD IN ASCENDING ORDER IN PERU--
CREATE PROCEDURE SP_HEADAGE
AS
BEGIN
	SELECT childid, dint, headage FROM Peru
	WHERE headage is not null
	ORDER BY headage
END
EXEC SP_HEADAGE

--CALCULATING THE COUNT OF CHILD'S AGE IN MONTHS FOR VIETNAM--
CREATE PROCEDURE SP_AGEMON
AS
BEGIN
	SELECT agemon, count(*) as count 
	FROM Vietnam
	WHERE agemon IS NOT NULL
	GROUP BY agemon
	ORDER BY agemon 
END
EXEC SP_AGEMON