-- DDL (Data Definition Language)

CREATE TABLE example_table (
  id SERIAL PRIMARY KEY, 
  name character varying(200) NOT NULL, 
  phone character varying(30) NOT NULL DEFAULT "no", 
  email character varying(200) NOT NULL,
  company_id integer NOT NULL REFERENCES companies (id),
  user_id INTEGER REFERENCES users,
  ticket_id INTEGER REFERENCES tickets (id) ON DELETE RESTRICT, -- Restricts deleting ticket if there is some links in current table
  film_id INTEGER REFERENCES films ON DELETE CASCADE, -- if film is deleted all linked records in this table will be deleted as well
  -- also there are NO ACTION, SET NULL and SET DEFAULT
  status character varying(100) NOT NULL CHECK (
    status IN (
      'done', 'in progress', 'delivery'
    )
  )
);

-- with contraints
CREATE TABLE films (
  id serial,
  title varchar(40) NOT NULL,
  len_min integer,
  -- red or green
  lang CHARACTER CHECK (
    lang in ('ru', 'en')
  ), 
  weight numeric CHECK (
    weight >= 150 
    OR weight <= 300
  ), -- from 150 to 300
  CONSTRAINT films_pk PRIMARY KEY (id), 
  CONSTRAINT constr_example CHECK (
    len_min > 100 
    AND title <> ''
  )
);

CREATE TABLE apples (
  id SERIAL,
  weight numeric,
  order_id interger,
  CONSTRAINT ch_weight_check CHECK (
    weight >= 150 
    AND weight <= 300
  ),
  CONSTRAINT apples_pk PRIMARY KEY (id), 
  CONSTRAINT order_fk FOREIGN KEY(order_id) REFERENCES orders(id)
);

-- columns
ALTER TABLE products ADD COLUMN description text CHECK (description <> '');
ALTER TABLE products DROP COLUMN description;
ALTER TABLE products DROP COLUMN description CASCADE;

-- addin contraints
ALTER TABLE products ADD CHECK (name <> 'что-то странное');
ALTER TABLE products ADD CONSTRAINT some_name UNIQUE (name);  -- unique product name
ALTER TABLE example ADD FOREIGN KEY (some_id) REFERENCES another_table;
ALTER TABLE products ALTER COLUMN category SET NOT NULL;

-- add new value to enum
ALTER TYPE enum_name ADD VALUE 'new_values';
ALTER TYPE enum_type ADD VALUE 'new_value' BEFORE 'old_value';
ALTER TYPE enum_type ADD VALUE 'new_value' AFTER 'old_value';

-- 1. rename the enum type you want to change
ALTER type some_enum_type rename to _some_enum_type;
-- 2. create new type
CREATE type some_enum_type as enum ('old', 'values', 'and', 'new', 'ones');
-- 3. rename column(s) which uses our enum type
ALTER table some_table rename column some_column to _some_column;
-- 4. add new column of new type
ALTER table some_table add some_column some_enum_type not null default 'new';
-- 5. copy values to the new column
UPDATE some_table SET some_column = _some_column::text::some_enum_type;
-- 6. remove old column and type
ALTER table some_table DROP column _some_column;
DROP type _some_enum_type;

-- dropping tables
DROP TABLE films, users;
DROP CASCADE TABLE films, users; -- deletes with all related object
DROP TABLE IF EXISTS films;




-- DML (Data Manipulation Language)

-- UPSERT query
INSERT INTO clients (id, name, phone, email) 
VALUES (9, 'Nelly Kelly', '77545454545', 'belly@mail.com') 
ON CONFLICT (id) DO UPDATE 
SET 
  name = EXCLUDED.name, 
  phone = EXCLUDED.phone, 
  email = EXCLUDED.email;

-- ON CONFLICT DO NOTHING
INSERT INTO products (id, name, price, category) 
VALUES (1, 'Shampoo 2', 1200, 'cosmetic') ON CONFLICT DO NOTHING;

-- date time
SELECT current_date, current_time, extract('mon' FROM date '1999-11-27');  -- 2021-09-30  05:10:23.356401 +00:00  11
