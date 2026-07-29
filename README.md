# Customer_Churn_Analysis-Model
An end-to-end data analytics pipeline identifying and predicting telecommunications customer churn. Built using T-SQL for data extraction, Tableau for executive dashboards, and Python (XGBoost &amp; SMOTE) for machine learning risk prediction.
# 📉 Telco Customer Churn Analysis & Prediction

## 📌 Project Overview
This end-to-end data analytics and machine learning project identifies the key drivers of customer churn within a telecommunications dataset and predicts at-risk customers. As a BSc student, I developed this project to demonstrate a complete data pipeline: from relational database management to visual analytics and predictive modeling.

## 🛠️ Tech Stack & Tools
* **Database Management:** SQL Server (T-SQL), Database/View Creation, CTEs, Window Functions
* **Data Visualization:** Tableau (Dashboards, LOD Expressions, Parameter Actions)
* **Machine Learning:** Python (pandas, Scikit-learn, XGBoost, SMOTE for class balancing)
* **Environment:** Google Colab, Jupyter Notebooks

## 📂 Project Components

### 1. SQL Analytics (`churn_analysis.sql`)
Built a relational database environment to calculate revenue leakage and cohort behavior.
* **Views & Window Functions:** Created `v_Customer_Revenue_Leakage` using `DENSE_RANK()` and partition averages to benchmark customer spend against their cohort.
* **CTEs:** Built running totals of cumulative revenue leakage by payment method to prioritize financial impact.
* **Granular Churn Rates:** Filtered explicit churn rates per product combination (e.g., Internet + Online Security + Tech Support) to identify high-risk service packages.

### 2. Tableau Dashboard (`Churn_Project_End_to_End.twbx`)
A high-contrast, interactive dashboard designed for executive stakeholders.
* Features Big Ass Numbers (BANs) for total active accounts, churn rate, and churned accounts.
* Translates customer counts into actual financial impact via a "Revenue Lost" metric.
* Utilizes a custom `Auditor_Cohort_Price_Gauge` to visually benchmark individual customers against average cohort pricing.

### 3. Machine Learning Prediction Model (`Churn_Rate_Prediction.ipynb`)
An XGBoost classification model to predict individual customer churn risk.
* **Data Preprocessing:** Handled missing values, applied Label Encoding, and balanced the highly skewed dataset using SMOTE (Synthetic Minority Over-sampling Technique).
* **Model Selection:** Evaluated Logistic Regression, Random Forest, and XGBoost.
* **Optimization:** Tuned decision thresholds specifically for the **Recall** metric (0.64), ensuring the business captures as many true churning customers as possible.
* **Deployment Function:** Built a custom Python function (`predict_customer()`) that accepts a Customer ID, outputs a percentage risk score, identifies specific risk factors (e.g., month-to-month contracts), and provides actionable retention advice.
