<%@ page language="java" import="java.sql.*, com.yourapp.payroll.DBConnection" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));

    Connection conn = DBConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement("DELETE FROM employees WHERE id = ?");
    ps.setInt(1, id);
    int deleted = ps.executeUpdate();

    if (deleted > 0) {
        response.sendRedirect("manageEmployees.jsp?msg=deleted");
    } else {
        response.sendRedirect("manageEmployees.jsp?msg=deleteFailed");
    }
%>
