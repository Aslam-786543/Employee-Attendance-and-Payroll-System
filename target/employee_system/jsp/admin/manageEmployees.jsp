<%@ page language="java" import="java.sql.*" %>
<%@ page import="com.yourapp.payroll.DBConnection" %>
<%
    Connection conn = DBConnection.getConnection();

    // Handle update logic if form is submitted
    if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("updateId") != null) {
        int updateId = Integer.parseInt(request.getParameter("updateId"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String designation = request.getParameter("designation");
        String salary = request.getParameter("salary");

        PreparedStatement updatePs = conn.prepareStatement("UPDATE employees SET name=?, email=?, designation=?, salary=? WHERE id=?");
        updatePs.setString(1, name);
        updatePs.setString(2, email);
        updatePs.setString(3, designation);
        updatePs.setString(4, salary);
        updatePs.setInt(5, updateId);
        updatePs.executeUpdate();
    }

    // Handle delete logic if deleteId exists
    if (request.getParameter("deleteId") != null) {
        int deleteId = Integer.parseInt(request.getParameter("deleteId"));
        PreparedStatement deletePs = conn.prepareStatement("DELETE FROM employees WHERE id=?");
        deletePs.setInt(1, deleteId);
        deletePs.executeUpdate();
    }

    // Fetch all employees again
    PreparedStatement ps = conn.prepareStatement("SELECT * FROM employees");
    ResultSet rs = ps.executeQuery();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Employees</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body { font-family: 'Segoe UI', sans-serif; }
        .sidebar {
            height: 100vh;
            width: 240px;
            position: fixed;
            background-color: #343a40;
            padding-top: 1rem;
        }
        .sidebar a {
            color: white;
            padding: 12px 20px;
            display: block;
            text-decoration: none;
            font-weight: 500;
        }
        .sidebar a:hover { background-color: #495057; }
        .main-content {
            margin-left: 240px;
            padding: 30px;
            background-color: #f8f9fa;
            min-height: 100vh;
        }
        .table td, .table th { vertical-align: middle; }
        .table th { background-color: #007bff; color: white; }
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <h4 class="text-white text-center mb-4">Admin Panel</h4>
    <a href="dashboard.jsp"><i class="bi bi-speedometer2"></i> Dashboard</a>
    <a href="manageEmployees.jsp" class="bg-primary"><i class="bi bi-people-fill"></i> Employees</a>
    <a href="markAttendance.jsp"><i class="bi bi-calendar-check-fill"></i> Attendance</a>
    <a href="viewLeaves.jsp"><i class="bi bi-journal-text"></i> Leaves</a>
    <a href="payroll.jsp"><i class="bi bi-currency-rupee"></i> Payroll</a>
    <a href="../../adminLogin.jsp"><i class="bi bi-box-arrow-left"></i> Logout</a>
</div>

<!-- Main Content -->
<div class="main-content">
    <h2 class="mb-4">Employee Directory</h2>
    <div class="table-responsive">
        <form method="post">
        <table class="table table-bordered table-hover bg-white shadow text-center">
            <thead>
                <tr>
                    <th>ID</th>
                    <th><i class="bi bi-person-fill"></i> Name</th>
                    <th><i class="bi bi-envelope-fill"></i> Email</th>
                    <th><i class="bi bi-briefcase-fill"></i> Designation</th>
                    <th><i class="bi bi-cash-stack"></i> Salary</th>
                    <th><i class="bi bi-gear-fill"></i> Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int editingId = request.getParameter("editId") != null ? Integer.parseInt(request.getParameter("editId")) : -1;

                    while (rs.next()) {
                        int empId = rs.getInt("id");
                        if (empId == editingId) {
                %>
                <!-- Editable Row -->
                <tr>
                    <td><%= empId %></td>
                    <td><input type="text" name="name" class="form-control" value="<%= rs.getString("name") %>" required></td>
                    <td><input type="email" name="email" class="form-control" value="<%= rs.getString("email") %>" required></td>
                    <td><input type="text" name="designation" class="form-control" value="<%= rs.getString("designation") %>" required></td>
                    <td><input type="text" name="salary" class="form-control" value="<%= rs.getString("salary") %>" required></td>
                    <td>
                        <input type="hidden" name="updateId" value="<%= empId %>">
                        <button type="submit" class="btn btn-success btn-sm">
                            <i class="bi bi-check-lg"></i> Save
                        </button>
                        <a href="manageEmployees.jsp" class="btn btn-secondary btn-sm">
                            <i class="bi bi-x-lg"></i> Cancel
                        </a>
                    </td>
                </tr>
                <%
                        } else {
                %>
                <!-- Normal Row -->
                <tr>
                    <td><%= empId %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("designation") %></td>
                    <td><%= rs.getString("salary") %></td>
                    <td>
                        <a href="manageEmployees.jsp?editId=<%= empId %>" class="btn btn-sm btn-warning">
                            <i class="bi bi-pencil-square"></i> Edit
                        </a>
                        <a href="manageEmployees.jsp?deleteId=<%= empId %>" 
                           class="btn btn-sm btn-danger" 
                           onclick="return confirm('Are you sure you want to delete this employee?');">
                            <i class="bi bi-trash"></i> Delete
                        </a>
                    </td>
                </tr>
                <%
                        }
                    }
                    conn.close();
                %>
            </tbody>
        </table>
        </form>
    </div>
</div>

</body>
</html>
