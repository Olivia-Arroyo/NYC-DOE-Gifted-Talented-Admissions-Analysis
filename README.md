# NYC-DOE-Gifted-Talented-Admissions-Analysis
A SQL data analysis project examining the admission rates of the NYC DOE's Gifted and Talented program. 

## I. Research Questions
- What proportion of applicants receive offers for admission into NYC's gifted and talented program?
- How do the offer rates among districts compare?
- What changes occurred in the percentage of offers extended to applicants following the adjustments made to admissions procedures post-Covid?

## II. Collect Data
For this data analysis data was extracted rom the NYC DOE site: https://infohub.nyced.org/reports. The data was in four different tables in one Excel file with a lot of formatting issues. The 2019 and 2020 tables had an addition column, Tested, that was not included in the 2021 and 2022 tables. The data was split into two tables in order to compare pre and post Covid admissions data: one table for 2019-2020 and a second table for 2021-2022.

## III. Data Cleaning
In order to analyze the data it was necessary to reformat the data so that it could be loaded into SQL. The tables were separated into a new Excel file and then converted the file from Excel to JSON. 

Steps to clean the data in SQL:
- Converted the column data types.
- Set the primary key (Year, District)
- Reformatted values that were formatted wrong so they matched the column data type.
- Converted the remaining data types.

## IV. Analyzing the Data
The data reveals a notable decrease in the number of applicants accepted into the Gifted and Talented program following the post-COVID admission adjustments. Across all 32 districts within the DOE, there was a lower percentage of offers made in 2021 and 2022 compared to 2019 and 2020, making admissions to the G&T program significantly more competitive.

Before the COVID-19 pandemic, admission to the G&T program relied on standardized exams. However, starting in 2021, testing was replaced with a nomination process where students were recommended by their teachers or a DOE representative specializing in early childhood education, resulting in a significant shift in admissions dynamics.

Key Insights Pre-Admission Changes:
- The average percentage of offers was 78.63%.
- The highest percentage of offers  was 100% in District 32.
- District 32, 23, 31, 11 and 27 had the highest percentage of offers respectively.
- The lowest percentage of offers was 36% in District 6.
- District 6, 4, 5, 3 and 2 had the lowest percentage of offers respectively.   

Key Insights Post-Admission Changes:
- The average percentage of offers was 23.30%.
- The highest percentage of offers was 59.72% in District 16.
- District 16, 23, 7, 1 and 4 had the highest percentage of offers respectively.
- The lowest percentage of offers was 10.89 in District 27%.
- District 27, 6, 29 ,23 and 11 had the lowest percentage of offers respectively.   

