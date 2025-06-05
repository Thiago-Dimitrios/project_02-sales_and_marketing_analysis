SELECT 
  EXTRACT(YEAR FROM transaction_date) AS year,
  EXTRACT(MONTH FROM transaction_date) AS month,
  COUNT(transaction_date) AS web_transactions,
  SUM(numwebvisitsmonth) AS web_visits,
  ROUND(COUNT(transaction_date) * 100.0 / SUM(numwebvisitsmonth), 2) AS conversion_web_sales
  
FROM marketing_data

GROUP BY 
  EXTRACT(YEAR FROM transaction_date),
  EXTRACT(MONTH FROM transaction_date)
  
ORDER BY year, month;
