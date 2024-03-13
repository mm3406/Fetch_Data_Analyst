 

#Which brand has the most spend among users who were created within the past 6 months?
SELECT B.name, SUM(R.total_spent) AS total_brand_spend
FROM USERS U
JOIN RECEIPTS R ON U.userid = R.user-id
JOIN ITEMS I ON R.receipt-id = I.receipt-id
JOIN BRANDS B ON I.barcode = B.barcode
WHERE U.created_date >= CURRENT_DATE - INTERVAL '6 MONTH'
GROUP BY B.name
ORDER BY total_brand_spend DESC
LIMIT 1;


#Which brand has the most transactions among users who were created within the past 6 months?
SELECT B.name, COUNT(DISTINCT R.receipt-id) AS total_transactions
FROM USERS U
JOIN RECEIPTS R ON U.userid = R.user-id
JOIN ITEMS I ON R.receipt-id = I.receipt-id
JOIN BRANDS B ON I.barcode = B.barcode
WHERE U.created_date >= CURRENT_DATE - INTERVAL '6 MONTH'
GROUP BY B.name
ORDER BY total_transactions DESC
LIMIT 1;
