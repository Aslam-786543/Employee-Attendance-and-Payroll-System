package com.yourapp.payroll;

import java.io.IOException;
import java.sql.*;

import javax.servlet.*;

import javax.servlet.http.*;


public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String designation = request.getParameter("designation");
        String salary = request.getParameter("salary");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO employees (name, email, password, designation, salary) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, designation);
            ps.setDouble(5, Double.parseDouble(salary));

            int result = ps.executeUpdate();
            if (result > 0) {
                response.sendRedirect("employeeLogin.jsp");
            } else {
                response.sendRedirect("error.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
