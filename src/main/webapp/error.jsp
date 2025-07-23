<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('https://images.pexels.com/photos/1020315/pexels-photo-1020315.jpeg?auto=compress&cs=tinysrgb&h=1080');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
        }

        .error-card {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.25);
            text-align: center;
            max-width: 450px;
            width: 100%;
        }

        .error-card h1 {
            font-size: 2.2rem;
            color: #dc3545;
        }

        .error-card p {
            font-size: 1.1rem;
            color: #333;
        }

        .error-card img {
            width: 80px;
            margin-top: 20px;
        }
    </style>
</head>
<body class="d-flex align-items-center justify-content-center">
    <div class="error-card">
        <h1>Oops! Something went wrong</h1>
        <p>We're experiencing some issues. Please try again later.</p>
        <img src="https://cdn-icons-png.flaticon.com/512/564/564619.png" alt="Error Icon">
    </div>
</body>
</html>
