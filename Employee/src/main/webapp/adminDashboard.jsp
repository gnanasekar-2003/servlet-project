<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Employee.dao.UserDao" %>
<%@ page import="com.Employee.dao.TaskDao" %>
<%@ page import="com.Employee.model.User" %>
<%@ page import="com.Employee.model.Task" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .container2 {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            text-align: center;
        }
        .container2 a {
            display: inline-block;
            padding: 12px 25px;
            border-radius: 5px;
            color: white;
            background-color: #007bff;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .container2 a:hover {
            background-color: #0056b3;
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 40px;
        }
        .card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            padding: 30px;
        }
        .card h2 {
            color: #444;
            border-bottom: 2px solid #f2f2f2;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .actions a {
            color: #007bff;
            text-decoration: none;
            margin-right: 10px;
            font-weight: bold;
        }
        .actions a:hover {
            text-decoration: underline;
        }
        .btn {
            display: inline-block;
            padding: 12px 25px;
            border-radius: 5px;
            color: white;
            background-color: #28a745;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #218838;
        }
        .charts {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }
        .chart {
            flex: 1;
            min-width: 300px;
            margin: 20px;
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .chart h3 {
            color: #333;
            margin-bottom: 15px;
        }
        .chart a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }
        .chart a:hover {
            text-decoration: underline;
        }
        form label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #444;
        }
        form input[type="text"],
        form input[type="password"],
        form input[type="date"],
        form input[type="time"],
        form input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        form input[type="submit"] {
            width: 100%;
            padding: 15px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        form input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        function calculateHours() {
            const startTime = document.getElementById('startTime').value;
            const endTime = document.getElementById('endTime').value;

            if (startTime && endTime) {
                const start = new Date('1970-01-01T' + startTime + 'Z');
                const end = new Date('1970-01-01T' + endTime + 'Z');
                const diff = end - start;

                if (diff < 0) {
                    alert('End time must be after start time.');
                    return;
                }

                const hours = diff / (1000 * 60 * 60);
                document.getElementById('numHours').value = hours.toFixed(1);
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Admin Dashboard</h1>

        <!-- View Employees -->
        <div class="card">
            <h2>View Employees</h2>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Role</th>
                    <th>Actions</th>
                </tr>
                <%
                    UserDao userDao = new UserDao();
                    List<User> employees = userDao.getUsersByRole("employee");
                    for (User employee : employees) {
                %>
                <tr>
                    <td><%= employee.getEmpId() %></td>
                    <td><%= employee.getUsername() %></td>
                    <td><%= employee.getRole() %></td>
                    <td class="actions">
                        <a href="DeleteEmployeeServlet?empId=<%= employee.getEmpId() %>">Delete</a>
                    </td>
                </tr>
                <% } %>
            </table>
        </div>

        <!-- Add Employee -->
        <div class="card">
            <h2>Add Employee</h2>
            <form action="AddEmployeeServlet" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
                
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
                
                <label for="role">Role:</label>
                <input type="text" id="role" name="role" value="employee" readonly>
                
                <input type="submit" value="Add Employee" class="btn">
            </form>
        </div>

        <!-- Add Task -->
        <div class="card">
            <h2>Add Task</h2>
            <form action="AdminAddTaskServlet" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
                
                <label for="date">Date:</label>
                <input type="date" id="date" name="date" required>
                
                <label for="startTime">Start Time:</label>
                <input type="time" id="startTime" name="startTime" step="1" onchange="calculateHours()" required>
                
                <label for="endTime">End Time:</label>
                <input type="time" id="endTime" name="endTime" step="1" onchange="calculateHours()" required>
                
                <label for="numHours">Number of Hours:</label>
                <input type="number" id="numHours" name="numHours" step="0.1" readonly required>
                
                <label for="category">Category:</label>
                <input type="text" id="category" name="category" required>
                
                <label for="project">Project:</label>
                <input type="text" id="project" name="project" required>
                
                <input type="submit" value="Add Task" class="btn">
            </form>
        </div>

        <!-- View Tasks -->
        <div class="card">
            <h2>View Tasks</h2>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Date</th>
                    <th>Start Time</th>
                    <th>End Time</th>
                    <th>Hours</th>
                    <th>Category</th>
                    <th>Project</th>
                    <th>Actions</th>
                </tr>
                <%
                    TaskDao taskDao = new TaskDao();
                    List<Task> tasks = taskDao.getAllTasks();
                    for (Task task : tasks) {
                %>
                <tr>
                    <td><%= task.getId() %></td>
                    <td><%= task.getUsername() %></td>
                    <td><%= task.getDate() %></td>
                    <td><%= task.getStartTime() %></td>
                    <td><%= task.getEndTime() %></td>
                    <td><%= task.getNumHours() %></td>
                    <td><%= task.getCategory() %></td>
                    <td><%= task.getProject() %></td>
                    <td class="actions">
                        <a href="adminEditTask.jsp?taskId=<%= task.getId() %>">Edit</a>
                        <form action="AdminDeleteTaskServlet" method="post" style="display:inline;">
                            <input type="hidden" name="taskId" value="<%= task.getId() %>">
                            <input type="submit" value="Delete">
                        </form>
                    </td>
                </tr>
                <% } %>
            </table>
        </div>

        <!-- View Charts -->
        <div class="card">
            <h2>View Charts</h2>
            <div class="charts">
                <div class="chart">
                    <h3>Project - Daily</h3>
                    <a href="selectProjectChart.jsp">Select Date and View Chart</a>
                </div>
                
                <div class="chart">
                    <h3>Employee - Monthly</h3>
                    <a href="selectEmployeeChart.jsp">Select Date and View Chart</a>                 
                </div>
            </div>
        </div>
    </div>
    <div class="container2">
        <a href="login.jsp">Back to Login</a>
    </div>
</body>
</html>
