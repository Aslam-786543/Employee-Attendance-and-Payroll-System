<%@ page language="java" import="java.sql.*, com.yourapp.payroll.DBConnection" %>
<%
    String idParam = request.getParameter("id");
    int empId = (idParam != null) ? Integer.parseInt(idParam) : 0;
    Connection conn = DBConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement("SELECT * FROM employees WHERE id = ?");
    ps.setInt(1, empId);
    ResultSet rs = ps.executeQuery();
    rs.next();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Employee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-dark text-white">
<div class="container mt-5">
    <h2 class="mb-4 text-warning">Edit Employee Info</h2>
    <form action="updateEmployee.jsp" method="post" class="bg-secondary p-4 rounded">
        <input type="hidden" name="id" value="<%= empId %>">
        <div class="mb-3">
            <label>Name</label>
            <input type="text" name="name" value="<%= rs.getString("name") %>" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Email</label>
            <input type="email" name="email" value="<%= rs.getString("email") %>" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Department</label>
            <input type="text" name="department" value="<%= rs.getString("department") %>" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Designation</label>
            <input type="text" name="designation" value="<%= rs.getString("designation") %>" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-warning">Update</button>
        <a href="manageEmployees.jsp" class="btn btn-light">Cancel</a>
    </form>
</div>
</body>
</html>
