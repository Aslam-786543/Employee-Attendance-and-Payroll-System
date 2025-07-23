<%@ page language="java" import="java.sql.*, com.yourapp.payroll.DBConnection" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String department = request.getParameter("department");
    String designation = request.getParameter("designation");

    Connection conn = DBConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement("UPDATE employees SET name=?, email=?, department=?, designation=? WHERE id=?");
    ps.setString(1, name);
    ps.setString(2, email);
    ps.setString(3, department);
    ps.setString(4, designation);
    ps.setInt(5, id);
    int updated = ps.executeUpdate();

    if (updated > 0) {
        response.sendRedirect("manageEmployees.jsp?msg=updated");
    } else {
        response.sendRedirect("editEmployee.jsp?id=" + id + "&error=1");
    }
%>
