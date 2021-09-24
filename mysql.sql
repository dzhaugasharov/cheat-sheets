-- create db
create database datebasename;

-- select db
use datebasename;

-- created table
create table employees(
  ID INT AUTO_INCREMENT PRIMARY KEY,
  NAME VARCHAR(80) NOT NULL,
  FOREIGN_ID INT NOT NULL);
create table result_table(author_ID int not null,book_ID int not null, PRIMARY KEY(author_ID, book_ID));
  
-- add foreign key
ALTER TABLE employees ADD FOREIGN KEY(CAR_ID) REFERENCES OTHER_TABLE(CAR_ID);

-- alter column, set not null and unique
ALTER TABLE employees MODIFY COLUMN CAR_ID INT NOT NULL UNIQUE;

-- change charset
alter table books CONVERT TO CHARACTER SET utf8;


-- insert data
INSERT employees(NAME,SURNAME,CAR_ID) VALUES ('Kairat','Karatuly','1');
INSERT client(FIO) VALUES 
('Ivanov Ivan Ivanovich'),
('Petrov Petr Petrovich'),
('Testerov Tester Testerovich'),
('Olgerd');
