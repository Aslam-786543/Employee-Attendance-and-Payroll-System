package com.yourapp.payroll;

import java.io.IOException;
import java.sql.*;
import java.time.YearMonth;

import javax.servlet.*;

import javax.servlet.http.*;


public class PayrollServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        try (Connection conn = DBConnection.getConnection()) {
            Statement empStmt = conn.createStatement();
            ResultSet empRs = empStmt.executeQuery("SELECT * FROM employees");

            YearMonth currentMonth = YearMonth.now();
            int totalWorkingDays = 22; // Example

            while (empRs.next()) {
                int empId = empRs.getInt("id");
                double salary = empRs.getDouble("salary");

                // Get present count
                PreparedStatement attStmt = conn.prepareStatement(
                    "SELECT COUNT(*) FROM attendance WHERE employee_id = ? AND status = 'Present' AND MONTH(date) = ? AND YEAR(date) = ?"
                );
                attStmt.setInt(1, empId);
                attStmt.setInt(2, currentMonth.getMonthValue());
                attStmt.setInt(3, currentMonth.getYear());

                ResultSet attRs = attStmt.executeQuery();
                int presentDays = 0;
                if (attRs.next()) {
                    presentDays = attRs.getInt(1);
                }

                // Calculate salary based on attendance
                double perDay = salary / totalWorkingDays;
                double netSalary = perDay * presentDays;

                // Store in payroll table
                PreparedStatement payrollStmt = conn.prepareStatement(
                    "INSERT INTO payroll (employee_id, month, total_working_days, present_days, leaves_taken, net_salary) VALUES (?, ?, ?, ?, ?, ?)"
                );
                payrollStmt.setInt(1, empId);
                payrollStmt.setString(2, currentMonth.toString());
                payrollStmt.setInt(3, totalWorkingDays);
                payrollStmt.setInt(4, presentDays);
                payrollStmt.setInt(5, totalWorkingDays - presentDays);
                payrollStmt.setDouble(6, netSalary);

                payrollStmt.executeUpdate();
            }

            response.sendRedirect("jsp/admin/payroll.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
