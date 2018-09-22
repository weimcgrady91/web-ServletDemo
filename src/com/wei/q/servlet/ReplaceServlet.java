package com.wei.q.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ReplaceServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.getWriter().println("www.baidu.com.cn");
        resp.getWriter().println("情色");
        resp.getWriter().println("色情");
        resp.getWriter().println("赌博");
        resp.getWriter().println("Chna");
    }
}
