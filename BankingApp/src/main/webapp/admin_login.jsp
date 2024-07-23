<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login - Banking Application</title>
    <meta charset="utf-8">
    <meta name="author" content="Your Name">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        html, body {
            height: 100%;
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #71b7e6, #9b59b6);
            color: #fff;
            font-size: 14px;
        }
        
        .my-login-page {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
        }

        .card-wrapper {
            width: 400px;
            margin: auto;
        }

        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,.1);
            background-color: #fff;
            color: #333;
        }

        .card.fat {
            padding: 20px;
        }

        .card-title {
            margin-bottom: 30px;
            font-weight: bold;
            color: #333;
        }

        .form-control {
            border-width: 2.3px;
            border-color: #ccc;
            border-radius: 5px;
        }

        .form-group label {
            width: 100%;
            color: #333;
        }

        .btn-primary {
            padding: 12px 10px;
            background: #9b59b6;
            border: none;
            color: #fff;
            border-radius: 5px;
            font-weight: bold;
        }

        .btn-primary:hover {
            background: #8e44ad;
        }

        .footer {
            margin: 40px 0;
            color: #888;
            text-align: center;
        }

        .text-center {
            text-align: center;
        }

        .text-center a {
            color: #9b59b6;
        }

        .text-center a:hover {
            color: #8e44ad;
            text-decoration: none;
        }

        @media screen and (max-width: 425px) {
            .card-wrapper {
                width: 90%;
                margin: 0 auto;
            }
        }

        @media screen and (max-width: 320px) {
            .card.fat {
                padding: 0;
            }

            .card.fat .card-body {
                padding: 15px;
            }
        }
    </style>
</head>

<body class="my-login-page">
    <div class="card-wrapper">
        <div class="card fat">
            <div class="card-body">
                <h4 class="card-title">Admin Login</h4>
                <form action="AdminLoginServlet" method="POST">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input id="username" type="text" class="form-control" name="username" required autofocus>
                        <div class="invalid-feedback">
                            Username is required
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password">Password
                            <a href="#" class="float-right">
                                Forgot Password?
                            </a>
                        </label>
                        <input id="password" type="password" class="form-control" name="password" required>
                        <div class="invalid-feedback">
                            Password is required
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="custom-checkbox custom-control">
                            <input type="checkbox" name="remember" id="remember" class="custom-control-input">
                            <label for="remember" class="custom-control-label">Remember Me</label>
                        </div>
                    </div>

                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-block">
                            Login
                        </button>
                    </div>
                    <div class="mt-4 text-center">
                        <a href="choose_role.jsp">Back to choose</a>
                    </div>
                </form>
            </div>
        </div>
        <div class="footer">
            Copyright &copy; 2024 &mdash; Genpact
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
