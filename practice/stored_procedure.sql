-- insert data in table
CREATE PROCEDURE insert_data(numeric, varchar, numeric, numeric)
LANGUAGE 'plpgsql'
AS $$

BEGIN

INSERT INTO employee(id, name, salary, dept_num) values($1, $2, $3, $4);
COMMIT;
END;
$$;

CALL insert_data(1,'abc', 4322, 2);