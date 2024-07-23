<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Success</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f8ff;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100vh;
    }
    h2 {
        color: #2c3e50;
        margin-bottom: 20px;
    }
    a {
        text-decoration: none;
        color: #3498db;
        font-size: 18px;
        margin: 10px 0;
        transition: color 0.3s ease;
    }
    a:hover {
        color: #1abc9c;
    }
    .container {
        text-align: center;
        background-color: #ffffff;
        padding: 40px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        border-radius: 10px;
    }
</style>
</head>
<body>
<div class="container">
    <h2>Welcome!</h2>
    <a href="admin_register_customer.jsp">Register Customer</a><br>
    <a href="view_customers.jsp">View Customer</a><br>
    <a href="modify_customer.jsp">Modify Customer</a><br>
    <a href="delete_customer.jsp">Delete Customer</a><br>
    <a href="choose_role.jsp" class="button">Go to Home </a><br>
</div>
</body>
</html>