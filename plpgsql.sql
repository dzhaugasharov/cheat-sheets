-- Function. Can return information
CREATE OR REPLACE FUNCTION example_function() RETURNS VOID AS $$ 
    DECLARE client RECORD; -- record type
BEGIN
    SELECT * FROM clients WHERE name = 'Иван Владиморович К' INTO client;
    -- writing information to console
    RAISE NOTICE 'Имя клиента = %, телефон = %', client.name, client.phone;
    -- catching exceptions
    EXCEPTION WHEN OTHERS THEN RAISE NOTICE 'You made a mistake!';
END $$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION get_text(num INT) RETURNS VOID AS $$ 
    DECLARE txt TEXT;
BEGIN
    txt = 'TEST' || num;
    RETURN txt;
END $$ LANGUAGE 'plpgsql';


--  Procedure
CREATE OR REPLACE PROCEDURE example_procedure(param1 TEXT) AS $$
DECLARE -- declaring variables
    txt TEXT;
    i   INT;
BEGIN
    -- executing sql commands
    EXECUTE ('DROP TABLE IF EXISTS ' || param1);
    EXECUTE ('CREATE TABLE ' || param1 || ' (name varchar(200))');
    -- calling funtion
    txt = get_text(4);
    -- another way of calling function
    SELECT get_text(7) INTO txt;
    -- loop example
    FOR i IN 1 .. 10
        LOOP
            EXECUTE('INSERT INTO ' || param1 || ' VALUES(''' || param1 || i || ''');');
            
            -- writing information to console
            RAISE NOTICE 'txt=%, i=%', txt, i;
        END LOOP;
END $$ LANGUAGE 'plpgsql';  -- specifying language

-- calling
DO $$ BEGIN
    -- calling procedure
    CALL example_procedure('nelly');

    -- calling function
    PERFORM gen_abra_cadabra(100);
END $$;

-- looping throug records
DO $$ DECLARE rec RECORD;
    BEGIN FOR rec IN 
        SELECT id, name, phone 
        FROM clients 
        ORDER BY name DESC 
        LOOP RAISE NOTICE 'id = %, name = %, phone = %', rec.id, rec.name, record.phone;
    END LOOP;
END $$;
