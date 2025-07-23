package com.yourapp.payroll;

import java.io.IOException;
import javax.servlet.*;

import javax.servlet.http.*;


public class AdminLoginServlet extends HttpServlet {
    private final String ADMIN_USERNAME = "admin";
    private final String ADMIN_PASSWORD = "admin123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (ADMIN_USERNAME.equals(username) && ADMIN_PASSWORD.equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", "true");
            response.sendRedirect("jsp/admin/dashboard.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
