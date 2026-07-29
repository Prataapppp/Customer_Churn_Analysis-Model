
CREATE VIEW v_Customer_Revenue_Leakage AS
WITH Customer_Cohort_Analysis AS (
    SELECT 
        CustomerID,
        gender,
        contract,
        internet_service,
        monthly_charges,
        churn_label,
        AVG(monthly_charges) OVER(PARTITION BY contract) AS avg_contract_charges,
        DENSE_RANK() OVER(PARTITION BY contract ORDER BY tenure_months DESC) AS loyalty_rank
    FROM telco_customer_churn
)
SELECT 
    CustomerID,
    contract,
    internet_service,
    monthly_charges,
    ROUND(avg_contract_charges, 2) AS group_average_charges,
    ROUND(monthly_charges - avg_contract_charges, 2) AS variance_from_average,
    churn_label
FROM Customer_Cohort_Analysis
GO