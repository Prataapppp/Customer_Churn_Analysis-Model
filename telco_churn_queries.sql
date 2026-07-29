USE master;
GO
CREATE DATABASE Telco_analytics;
GO
USE Telco_Analytics;
GO

CREATE TABLE customer_churn (
    customer_id VARCHAR(50) PRIMARY KEY,
    gender VARCHAR(10) NULL,
    senior_citizen INT NULL,
    partner VARCHAR(5) NULL,
    dependents VARCHAR(5) NULL,
    tenure_months INT NULL,
    phone_service VARCHAR(5) NULL,
    multiple_lines VARCHAR(50) NULL,
    internet_service VARCHAR(50) NULL,
    online_security VARCHAR(50) NULL,
    online_backup VARCHAR(50) NULL,
    device_protection VARCHAR(50) NULL,
    tech_support VARCHAR(50) NULL,
    streaming_tv VARCHAR(50) NULL,
    streaming_movies VARCHAR(50) NULL,
    contract VARCHAR(50) NULL,
    paperless_billing VARCHAR(5) NULL,
    payment_method VARCHAR(50) NULL,
    monthly_charges DECIMAL(10,2) NULL,
    total_charges DECIMAL(10,2) NULL,
    churn_label VARCHAR(5) NULL,
    churn_reason VARCHAR(MAX) NULL
);
GO