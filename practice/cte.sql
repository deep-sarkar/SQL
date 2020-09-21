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

-- WITH cte we can perform join and subquery at same time
-- Display attandance with maximum spent time with writting disk for perticular user
WITH cte_attandance AS (
SELECT date_time::DATE, user_name
FROM temporary_mis
GROUP BY 1,2),

cte_disk_writing AS (
SELECT user_name,max(time_spent_writing_to_disk) as max_spent_time
FROM temporary_mis
GROUP BY user_name)

SELECT cte_attandance.user_name, count(cte_attandance.user_name) as attandance, cte_disk_writing.max_spent_time
FROM cte_attandance
INNER JOIN cte_disk_writing 
ON cte_disk_writing.user_name = cte_attandance.user_name
GROUP BY cte_attandance.user_name, cte_disk_writing.max_spent_time;