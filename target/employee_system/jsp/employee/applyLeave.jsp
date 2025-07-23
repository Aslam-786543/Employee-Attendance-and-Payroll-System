<%@ page language="java" session="true" %>
<%
    String empName = (String) session.getAttribute("name");
    if (empName == null) response.sendRedirect("../../employeeLogin.jsp");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Apply Leave</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
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

        .sidebar a:hover {
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

        .form-container {
            background: rgba(0, 0, 0, 0.75);
            padding: 30px;
            border-radius: 15px;
            max-width: 500px;
            margin: 60px auto;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
        }

        h2 {
            color: #ffc107;
            font-weight: 600;
        }

        label, input, textarea {
            color: white;
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

            .form-container {
                margin: 20px;
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
        <a href="payroll.jsp"><i class="bi bi-cash-stack"></i>Payroll</a>
        <a href="../../employeeLogin.jsp"><i class="bi bi-box-arrow-right"></i>Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="form-container">
            <h2 class="text-center mb-4">Apply for Leave</h2>
            <form action="../../ApplyLeaveServlet" method="post">
                <div class="mb-3">
                    <label for="leave_date" class="form-label">Leave Date</label>
                    <input type="date" id="leave_date" name="leave_date" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="reason" class="form-label">Reason</label>
                    <textarea id="reason" name="reason" class="form-control" rows="4" required></textarea>
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn btn-warning">Submit Leave Request</button>
                </div>
            </form>
        </div>
    </div>

</body>
</html>
