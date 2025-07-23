<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Login</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('https://images.pexels.com/photos/373076/pexels-photo-373076.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=1080&w=1920');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            min-height: 100vh;
        }

        .login-card {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        .login-icon {
            width: 100px;
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #28a745;
        }

        .btn-success {
            background-color: #28a745;
            border: none;
        }

        .btn-success:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="container d-flex justify-content-center align-items-center min-vh-100">
        <div class="col-md-6 login-card">
            <h2 class="text-center mb-4">Employee Login</h2>
            <form action="EmployeeLoginServlet" method="post">
                <div class="mb-3">
                    <label>Email</label>
                    <input type="email" name="email" class="form-control" required/>
                </div>
                <div class="mb-3">
                    <label>Password</label>
                    <input type="password" name="password" class="form-control" required/>
                </div>
                <button type="submit" class="btn btn-success w-100">Login</button>
            </form>

            <div class="text-center mt-3">
                <p>Don't have an account?</p>
                <a href="register.jsp" class="btn btn-primary">Register Now</a>
            </div>

            <div class="text-center mt-4">
                <img src="https://cdn-icons-png.flaticon.com/512/219/219970.png" class="login-icon" alt="Employee Icon"/>
            </div>
        </div>
    </div>
</body>
</html>
