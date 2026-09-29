# Hospital Patient & Healthcare Analytics Report

## 1. Project Overview

This project analyzes 13,266 hospital admission records using Python, MySQL, Machine Learning, and Power BI.

The analysis focuses on hospital admissions, patient demographics, billing patterns, department performance, length of stay, patient satisfaction, and 30-day readmission risk.

---

## 2. Project Objectives

The main objectives of the project are to:

- Analyze hospital admission patterns
- Evaluate department performance
- Understand patient demographics
- Analyze hospital billing patterns
- Measure length of stay
- Study patient satisfaction
- Analyze 30-day readmission patterns
- Identify unusual billing records
- Segment high-risk admissions
- Build an interactive Power BI dashboard

---

## 3. Dataset

The dataset contains:

- 13,266 hospital admission records
- 14 original fields
- Patient demographic information
- Diagnosis information
- Department information
- Admission type
- Insurance type
- Length of stay
- Billing amount
- Readmission status
- Patient satisfaction

---

## 4. Data Preparation

Python was used for data inspection, cleaning, and feature engineering.

The preparation process included:

- Missing-value analysis
- Duplicate-record checks
- Data-type validation
- Date conversion
- Patient satisfaction value handling
- Numerical-column validation
- Readmission-status preparation

Additional analytical features were created:

- Age Group
- Stay Category
- Admission Year
- Admission Month
- Admission Quarter
- Billing Category
- Readmission Status
- Billing Outlier
- Patient Risk

---

## 5. Python Analysis

Python was used for:

- Exploratory Data Analysis
- Hospital KPI analysis
- Department performance analysis
- Billing outlier detection
- Patient risk segmentation
- Correlation analysis
- 30-day readmission prediction

---

## 6. MySQL and SQL Analysis

The processed hospital dataset was loaded into the `hospital_analytics` MySQL database.

The main analytical table is:

`admissions`

Approximately 40 SQL queries were developed covering:

- Hospital KPIs
- Patient analysis
- Department performance
- Billing analysis
- Diagnosis analysis
- Readmission analysis
- Patient risk analysis
- Time-based trends
- Advanced healthcare analysis

---

## 7. Power BI Dashboard

The Power BI report contains five pages:

### Executive Overview

Provides a high-level view of hospital performance, including admissions, billing, length of stay, readmission, and satisfaction.

### Patient Analysis

Analyzes patient demographics, age groups, gender, diagnoses, admission types, and satisfaction.

### Financial Analysis

Analyzes hospital billing trends, department billing, insurance types, stay categories, and billing outliers.

### Department Performance

Compares departments using admissions, billing, average length of stay, satisfaction, readmission rate, and patient risk.

### Patient / Admission Detail

Provides record-level drill-through analysis using department, diagnosis, admission type, and insurance type.

---

## 8. Key Healthcare Insights

- General Medicine recorded the highest number of admissions with 2,089 admissions.
- Emergency recorded 1,880 admissions.
- Pulmonology recorded the highest department-level readmission rate at approximately 11.88%.
- Oncology recorded the highest average billing amount at approximately ₹220,339.69.
- Oncology recorded the longest average length of stay at approximately 8.54 days.
- Orthopedics recorded the highest average patient satisfaction at approximately 3.80.
- 449 billing outliers were identified.
- Billing outliers represented approximately 3.38% of admissions.
- 3,585 admissions were classified as High Risk.
- High Risk admissions represented approximately 27.02% of the dataset.
- Length of stay and billing amount showed a correlation of approximately 0.67.
- The Logistic Regression readmission model achieved a ROC-AUC of 0.81.

---

## 9. Recommendations

- Monitor departments with higher readmission rates.
- Strengthen discharge planning for frequently readmitted patients.
- Monitor high-risk admissions proactively.
- Investigate unusual billing records.
- Review resource utilization for long-stay patients.
- Monitor Oncology billing and length-of-stay patterns.
- Track patient satisfaction across departments.
- Use multiple KPIs when evaluating department performance.
- Use readmission prediction as an analytical screening mechanism.

---

## 10. Conclusion

The project demonstrates an end-to-end healthcare analytics workflow integrating Python, MySQL, SQL, Machine Learning, and Power BI.

The analysis provides operational, financial, and patient-level insights while demonstrating practical skills in data cleaning, feature engineering, statistical analysis, predictive modeling, database analysis, and interactive dashboard development.

The dataset and predictive analysis are intended for educational and portfolio purposes and should not be used for real-world clinical decision-making.