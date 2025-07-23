<%@ page language="java" import="java.sql.*" %>
<%@ page import="com.yourapp.payroll.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payroll Summary</title>
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

        .sidebar a:hover {
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
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <h4 class="text-white text-center mb-4">Admin Panel</h4>
    <a href="dashboard.jsp"><i class="bi bi-speedometer2"></i> Dashboard</a>
    <a href="manageEmployees.jsp"><i class="bi bi-people-fill"></i> Employees</a>
    <a href="markAttendance.jsp"><i class="bi bi-calendar-check-fill"></i> Attendance</a>
    <a href="viewLeaves.jsp"><i class="bi bi-journal-text"></i> Leaves</a>
    <a href="payroll.jsp" class="bg-primary"><i class="bi bi-currency-rupee"></i> Payroll</a>
    <a href="../../adminLogin.jsp"><i class="bi bi-box-arrow-left"></i> Logout</a>
</div>

<!-- Main Content -->
<div class="main-content">
    <h2 class="mb-4">Payroll Summary</h2>

    <form action="../../PayrollServlet" method="post">
        <button type="submit" class="btn btn-success mb-3">
            <i class="bi bi-file-earmark-bar-graph-fill"></i> Generate Payroll
        </button>
    </form>

    <div class="table-responsive">
        <table class="table table-bordered table-hover bg-white shadow">
            <thead class="table-dark text-center">
            <tr>
                <th>Employee Name</th>
                <th>Month</th>
                <th>Working Days</th>
                <th>Present Days</th>
                <th>Leaves</th>
                <th>Net Salary (₹)</th>
            </tr>
            </thead>
            <tbody>
            <%
                try {
                    conn = DBConnection.getConnection();
                    String sql = "SELECT p.*, e.name FROM payroll p JOIN employees e ON p.employee_id = e.id ORDER BY p.id DESC";
                    ps = conn.prepareStatement(sql);
                    rs = ps.executeQuery();

                    boolean hasData = false;
                    while (rs.next()) {
                        hasData = true;
            %>
            <tr class="text-center">
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("month") %></td>
                <td><%= rs.getInt("total_working_days") %></td>
                <td><%= rs.getInt("present_days") %></td>
                <td><%= rs.getInt("leaves_taken") %></td>
                <td>₹ <%= rs.getDouble("net_salary") %></td>
            </tr>
            <%
                    }

                    if (!hasData) {
            %>
            <tr>
                <td colspan="6" class="text-center text-muted">No payroll records found.</td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='6' class='text-danger'>Error loading payroll: " + e.getMessage() + "</td></tr>");
                } finally {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (conn != null) conn.close();
                }
            %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
