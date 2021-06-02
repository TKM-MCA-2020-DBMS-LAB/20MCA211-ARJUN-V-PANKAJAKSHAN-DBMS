mysql> use dbms_lab;
Database changed
mysql> show tables;
+--------------------+
| Tables_in_dbms_lab |
+--------------------+
| department         |
| employee           |
+--------------------+
2 rows in set (0.00 sec)

mysql> describe department;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| dept_no   | varchar(100) | NO   | PRI | NULL    |       |
| dept_name | varchar(100) | YES  |     | NULL    |       |
| location  | varchar(100) | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
3 rows in set (0.13 sec)

mysql> select * from department;
+---------+--------------+-----------+
| dept_no | dept_name    | location  |
+---------+--------------+-----------+
| 10      | Bsc maths    | 4th floor |
| 11      |  Bsc physics | 1st floor |
| 12      | BCA          | 3rd floor |
| 13      | MCA          | 2nd floor |
| 14      | M tech       | 3rd floor |
+---------+--------------+-----------+
5 rows in set (0.10 sec)

mysql> select * from employee;
+--------+----------+------------+---------+------------+------------+---------+--------+
| emp_no | emp_name | DOB        | address | DOJ        | mob_no     | dept_no | salary |
+--------+----------+------------+---------+------------+------------+---------+--------+
|      1 | JITHU    | 1997-10-15 |  CLG_14 | 2021-01-18 | 8129764123 |      10 |  99000 |
|      2 | AKHIL    | 1996-12-01 |  CLG_12 | 2020-01-18 | 777745673  |      11 |  80000 |
|      3 | AKHIL    | 1996-02-11 |  CLG_13 | 2020-01-18 | 9999999999 |      12 |  80000 |
+--------+----------+------------+---------+------------+------------+---------+--------+
3 rows in set (0.10 sec)

mysql> create view Manager as SELECT emp_name,DOB,salary,location from employee,department;
Query OK, 0 rows affected (0.30 sec)

mysql> select  distinct e.emp_name from employee e ,Manager m where e.salary >m.salary;
+----------+
| emp_name |
+----------+
| JITHU    |
+----------+
1 row in set (0.10 sec)

mysql> DROP VIEW MANAGER;
Query OK, 0 rows affected (0.21 sec)

mysql> create view Manager as SELECT emp_name,DOB,salary,location from employee,department;
Query OK, 0 rows affected (0.25 sec)

mysql> update Manager set salary=1.1 * salary where emp_name="AKHIL";
Query OK, 2 rows affected (0.15 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> create table deptsal as select dept_no , 0 as totalsalary from department;
Query OK, 5 rows affected (2.10 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql>  select * from deptsal;
+---------+-------------+
| dept_no | totalsalary |
+---------+-------------+
| 10      |           0 |
| 11      |           0 |
| 12      |           0 |
| 13      |           0 |
| 14      |           0 |
+---------+-------------+
5 rows in set (0.00 sec)

mysql> delimiter //
mysql> create procedure updatesal(IN Param1 int)
    -> begin
    -> update deptsal
    -> set totalsalary= (select sum(salary)from employee  where dept_no=Param1)
    -> where dept_no =param1;
    -> end; //
Query OK, 0 rows affected (0.03 sec)

5 rows in set (0.00 sec)

mysql> delimiter ;
mysql> call updatesal(11);
Query OK, 1 row affected (0.25 sec)

mysql> call updatesal(12);
Query OK, 1 row affected (0.29 sec)

mysql> select * from deptsal;
+---------+-------------+
| dept_no | totalsalary |
+---------+-------------+
| 10      |           0 |
| 11      |       88000 |
| 12      |       88000 |
| 13      |           0 |
| 14      |           0 |
+---------+-------------+
5 rows in set (0.00 sec)

mysql> drop procedure updatesal;
Query OK, 0 rows affected (0.23 sec)

mysql> DELIMITER //
mysql> CREATE PROCEDURE Getdetails()
    -> begin
    -> select * from employee;
    -> end //
Query OK, 0 rows affected (0.20 sec)

mysql> DELIMITER ;
mysql> CALL Getdetails();
+--------+----------+------------+---------+------------+------------+---------+--------+
| emp_no | emp_name | DOB        | address | DOJ        | mob_no     | dept_no | salary |
+--------+----------+------------+---------+------------+------------+---------+--------+
|      1 | JITHU    | 1997-10-15 |  CLG_14 | 2021-01-18 | 8129764123 |      10 |  99000 |
|      2 | AKHIL    | 1996-12-01 |  CLG_12 | 2020-01-18 | 777745673  |      11 |  88000 |
|      3 | AKHIL    | 1996-02-11 |  CLG_13 | 2020-01-18 | 9999999999 |      12 |  88000 |
+--------+----------+------------+---------+------------+------------+---------+--------+
3 rows in set (0.01 sec)

Query OK, 0 rows affected (0.03 sec)
