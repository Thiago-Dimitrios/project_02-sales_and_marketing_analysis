SELECT 
  EXTRACT(YEAR FROM transaction_date) AS year,
  COUNT(transaction_date) AS web_transactions,
  SUM(numwebvisitsmonth) AS web_visits,
  ROUND(COUNT(transaction_date) * 100.0 / SUM(numwebvisitsmonth), 2) AS conversion_web_sales
  
FROM marketing_data

GROUP BY 
  EXTRACT(YEAR FROM transaction_date)
  
ORDER BY year;
