use project;
# Then i have put datast(Hospital Data)in the mysql
select * from hospital_data;
# now we are able to do work in the data set

/* Hospital_Data.csv



Hospital Data Analysis | SQL Portfolio Project
Project Overview
This project analyzes a hospital dataset using MySQL to explore patient volume, staffing, department activity, length of stay, and medical expenses.
Dataset


- 100 records
- 8 columns
- Hospital Name
- Location
- Department
- Doctors Count
- Patients Count
- Admission Date
- Discharge Date
- Medical Expenses


The dataset is a practice/assignment dataset. Do not interpret the results as real-world medical or financial advice.
Business Questions

1. What is the total number of patients?

2. What is the average doctor count per hospital?

3. Which three departments have the highest patient counts?

4. Which hospital has the highest total medical expenses?

5. What are medical expenses per patient-stay day by hospital?

6. Which record has the longest hospital stay?

7. How many patients were treated in each city?

8. What is the average length of stay by department?

9. Which department has the lowest total patient count?

10. How do medical expenses vary by admission month?

*/
-- Hospital Data Analysis | SQL Portfolio Project
-- Database: MySQL 8+
-- Table name assumed:  hospital_data

-- Dataset columns:

-- Hospital Name, Location, Department, Doctors Count, Patients Count,
-- Admission Date, Discharge Date, Medical Expenses
--
-- IMPORTANT: 
# Import CSV date columns in DD-MM-YYYY format as VARCHAR,
-- or adjust the STR_TO_DATE expressions if your import uses DATE columns.

# now we are solve the question one by one

-- 1. Total number of patients

SELECT SUM(`Patients Count`) AS total_patients
FROM hospital_data;

# Answer->>> total_patients
# ->>'9347'


-- 2. Average number of doctors per hospital
select * from hospital_data;

SELECT `Hospital Name`,
       AVG(`Doctors Count`) AS avg_doctors
FROM hospital_data
GROUP BY `Hospital Name`
ORDER BY avg_doctors DESC;

-- 3. Top 3 departments by total patients
select * from hospital_data;

SELECT Department,
       SUM(`Patients Count`) AS total_patients
FROM hospital_data
GROUP BY Department
ORDER BY total_patients DESC
LIMIT 3;
/*  Answer->--> Department  total_patients
        -->>Urology	       1766
			Neurology	   1229
			ENT	           1064 */
            
            
-- 4. Hospital with the highest total medical expenses
select * from hospital_data;

SELECT "Hospital Name",
       SUM(`Medical Expenses`) AS total_medical_expenses
FROM hospital_data
GROUP BY `Hospital Name`
ORDER BY total_medical_expenses DESC
LIMIT 1;

-- 5. Average medical expenses per patient-stay day by hospital
-- This defines "daily average" as total expenses divided by total patient-stay days.
SELECT "Hospital Name",
       ROUND(
         SUM(`Medical Expenses`) /
         NULLIF(SUM(DATEDIFF(
           STR_TO_DATE(`Discharge Date`, '%d-%m-%Y'),
           STR_TO_DATE(`Admission Date`, '%d-%m-%Y')
         )), 0),
         2
       ) AS expense_per_patient_stay_day
FROM hospital_data
GROUP BY `Hospital Name`
ORDER BY expense_per_patient_stay_day DESC;

-- 6. Longest hospital stay
SELECT "Hospital Name", Location, Department,
       `Admission Date`, `Discharge Date`,
       DATEDIFF(
         STR_TO_DATE(`Discharge Date`, '%d-%m-%Y'),
         STR_TO_DATE(`Admission Date`, '%d-%m-%Y')
       ) AS stay_days
FROM hospital_data
ORDER BY stay_days DESC
LIMIT 1;

-- 7. Total patients treated per city/location
SELECT Location AS city,
       SUM(`Patients Count`) AS total_patients
FROM hospital_data
GROUP BY Location
ORDER BY total_patients DESC;

-- 8. Average length of stay per department
SELECT Department,
       ROUND(AVG(DATEDIFF(
         STR_TO_DATE(`Discharge Date`, '%d-%m-%Y'),
         STR_TO_DATE(`Admission Date`, '%d-%m-%Y')
       )), 2) AS avg_stay_days
FROM hospital_data
GROUP BY Department
ORDER BY avg_stay_days DESC;

-- 9. Department with the lowest total number of patients
SELECT Department,
       SUM(`Patients Count`) AS total_patients
FROM hospital_data
GROUP BY Department
ORDER BY total_patients ASC
LIMIT 1;

-- 10. Monthly medical expenses report (month based on Admission Date)
SELECT DATE_FORMAT(
         STR_TO_DATE(`Admission Date`, '%d-%m-%Y'),
         '%Y-%m'
       ) AS admission_month,
       ROUND(SUM(`Medical Expenses`), 2) AS total_medical_expenses
FROM hospital_data
GROUP BY admission_month
ORDER BY admission_month;
