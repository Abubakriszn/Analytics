SELECT *
FROM Crashes;


-- 1-creating a table duplicate--

CREATE TABLE Crashes_2
LIKE Crashes;

SELECT *
FROM Crashes_2;
INSERT Crashes_2
SELECT *
FROM Crashes;

SELECT *
FROM Crashes_2;

	SELECT *,
    ROW_NUMBER() OVER(
    Partition BY Quarter, State, Total_Crashes, Num_Injured, Num_Killed, Total_Vehicles_Involved, SPV, DAD, PWR, FTQ, Other_Factors)
    As row_num
    FROM Crashes_2;
    
WITH duplicate_CTE AS
(
SELECT *,
ROW_NUMBER() OVER(
    Partition BY Quarter, State, Total_Crashes, Num_Injured, Num_Killed, Total_Vehicles_Involved, SPV, DAD, PWR, FTQ, Other_Factors)
As row_num
FROM Crashes_2
)
SELECT *
FROM duplicate_CTE
where row_num > 1;

-- 2- Trimming Unwanted Spaces---

SELECT Quarter, TRIM(Quarter),
 State, TRIM(State),
 Total_Crashes, TRIM(Total_Crashes),
 Num_Injured, TRIM(Num_Injured),
 Num_Killed, TRIM(Num_Killed),
 Total_Vehicles_Involved, TRIM(Total_Vehicles_Involved),
 SPV, TRIM(SPV),
 DAD, TRIM(DAD),
 PWR, TRIM(PWR),
 FTQ, TRIM(FTQ),
 Other_Factors, TRIM(Other_Factors)
 FROM Crashes_2;
 
 -- 3- Updating the Trimmed Table-----

UPDATE Crashes_2
 SET Quarter = TRIM(Quarter), 
  State = TRIM(State),
  Total_Crashes = TRIM(Total_Crashes),
  Num_Injured = TRIM(Num_Injured),
  Num_Killed = TRIM(Num_Killed),
  Total_Vehicles_Involved = TRIM(Total_Vehicles_Involved),
  SPV = TRIM(SPV),
  DAD = TRIM(DAD),
  PWR = TRIM(PWR),
  FTQ = TRIM(FTQ),
  Other_Factors = TRIM(Other_Factors);
  
  SELECT *
  FROM crashes_2;
  
  -- 4- Changing the rows values----
  
  SELECT Quarter
FROM Crashes_2
WHERE Quarter LIKE '%2020';

UPDATE crashes_2
SET Quarter = '2020'
WHERE Quarter LIKE '%2020';

SELECT *
FROM crashes_2;

SELECT Quarter
FROM Crashes_2
WHERE Quarter LIKE '%2021';

UPDATE crashes_2
SET Quarter = '2021'
WHERE Quarter LIKE '%2021';

SELECT Quarter
FROM Crashes_2
WHERE Quarter LIKE '%2022';

UPDATE crashes_2
SET Quarter = '2022'
WHERE Quarter LIKE '%2022';

SELECT Quarter
FROM Crashes_2
WHERE Quarter LIKE '%2023';

UPDATE crashes_2
SET Quarter = '2023'
WHERE Quarter LIKE '%2023';

SELECT Quarter
FROM Crashes_2
WHERE Quarter LIKE '%2024';

UPDATE crashes_2
SET Quarter = '2024'
WHERE Quarter LIKE '%2024';

-- 5- Generating the top 10 states according to total_crashes---

SELECT *
FROM crashes_2
ORDER BY Total_Crashes DESC
LIMIT 10;

-- 6- Generating the sum of total_crashes between the year 2020 to 2024---

SELECT SUM(Total_Crashes)
FROM crashes_2;

-- 7- Generating the top 10 states according to number of victims injured---

SELECT *
FROM crashes_2
ORDER BY Num_Injured DESC
LIMIT 10;

-- 8- Generating the sum of victims injured between the year 2020 to 2024---

SELECT SUM(Num_Injured)
FROM crashes_2;

-- 9- Generating the top 10 states according to number of victims Killed---

SELECT *
FROM crashes_2
ORDER BY Num_Killed DESC
LIMIT 10;

-- 10- Generating the sum of victims Killed between the year 2020 to 2024---

SELECT SUM(Num_Killed)
FROM crashes_2;

-- 11- Generating the top 10 states according to number of total vehicles involved---

SELECT *
FROM crashes_2
ORDER BY Total_Vehicles_Involved DESC
LIMIT 10;

--  12- Generating the sum of total vehicles involved between the year 2020 to 2024---


SELECT SUM(Total_Vehicles_Involved)
FROM crashes_2;

--  13- Generating the top 10 states according to number of other factors---

SELECT *
FROM crashes_2
ORDER BY Other_Factors DESC
LIMIT 10;

--  14- Generating the sum of other factors involved between the year 2020 to 2024---

SELECT SUM(Other_Factors)
FROM crashes_2;

--  15-- Generating the top 10 states according to the sum of total crashes---


SELECT *
FROM crashes_2
ORDER BY Total_Crashes ASC
LIMIT 10;

SELECT *
FROM crashes_2;

--  16 --- Renaming the column titles---

ALTER TABLE crashes_2 CHANGE SPV
Speed_Violation INT;


SELECT *
FROM crashes_2;

ALTER TABLE crashes_2 CHANGE DAD
Driving_Under_Influence INT;

SELECT *
FROM crashes_2;

ALTER TABLE crashes_2 CHANGE PWR
Poor_Weather INT;

SELECT *
FROM crashes_2;

ALTER TABLE crashes_2 CHANGE FTQ
Fatigue INT;

SELECT *
FROM crashes_2;

--  17 - Generating the top 10 states according to poor weather---


SELECT *
FROM crashes_2
ORDER BY Poor_Weather DESC
LIMIT 10;

 --  18 - Generating the top 10 states according to  rate of driving under the influence of alcohol/drug---

SELECT *
FROM crashes_2
ORDER BY Driving_Under_Influence DESC
LIMIT 10;

--  19 - Generating the top 10 states according to  rate of speed violation---

SELECT *
FROM crashes_2
ORDER BY Speed_Violation DESC
LIMIT 10;

--  20 - Generating the top 10 states according to  rate of tiredness or fatigue---

SELECT *
FROM crashes_2
ORDER BY Fatigue DESC
LIMIT 10;

-- 21 later discovered a negative sign behind the other_factors rows and then later cleaned them by the query below.--

SELECT *
FROM crashes_2
WHERE Other_Factors 
LIKE '-%';

UPDATE crashes_2
SET Other_Factors=
Replace (Other_Factors, '-', '')
WHERE Other_Factors LIKE '-%';

SELECT *
FROM crashes_2
WHERE Other_Factors 
LIKE '-%';