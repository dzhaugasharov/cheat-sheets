-- creating
CREATE TABLE clients (
  id SERIAL PRIMARY KEY, 
  name character varying(200) NOT NULL, 
  phone character varying(30) NOT NULL DEFAULT "no", 
  email character varying(200) NOT NULL,
  company_id integer NOT NULL REFERENCES companies (id)
);

CREATE TABLE apples (
  color CHARACTER CHECK (
    color in ('red', 'green')
  ), 
  -- red or green
  weight numeric CHECK (
    weight >= 150 
    OR weight <= 300
  ) -- from 150 to 300
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

-- add new value to enum
ALTER TYPE enum_name ADD VALUE 'new_values';
ALTER TYPE enum_type ADD VALUE 'new_value' BEFORE 'old_value';
ALTER TYPE enum_type ADD VALUE 'new_value' AFTER 'old_value';


-- 1. rename the enum type you want to change
alter type some_enum_type rename to _some_enum_type;
-- 2. create new type
create type some_enum_type as enum ('old', 'values', 'and', 'new', 'ones');
-- 3. rename column(s) which uses our enum type
alter table some_table rename column some_column to _some_column;
-- 4. add new column of new type
alter table some_table add some_column some_enum_type not null default 'new';
-- 5. copy values to the new column
update some_table set some_column = _some_column::text::some_enum_type;
-- 6. remove old column and type
alter table some_table drop column _some_column;
drop type _some_enum_type;
