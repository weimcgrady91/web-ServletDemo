package com.wei.q.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GZipFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String acceptEncoding = request.getHeader("Accept-Encoding");
        if (acceptEncoding != null && acceptEncoding.toLowerCase().indexOf("gzip") != -1) {
            GZipResponseWrapper gzipRes = new GZipResponseWrapper(response);
            filterChain.doFilter(request,gzipRes);
            gzipRes.finishResponse();
        } else {
            filterChain.doFilter(request,response);
        }
    }

    @Override
    public void destroy() {

    }
}
