#----- Answer 1a -----#

-- 1. Create Database named people education
CREATE DATABASE people_education;

-- 2. Show database which you created
SHOW DATABASES;

-- 3. Create tables
USE people_education;
-- a. create a table named people info
CREATE TABLE people_info (
    name VARCHAR(25) NOT NULL,
    age INT NOT NULL,
    high_school_attended VARCHAR(100) NOT NULL,
    height FLOAT NOT NULL
);

-- b. Create a table named school info
CREATE TABLE school_info (
    school_name VARCHAR(100) NOT NULL,
    zip_code INT NOT NULL
);

-- c. Create a table named school mascot
CREATE TABLE school_mascot (
    school_name VARCHAR(100) NOT NULL,
    school_mascot VARCHAR(50)
);

-- 4. Show all tables
SHOW TABLES;

-- 5. Delete table named school_mascot
DROP TABLE school_mascot;

-- 6. Insert data in table
INSERT INTO people_info(name,age,high_school_attended,height) VALUES
	('raman',19,'Shri Ram Collage',1.6),('karan',18,'Hindu Collage',1.8),
    ('shruti',17,'Venkateshwer Collage',1.5),('ritika',18,'Shivaji Collage',1.56);
    
SELECT * FROM people_info;

#----- Answer 1b -----#

-- 1. Create a database;
CREATE DATABASE tech_firm;
USE tech_firm;

-- 2. show database which is created
SHOW DATABASES;

-- 3. Create a table named employee
CREATE TABLE employee (
    emp_id CHAR(9) NOT NULL,
    emp_name VARCHAR(20) NOT NULL,
    dept_no INT NOT NULL,
    manager_id CHAR(9),
    salary DECIMAL(10 , 2 ),
    hire_date TIMESTAMP
);

-- 4. Populate data in table

INSERT INTO employee(emp_id,emp_name,dept_no,manager_id,salary,hire_date) VALUES
	('123456789','john smith',5,'222335555',30000,'1965-09-01'),
    ('333445555','franklin wong',5,'888665555',40000,'1955-09-01'),
    ('453453453','joyce english',5,'333445555',25000,'1972-09-01'),
    ('666884444','ramesh narayan',5,'333445555',38000,'1962-09-01'),
    ('888665555','james borg',1,NULL,55000,'1937-09-01'),
    ('987654321','jennifer wallace',4,'888665555',43000,'1941-09-01'),
    ('987987987','ahmed jabbar',4,'987654321',25000,'1969-09-01'),
    ('999887777','alicia zeleya',4,'987654321',25000,'1968-09-01');
    
-- 5. Retrieve the data of rows
SELECT * FROM employee;

-- 6. retrieve emp_id,emp_name,dept_no, and salary of department no 5
SELECT emp_id,emp_name,dept_no,salary FROM employee WHERE dept_no=5;