# Model Performance & Advanced Analytics Report

## 1. Overview

This report summarizes the Machine Learning and advanced analytical components of the Hospital Patient & Healthcare Analytics project.

The analysis includes:

- 30-Day Readmission Risk Model
- Billing Amount Outlier Detection
- Department-wise Readmission Analysis
- Patient Risk Segmentation
- Correlation Analysis

---

## 2. Readmission Risk Model

A Logistic Regression classification model was developed to analyze the probability of 30-day hospital readmission.

The model uses patient and admission characteristics such as:

- Age
- Length of Stay
- Billing Amount
- Department
- Insurance Type
- Admission Type
- Gender

Categorical features were encoded before modeling and numerical variables were prepared for Logistic Regression.

### Model Performance

**ROC-AUC: 0.81**

The model was evaluated using:

- ROC-AUC
- Precision
- Recall
- F1-Score
- Classification Report
- ROC Curve

The ROC-AUC value of 0.81 indicates useful discrimination between readmitted and non-readmitted cases within the synthetic dataset.

### Readmission Risk Model

![Readmission Risk Model](../outputs/01_readmission_risk_model.png)

---

## 3. Billing Amount Outlier Distribution

The Interquartile Range method was used to identify unusually high billing records.

Results:

- Q1: 40,973.27
- Q3: 117,875.33
- IQR: 76,902.06
- Billing Outliers: 449
- Outlier Percentage: 3.38%

![Billing Amount Outlier Distribution](../outputs/02_billing_amount_outlier_distribution.png)

---

## 4. Department-wise Readmission Rate

Readmission rates were compared across hospital departments.

Pulmonology recorded the highest department-level readmission rate at approximately 11.88%.

General Medicine recorded a readmission rate of approximately 11.01%.

![Department-wise Readmission Rate](../outputs/03_department_wise_readmission_rate.png)

---

## 5. Patient Risk Distribution

Admissions were classified into High Risk and Normal Risk groups.

Results:

- High Risk Admissions: 3,585
- High Risk Percentage: 27.02%
- Normal Risk Admissions: 9,681
- Normal Risk Percentage: 72.98%

![Patient Risk Distribution](../outputs/04_patient_risk_distribution.png)

---

## 6. Correlation Matrix of Key Hospital Variables

Correlation analysis was performed using selected financial and clinical variables.

The strongest observed relationship was between:

**Length of Stay and Billing Amount: 0.67**

Patient Satisfaction and Readmission showed a weak negative relationship of approximately:

**-0.14**

![Correlation Matrix of Key Hospital Variables](../outputs/05_correlation_matrix_key_hospital_variables.png)

---

## 7. Key Findings

- The Logistic Regression model achieved a ROC-AUC of 0.81.
- 449 billing records were identified as outliers.
- Pulmonology had the highest department-level readmission rate.
- Approximately 27.02% of admissions were classified as High Risk.
- Length of Stay and Billing Amount showed the strongest observed correlation at approximately 0.67.

---

## 8. Conclusion

The advanced analytics layer extends the project beyond traditional dashboard reporting by combining statistical analysis, risk segmentation, outlier detection, correlation analysis, and predictive modeling.

These techniques provide additional insight into hospital billing, patient risk, department performance, and readmission patterns.

> This analysis uses synthetic healthcare data and is intended for educational and portfolio purposes only. It should not be used for clinical diagnosis, treatment, or real-world healthcare decision-making.