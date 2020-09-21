-- The RANK() function is an analytic function that calculates the rank of a value in a set of values.
SELECT user_name, RANK() OVER(ORDER BY cpu_count)
FROM temporary_mis;

-- Application 
-- SELECT first record for all users
SELECT user_name,cpu_count, RANK() OVER(PARTITION BY user_name ORDER BY CPU_COUNT)
FROM temporary_mis
GROUP BY user_name, cpu_count;