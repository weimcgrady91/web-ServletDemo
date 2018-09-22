package com.wei.q.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

public class RequestInfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();

        String param1 = req.getParameter("param1");
        String param2 = req.getParameter("param2");
        out.println("param1=" + param1 + ",param2=" + param2);
        out.println("headers");
        Enumeration<String> headerNames = req.getHeaderNames();
        while (headerNames.hasMoreElements()) {
            String headName = headerNames.nextElement();
            String headValue = req.getHeader(headName);
            out.println("headerName:" + headName + ",headValue=" + headValue);
        }
        out.println("req.getRequestURI=" + req.getRequestURI());
        out.println("req.getRemoteUser()=" + req.getRemoteUser());
        out.println("req.getRequestURL()=" + req.getRequestURL());
        out.println("req.getServerName()=" + req.getServerName());
        out.println("req.getServerPort()=" + req.getServerPort());
        out.println("req.getLocalAddr()=" + req.getLocalAddr());

    }

}
