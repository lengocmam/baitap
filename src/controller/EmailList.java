package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import model.User;
import data.UserDB;

public class EmailList extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Nhận action từ form
        String action = request.getParameter("action");
        if (action == null) {
            action = "join"; // default action
        }

        // Debug log
        System.out.println("Action received: " + action);

        String url = "/index.html";

        if (action.equals("join")) {
            url = "/index.html";
        } else if (action.equals("add")) {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");

            User user = new User(firstName, lastName, email);
            UserDB.insert(user);

            // Debug log
            System.out.println("New user added: " + firstName + " " + lastName + " - " + email);

            request.setAttribute("user", user);
            url = "/thanks.jsp";
        }

        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
