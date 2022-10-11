/* CREATING THE TABLES */


--TABLE 1--
Create table Ethiopia
(
U_ID INT,
[childid] VARCHAR(32),
[yc] INT,
[round] INT,
[inround] INT,
[panel] INT,
[dint] DATETIME NULL,
[clustid] INT NULL,
[region] INT NULL,
[typesite] INT NULL,
[childloc] INT NULL,
[chsex] INT NULL,
[chlang] INT NULL,
[chethnic] INT NULL,
[chldrel] INT NULL,
[agemon] INT NULL,
[chweight] FLOAT NULL,
[bmi] FLOAT NULL,
[fhfa] INT NULL,
[underweight] INT NULL,
[stunting] INT NULL,
[thinness] INT NULL,
[chhrel] INT NULL,
[chhealth] INT NULL,
[headage] INT NULL,
[wi_new] FLOAT NULL,
CONSTRAINT PK_Ethiopia_U_ID PRIMARY KEY (U_ID)
)


/* INSERTING THE VALUES IN TABLES */

INSERT INTO Ethiopia 
Select U_ID,childid,yc,round,inround,panel,dint,clustid,region,
typesite,childloc,chsex,chlang,chethnic,chldrel,agemon,
chweight,bmi,fhfa,underweight,stunting,thinness,chhrel,chhealth,headage,wi_new
from dbo.ethiopia_constructed$;

Select * from Ethiopia;

--TABLE 2--

Create table India
(
[IND_ID] INT,  
[childid] VARCHAR(32),
[yc] INT,
[round] INT,
[inround] INT,
[panel12345] INT,
[dint] DATETIME NULL,
[clustid] INT NULL,
[region] INT NULL,
[typesite] INT NULL,
[childloc] INT NULL,
[chsex] INT NULL,
[chlang] INT NULL,
[chethnic] INT NULL,
[chldrel] INT NULL,
[agemon] INT NULL,
[chweight] FLOAT NULL,
[bmi] FLOAT NULL,
[fhfa] INT NULL,
[underweight] INT NULL,
[stunting] INT NULL,
[thinness] INT NULL,
[chhrel] INT NULL,
[chhealth] INT NULL,
[headage] INT NULL,
[headrel] INT NULL,
CONSTRAINT PK_IND_ID PRIMARY KEY (IND_ID)
)

--INSERTING THE VALUES IN TABLES--
INSERT INTO India 
Select IND_ID,childid,yc,round,inround,panel12345,dint,clustid,region,
typesite,childloc,chsex,chlang,chethnic,chldrel,agemon,
chweight,bmi,fhfa,underweight,stunting,thinness,chhrel,chhealth,headage,headrel
from dbo.india_constructed$;

Select * from India;

--TABLE 3--

Create table Peru
(
[PER_ID] INT,
[childid] VARCHAR(32),
[yc] INT,
[round] INT,
[inround] INT,
[panel12345] INT,
[dint] DATETIME NULL,
[clustid] INT NULL,
[region] INT NULL,
[typesite] INT NULL,
[childloc] INT NULL,
[chsex] INT NULL,
[chlang] INT NULL,
[chethnic] INT NULL,
[chldrel] INT NULL,
[agemon] INT NULL,
[chweight] FLOAT NULL,
[bmi] FLOAT NULL,
[fhfa] INT NULL,
[underweight] INT NULL,
[stunting] INT NULL,
[thinness] INT NULL,
[chhrel] INT NULL,
[chhealth] INT NULL,
[headage] INT NULL,
[headrel] INT NULL,
CONSTRAINT PK_PER_ID PRIMARY KEY (PER_ID)
)

-- INSERTING THE VALUES IN TABLES --
INSERT INTO Peru 
Select PER_ID,childid,yc,round,inround,panel12345,dint,clustid,region,
typesite,childloc,chsex,chlang,chethnic,chldrel,agemon,
chweight,bmi,fhfa,underweight,stunting,thinness,chhrel,chhealth,headage,headrel
from dbo.peru_constructed$;

Select * from Peru;

--TABLE 4--
Create table Vietnam
(
[VIET_ID] INT,
[childid] VARCHAR(32),
[yc] INT,
[round] INT,
[inround] INT,
[panel12345] INT,
[dint] DATETIME NULL,
[clustid] INT NULL,
[region] INT NULL,
[typesite] INT NULL,
[childloc] INT NULL,
[chsex] INT NULL,
[chlang] INT NULL,
[chethnic] INT NULL,
[chldrel] INT NULL,
[agemon] INT NULL,
[chweight] FLOAT NULL,
[bmi] FLOAT NULL,
[fhfa] INT NULL,
[underweight] INT NULL,
[stunting] INT NULL,
[thinness] INT NULL,
[chhrel] INT NULL,
[chhealth] INT NULL,
[headage] INT NULL,
[headrel] INT NULL,
CONSTRAINT FK_VIET_ID PRIMARY KEY (VIET_ID)
)

/* INSERTING THE VALUES IN TABLES */
INSERT INTO Vietnam 
Select VIET_ID,childid,yc,round,inround,panel12345,dint,clustid,region,
typesite,childloc,chsex,chlang,chethnic,chldrel,agemon,
chweight,bmi,fhfa,underweight,stunting,thinness,chhrel,chhealth,headage,headrel
from dbo.vietnam_constructed$;

select * from Vietnam;


--REPORT 1-- 
--Displaying Younger cohort in the country Ehtiopia---
CREATE VIEW V_Younger_Cohort
AS
SELECT childid,yc,round,dint,clustid,region,chsex,agemon,chweight,bmi,chhealth FROM Ethiopia
WHERE yc=1;

SELECT * from V_Younger_Cohort;

--Displaying Older cohort in the country India---
CREATE VIEW V_Older_Cohort
AS
SELECT childid,yc,round,dint,clustid,region,chsex,agemon,chweight,bmi,chhealth FROM India
WHERE yc=0;

SELECT * FROM V_Older_Cohort;

--Displaying Body mass index(BMI) GREATER THAN 10 in the country Peru---
CREATE VIEW V_bmi
AS
SELECT childid,yc,round,dint,clustid,region,chsex,agemon,chweight,bmi,chhealth FROM Peru
WHERE bmi>10;

SELECT * FROM V_bmi;

--Displaying Childweight(kg) in the country Vietnam---
CREATE VIEW V_chweight
AS
SELECT childid,yc,round,dint,clustid,region,chsex,agemon,chweight,bmi,chhealth FROM Vietnam
WHERE chweight>50;

SELECT * FROM V_chweight;

--Displaying the Complex Views for the countries Peru and Vietnam---
CREATE VIEW Complex_V
AS
SELECT * FROM Peru
UNION
SELECT * FROM Vietnam

SELECT * FROM Complex_V;