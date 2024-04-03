-- Dataset: Gifted and Talented
-- Source: The data was sourced from the NYC DOE public data located at: https://infohub.nyced.org/reports
-- Queried using MySQL Workbench

-- DATA CLEANING -- 2019-2020 Data: Pre-Covid Admissions Changes

USE sql_gifted_talented;

-- Convert the columns' data types
ALTER TABLE gt_results_19_20
MODIFY COLUMN Year Year,
MODIFY COLUMN District VARCHAR(2);

-- Set primary key
ALTER TABLE gt_results_19_20
ADD CONSTRAINT PK_YearDistrict PRIMARY KEY (Year, District);

-- Delete rows with incomplete data
DELETE FROM gt_results_19_20
WHERE Eligible = 's' AND District > 0 AND Year > 0;

DELETE FROM gt_results_19_20
WHERE  Offers = 's' AND District > 0 AND Year > 0;

-- Convert the remaining column data types
ALTER TABLE gt_results_19_20
MODIFY COLUMN Tested INT,
MODIFY COLUMN Applicants INT,
MODIFY COLUMN Eligible INT,
MODIFY COLUMN Offers INT;

-- Create table with clean data
CREATE TABLE gt_19_20_clean
AS
SELECT 
	Year,
    District,
	Tested,
    Eligible,
    (Eligible / Tested * 100) AS Perecent_Eligible_After_Testing,
    Applicants,
	(Applicants / Eligible * 100) AS Percent_Applicants_From_Eligible_Pool,
    Offers,
    (Offers / Applicants * 100) AS Percent_Offers_Made_Applicants_Pre_Changes
FROM gt_results_19_20
ORDER BY Percent_Offers_Made_Applicants_Pre_Changes;
