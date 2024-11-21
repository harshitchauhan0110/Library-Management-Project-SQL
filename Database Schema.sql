-- Library Management Project

-- creating branch table and database


DROP DATABASE IF EXISTS library_project;
CREATE DATABASE library_project;

USE  library_project;

DROP TABLE IF EXISTS branch;
CREATE TABLE branch 
	(
		branch_id  VARCHAR(10),
        manager_id VARCHAR(10),
        branch_address VARCHAR(55),
        contact_no VARCHAR(10)
	);
    
    
DROP TABLE IF EXISTS employees;
CREATE TABLE employees
	(
		emp_id  VARCHAR(10) PRIMARY KEY,
        emp_name VARCHAR(30),
        position VARCHAR(55),
        salary INT,
        branch_id VARCHAR(25) -- FK
	);
    

DROP TABLE IF EXISTS books;
CREATE TABLE books
	(
		isbn  VARCHAR(25) PRIMARY KEY,
        book_title VARCHAR(75),
        category VARCHAR(55),
        rental_price FLOAT,
        status VARCHAR(15),
        author VARCHAR(35),
        publisher VARCHAR(55)
	);


DROP TABLE IF EXISTS members;
CREATE TABLE members
	(
		member_id  VARCHAR(10) PRIMARY KEY,
        member_name VARCHAR(30),
        member_address VARCHAR(75),
        reg_date DATE
	);        
    

DROP TABLE IF EXISTS issued_status;
CREATE TABLE issued_status
	(
		issued_id  VARCHAR(10) PRIMARY KEY,
        issued_member_id VARCHAR(10), -- FK
        issued_book_name VARCHAR(75),
        issued_date DATE,
        issued_book_isbn VARCHAR(25), -- FK
        issued_emp_id VARCHAR(15)
	);
    
DROP TABLE IF EXISTS return_status;
CREATE TABLE return_status
	(
		return_id  VARCHAR(10) PRIMARY KEY,
        issued_id VARCHAR(30),
        return_book_name VARCHAR(75),
        return_date DATE,
        return_bookisbn VARCHAR(25)
	);
    
-- Foreing key Constraint for Relationship

ALTER TABLE issued_status
ADD CONSTRAINT fk_member
FOREIGN KEY (issued_member_id)
REFERENCES members(member_id);

ALTER TABLE issued_status
ADD CONSTRAINT fk_empid
FOREIGN KEY (issued_emp_id)
REFERENCES employees(emp_id);

ALTER TABLE issued_status
ADD CONSTRAINT fk_isbn
FOREIGN KEY (issued_book_isbn)
REFERENCES books(isbn);

ALTER TABLE employees
ADD CONSTRAINT fk_branch
FOREIGN KEY (branch_id)
REFERENCES branch(branch_id);

ALTER TABLE return_status
ADD CONSTRAINT fk_issuedid
FOREIGN KEY (issued_id)
REFERENCES issued_status(issued_id);
