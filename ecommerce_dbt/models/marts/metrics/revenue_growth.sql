{{ config(materialized='view') }}

SELECT 
    purchase_month,
    monthly_revenue as revenue,
    LAG(monthly_revenue) OVER (ORDER BY purchase_month) AS previous_month_revenue,
    CASE 
        WHEN LAG(monthly_revenue) OVER (ORDER BY purchase_month) IS NULL THEN NULL
        ELSE (monthly_revenue - LAG(monthly_revenue) OVER (ORDER BY purchase_month)) / LAG(monthly_revenue) OVER (ORDER BY purchase_month)
    END AS revenue_growth


FROM {{ ref('monthly_revenue') }} 
