<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Employee.model.Task" %>
<%@ page import="com.Employee.model.User" %>
<%@ page import="com.Employee.dao.TaskDao" %>
<%@ page import="java.sql.Date" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Daily Tasks Chart</title>
    <!-- Load Google Charts API -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            // Fetch data from the servlet
            var tasksData = [
                ['Category', 'Hours']
                <% 
                    if (request.getAttribute("tasks") != null) {
                        List<Task> tasks = (List<Task>) request.getAttribute("tasks");
                        for (Task task : tasks) {
                %>
                ,['<%= task.getCategory() %>', <%= task.getNumHours() %>]
                <%       }
                    }
                %>
            ];

            var data = google.visualization.arrayToDataTable(tasksData);

            var options = {
                title: 'Daily Tasks Distribution',
                is3D: true,
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart'));

            chart.draw(data, options);
        }
    </script>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }
        h1 {
            color: #333;
            margin-top: 20px;
        }
        form {
            margin: 20px 0;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #666;
        }
        input[type="date"] {
            padding: 8px;
            font-size: 16px;
            width: 250px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            border: none;
            color: white;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        #piechart {
            width: 900px;
            height: 500px;
            margin-top: 20px;
        }
        ul {
            list-style: none;
            padding: 0;
        }
        ul li {
            background-color: #fff;
            margin: 5px 0;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <h1>Daily Tasks Chart</h1>
    <form method="get" action="DailyTasksChartServlet">
        <label for="date">Select Date:</label>
        <input type="date" id="date" name="date" required>
        <input type="submit" value="Generate Chart">
    </form>

    <div id="piechart"></div>
    
    <% 
        if (request.getAttribute("tasks") != null) {
            List<Task> tasks = (List<Task>) request.getAttribute("tasks");
    %>
    <h2>Tasks for <%= request.getParameter("date") %></h2>
    <ul>
        <% if (tasks.isEmpty()) { %>
            <li>No tasks found for <%= request.getParameter("date") %>.</li>
        <% } else { %>
            <% for (Task task : tasks) { %>
                <li><%= task.getId() %> - <%= task.getCategory() %> - <%= task.getNumHours() %> hours</li>
            <% } %>
        <% } %>
    </ul>
    <% } %>
</body>
</html>
