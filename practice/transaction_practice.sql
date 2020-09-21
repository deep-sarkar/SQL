-- DELETE perticular record and rollback
-- START with begin
BEGIN;
-- DELETE QUERY
DELETE
FROM temporary_mis
WHERE date_time = '2019-09-18 08:30:01';
-- ROLLBACK or COMMIT
ROLLBACK;