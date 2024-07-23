<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Login - Banking Application</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #6a85b6 0%, #bac8e0 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            width: 320px;
            text-align: center;
            transition: transform 0.3s ease;
        }
        .container:hover {
            transform: translateY(-10px);
        }
        h1 {
            margin-bottom: 25px;
            font-size: 26px;
            color: #333;
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #555;
        }
        input[type="text"],
        input[type="password"] {
            width: 90%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }
        button {
            width: 100%;
            padding: 12px;
            background-color: #9146ff;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin-bottom: 15px;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #6b30e0;
        }
        .back-link,
        .register-link {
            display: block;
            margin-top: 15px;
            color: #9146ff;
            text-decoration: none;
            font-size: 14px;
        }
        .back-link:hover,
        .register-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Customer Login</h1>
        <form action="logincustomer" method="post">
            <input type="hidden" name="action" value="login"/>
            <label for="accountNo">Account No:</label>
            <input type="text" id="accountNo" name="accountNo" required/>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required/>

            <button type="submit">Login</button>
        </form>
        <a href="change_password.jsp" class="register-link">Change Password</a>
        <a href="register_customer.jsp" class="register-link">New Registration</a>
        <a href="choose_role.jsp" class="back-link">Back to Choose Role</a>
    </div>
</body>
</html>
