package com.wei.q.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;

public class WaterMarkFilter implements Filter {
    private String waterMarkFilePath;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        String file = filterConfig.getInitParameter("waterMarkFile");
        waterMarkFilePath = filterConfig.getServletContext().getRealPath(file);
        System.out.println(waterMarkFilePath);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        WaterMarkResponseWrapper waterMarkRes = new WaterMarkResponseWrapper(response, waterMarkFilePath);
        filterChain.doFilter(request, waterMarkRes);
        waterMarkRes.finishResponse();
//        filterChain.doFilter(request,response);
//        OutputStream outputStream = response.getOutputStream();


    }

    @Override
    public void destroy() {

    }
}
