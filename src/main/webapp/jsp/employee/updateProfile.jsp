<%@ page import="java.sql.*" %>
<%@ page import="com.yourapp.payroll.DBConnection" %>

<%
    request.setCharacterEncoding("UTF-8");
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String designation = request.getParameter("designation");
    String salaryStr = request.getParameter("salary");

    double salary = 0.0;
    if (salaryStr != null && !salaryStr.trim().isEmpty()) {
        salary = Double.parseDouble(salaryStr);
    }

    Connection conn = DBConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement(
        "UPDATE employees SET name = ?, email = ?, designation = ?, salary = ? WHERE id = ?"
    );
    ps.setString(1, name);
    ps.setString(2, email);
    ps.setString(3, designation);
    ps.setDouble(4, salary);
    ps.setInt(5, id);

    int result = ps.executeUpdate();
    if (result > 0) {
        response.sendRedirect("profile.jsp");
    } else {
        out.println("<h3 style='color:red'>Update Failed!</h3>");
    }
%>
