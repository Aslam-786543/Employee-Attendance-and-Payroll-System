<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Attendance & Payroll System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('https://images.unsplash.com/photo-1521791136064-7986c2920216?fit=crop&w=1500&q=80');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .overlay {
            background-color: rgba(255, 255, 255, 0.85);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 25px rgba(0, 0, 0, 0.2);
        }
        .card {
            border: none;
            transition: 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }
        .card-img-top {
            width: 90px;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="overlay text-center">
        <h1 class="mb-4 text-primary">Employee Attendance & Payroll Management System</h1>

        <div class="row justify-content-center mt-4">
            <!-- Employee Login -->
            <div class="col-md-5 col-lg-4 mb-4">
                <div class="card p-4">
                    <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Employee Icon" class="card-img-top mx-auto">
                    <h4 class="mt-3">Employee Login</h4>
                    <a href="employeeLogin.jsp" class="btn btn-outline-primary mt-3">Go to Employee Login</a>
                </div>
            </div>

            <!-- Admin Login -->
            <div class="col-md-5 col-lg-4 mb-4">
                <div class="card p-4">
                    <img src="https://cdn-icons-png.flaticon.com/512/1792/1792892.png" alt="Admin Icon" class="card-img-top mx-auto">
                    <h4 class="mt-3">Admin Login</h4>
                    <a href="adminLogin.jsp" class="btn btn-outline-danger mt-3">Go to Admin Login</a>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
