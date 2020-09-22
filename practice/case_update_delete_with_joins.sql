-- DEPT TABLE FOR DEPT INFORMATION
CREATE TABLE dept( d_name varchar(20) not null,
				 	d_no int PRIMARY KEY);

-- INSER first value
INSERT INTO dept(d_name, d_no)
VALUES ('developer',1);

-- EMPLOYEE TABLE FOR EMPLOYEE DETAIL
CREATE TABLE employee( id int NOT NULL PRIMARY KEY,
					 name varchar(20) NOT NULL,
					 salary int NOT NULL,
					 dept_no int,
					 CONSTRAINT fk_dept
      				 FOREIGN KEY(dept_no)
					 REFERENCES dept(d_no));

-- INSERT first value
INSERT INTO employee(id, name, salary, dept_no)
VALUES (101, 'Tom', 4000, 1);

-- 1. UPDATE USING JOINS
-- a. Update all employee salary to 4000
UPDATE employee
SET salary = 4000
FROM dept
WHERE dept.d_no = employee.dept_no;

-- Update 3rd dept salary to 4500
UPDATE employee
SET salary = 4500
FROM dept
WHERE dept.d_no = employee.dept_no and dept.d_no = 3;

-- 2. DELETE using JOINS
-- Delete all data for testers from employee table
DELETE
FROM employee
USING dept
where employee.dept_no = dept.d_no and d_name = 'tester';

-- 3. Update using case
UPDATE dept
SET d_name = CASE d_no
WHEN 1 THEN 'test'
WHEN 2 THEN 'dev'
WHEN 3 THEN 'hr'
WHEN 4 THEN 'sales'
END;