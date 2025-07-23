<%@ page language="java" session="true" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.yourapp.payroll.DBConnection" %>

<%
    int empId = (int) session.getAttribute("employeeId");
    Connection conn = DBConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement("SELECT * FROM employees WHERE id = ?");
    ps.setInt(1, empId);
    ResultSet rs = ps.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
    <title>My Profile</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    <style>
        body {
            background: url('https://images.pexels.com/photos/3182763/pexels-photo-3182763.jpeg?auto=compress&cs=tinysrgb&w=1600') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
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

        .profile-card {
            background: rgba(0, 0, 0, 0.75);
            padding: 30px;
            border-radius: 15px;
            max-width: 700px;
            margin: auto;
            box-shadow: 0 0 20px rgba(0,0,0,0.5);
            color: white;
        }

        h2 {
            color: #ffc107;
            font-weight: 600;
            text-align: center;
            margin-bottom: 30px;
        }

        label {
            font-weight: 500;
        }

        .btn-primary {
            width: 100%;
            font-weight: 600;
            padding: 10px;
            border-radius: 10px;
            margin-top: 20px;
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
        <a href="profile.jsp" class="active"><i class="bi bi-person-badge"></i>My Profile</a>
        <a href="applyLeave.jsp"><i class="bi bi-calendar-plus"></i>Apply Leave</a>
        <a href="attendance.jsp"><i class="bi bi-clock-history"></i>My Attendance</a>
        <a href="payroll.jsp"><i class="bi bi-cash-stack"></i>Payroll</a>
        <a href="../../employeeLogin.jsp"><i class="bi bi-box-arrow-right"></i>Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="profile-card">
            <h2>My Profile</h2>
            <% if (rs.next()) { %>
                <form action="updateProfile.jsp" method="post">
                    <input type="hidden" name="id" value="<%= empId %>">

                    <div class="mb-3">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" name="name" value="<%= rs.getString("name") %>" required>
                    </div>

                    <div class="mb-3">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" name="email" value="<%= rs.getString("email") %>" required>
                    </div>

                    <div class="mb-3">
                        <label for="designation">Designation</label>
                        <input type="text" class="form-control" name="designation" value="<%= rs.getString("designation") %>">
                    </div>

                    <div class="mb-3">
                        <label for="salary">Salary</label>
                        <input type="number" step="0.01" class="form-control" name="salary" value="<%= rs.getString("salary") %>">
                    </div>

                    <button type="submit" class="btn btn-primary">Update Profile</button>
                </form>
            <% } else { %>
                <p class="text-danger text-center">Employee data not found.</p>
            <% } %>
        </div>
    </div>

</body>
</html>
