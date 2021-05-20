CREATE DATABASE Organization;       /*Created database*/
USE Organization;                    /*Selected the current database*/


CREATE TABLE Employee(Emp_no INT PRIMARY KEY,Emp_name VARCHAR(30) NOT NULL,Address VARCHAR(30),DOB DATE NOT NULL,Date_of_Join DATE,Mobile_no NUMERIC,Dept_no INT,Salary INT,FOREIGN KEY(Dept_no) REFERENCES Department(Dept_no));    /* Created tables*/



CREATE TABLE Department(Dept_no INT PRIMARY KEY,Dept_name VARCHAR(30),Location VARCHAR(30));

INSERT INTO Employee VALUES(1,"Chruchhill","London",'1900-05-04','2020-05-06',342367344,2,334000);

INSERT INTO Employee VALUES(2,"hilli","pavo",'1993-04-30','2021-01-08',4343940696,1,40000);

INSERT INTO Employee VALUES(3,"Mavi","berlin",'1992-09-17','2018-11-15',2313941325,4,5000);

INSERT INTO Employee VALUES(4,"hundersberg","moscow",'1992-09-29','2020-11-20',1233311289,3,200000);

INSERT INTO Department VALUES(1,"HEAD OFFICE","Building no.1");

INSERT INTO Department VALUES(2,"FINANCE DEPARTMENT","Building no.2");

INSERT INTO Department VALUES(3,"MANAGEMENT DEPARTMENT","Building no.3");

INSERT INTO Department VALUES(4,"CUSTOMER SERVICE OFFICE","Building no.4");

SHOW TABLES;                                  /*Listing all the tables in the current database*/
DESCRIBE Employee;                            /*Displaying the structure of the employee table*/
DESCRIBE Department;
SELECT * from Employee;
SELECT * from Department;

ALTER TABLE Employee  
ADD Designation VARCHAR(50);      /* Adding a new column Designation to the employee table*/

DESCRIBE Employee;
ALTER TABLE Department
DROP COLUMN Location;          /*Droping the column location from Dept table*/

DROP TABLE Employee;
DROP TABLE Department;                    /*Droping tables*/
DROP DATABASE Organization;               /*Deleting database*/

