SELECT

  EXTRACT(YEAR FROM transaction_date) AS year,

  SUM(NumWebPurchases) as Sum_Web_Purchases,
  SUM(NumWebPurchases+NumCatalogPurchases+NumStorePurchases) as sum_General_Purchases,

  ROUND(SUM(NumWebPurchases) * 100.0 / SUM(NumWebPurchases+NumCatalogPurchases+NumStorePurchases), 2) as Web_Sales_Percent


FROM marketing_data

GROUP BY 
  EXTRACT(YEAR FROM transaction_date)

  
ORDER BY year;


