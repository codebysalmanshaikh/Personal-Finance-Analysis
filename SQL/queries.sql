USE finance_project;

DESCRIBE raw_finances_data;

SELECT 
    COUNT(*) AS Total_Records,
    ROUND(AVG(Income),2) AS Avg_Income,
    ROUND(AVG(Disposable_Income),2) AS Avg_Disposable_Income
FROM raw_finances_data;



SELECT 
    'Rent' AS Category, SUM(Rent) AS Total_Expense FROM raw_finances_data
UNION ALL
SELECT 'Groceries', SUM(Groceries) FROM raw_finances_data
UNION ALL
SELECT 'Transport', SUM(Transport) FROM raw_finances_data
UNION ALL
SELECT 'Entertainment', SUM(Entertainment) FROM raw_finances_data
UNION ALL
SELECT 'Healthcare', SUM(Healthcare) FROM raw_finances_data
ORDER BY Total_Expense DESC;


SELECT 
    CASE 
        WHEN Income < 20000 THEN 'Low Income'
        WHEN Income BETWEEN 20000 AND 50000 THEN 'Mid Income'
        ELSE 'High Income'
    END AS Income_Group,
    ROUND(AVG(Desired_Savings),2) AS Avg_Desired_Savings,
    ROUND(AVG(Disposable_Income),2) AS Avg_Disposable_Income
FROM raw_finances_data
GROUP BY Income_Group;

SELECT 
    Occupation,
    ROUND(AVG(Income),2) AS Avg_Income,
    ROUND(AVG(Desired_Savings),2) AS Avg_Savings
FROM raw_finances_data
GROUP BY Occupation
ORDER BY Avg_Savings DESC;

SELECT 
    ROUND(AVG(Rent/Income * 100),2) AS Avg_Rent_Percentage,
    ROUND(AVG(Groceries/Income * 100),2) AS Avg_Groceries_Percentage,
    ROUND(AVG(Transport/Income * 100),2) AS Avg_Transport_Percentage,
    ROUND(AVG(Entertainment/Income * 100),2) AS Avg_Entertainment_Percentage,
    ROUND(AVG(Healthcare/Income * 100),2) AS Avg_Healthcare_Percentage
FROM raw_finances_data;



SELECT 
    CASE 
        WHEN (Disposable_Income/Income)*100 < 10 THEN 'Low Savers (<10%)'
        WHEN (Disposable_Income/Income)*100 BETWEEN 10 AND 30 THEN 'Moderate Savers (10-30%)'
        ELSE 'High Savers (>30%)'
    END AS Savings_Group,
    COUNT(*) AS People_Count,
    ROUND(AVG(Income),2) AS Avg_Income,
    ROUND(AVG(Disposable_Income),2) AS Avg_Disposable
FROM raw_finances_data
GROUP BY Savings_Group
ORDER BY People_Count DESC;

SELECT 
    Occupation,
    ROUND(AVG(Total_Monthly_Expenses/Income * 100),2) AS Avg_Expense_Percent,
    ROUND(AVG(Disposable_Income/Income * 100),2) AS Avg_Savings_Percent
FROM raw_finances_data
GROUP BY Occupation
ORDER BY Avg_Savings_Percent DESC
LIMIT 10;

