--  Procedure
CREATE OR REPLACE PROCEDURE example_procedure(param1 TEXT) AS $$ DECLARE mytext TEXT;
BEGIN
    EXECUTE('DROP TABLE IF EXISTS ' || param1);
    EXECUTE('CREATE TABLE ' || param1 || ' (
        id int
    )');
END $$ LANGUAGE 'plpgsql';

-- calling procedure
DO $$ BEGIN
CALL example_procedure('nelly');
END $$;
