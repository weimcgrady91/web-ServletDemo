package com.wei.q.filter;

import com.wei.q.servlet.HttpCharacterResponseWrapper;

import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;

public class OutputReplaceFilter implements Filter {
    private Properties pp = new Properties();

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        String file = filterConfig.getInitParameter("file");
        String realPath = filterConfig.getServletContext().getRealPath(file);
        try {
            pp.load(new FileInputStream(realPath));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpCharacterResponseWrapper response = new HttpCharacterResponseWrapper((HttpServletResponse)servletResponse);
        filterChain.doFilter(servletRequest,response);
        String output = response.getCharArrayWriter().toString();
        for(Object obj: pp.keySet()) {
            String key = (String) obj;
            output= output.replace(key,pp.getProperty(key));
        }
        PrintWriter out = servletResponse.getWriter();
        out.write(output);
        out.println("<!--Generated at" + new Date()+"-->");

    }

    @Override
    public void destroy() {

    }
}
