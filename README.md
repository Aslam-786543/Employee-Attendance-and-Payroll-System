# 🧾 Employee Payroll Management System

A full-featured **web-based payroll management system** built using **Java (JSP + JDBC)**, **MySQL**, and **Bootstrap**. This system helps companies manage employee profiles, attendance, leave requests, and monthly payroll dynamically with a clean and interactive user interface.

---

## 🚀 Features

### 👩‍💼 Employee Module
- Employee Registration & Login
- View Profile and Recent Activities
- Apply for Leaves
- View Attendance Records
- Monthly Payroll Summary

### 🛠️ Admin Module
- Admin Login
- Add & Manage Employees
- Approve/Reject Leave Requests
- Mark Attendance
- Generate Monthly Payroll
- View Employee Activities

---

## 🧰 Tech Stack

| Layer       | Technology                 |
|------------|-----------------------------|
| Frontend   | HTML, CSS, Bootstrap        |
| Backend    | JSP, Java (JDBC)            |
| Database   | MySQL                       |
| Server     | Apache Tomcat (v8+ / v9+)   |
| IDE        | NetBeans / Eclipse          |

---

## Steps to implement:
1.Import the SQL File:
Open phpMyAdmin or MySQL CLI
Create a database named employee_payroll
Import the file sql/employee_payroll.sql

2.Configure the Database:
In src/com/yourapp/dao/DBConnection.java, update:
String url = "jdbc:mysql://localhost:3306/employee_payroll";
String user = "root";
String password = "your_password";

3. Build & Deploy:
Open the project in NetBeans or Eclipse
Deploy it on Apache Tomcat 8/9
Access via http://localhost:8080/employee-payroll-system/login.jsp
