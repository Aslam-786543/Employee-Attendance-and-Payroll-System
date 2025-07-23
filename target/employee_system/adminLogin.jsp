<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('https://images.pexels.com/photos/3184287/pexels-photo-3184287.jpeg?auto=compress&cs=tinysrgb&h=1080');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
        }

        .login-card {
            background: rgba(255, 255, 255, 0.96);
            border-radius: 20px;
            max-width: 400px;
            width: 100%;
            margin: auto;
            padding: 35px;
            box-shadow: 0 0 30px rgba(0,0,0,0.3);
        }

        .form-label {
            font-weight: 600;
        }

        .form-control {
            border-radius: 10px;
        }

        .btn {
            border-radius: 10px;
        }

        .login-icon {
            width: 70px;
            margin-bottom: 15px;
        }
    </style>
</head>
<body class="d-flex align-items-center justify-content-center">
    <div class="login-card text-center">
        <img src="https://cdn-icons-png.flaticon.com/512/1022/1022791.png" alt="Admin Icon" class="login-icon">
        <h3 class="mb-4">Admin Login</h3>
        <form action="AdminLoginServlet" method="post">
            <div class="mb-3 text-start">
                <label class="form-label">Username</label>
                <input type="text" name="username" class="form-control" required/>
            </div>
            <div class="mb-3 text-start">
                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-control" required/>
            </div>
            <button type="submit" class="btn btn-primary w-100">Login</button>
        </form>
    </div>
</body>
</html>
