-- A common table expression is a temporary result set which you can reference within 
-- another SQL statement including SELECT, INSERT, UPDATE or DELETE.

-- Common Table Expressions are temporary in the sense that they only exist during the execution of the query.
-- Display attandence of all user based on 3 days

WITH cte_attandance AS (
SELECT date_time::DATE, user_name
FROM temporary_mis
GROUP BY 1,2)

SELECT user_name, count(user_name) as attandance
FROM cte_attandance
GROUP BY user_name;

