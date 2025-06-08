SELECT 
  TO_CHAR(transaction_date, 'YYYY-MM') AS year_month,
  COUNT(transaction_date) AS web_transactions,
  SUM(numwebvisitsmonth) AS web_visits,
  ROUND(COUNT(transaction_date) * 100.0 / SUM(numwebvisitsmonth), 2) AS conversion_web_sales

FROM marketing_data

GROUP BY TO_CHAR(transaction_date, 'YYYY-MM')
ORDER BY year_month;
