<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Registration</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            background-image: url('https://images.pexels.com/photos/3184291/pexels-photo-3184291.jpeg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', sans-serif;
        }
        .card {
            width: 100%;
            max-width: 500px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .card img {
            width: 80px;
            margin: 0 auto;
            display: block;
        }
    </style>
</head>
<body>
    <div class="card p-4">
        <img src="https://cdn-icons-png.flaticon.com/512/921/921347.png" alt="Employee Icon">
        <h2 class="text-center mt-2 mb-4">Register as Employee</h2>
        
        <form action="RegisterServlet" method="post">
            <div class="mb-3">
                <label>Name</label>
                <input type="text" name="name" class="form-control" required/>
            </div>
            <div class="mb-3">
                <label>Email</label>
                <input type="email" name="email" class="form-control" required/>
            </div>
            <div class="mb-3">
                <label>Password</label>
                <input type="password" name="password" class="form-control" required/>
            </div>
            <div class="mb-3">
                <label>Designation</label>
                <input type="text" name="designation" class="form-control" required/>
            </div>
            <div class="mb-3">
                <label>Salary</label>
                <input type="number" name="salary" step="0.01" class="form-control" required/>
            </div>
            <button type="submit" class="btn btn-primary w-100 mt-3">Register</button>
        </form>
    </div>
</body>
</html>
