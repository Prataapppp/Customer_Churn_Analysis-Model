WITH Payment_Losses AS (
    SELECT 
        payment_method,
        contract,
        COUNT(CustomerID) AS churn_count,
        SUM(monthly_charges) AS lost_monthly_revenue
    FROM Telco_customer_churn
    WHERE churn_label = 'Yes'
    GROUP BY payment_method, contract
)
SELECT 
    payment_method,
    contract,
    churn_count,
    ROUND(lost_monthly_revenue, 2) AS monthly_revenue_leakage,
    -- WINDOW FUNCTION: Running total of financial leakage across categories
    ROUND(SUM(lost_monthly_revenue) OVER(ORDER BY lost_monthly_revenue DESC), 2) AS cumulative_revenue_leakage
FROM Payment_Losses;