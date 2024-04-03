-- Dataset: Gifted and Talented
-- Source: The data was sourced from the NYC DOE public data located at: https://infohub.nyced.org/reports
-- Queried using MySQL Workbench

-- What proportion of applicants receive offers for admission into NYC's gifted and talented program?
-- How do the offer rates among districts compare?
-- What changes occurred in the percentage of offers extended to applicants following the adjustments made to admissions procedures post-Covid?

-- Returning data from the pre and post Covid tables to compare the trends in offers from 2019 - 2022.
SELECT 
    pre.District,
    pre.Year,
    Percent_Offers_Made_Applicants_Pre_Covid AS Percent_Offers_Made
FROM gt_19_20_clean pre 
LEFT JOIN gt_21_22_clean post ON pre.District = post.District
UNION
SELECT 
    post.District,
    post.Year,
    Percent_Offers_Made_Applicants_Post_Covid
FROM gt_21_22_clean post 
RIGHT JOIN gt_19_20_clean pre ON pre.District = post.District
ORDER BY District, Year;

-- Count the number of districts apart of the data set
SELECT DISTINCT COUNT(District)
FROM gt_19_20_clean;

SELECT DISTINCT COUNT(District)
FROM gt_21_22_clean;

-- What was the average offer rate for the G&T program prior to the admission changes?
-- Retrieve the average percentage of offers made pre admission changes
SELECT AVG(Percent_Offers_Made_Applicants_Pre_Covid)
FROM gt_19_20_clean;

-- What districts had the highest percentage of offers prior to the admission adjustments? 
-- What were the percentages of offers extended by those districts?
-- Retrieve the highest percentage of offers made pre admission changes
SELECT 
    District,
    Year,
    Percent_Offers_Made_Applicants_Pre_Covid
FROM gt_19_20_clean
ORDER BY Percent_Offers_Made_Applicants_Pre_Covid DESC;

-- What districts had the lowest percentage of offers prior to the admission adjustments? 
-- What were the percentages of offers extended by those districts?
-- Retrieve the lowest percentage of offers made pre admission changes
SELECT 
    District,
    Year,
    Percent_Offers_Made_Applicants_Pre_Covid
FROM gt_19_20_clean
ORDER BY Percent_Offers_Made_Applicants_Pre_Covid;

-- What was the average offer rate for the G&T program after the admission changes?
-- Retrieve the average percentage of offers made post admission changes
SELECT AVG(Percent_Offers_Made_Applicants_Post_Covid)
FROM gt_21_22_clean;

-- What districts had the highest percentage of offers after the admission adjustments? 
-- What were the percentages of offers extended by those districts?
-- Retrieve the highest percentage of offers made pre admission changes
SELECT 
    District,
    Year,
    Percent_Offers_Made_Applicants_Post_Covid
FROM gt_21_22_clean
ORDER BY Percent_Offers_Made_Applicants_Post_Covid DESC;

-- What districts had the lowest percentage of offers after the admission adjustments? 
-- What were the percentages of offers extended by those districts?
-- Retrieve the lowest percentage of offers made pre admission changes
SELECT 
    District,
    Year,
    Percent_Offers_Made_Applicants_Post_Covid
FROM gt_21_22_clean
ORDER BY Percent_Offers_Made_Applicants_Post_Covid;
