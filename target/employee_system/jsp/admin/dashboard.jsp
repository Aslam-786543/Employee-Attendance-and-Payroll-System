<%@ page language="java" session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-image: url('https://images.unsplash.com/photo-1519389950473-47ba0277781c?auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            color: #fff;
            font-family: 'Segoe UI', sans-serif;
        }

        .dashboard-container {
            background: rgba(0, 0, 0, 0.7);
            border-radius: 15px;
            padding: 40px;
            margin-top: 60px;
            box-shadow: 0 0 15px rgba(0,0,0,0.5);
        }

        .card-custom {
            background-color: #1e1e2f;
            color: #ffffff;
            border: none;
            border-radius: 10px;
            transition: 0.3s;
        }

        .card-custom:hover {
            transform: scale(1.03);
            box-shadow: 0 0 15px rgba(255,255,255,0.2);
        }

        .btn-custom {
            background-color: #17a2b8;
            color: white;
            border: none;
        }

        .btn-custom:hover {
            background-color: #138496;
        }
    </style>
</head>
<body>
    <div class="container dashboard-container">
        <h2 class="text-center mb-5">Admin Dashboard</h2>

        <div class="row row-cols-1 row-cols-md-3 g-4">
            <div class="col">
                <div class="card card-custom text-center p-3">
                    <h5 class="card-title">Manage Employees</h5>
                    <a href="manageEmployees.jsp" class="btn btn-custom mt-2">Go</a>
                </div>
            </div>
            <div class="col">
                <div class="card card-custom text-center p-3">
                    <h5 class="card-title">View Leave Requests</h5>
                    <a href="viewLeaves.jsp" class="btn btn-warning mt-2">Go</a>
                </div>
            </div>
            <div class="col">
                <div class="card card-custom text-center p-3">
                    <h5 class="card-title">Mark Attendance</h5>
                    <a href="markAttendance.jsp" class="btn btn-success mt-2">Go</a>
                </div>
            </div>
            <div class="col">
                <div class="card card-custom text-center p-3">
                    <h5 class="card-title">View Payroll</h5>
                    <a href="payroll.jsp" class="btn btn-info mt-2">Go</a>
                </div>
            </div>
            <div class="col">
                <div class="card card-custom text-center p-3">
                    <h5 class="card-title">Logout</h5>
                    <a href="../../adminLogin.jsp" class="btn btn-danger mt-2">Logout</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
