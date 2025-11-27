/*
PROBLEM STATEMENT:
Find Duplicate Emails (LeetCode 182)

INPUT TABLE: Person
+----+---------+
| id | email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+

OUTPUT:
+---------+
| Email   |
+---------+
| a@b.com |
+---------+
*/

SELECT 
    email AS Email
FROM 
    Person
GROUP BY 
    email
HAVING 
    COUNT(email) > 1;

/*
LOGIC EXPLANATION:
1.  GROUP BY email: This organizes the table so all identical emails are bucketed together.
2.  COUNT(email) >: The HAVING clause filters these buckets. We only want to keep the buckets that contain more than one record.
3.  SELECT email: Finally, we retrieve the email address that met the criteria.

ALTERNATIVE APPROACH (For larger datasets):
If we needed to see the specific IDs associated with the duplicates, we could use a Window Function:
    SELECT id, email, COUNT(*) OVER(PARTITION BY email) as cnt
    FROM Person
    WHERE cnt > 1;
*/
