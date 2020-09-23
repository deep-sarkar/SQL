-- A cursor is a pointer with read-only access to the results of a SELECT statement. 
-- Applications use cursors to maintain a persistent connection to a Postgres database. 
-- Using a cursor helps an application to be more efficient.
BEGIN;

-- 1. DECLARE
-- Create a cursor for all moouse 0
DECLARE cursor1 CURSOR FOR 
SELECT * FROM temporary_mis
WHERE mouse = 0;

-- 2.FETCH 
-- a.fetch first 6 data
FETCH 6 FROM cursor1;

-- b. fetch all
FETCH ALL FROM cursor1;

-- 3. MOVE
-- Since a cursor maintains its current position within a given result set, 
-- we can move the cursor to a new position using the MOVE command.
MOVE FORWARD 1
IN cursor1;

-- 4.CLOSE
-- CLOSE cursor to freeup space
CLOSE cursor1;