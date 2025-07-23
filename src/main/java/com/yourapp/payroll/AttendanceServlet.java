package com.yourapp.payroll;

import java.io.IOException;
import java.sql.*;
import java.sql.Date;
import java.util.*;

import javax.servlet.*;

import javax.servlet.http.*;



public class AttendanceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String date = java.time.LocalDate.now().toString();

        try (Connection conn = DBConnection.getConnection()) {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT id FROM employees");

            while (rs.next()) {
                int empId = rs.getInt("id");
                String status = request.getParameter("status_" + empId);
                if (status != null) {
                    PreparedStatement ps = conn.prepareStatement("INSERT INTO attendance (employee_id, date, status) VALUES (?, ?, ?)");
                    ps.setInt(1, empId);
                    ps.setDate(2, Date.valueOf(date));
                    ps.setString(3, status);
                    ps.executeUpdate();
                }
            }

            response.sendRedirect("jsp/admin/dashboard.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
