/*
PROBLEM STATEMENT:
Get the Top 3 Highest-Paid Employees (Google Interview Question)

INPUT TABLE: Employee
+-------------+----------+
| employee_id | salary   |
+-------------+----------+
| 1           | 90000    |
| 2           | 120000   |
| 3           | 85000    |
| 4           | 150000   |
| 5           | 110000   |
+-------------+----------+

OUTPUT:
+-------------+----------+
| employee_id | salary   |
+-------------+----------+
| 4           | 150000   |
| 2           | 120000   |
| 5           | 110000   |
+-------------+----------+
*/

SELECT 
    *
FROM 
    Employee
ORDER BY 
    salary DESC 
LIMIT 3;

/*
LOGIC EXPLANATION:
1.  ORDER BY salary DESC: This sorts the employees based on their salary in descending order (highest to lowest).
2.  LIMIT 3: This restricts the result set to only the top 3 records after sorting.

ALTERNATIVE APPROACH (Handling Ties):
If multiple employees have the same salary and you need to handle ties (e.g., top 3 salaries including ties), use DENSE_RANK():
    WITH RankedSalaries AS (
        SELECT *, DENSE_RANK() OVER (ORDER BY salary DESC) as rnk
        FROM Employee
    )
    SELECT * FROM RankedSalaries WHERE rnk <= 3;
*/
