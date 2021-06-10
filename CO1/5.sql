
USE company;

SHOW TABLES;
DESCRIBE Employee;

SELECT * FROM Employee;

DELIMITER //
CREATE FUNCTION Emp_Details(dep_no INT)
RETURNS INTEGER

BEGIN
DECLARE emp_count INT; 
 SELECT COUNT(*) INTO emp_count
FROM Employee
WHERE Employee.Dept_no = dep_no ;
RETURN emp_count;
END
//
