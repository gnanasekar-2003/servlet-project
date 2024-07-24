package com.Employee.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Employee.dao.UserDao;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String empIdStr = request.getParameter("empId");

        if (empIdStr == null || empIdStr.isEmpty()) {
            response.sendRedirect("adminDashboard.jsp");
            return;
        }

        try {
            int empId = Integer.parseInt(empIdStr);

            UserDao userDao = new UserDao();
            boolean success = userDao.deleteEmployee(empId);

            if (success) {
                response.sendRedirect("adminDashboard.jsp?message=Employee+deleted+successfully");
            } else {
                response.sendRedirect("adminDashboard.jsp?message=Failed+to+delete+employee");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("adminDashboard.jsp?message=Invalid+employee+ID");
        }
    }
}
