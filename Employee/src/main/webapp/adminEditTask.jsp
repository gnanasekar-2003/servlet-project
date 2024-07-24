<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.Employee.dao.TaskDao" %>
<%@ page import="com.Employee.model.Task" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Task</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            max-width: 600px;
            width: 100%;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        .container h2 {
            margin-top: 0;
            color: #333;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
        }
        input[type="text"],
        input[type="date"],
        input[type="time"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        function calculateNumHours() {
            var startTime = document.getElementById("startTime").value;
            var endTime = document.getElementById("endTime").value;
            if (startTime && endTime) {
                var start = new Date("1970-01-01T" + startTime + "Z");
                var end = new Date("1970-01-01T" + endTime + "Z");
                var diff = (end - start) / (1000 * 60 * 60); // Difference in hours
                if (diff < 0) diff += 24; // Handle case where endTime is after midnight
                document.getElementById("numHours").value = diff.toFixed(1);
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Edit Task</h2>
        <form action="AdminEditTaskServlet" method="post">
            <% 
                String taskIdParam = request.getParameter("taskId");
                int taskId = Integer.parseInt(taskIdParam);
                TaskDao taskDao = new TaskDao();
                Task task = taskDao.getTaskById(taskId);
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                String formattedDate = dateFormat.format(task.getDate());
            %>
            <input type="hidden" name="taskId" value="<%= task.getId() %>">
            
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" value="<%= task.getUsername() %>" readonly>

            <label for="empId">Employee ID:</label>
            <input type="text" id="empId" name="empId" value="<%= task.getEmpId() %>" readonly>

            <label for="date">Date:</label>
            <input type="date" id="date" name="date" value="<%= formattedDate %>" required>

            <label for="startTime">Start Time:</label>
            <input type="time" id="startTime" name="startTime" value="<%= task.getStartTime() %>" step="1" required onchange="calculateNumHours()">

            <label for="endTime">End Time:</label>
            <input type="time" id="endTime" name="endTime" value="<%= task.getEndTime() %>" step="1" required onchange="calculateNumHours()">

            <label for="numHours">Number of Hours:</label>
            <input type="number" id="numHours" name="numHours" value="<%= task.getNumHours() %>" step="0.1" required readonly>

            <label for="category">Category:</label>
            <input type="text" id="category" name="category" value="<%= task.getCategory() %>" required>

            <label for="project">Project:</label>
            <input type="text" id="project" name="project" value="<%= task.getProject() %>" required>

            <input type="submit" value="Update Task">
        </form>
    </div>
</body>
</html>
