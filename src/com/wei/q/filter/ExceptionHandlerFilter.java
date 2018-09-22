package com.wei.q.filter;

import com.wei.q.AccountException;
import com.wei.q.BusinessException;

import javax.servlet.*;
import java.io.IOException;

public class ExceptionHandlerFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        try {
            filterChain.doFilter(servletRequest, servletResponse);
        } catch (Exception e) {
            Throwable rootCause = e;
            while (rootCause.getCause() != null) {
                rootCause = rootCause.getCause();
            }
            String message = rootCause.getMessage();
            message = message == null ? "异常" + rootCause.getClass().getName() : message;
            servletRequest.setAttribute("message", message);
            servletRequest.setAttribute("e", e);
            if (rootCause instanceof AccountException) {
                servletRequest.getRequestDispatcher("/accountException.jsp").forward(servletRequest, servletResponse);
            } else if (rootCause instanceof BusinessException) {
                servletRequest.getRequestDispatcher("/businessException.jsp").forward(servletRequest, servletResponse);
            }
        }
    }

    @Override
    public void destroy() {

    }
}
