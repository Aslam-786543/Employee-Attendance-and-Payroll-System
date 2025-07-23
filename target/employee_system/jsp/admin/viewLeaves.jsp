<%@ page language="java" import="java.sql.*" %>
<%@ page import="com.yourapp.payroll.DBConnection" %>
<%
    Connection conn = DBConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement("SELECT l.id, e.name, l.leave_date, l.reason, l.status FROM leaves l JOIN employees e ON l.employee_id = e.id WHERE l.status='Pending'");
    ResultSet rs = ps.executeQuery();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Leave Requests</title>
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
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <h4 class="text-white text-center mb-4">Admin Panel</h4>
    <a href="dashboard.jsp"><i class="bi bi-speedometer2"></i> Dashboard</a>
    <a href="manageEmployees.jsp"><i class="bi bi-people-fill"></i> Employees</a>
    <a href="markAttendance.jsp"><i class="bi bi-calendar-check-fill"></i> Attendance</a>
    <a href="viewLeaves.jsp" class="active bg-primary"><i class="bi bi-journal-text"></i> Leaves</a>
    <a href="payroll.jsp"><i class="bi bi-currency-rupee"></i> Payroll</a>
    <a href="../../adminLogin.jsp"><i class="bi bi-box-arrow-left"></i> Logout</a>
</div>

<!-- Main Content -->
<div class="main-content">
    <h2 class="mb-4">Pending Leave Requests</h2>

    <div class="table-responsive">
        <table class="table table-bordered table-hover bg-white shadow">
            <thead class="table-dark text-center">
                <tr>
                    <th>Employee Name</th>
                    <th>Leave Date</th>
                    <th>Reason</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <%
                while (rs.next()) {
            %>
                <tr class="text-center">
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getDate("leave_date") %></td>
                    <td><%= rs.getString("reason") %></td>
                    <td>
                        <form action="../../LeaveApprovalServlet" method="post" class="d-flex justify-content-center gap-2">
                            <input type="hidden" name="leaveId" value="<%= rs.getInt("id") %>">
                            <button type="submit" name="action" value="approve" class="btn btn-success btn-sm">
                                <i class="bi bi-check-circle"></i> Approve
                            </button>
                            <button type="submit" name="action" value="reject" class="btn btn-danger btn-sm">
                                <i class="bi bi-x-circle"></i> Reject
                            </button>
                        </form>
                    </td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
