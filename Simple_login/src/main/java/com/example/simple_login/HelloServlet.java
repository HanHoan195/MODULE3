package com.example.simple_login;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "LoginServlet", value = "/login")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

//        // Hello
//        PrintWriter out = response.getWriter();
//        out.println("<html><body>");
//        out.println("<h1>" + message + "</h1>");
//        out.println("</body></html>");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    public void destroy() {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      String username = req.getParameter("username");
      String password = req.getParameter("password");

//      PrintWriter writer = resp.getWriter();
//      writer.println("<html>");
//
//        if ("admin".equals(username) && "admin".equals(password)) {
//            writer.println("<h1>Welcome " + username + " to website </h1>");
//        } else {
//            writer.println("<h1>Login Error</h1>");
//        }
//        writer.println("</html>");

        if ("admin".equals(username) && "admin".equals(password)) {
            req.setAttribute("message", "Dang nhap thanh cong");
        } else {
            req.setAttribute("message", "Dang nhap that bai");
        }
        req.getRequestDispatcher("home.jsp").forward(req, resp);
    }



}