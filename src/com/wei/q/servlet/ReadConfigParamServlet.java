package com.wei.q.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

public class ReadConfigParamServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();

        out.println("servlet初始参数");
        Enumeration<String> initParameterNames = getServletConfig().getInitParameterNames();
        while (initParameterNames.hasMoreElements()) {
            String paramName = initParameterNames.nextElement();
            String paramValue = getServletConfig().getInitParameter(paramName);
            out.println("paramName=" + paramName + ",paramValue=" + paramValue);
        }
        out.println();
        out.println("容器初始参数");
        Enumeration<String> parameterNames = getServletContext().getInitParameterNames();
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            String paramValue = getServletContext().getInitParameter(paramName);
            out.println("paramName=" + paramName + ",paramValue=" + paramValue);
        }

    }
}
