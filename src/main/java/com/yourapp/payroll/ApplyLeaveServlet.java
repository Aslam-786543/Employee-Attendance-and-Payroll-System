package com.yourapp.payroll;

import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;

import javax.servlet.*;

import javax.servlet.http.*;


public class ApplyLeaveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        int empId = (int) request.getSession().getAttribute("employeeId");
        String leaveDate = request.getParameter("leave_date");
        String reason = request.getParameter("reason");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO leaves (employee_id, leave_date, reason, status) VALUES (?, ?, ?, 'Pending')";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, empId);
            ps.setDate(2, Date.valueOf(leaveDate));
            ps.setString(3, reason);

            int result = ps.executeUpdate();
            response.sendRedirect("jsp/employee/dashboard.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
