package com.wei.q.filter;

import javax.servlet.*;
import java.io.IOException;

public class CharacterEncodingFilter implements Filter {

    private String charEncoding;
    private String enable;


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        charEncoding = filterConfig.getInitParameter("CharEncoding");
        enable = filterConfig.getInitParameter("enable");
        System.out.println("charEncoding=" + charEncoding + ",enable=" + enable);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        if ("true".equals(enable)) {
            servletRequest.setCharacterEncoding(charEncoding);
//            servletResponse.setCharacterEncoding(charEncoding);
            servletResponse.setContentType("text/html;charset=utf-8");
        }
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {

    }
}
