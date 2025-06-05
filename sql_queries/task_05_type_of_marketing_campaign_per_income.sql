SELECT 
CASE 
WHEN income <= 20000 THEN 'Low'
WHEN income > 20000 AND income <= 50000 THEN 'Lower_middle'
WHEN income > 50000 AND income <= 80000 THEN 'Upper_middle'
WHEN income > 80000 AND income <= 120000 THEN 'High'
ELSE 'Very_high'
END AS income_group,

 ROUND ((AVG(AcceptedCmp1) * 100),2) AS Cmp1_Rate,
 ROUND ((AVG(AcceptedCmp2) * 100),2) AS Cmp2_Rate,
 ROUND ((AVG(AcceptedCmp3) * 100),2) AS Cmp3_Rate,
 ROUND ((AVG(AcceptedCmp4) * 100),2) AS Cmp4_Rate,
 ROUND ((AVG(AcceptedCmp5) * 100),2) AS Cmp5_Rate

FROM marketing_data

GROUP BY income_group
ORDER BY income_group;