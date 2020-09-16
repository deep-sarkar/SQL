-- Create database
CREATE TABLE temporary_MIS(
Date_Time DATE NOT NULL, 
Cpu_Count INT NOT NULL,
Cpu_Working_Time DECIMAL(11,3) NOT NULL,
Cpu_idle_Time DECIMAL(11,3) NOT NULL,
cpu_percent DECIMAL(11,3) NOT NULL,
Usage_cpu_count INT NOT NULL,
number_of_software_interrupts_since_boot DECIMAL(11,3) NOT NULL,
number_of_system_calls_since_boot INT NOT NULL,
number_of_interrupts_since_boot INT NOT NULL,
cpu_avg_load_over_1_min DECIMAL(11,3) NOT NULL,
cpu_avg_load_over_5_min DECIMAL(11,3) NOT NULL,
cpu_avg_load_over_15_min DECIMAL(11,3) NOT NULL,
system_total_memory BIGINT NOT NULL,
system_used_memory BIGINT NOT NULL,
system_free_memory BIGINT NOT NULL,
system_active_memory BIGINT NOT NULL,
system_inactive_memory BIGINT NOT NULL,
system_buffers_memory BIGINT NOT NULL,
system_cached_memory BIGINT NOT NULL,
system_shared_memory BIGINT NOT NULL,
system_avalible_memory BIGINT NOT NULL,
disk_total_memory BIGINT NOT NULL,
disk_used_memory BIGINT NOT NULL,
disk_free_memory BIGINT NOT NULL,
disk_read_count BIGINT NOT NULL,
disk_write_count BIGINT NOT NULL,
disk_read_bytes BIGINT NOT NULL,
disk_write_bytes BIGINT NOT NULL,
time_spent_reading_from_disk BIGINT NOT NULL,
time_spent_writing_to_disk BIGINT NOT NULL,
time_spent_doing_actual_Input_Output BIGINT NOT NULL,
number_of_bytes_sent BIGINT NOT NULL,
number_of_bytes_received BIGINT NOT NULL,
number_of_packets_sent BIGINT NOT NULL,
number_of_packets_recived BIGINT NOT NULL,
total_number_of_errors_while_receiving BIGINT NOT NULL,
total_number_of_errors_while_sending BIGINT NOT NULL,
total_number_of_incoming_packets_which_were_dropped BIGINT NOT NULL,
total_number_of_outgoing_packets_which_were_dropped BIGINT NOT NULL,
boot_time varchar(100) NOT NULL,
user_name varchar(50) NOT NULL,
keyboard DECIMAL NOT NULL,
mouse DECIMAL NOT NULL,
technology varchar(100) NOT NULL,
files_changed INT NOT NULL
); 

-- copy csv data to table
COPY cpu_analysis."temporary_mis" FROM '/home/deep/Documents/csv/CpuLogData2019-09-18.csv'
DELIMITER ','
CSV HEADER;

-- 1. Aggrigation function
-- a. Avg of Cpu_Working_Time by user
SELECT user_name, technology, avg(cpu_working_time)
FROM temporary_mis
GROUP BY user_name, technology;

-- b. max of Cpu_idle_Time ny user
SELECT user_name, technology, max(cpu_idle_time)
FROM temporary_mis
GROUP BY user_name, technology;

-- c. avg of Cpu_idle_Time by technology
SELECT technology, avg(cpu_idle_time)
FROM temporary_mis
GROUP BY technology;


-- d. min of cpu_percent by technology
SELECT technology, min(cpu_percent)
FROM temporary_mis
GROUP BY technology;

-- e. max of cpu_percent by user
SELECT user_name, max(cpu_percent)
FROM temporary_mis
GROUP BY user_name;

-- f. avg of Usage_cpu_count by date
SELECT date_time::DATE,user_name, avg(usage_cpu_count)
FROM temporary_mis
GROUP BY date_time::DATE, user_name
ORDER BY date_time;

-- g. avg of Usage_cpu_count by date and user
SELECT date_time::DATE, user_name, avg(usage_cpu_count)
FROM temporary_mis
GROUP BY date_time::DATE, user_name
ORDER BY date_time asc;

-- h. avg of Usage_cpu_count by date and user filtering for perticular user by having clause
SELECT date_time::DATE,user_name, avg(usage_cpu_count)
FROM temporary_mis
GROUP BY date_time::DATE, user_name
having user_name = 'iamnzm@outlook.com'
order by date_time;

-- i. above query by using like
SELECT date_time::DATE,user_name, avg(usage_cpu_count)
FROM temporary_mis
GROUP BY date_time::DATE, user_name
having user_name like '%@outlook%'
order by date_time;

-- j. count number_of_packets_sent for perticular user on perticular date
SELECT date_time::DATE, user_name, count(number_of_packets_sent)
FROM temporary_mis
GROUP BY date_time::DATE, user_name
ORDER BY date_time;

-- k. count total number_of_packets_sent for perticular user
SELECT user_name, count(number_of_packets_sent)
FROM temporary_mis
GROUP BY user_name;


-- 2. Count number of times mouse and keyboard = 0 Ans. 549
SELECT user_name,count(mouse)
FROM temporary_mis
WHERE mouse = 0 AND keyboard = 0
GROUP BY user_name;

