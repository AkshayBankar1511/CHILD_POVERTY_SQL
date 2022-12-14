--REPORT 4--

--ANALYSING CHWEIGHT MORE THAN 60 WITH GROUPING BMI IN ETHIOPIA---
SELECT childid, chweight, bmi
FROM Ethiopia 
WHERE childid LIKE '%ET%'
GROUP BY childid, chweight, bmi
HAVING chweight > 60
ORDER BY chweight DESC, bmi 


--ENSURING THE HOUSEHOLD SENTINEL SITE ID DATABASE REMAINS IN CONSISTENT STATE WHEN MUTIPLE USERS ACCESS IT IN INDIA--- 
--BLOCKING 1 USING XCLUSIVE LOCK--
BEGIN TRAN
SELECT * FROM India(XLOCK)
WHERE clustid BETWEEN 10 AND 90
--BLOCKING 2 QUERY IS IN SQLQUERY4.1--

-- BLOCKING 2 RELEASING--
COMMIT TRAN



--ANALYSING THE FULL DATE FUNCTION IN PERU---
CREATE FUNCTION FDATE
	(
		@dint as DATETIME
	)
RETURNS VARCHAR(MAX)
AS
BEGIN

	RETURN DATENAME(DW,@dint) + ' ' +
	DATENAME(D,@dint) + ' ' +
	DATENAME(M,@dint) + ' ' +
	DATENAME(YY,@dint) 
END

SELECT childid,dint,[dbo].[FDATE](dint) AS 'FULLDATE'
FROM Peru
WHERE childid LIKE '%PE15%' AND dint IS NOT NULL 



---ANALYSING THE CHILD'S DATE OF INTERVIEW WITH RESPECT TO YOUNGER COHERT--

SELECT childid, dint, yc, 
    CHOOSE(yc,'younger', 'older') AS data_cohert
FROM  Vietnam
WHERE dint IS NOT NULL
ORDER BY dint DESC

