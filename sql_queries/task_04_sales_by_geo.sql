SELECT country, 

SUM(NumWebPurchases) AS Web_Purchases,
SUM(NumCatalogPurchases) AS Catalog_Purchases,
SUM(NumStorePurchases) AS Store_Purchases

FROM marketing_data
GROUP BY country
ORDER BY country
