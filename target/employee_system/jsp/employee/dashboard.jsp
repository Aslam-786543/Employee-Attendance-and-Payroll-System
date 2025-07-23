<%@ page language="java" session="true" %>
<%
    String empName = (String) session.getAttribute("name");
    if (empName == null) response.sendRedirect("../../employeeLogin.jsp");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Dashboard</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-image: url('https://images.unsplash.com/photo-1520607162513-77705c0f0d4a?auto=format&fit=crop&w=1650&q=80');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            min-height: 100vh;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .dashboard-box {
            background-color: rgba(255, 255, 255, 0.98);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 700px;
        }

        .avatar {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 50%;
            margin-bottom: 15px;
        }

        h2 {
            font-weight: bold;
            color: #343a40;
            margin-bottom: 30px;
        }

        .btn-custom {
            padding: 14px 0;
            font-size: 16px;
            font-weight: 600;
            border-radius: 10px;
        }

        .logout-btn {
            margin-top: 25px;
        }
    </style>
</head>
<body>

    <div class="dashboard-box text-center">
        <!-- Avatar -->
        <img src="https://cdn-icons-png.flaticon.com/512/219/219983.png" class="avatar" alt="Employee Avatar">

        <!-- Welcome -->
        <h2>Welcome, <%= empName %></h2>

        <!-- Action Buttons -->
        <div class="row g-3">
            <div class="col-md-6">
                <a href="profile.jsp" class="btn btn-primary w-100 btn-custom">My Profile</a>
            </div>
            <div class="col-md-6">
                <a href="attendance.jsp" class="btn btn-success w-100 btn-custom">My Attendance</a>
            </div>
            <div class="col-md-6">
                <a href="applyLeave.jsp" class="btn btn-warning w-100 btn-custom">Apply Leave</a>
            </div>
            <div class="col-md-6">
                <a href="payroll.jsp" class="btn btn-info w-100 btn-custom">My Payroll</a>
            </div>
        </div>

        <!-- Logout -->
        <div class="logout-btn">
            <a href="../../employeeLogin.jsp" class="btn btn-danger w-100 btn-custom">Logout</a>
        </div>
    </div>

</body>
</html>
