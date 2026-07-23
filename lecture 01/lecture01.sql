-- SQL -> Structured Query language
-- Database -> Where we store data
-- DBMS(database management system) -> which is an application used to manage database

-- MySQL -> RDBMS(Relational Database management System)
-- Relational Data -> Data in format of tables..


-- Create database
create database company;

-- select the database
use company;


-- Create table
create table employees(
	emp_id int,
    name varchar(50),
	age int,
    salary int,
	city varchar(10)
);


create table manager(

	manager_id int,
    emp_id int,
    dept varchar(20)
);


show tables;

-- view the table structure

describe employees;


-- inserting data

insert into 
employees 
values(101,"Rohan",25,45000,"Delhi");

-- Retrieving Data

select * from employees;

-- multiple rows
insert into employees
values
(102,"Krish",30,58000,"Kolkata"),
(103,"Neha",28,35000,"Chennai"),
(104,"Ram",null,40000,"Bareilly");


-- Retrieve specific columns

select 
	emp_id,
    name,
    salary 
from employees;



-- updating data

update employees
set age = 31
where emp_id = 104;

-- Safe mode command

set SQL_SAFE_UPDATES = 0;-- for disabling the safe mode
set SQL_SAFE_UPDATES = 1;-- enable the safe mode

select @@sql_safe_updates; -- to chech status of safe mode


-- delete data

delete from employees
where emp_id = 104;


delete from employees
where name = "Rohan";



-- delete all rows;
delete from employees;



-- add column in table

alter table employees
add email varchar(30);


-- rename the column
alter table employees
rename column name to emp_name;


-- drop the column
alter table employees
drop column email;


-- remove all the rows
truncate table employees;

-- delete the table from database
drop table employees;


select * from employees;

-- datatypes in sql

-- smallint ->2byte,int -> 4byte,bigint -> 8byte
-- Decimal (variable size),float -> 4bytes , double -> 8bytes

-- varchar() variable length string
-- text ->large text (60kb)
-- enum -> one value from a predefined list
-- set -> multiple values from a predifined list


-- date (YYYY-MM-DD) 
-- time (HH:MM:SS)
-- datetime (YYYY-MM-DD HH:MM:SS)
-- timestamp (often auto updated)
-- year (YYYY)

-- boolean true/false




