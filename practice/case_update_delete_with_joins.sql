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

