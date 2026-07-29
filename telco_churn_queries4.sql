SELECT 
    internet_service,
    online_security,
    tech_support,
    COUNT(CustomerID) AS total_customers,
    SUM(CASE WHEN churn_label = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    -- Calculate explicit churn rates per product combination
    ROUND(
        CAST(SUM(CASE WHEN churn_label = 'Yes' THEN 1 ELSE 0 END) AS FLOAT) / 
        COUNT(CustomerID) * 100, 2
    ) AS churn_rate_percentage
FROM Telco_customer_churn
GROUP BY internet_service, online_security, tech_support
HAVING COUNT(CustomerID) > 50 -- Filter out tiny sample groups
ORDER BY churn_rate_percentage DESC;