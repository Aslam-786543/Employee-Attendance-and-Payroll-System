<%@ page language="java" session="true" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.yourapp.payroll.DBConnection" %>
<%
    int empId = (int) session.getAttribute("employeeId");
    Connection conn = DBConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement("SELECT * FROM payroll WHERE employee_id = ?");
    ps.setInt(1, empId);
    ResultSet rs = ps.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
    <title>My Payroll</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: url('https://images.pexels.com/photos/3184465/pexels-photo-3184465.jpeg?auto=compress&cs=tinysrgb&w=1600') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
        }

        .sidebar {
            height: 100vh;
            width: 230px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: rgba(0, 0, 0, 0.9);
            padding-top: 60px;
            box-shadow: 2px 0 10px rgba(0,0,0,0.6);
        }

        .sidebar a {
            padding: 15px 25px;
            display: flex;
            align-items: center;
            color: white;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .sidebar a:hover, .sidebar a.active {
            background-color: #ffc107;
            color: black;
        }

        .sidebar a i {
            margin-right: 10px;
        }

        .main-content {
            margin-left: 240px;
            padding: 40px;
        }

        .table-container {
            background: rgba(0, 0, 0, 0.75);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
        }

        h2 {
            color: #ffc107;
            font-weight: 600;
        }

        table th, table td {
            color: white;
            vertical-align: middle !important;
        }

        table th {
            background-color: #343a40;
        }

        table td {
            background-color: rgba(255, 255, 255, 0.1);
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }

            .main-content {
                margin-left: 0;
                padding: 20px;
            }
        }
    </style>
</head>
<body>

    <!-- Sidebar Navigation -->
    <div class="sidebar">
        <a href="dashboard.jsp"><i class="bi bi-speedometer2"></i>Dashboard</a>
        <a href="profile.jsp"><i class="bi bi-person-badge"></i>My Profile</a>
        <a href="applyLeave.jsp"><i class="bi bi-calendar-plus"></i>Apply Leave</a>
        <a href="attendance.jsp"><i class="bi bi-clock-history"></i>My Attendance</a>
        <a href="payroll.jsp" class="active"><i class="bi bi-cash-stack"></i>Payroll</a>
        <a href="../../employeeLogin.jsp"><i class="bi bi-box-arrow-right"></i>Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="container table-container">
            <h2 class="text-center mb-4">My Payroll</h2>
            <div class="table-responsive">
                <table class="table table-bordered text-center table-hover">
                    <thead class="table-warning text-dark">
                        <tr>
                            <th>Month</th>
                            <th>Working Days</th>
                            <th>Presents</th>
                            <th>Leaves</th>
                            <th>Net Salary</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% while (rs.next()) { %>
                            <tr>
                                <td><%= rs.getString("month") %></td>
                                <td><%= rs.getInt("total_working_days") %></td>
                                <td><%= rs.getInt("present_days") %></td>
                                <td><%= rs.getInt("leaves_taken") %></td>
                                <td><%= rs.getString("net_salary") %></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</body>
</html>
