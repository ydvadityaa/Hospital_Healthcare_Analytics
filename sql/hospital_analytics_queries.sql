-- =========================================================
-- HOSPITAL PATIENT & HEALTHCARE ANALYTICS
-- COMPLETE SQL ANALYSIS
-- Database: hospital_analytics
-- Table: admissions
-- =========================================================

USE hospital_analytics;


-- =========================================================
-- SECTION 1: KPI ANALYSIS
-- =========================================================

-- 1. Total Admissions
SELECT COUNT(*) AS total_admissions
FROM admissions;


-- 2. Total Unique Patients
SELECT COUNT(DISTINCT patient_id) AS total_unique_patients
FROM admissions;


-- 3. Total Billing Amount
SELECT ROUND(SUM(billing_amount), 2) AS total_billing_amount
FROM admissions;


-- 4. Average Billing per Admission
SELECT ROUND(AVG(billing_amount), 2) AS avg_billing_per_admission
FROM admissions;


-- 5. Average Length of Stay
SELECT ROUND(AVG(length_of_stay_days), 2) AS avg_length_of_stay_days
FROM admissions;


-- 6. Average Patient Satisfaction
SELECT ROUND(AVG(patient_satisfaction), 2) AS avg_patient_satisfaction
FROM admissions;


-- 7. Overall Readmission Rate
SELECT 
    ROUND(
        100.0 * SUM(
            CASE 
                WHEN LOWER(CAST(is_readmission_30d AS CHAR)) IN ('true', '1')
                THEN 1 
                ELSE 0 
            END
        ) / COUNT(*),
        2
    ) AS readmission_rate_percent
FROM admissions;


-- =========================================================
-- SECTION 2: PATIENT & ADMISSION ANALYSIS
-- =========================================================

-- 8. Admissions by Gender
SELECT 
    gender,
    COUNT(*) AS total_admissions
FROM admissions
GROUP BY gender
ORDER BY total_admissions DESC;


-- 9. Admissions by Admission Type
SELECT 
    admission_type,
    COUNT(*) AS total_admissions
FROM admissions
GROUP BY admission_type
ORDER BY total_admissions DESC;


-- 10. Admissions by Insurance Type
SELECT 
    insurance_type,
    COUNT(*) AS total_admissions
FROM admissions
GROUP BY insurance_type
ORDER BY total_admissions DESC;


-- 11. Admissions by Age Group
SELECT 
    age_group,
    COUNT(*) AS total_admissions
FROM admissions
GROUP BY age_group
ORDER BY total_admissions DESC;


-- 12. Admissions by Discharge Status
SELECT 
    discharge_status,
    COUNT(*) AS total_admissions
FROM admissions
GROUP BY discharge_status
ORDER BY total_admissions DESC;


-- =========================================================
-- SECTION 3: DEPARTMENT PERFORMANCE
-- =========================================================

-- 13. Department-wise Admissions
SELECT 
    department,
    COUNT(*) AS total_admissions
FROM admissions
GROUP BY department
ORDER BY total_admissions DESC;


-- 14. Average Billing by Department
SELECT 
    department,
    ROUND(AVG(billing_amount), 2) AS avg_billing
FROM admissions
GROUP BY department
ORDER BY avg_billing DESC;


-- 15. Average Length of Stay by Department
SELECT 
    department,
    ROUND(AVG(length_of_stay_days), 2) AS avg_length_of_stay
FROM admissions
GROUP BY department
ORDER BY avg_length_of_stay DESC;


-- 16. Average Patient Satisfaction by Department
SELECT 
    department,
    ROUND(AVG(patient_satisfaction), 2) AS avg_patient_satisfaction
FROM admissions
GROUP BY department
ORDER BY avg_patient_satisfaction DESC;


-- 17. Department-wise Readmission Rate
SELECT 
    department,
    COUNT(*) AS total_admissions,
    SUM(
        CASE 
            WHEN LOWER(CAST(is_readmission_30d AS CHAR)) IN ('true', '1')
            THEN 1 
            ELSE 0 
        END
    ) AS readmissions,
    ROUND(
        100.0 * SUM(
            CASE 
                WHEN LOWER(CAST(is_readmission_30d AS CHAR)) IN ('true', '1')
                THEN 1 
                ELSE 0 
            END
        ) / COUNT(*),
        2
    ) AS readmission_rate_percent
FROM admissions
GROUP BY department
ORDER BY readmission_rate_percent DESC;


-- =========================================================
-- SECTION 4: FINANCIAL ANALYSIS
-- =========================================================

-- 18. Total Billing by Department
SELECT 
    department,
    ROUND(SUM(billing_amount), 2) AS total_billing
FROM admissions
GROUP BY department
ORDER BY total_billing DESC;


-- 19. Billing by Insurance Type
SELECT 
    insurance_type,
    COUNT(*) AS total_admissions,
    ROUND(SUM(billing_amount), 2) AS total_billing,
    ROUND(AVG(billing_amount), 2) AS avg_billing
FROM admissions
GROUP BY insurance_type
ORDER BY total_billing DESC;


-- 20. High Cost Admissions
SELECT 
    admission_id,
    patient_id,
    department,
    diagnosis,
    billing_amount,
    length_of_stay_days
FROM admissions
WHERE billing_category = 'High Cost'
ORDER BY billing_amount DESC
LIMIT 20;


-- =========================================================
-- SECTION 5: READMISSION & RISK ANALYSIS
-- =========================================================

-- 21. Readmitted vs Not Readmitted
SELECT 
    readmission_status,
    COUNT(*) AS total_admissions
FROM admissions
GROUP BY readmission_status
ORDER BY total_admissions DESC;


-- 22. High Risk vs Normal Risk Admissions
SELECT
    patient_risk,
    COUNT(*) AS total_admissions,
    ROUND(
        100.0 * COUNT(*) / (SELECT COUNT(*) FROM admissions),
        2
    ) AS percentage
FROM admissions
GROUP BY patient_risk
ORDER BY total_admissions DESC;


-- 23. High Risk Admissions by Department
SELECT 
    department,
    COUNT(*) AS high_risk_admissions
FROM admissions
WHERE patient_risk = 'High Risk'
GROUP BY department
ORDER BY high_risk_admissions DESC;


-- 24. Average Billing and Stay by Risk Category
SELECT 
    patient_risk,
    ROUND(AVG(billing_amount), 2) AS avg_billing,
    ROUND(AVG(length_of_stay_days), 2) AS avg_length_of_stay
FROM admissions
GROUP BY patient_risk;


-- =========================================================
-- SECTION 6: TIME TREND ANALYSIS
-- =========================================================

-- 25. Monthly Admission Trend
SELECT 
    admission_year,
    admission_month_no,
    admission_month,
    COUNT(*) AS total_admissions
FROM admissions
GROUP BY admission_year, admission_month_no, admission_month
ORDER BY admission_year, admission_month_no;


-- 26. Monthly Billing Trend
SELECT 
    admission_year,
    admission_month_no,
    admission_month,
    ROUND(SUM(billing_amount), 2) AS total_billing
FROM admissions
GROUP BY admission_year, admission_month_no, admission_month
ORDER BY admission_year, admission_month_no;


-- 27. Quarterly Admission Trend
SELECT 
    admission_year,
    admission_quarter,
    COUNT(*) AS total_admissions
FROM admissions
GROUP BY admission_year, admission_quarter
ORDER BY admission_year, admission_quarter;


-- =========================================================
-- SECTION 7: DIAGNOSIS & STAY ANALYSIS
-- =========================================================

-- 28. Top 10 Diagnoses by Admission Volume
SELECT 
    diagnosis,
    COUNT(*) AS total_admissions
FROM admissions
GROUP BY diagnosis
ORDER BY total_admissions DESC
LIMIT 10;


-- 29. Top 10 Diagnoses by Average Billing
SELECT 
    diagnosis,
    ROUND(AVG(billing_amount), 2) AS avg_billing
FROM admissions
GROUP BY diagnosis
ORDER BY avg_billing DESC
LIMIT 10;


-- 30. Long Stay Admissions
SELECT 
    admission_id,
    patient_id,
    department,
    diagnosis,
    length_of_stay_days,
    billing_amount,
    patient_risk
FROM admissions
WHERE stay_category = 'Long Stay'
ORDER BY length_of_stay_days DESC
LIMIT 20;


-- =========================================================
-- SECTION 8: ADVANCED ANALYTICS
-- =========================================================

-- 31. Billing Outlier Summary
SELECT
    billing_outlier,
    COUNT(*) AS total_admissions,
    ROUND(
        100.0 * COUNT(*) / (SELECT COUNT(*) FROM admissions),
        2
    ) AS percentage
FROM admissions
GROUP BY billing_outlier;


-- 32. Department-wise High Risk Percentage
SELECT
    department,
    COUNT(*) AS total_admissions,
    SUM(
        CASE 
            WHEN patient_risk = 'High Risk' THEN 1 
            ELSE 0 
        END
    ) AS high_risk_admissions,
    ROUND(
        100.0 * SUM(
            CASE 
                WHEN patient_risk = 'High Risk' THEN 1 
                ELSE 0 
            END
        ) / COUNT(*),
        2
    ) AS high_risk_percentage
FROM admissions
GROUP BY department
ORDER BY high_risk_percentage DESC;


-- 33. Readmission Rate by Admission Type
SELECT
    admission_type,
    COUNT(*) AS total_admissions,
    ROUND(
        100.0 * AVG(
            CASE 
                WHEN LOWER(CAST(is_readmission_30d AS CHAR)) IN ('true', '1')
                THEN 1 
                ELSE 0 
            END
        ),
        2
    ) AS readmission_rate_percent
FROM admissions
GROUP BY admission_type
ORDER BY readmission_rate_percent DESC;


-- 34. Readmission Rate by Insurance Type
SELECT
    insurance_type,
    COUNT(*) AS total_admissions,
    ROUND(
        100.0 * AVG(
            CASE 
                WHEN LOWER(CAST(is_readmission_30d AS CHAR)) IN ('true', '1')
                THEN 1 
                ELSE 0 
            END
        ),
        2
    ) AS readmission_rate_percent
FROM admissions
GROUP BY insurance_type
ORDER BY readmission_rate_percent DESC;


-- 35. Average Satisfaction by Stay Category
SELECT
    stay_category,
    COUNT(*) AS total_admissions,
    ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction
FROM admissions
GROUP BY stay_category
ORDER BY avg_satisfaction DESC;


-- 36. Billing Analysis by Stay Category
SELECT
    stay_category,
    COUNT(*) AS total_admissions,
    ROUND(AVG(billing_amount), 2) AS avg_billing,
    ROUND(SUM(billing_amount), 2) AS total_billing
FROM admissions
GROUP BY stay_category
ORDER BY avg_billing DESC;


-- 37. Age Group Performance Analysis
SELECT
    age_group,
    COUNT(*) AS total_admissions,
    ROUND(AVG(billing_amount), 2) AS avg_billing,
    ROUND(AVG(length_of_stay_days), 2) AS avg_length_of_stay,
    ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction
FROM admissions
GROUP BY age_group
ORDER BY total_admissions DESC;


-- 38. High Risk Admissions by Age Group
SELECT
    age_group,
    COUNT(*) AS high_risk_admissions
FROM admissions
WHERE patient_risk = 'High Risk'
GROUP BY age_group
ORDER BY high_risk_admissions DESC;


-- 39. Top 10 Highest Billing Admissions
SELECT
    admission_id,
    patient_id,
    department,
    diagnosis,
    billing_amount,
    length_of_stay_days,
    patient_risk
FROM admissions
ORDER BY billing_amount DESC
LIMIT 10;


-- 40. Complete Department Performance Summary
SELECT
    department,
    COUNT(*) AS total_admissions,
    ROUND(AVG(billing_amount), 2) AS avg_billing,
    ROUND(AVG(length_of_stay_days), 2) AS avg_length_of_stay,
    ROUND(
        100.0 * AVG(
            CASE 
                WHEN LOWER(CAST(is_readmission_30d AS CHAR)) IN ('true', '1')
                THEN 1 
                ELSE 0 
            END
        ),
        2
    ) AS readmission_rate_percent,
    ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction,
    ROUND(
        100.0 * AVG(
            CASE 
                WHEN patient_risk = 'High Risk' THEN 1 
                ELSE 0 
            END
        ),
        2
    ) AS high_risk_percentage
FROM admissions
GROUP BY department
ORDER BY readmission_rate_percent DESC;