-- CREATE database in postgres from terminal for django specific settings
-- step 1 (login as su) : sudo su - postgres
-- step 2 (go to psql terminal): psql
-- step 3 (create database): CREATE DATABASE myproject;
-- step 4 (create user): CREATE USER myprojectuser WITH PASSWORD 'password';
-- step 5 (set default encoading to utf-8): ALTER ROLE myprojectuser SET client_encoding TO 'utf8'; (for django clint);
-- step 6 (default transaction isolation scheme to “read committed”) : ALTER ROLE myprojectuser SET default_transaction_isolation TO 'read committed';
        -- (blocks reads from uncommitted transactions);
-- step 6 (set default timezone) : ALTER ROLE myprojectuser SET timezone TO 'UTC';
-- step 7 (grant privilages to user): GRANT ALL PRIVILEGES ON DATABASE myproject TO myprojectuser;

-- \q : quit from psql terminal
-- exit : exit from postgres



-- Access postgres from terminal : psql -U username -h localhost

-- CREATE schema
 CREATE SCHEMA information;

-- SET search path
 SET search_path TO information;

-- DROP schema
 DROP SCHEMA schemaname;

-- CREATE table
 CREATE TABLE student(id int, name varchar(20));
--  or with constraints:
CREATE TABLE employee(
	Fname CHAR NOT NULL,
	Mname CHAR NULL,
	Lname CHAR NOT null,
	ssn CHAR(9) NOT NULL PRIMARY KEY,
	Bdate date,
	Address TEXT NOT NULL,
	Salary DECIMAL(10,2) NOT NULL,
	Super_ssn CHAR(9),
	Dno INT NOT NULL
);

-- rename table
 ALTER TABLE studentinfo RENAME TO student;

-- ADD columns
 ALTER TABLE student ADD gender char, ADD standard int;

-- ALETR DATATYPE of column
 ALTER TABLE student ALTER COLUMN standard TYPE char;

-- DROP COLUMN
 ALTER TABLE student DROP COLUMN standard;

-- DROP table
 DROP TABLE tablename;