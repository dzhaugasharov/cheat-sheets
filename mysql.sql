-- create db
create database datebasename;

-- select db
use datebasename;

-- created table
create table employees(
  ID INT AUTO_INCREMENT PRIMARY KEY,
  NAME VARCHAR(80) NOT NULL,
  FOREIGN_ID INT NOT NULL);
  
-- add foreign key
ALTER TABLE employees ADD FOREIGN KEY(CAR_ID) REFERENCES OTHER_TABLE(CAR_ID);

-- alter column, set not null and unique
ALTER TABLE employees MODIFY COLUMN CAR_ID INT NOT NULL UNIQUE;
