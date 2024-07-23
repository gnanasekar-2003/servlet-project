<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Dashboard</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #ece9e6, #ffffff);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
            text-align: center;
        }
        h1 {
            color: #333;
            margin-bottom: 30px;
            font-weight: 600;
        }
        .dashboard-link {
            display: block;
            margin-bottom: 15px;
            padding: 15px;
            text-decoration: none;
            background-color: #007bff;
            color: white;
            border-radius: 8px;
            transition: background-color 0.3s, transform 0.3s;
            font-size: 16px;
            font-weight: 500;
        }
        .dashboard-link:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
        form {
            margin-top: 20px;
        }
        form input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 12px 25px;
            border: none;
            cursor: pointer;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            transition: background-color 0.3s, transform 0.3s;
        }
        form input[type="submit"]:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Your Dashboard</h1>
        <a href="ViewBalanceServlet" class="dashboard-link">View Balance</a>
        <a href="ViewTransactionsServlet" class="dashboard-link">View Transactions</a>
        <a href="WithdrawServlet" class="dashboard-link">Withdraw Money</a>
        <a href="DepositServlet" class="dashboard-link">Deposit Money</a>
        <a href="delete_account.jsp" class="dashboard-link">Delete Account</a>
        <form action="customer_login.jsp">
            <input type="submit" value="Logout">
        </form>
    </div>
</body>
</html>
