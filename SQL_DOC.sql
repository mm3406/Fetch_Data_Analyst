 

#Which brand has the most spend among users who were created within the past 6 months?
SELECT name, COUNT(*) as total_receipts
FROM receipts
WHERE MONTH(purchase_date) = MONTH(CURRENT_DATE)
  AND YEAR(receipt_date) = YEAR(CURRENT_DATE)
GROUP BY name
ORDER BY total_receipts DESC
LIMIT 5;

#Which brand has the most transactions among users who were created within the past 6 months?
SELECT top_brand, SUM(spend) AS total_spend
FROM brands
JOIN users ON brands.user_id = users.user_id
WHERE users.creation_date >= CURDATE() - INTERVAL 6 MONTH
GROUP BY brand
ORDER BY total_spend DESC
LIMIT 1;
