package com.yourapp.payroll;

import java.io.IOException;
import java.sql.*;

import javax.servlet.*;

import javax.servlet.http.*;

public class LeaveApprovalServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String action = request.getParameter("action"); // approve or reject
        int leaveId = Integer.parseInt(request.getParameter("leaveId"));

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE leaves SET status = ? WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, action.equals("approve") ? "Approved" : "Rejected");
            ps.setInt(2, leaveId);

            ps.executeUpdate();
            response.sendRedirect("jsp/admin/viewLeaves.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
