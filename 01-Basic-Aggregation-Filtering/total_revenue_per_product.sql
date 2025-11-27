/*
PROBLEM STATEMENT:
Calculate the Total Revenue Per Product 

INPUT TABLE: Sales
+------------+----------+-------+
| product_id | quantity | price |
+------------+----------+-------+
| 101        | 5        | 10.00 |
| 102        | 2        | 20.00 |
| 101        | 3        | 10.00 |
+------------+----------+-------+

OUTPUT:
+------------+---------------+
| product_id | total_revenue |
+------------+---------------+
| 101        | 80.00         |
| 102        | 40.00         |
+------------+---------------+
*/

SELECT 
    product_id, 
    SUM(quantity * price) AS total_revenue
FROM 
    Sales
GROUP BY 
    product_id
ORDER BY 
    total_revenue DESC; 

/*
LOGIC EXPLANATION:
1.  SUM(quantity * price): Calculates the revenue for each individual transaction row first, then sums them up.
2.  GROUP BY product_id: Buckets the sales data so we get one total per unique product.
3.  ORDER BY total_revenue DESC:Immediately highlights top-performing products, which is usually what stakeholders want to see first.
*/
