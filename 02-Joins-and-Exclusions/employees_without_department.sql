/*
PROBLEM STATEMENT:
Find Employees Without Department

INPUT TABLES:
Employee
+-------------+-------+---------------+
| employee_id | name  | department_id |
+-------------+-------+---------------+
| 1           | Alice | 10            |
| 2           | Bob   | 20            |
| 3           | Charlie| NULL         |
+-------------+-------+---------------+

Department
+---------------+-------+
| department_id | name  |
+---------------+-------+
| 10            | IT    |
| 20            | Sales |
+---------------+-------+

OUTPUT:
+-------------+-------+---------------+
| employee_id | name  | department_id |
+-------------+-------+---------------+
| 3           | Charlie| NULL         |
+-------------+-------+---------------+
*/

SELECT 
    e.*
FROM 
    Employee AS e
LEFT JOIN 
    Department AS d ON e.department_id = d.department_id
WHERE 
    d.department_id IS NULL;

/*
LOGIC EXPLANATION:
1.  LEFT JOIN: We fetch ALL rows from the 'Employee' table (left side), and match them with the 'Department' table (right side) where possible.
2.  WHERE d.department_id IS NULL: If an employee has a department_id that doesn't exist in the Department table (or is NULL), the join will return NULL for the Department columns. We filter for these specific cases to find the "orphans."
*/
