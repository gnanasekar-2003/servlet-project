<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.Employee.model.Task" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Project Tasks Chart</title>
    <!-- Load Google Charts API -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var chartData = [];
            var chartOptions = { title: '', is3D: true };
            var chart;

            <% 
                String chartType = (String) request.getAttribute("type");
                if ("daily".equals(chartType)) {
                    %>
                    chartData.push(['Project', 'Hours']);
                    <% 
                        List<Task> tasks = (List<Task>) request.getAttribute("tasks");
                        if (tasks != null && !tasks.isEmpty()) {
                            Map<String, Double> projectHours = new HashMap<>();
                            for (Task task : tasks) {
                                String project = task.getProject();
                                Double hours = task.getNumHours();
                                projectHours.put(project, projectHours.getOrDefault(project, 0.0) + hours);
                            }
                            for (Map.Entry<String, Double> entry : projectHours.entrySet()) {
                                %>
                                chartData.push(['<%= entry.getKey() %>', <%= entry.getValue() %>]);
                                <% 
                            }
                        } else {
                            %>
                            chartData.push(['No Data', 0]);
                            <% 
                        }
                        %>
                        chartOptions.title = 'Daily Project Tasks Distribution';
                        chart = new google.visualization.PieChart(document.getElementById('chart_div'));
                        <% 
                } else if ("weekly".equals(chartType) || "monthly".equals(chartType)) {
                    %>
                    chartData.push(['Project', 'Hours']);
                    <% 
                        Map<String, Double> projectHours = (Map<String, Double>) request.getAttribute("projectHours");
                        if (projectHours != null && !projectHours.isEmpty()) {
                            for (Map.Entry<String, Double> entry : projectHours.entrySet()) {
                                %>
                                chartData.push(['<%= entry.getKey() %>', <%= entry.getValue() %>]);
                                <% 
                            }
                        } else {
                            %>
                            chartData.push(['No Data', 0]);
                            <% 
                        }
                        if ("weekly".equals(chartType)) {
                            %>
                            chartOptions.title = 'Weekly Project Hours';
                            chart = new google.visualization.BarChart(document.getElementById('chart_div'));
                            <% 
                        } else if ("monthly".equals(chartType)) {
                            %>
                            chartOptions.title = 'Monthly Project Hours';
                            chart = new google.visualization.BarChart(document.getElementById('chart_div'));
                            <% 
                        }
                }
            %>

            var data = google.visualization.arrayToDataTable(chartData);
            chart.draw(data, chartOptions);
        }
    </script>
</head>
<body>
    <h1>Project Tasks Chart</h1>
    <div id="chart_div" style="width: 900px; height: 500px;"></div>
</body>
</html>
