package com.example.customerlist;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/customer")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        List<Customer> customers = new ArrayList<>();
        customers.add(new Customer(1,"Hoàn", "huế","1995-05-19"));
        customers.add(new Customer(2,"Đạt", "huế","1999-05-19"));
        customers.add(new Customer(3,"Thi", "huế","2000-05-19"));

        request.setAttribute("customers", customers);

        request.getRequestDispatcher("customer.jsp").forward(request, response);

    }

    public void destroy() {
    }
}