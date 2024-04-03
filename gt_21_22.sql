-- Dataset: Gifted and Talented
-- Source: The data was sourced from the NYC DOE public data located at: https://infohub.nyced.org/reports
-- Queried using MySQL Workbench

-- DATA CLEANING -- 2021-2022 Data: Post-Covid Admissions Changes

USE sql_gifted_talented;

-- Convert the columns' data types
ALTER TABLE gt_results_21_22
MODIFY COLUMN Year Year,
MODIFY COLUMN District VARCHAR(2);

-- Set primary key
ALTER TABLE gt_results_21_22
ADD CONSTRAINT PK_YearDistrict PRIMARY KEY (Year, District);

-- Correct values with formatting issues
UPDATE gt_results_21_22
SET 
    Applicants = '1111',
    Eligible = '1024'
WHERE Year = 2022 AND District = '2';

UPDATE gt_results_21_22
SET 
    Applicants = '1235',
    Eligible = '1142'
WHERE Year = 2021 AND District = '2';

-- Convert the remaining column data types
ALTER TABLE gt_results_21_22
MODIFY COLUMN Applicants INT,
MODIFY COLUMN Eligible INT,
MODIFY COLUMN Offers INT;

-- Create table with clean data
CREATE TABLE gt_21_22_clean
AS
SELECT 
    Year,
    District,
    Applicants,
    Eligible,
    (Eligible / Applicants * 100) AS Percent_Eligible_Applicants,
    Offers,
    (Offers / Applicants * 100) AS Percent_Offers_Made_Applicants_Post_Changes
FROM gt_results_21_22
ORDER BY Percent_Offers_Made_Applicants_Post_Changes;





    
