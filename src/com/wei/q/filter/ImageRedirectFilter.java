package com.wei.q.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ImageRedirectFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("ImageRedirectFilter init");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String referer = request.getHeader("referer");
        if (referer == null || !referer.contains(request.getServerName())) {
            request.getRequestDispatcher("/errorImage.jsp").forward(request, response);
        } else {
            filterChain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
        System.out.println("ImageRedirectFilter destroy");
    }
}
