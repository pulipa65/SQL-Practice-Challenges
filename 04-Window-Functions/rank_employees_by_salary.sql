/*
PROBLEM STATEMENT:
Rank Employees by Salary Within Each Department

INPUT TABLE: Employee
+-------------+---------------+----------+
| employee_id | department_id | salary   |
+-------------+---------------+----------+
| 1           | 10            | 100000   |
| 2           | 10            | 90000    |
| 3           | 20            | 120000   |
| 4           | 20            | 130000   |
| 5           | 20            | 120000   |
+-------------+---------------+----------+

OUTPUT:
+-------------+---------------+----------+------------+
| employee_id | department_id | salary   | salary_rk  |
+-------------+---------------+----------+------------+
| 1           | 10            | 100000   | 1          |
| 2           | 10            | 90000    | 2          |
| 4           | 20            | 130000   | 1          |
| 3           | 20            | 120000   | 2          |
| 5           | 20            | 120000   | 2          |
+-------------+---------------+----------+------------+
*/

SELECT 
    employee_id, 
    department_id, 
    salary,
    RANK() OVER (
        PARTITION BY department_id 
        ORDER BY salary DESC
    ) AS salary_rk
FROM 
    Employee;

/*
LOGIC EXPLANATION:
1.  RANK() OVER (...): This Window Function assigns a rank to each row within a partition.
2.  PARTITION BY department_id: Groups employees by department. Ranking restarts for each group.
3.  ORDER BY salary DESC: Sorts employees by salary from highest to lowest.

HANDLING TIES (CRITICAL INTERVIEW TOPIC):
The choice of function depends on specific business criteria regarding ties:

A. RANK():
   - Logic: If two people tie for 2nd, the next person is 4th.
   - Use Case: When you want to see the true gap in position (e.g., "Top 3" might only return 2 people if ties exist).
   - Sequence: 1, 2, 2, 4...

B. DENSE_RANK():
   - Logic: If two people tie for 2nd, the next person is 3rd.
   - Use Case: When you simply want the "Second Highest" distinct salary, regardless of how many people share it.
   - Sequence: 1, 2, 2, 3...

C. ROW_NUMBER():
   - Logic: Forces a unique number even for ties (arbitrary order unless specified).
   - Use Case: When you need to pick exactly one person per rank (e.g., "Select one winner").
   - Sequence: 1, 2, 3, 4...
*/
