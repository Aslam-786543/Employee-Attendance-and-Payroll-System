-- -----------------------------------------------------
-- Schema: employee_system
-- -----------------------------------------------------

-- Drop existing database if it exists
DROP DATABASE IF EXISTS employee_system;

-- Create database
CREATE DATABASE employee_system;

-- Use the database
USE employee_system;

-- -----------------------------------------------------
-- Table: employees
-- -----------------------------------------------------
CREATE TABLE employees (
    id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    designation VARCHAR(100),
    salary DECIMAL(10,2),
    PRIMARY KEY (id)
);

-- -----------------------------------------------------
-- Table: leaves
-- -----------------------------------------------------
CREATE TABLE leaves (
    id INT(11) NOT NULL AUTO_INCREMENT,
    employee_id INT(11) NOT NULL,
    leave_date DATE NOT NULL,
    reason TEXT,
    status ENUM('Pending','Approved','Rejected') DEFAULT 'Pending',
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE
);

-- -----------------------------------------------------
-- Table: attendance
-- -----------------------------------------------------
CREATE TABLE attendance (
    id INT(11) NOT NULL AUTO_INCREMENT,
    employee_id INT(11) NOT NULL,
    date DATE NOT NULL,
    status ENUM('Present','Absent') NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE
);

-- -----------------------------------------------------
-- Table: payroll
-- -----------------------------------------------------
CREATE TABLE payroll (
    id INT(11) NOT NULL AUTO_INCREMENT,
    employee_id INT(11) NOT NULL,
    month VARCHAR(20),
    total_working_days INT(11) DEFAULT 22,
    present_days INT(11),
    leaves_taken INT(11),
    net_salary DECIMAL(10,2),
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE
);
