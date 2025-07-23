<%@ page language="java" import="java.sql.*" %>
<%@ page import="com.yourapp.payroll.DBConnection" %>
<%
    Connection conn = DBConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement("SELECT id, name FROM employees");
    ResultSet rs = ps.executeQuery();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Mark Attendance</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
        }

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

        .sidebar a:hover,
        .sidebar a.active {
            background-color: #495057;
        }

        .main-content {
            margin-left: 240px;
            padding: 30px;
            background-color: #f8f9fa;
            min-height: 100vh;
        }

        .table td, .table th {
            vertical-align: middle;
        }

        .form-select {
            width: 150px;
        }

        .btn-primary {
            padding: 10px 25px;
            font-size: 16px;
            border-radius: 30px;
        }
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <h4 class="text-white text-center mb-4">Admin Panel</h4>
    <a href="dashboard.jsp"><i class="bi bi-speedometer2"></i> Dashboard</a>
    <a href="manageEmployees.jsp"><i class="bi bi-people-fill"></i> Employees</a>
    <a href="markAttendance.jsp" class="active"><i class="bi bi-calendar-check-fill"></i> Attendance</a>
    <a href="viewLeaves.jsp"><i class="bi bi-journal-text"></i> Leaves</a>
    <a href="payroll.jsp"><i class="bi bi-currency-rupee"></i> Payroll</a>
    <a href="../../adminLogin.jsp"><i class="bi bi-box-arrow-left"></i> Logout</a>
</div>

<!-- Main Content -->
<div class="main-content">
    <h2 class="mb-4">Mark Employee Attendance</h2>

    <form action="../../AttendanceServlet" method="post">
        <div class="table-responsive">
            <table class="table table-bordered table-hover bg-white shadow">
                <thead class="table-dark text-center">
                    <tr>
                        <th>Employee Name</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <% while(rs.next()) { %>
                    <tr class="text-center">
                        <td><%= rs.getString("name") %></td>
                        <td>
                            <input type="hidden" name="empId" value="<%= rs.getInt("id") %>"/>
                            <select name="status_<%= rs.getInt("id") %>" class="form-select d-inline-block">
                                <option value="Present">Present</option>
                                <option value="Absent">Absent</option>
                            </select>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <button type="submit" class="btn btn-primary mt-3">
            <i class="bi bi-check-circle-fill"></i> Submit Attendance
        </button>
    </form>
</div>

</body>
</html>
