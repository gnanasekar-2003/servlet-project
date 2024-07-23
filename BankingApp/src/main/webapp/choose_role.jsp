<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Banking Application - Choose Role</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #ffffff;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 400px;
            width: 100%;
            backdrop-filter: blur(10px);
        }
        h1 {
            color: #ffffff;
            margin-bottom: 20px;
            font-size: 24px;
        }
        p {
            color: #e0e0e0;
            font-size: 18px;
            margin-bottom: 30px;
        }
        .btn {
            display: inline-block;
            padding: 12px 25px;
            margin: 10px;
            color: #ffffff;
            background-color: #ff5722;
            border: none;
            border-radius: 50px;
            text-decoration: none;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s, box-shadow 0.3s;
        }
        .btn:hover {
            background-color: #e64a19;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Banking Application</h1>
        <p>Please choose your role to continue:</p>
        <a href="admin_login.jsp" class="btn">Admin Login</a>
        <a href="customer_login.jsp" class="btn">Customer Login</a>
    </div>
</body>
</html>
