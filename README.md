# Library Management System using SQL Project --P2

## Project Overview

**Project Title**: Library Management System  
**Database**: `library_db`

This project demonstrates the implementation of a Library Management System using SQL. It includes creating and managing tables, performing CRUD operations, and executing advanced SQL queries. The goal is to showcase skills in database design, manipulation, and querying.

![library-slider-img-3_1653482722](https://github.com/user-attachments/assets/3afcaf1e-d14b-4920-b6b6-34ff3157dbfb)

## Objectives

1. **Set up the Library Management System Database**: Create and populate the database with tables for branches, employees, members, books, issued status, and return status.
2. **CRUD Operations**: Perform Create, Read, Update, and Delete operations on the data.
3. **CTAS (Create Table As Select)**: Utilize CTAS to create new tables based on query results.
4. **Advanced SQL Queries**: Develop complex queries to analyze and retrieve specific data.

## Project Structure

### 1. Database Setup
![ER Diagram](https://github.com/user-attachments/assets/65440c67-7e5e-43b0-805d-24141fc7bdbc)

- **Database Creation**: Created a database named `library_Project`.
- **Table Creation**: Created tables for branches, employees, members, books, issued status, and return status. Each table includes relevant columns and relationships.

```sql
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
