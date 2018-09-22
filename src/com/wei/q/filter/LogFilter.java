package com.wei.q.filter;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LogFilter implements Filter {
    private Log log = LogFactory.getLog(this.getClass());
    private String filterName;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        filterName = filterConfig.getFilterName();
        log.info("启动Filter" + filterName);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        long startTime = System.currentTimeMillis();
        String requestURI = request.getRequestURI();
        requestURI = request.getQueryString() == null ? requestURI :
                (requestURI + "?" + request.getQueryString());
        filterChain.doFilter(request, response);
        long endTime = System.currentTimeMillis();
        log.info(request.getRemoteAddr() + "访问了" + requestURI + ",总用时" + (endTime - startTime) + "毫秒");
    }

    @Override
    public void destroy() {
        log.info("关闭Filter:" + filterName);
    }
}
