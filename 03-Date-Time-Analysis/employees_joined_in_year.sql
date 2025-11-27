/*
PROBLEM STATEMENT:
Retrieve All Employees Who Joined in 2023 (Amazon Interview Question)

INPUT TABLE: Employee
+-------------+-------+------------+
| employee_id | name  | hire_date  |
+-------------+-------+------------+
| 1           | Alice | 2023-01-15 |
| 2           | Bob   | 2022-12-01 |
| 3           | Carol | 2023-08-20 |
| 4           | Dave  | 2024-01-05 |
+-------------+-------+------------+

OUTPUT:
+-------------+-------+------------+
| employee_id | name  | hire_date  |
+-------------+-------+------------+
| 1           | Alice | 2023-01-15 |
| 3           | Carol | 2023-08-20 |
+-------------+-------+------------+
*/

SELECT 
    * FROM 
    Employee
WHERE 
    EXTRACT(YEAR FROM hire_date) = 2023;

/*
LOGIC EXPLANATION:
1.  EXTRACT(YEAR FROM hire_date): This standard SQL function isolates the "Year" part of the date. 
    Example: '2023-01-15' becomes 2023.
2.  WHERE ... = 2023: We filter the rows to keep only those where the extracted year matches our target.

ALTERNATIVE SYNTAX (Database Specific):
- SQL Server: WHERE YEAR(hire_date) = 2023
- Oracle/PostgreSQL: WHERE EXTRACT(YEAR FROM hire_date) = 2023
- MySQL: WHERE YEAR(hire_date) = 2023
*/
