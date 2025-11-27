/*
PROBLEM STATEMENT:
Show the Count of Orders Per Customer

INPUT TABLE: Orders
+----------+-------------+------------+
| order_id | customer_id | order_date |
+----------+-------------+------------+
| 101      | 1           | 2023-01-01 |
| 102      | 2           | 2023-01-02 |
| 103      | 1           | 2023-01-03 |
| 104      | 1           | 2023-01-04 |
| 105      | 3           | 2023-01-05 |
+----------+-------------+------------+

OUTPUT:
+-------------+-------------+
| customer_id | order_count |
+-------------+-------------+
| 1           | 3           |
| 2           | 1           |
| 3           | 1           |
+-------------+-------------+
*/

SELECT 
    customer_id, 
    COUNT(order_id) AS order_count
FROM 
    Orders
GROUP BY 
    customer_id
ORDER BY 
    order_count DESC;

/*
LOGIC EXPLANATION:
1.  GROUP BY customer_id: We gather all records belonging to the same customer into a single "bucket."
2.  COUNT(order_id): Inside each bucket, we count how many orders exist. 
    Note: COUNT(*) is also valid here, but COUNT(order_id) is more explicit.
3.  ORDER BY order_count DESC: (Best Practice) Sorting by count helps analysts immediately see the most active customers at the top.

ALTERNATIVE APPROACH (Filtering):
If you only wanted customers with multiple orders (Repeat Buyers), you would add:
    HAVING COUNT(order_id) > 1;
*/
