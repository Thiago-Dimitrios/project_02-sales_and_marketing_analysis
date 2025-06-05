SELECT 
  EXTRACT(YEAR FROM transaction_date) AS year,
  EXTRACT(MONTH FROM transaction_date) AS month,

 SUM(MntWines+MntFruits+MntMeatProducts+MntFishProducts+MntSweetProducts+MntGoldProds) AS Total_product_sales,

 ROUND(SUM(MntWines) * 100.0 / SUM(MntWines+MntFruits+MntMeatProducts+MntFishProducts+MntSweetProducts+MntGoldProds), 2) AS wines_percent,
 ROUND(SUM(MntFruits) * 100.0 / SUM(MntWines+MntFruits+MntMeatProducts+MntFishProducts+MntSweetProducts+MntGoldProds), 2) AS fruits_percent,
 ROUND(SUM(MntMeatProducts) * 100.0 / SUM(MntWines+MntFruits+MntMeatProducts+MntFishProducts+MntSweetProducts+MntGoldProds), 2) AS meat_percent,
 ROUND(SUM(MntFishProducts) * 100.0 / SUM(MntWines+MntFruits+MntMeatProducts+MntFishProducts+MntSweetProducts+MntGoldProds), 2) AS fish_percent,
 ROUND(SUM(MntSweetProducts) * 100.0 / SUM(MntWines+MntFruits+MntMeatProducts+MntFishProducts+MntSweetProducts+MntGoldProds), 2) AS sweet_products_percent,
 ROUND(SUM(MntGoldProds) * 100.0 / SUM(MntWines+MntFruits+MntMeatProducts+MntFishProducts+MntSweetProducts+MntGoldProds), 2) AS gold_products_percent
  
FROM marketing_data

GROUP BY 
  EXTRACT(YEAR FROM transaction_date),
  EXTRACT(MONTH FROM transaction_date)
  
ORDER BY year, month;
