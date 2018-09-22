package com.wei.q.filter;

import com.wei.q.AccountException;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class PrivilegeFilter implements Filter {
    private Properties pp = new Properties();

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        String file = filterConfig.getInitParameter("file");
        String realPath = filterConfig.getServletContext().getRealPath(file);
        try {
            pp.load(new FileInputStream(realPath));
        } catch (IOException e) {
            e.printStackTrace();
            filterConfig.getServletContext().log("读取权限控制文件失败.", e);
        }
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        String requestURI = request.getRequestURI().replace(request.getContextPath() + "/", "");
        String action = request.getParameter("action");
        action = action == null ? "" : action;
        String uri = requestURI + "?action=" + action;
        String role = (String) request.getSession(true).getAttribute("role");
        role = role == null ? "guest" : role;
        boolean authentificated = true;
        for (Object obj : pp.keySet()) {
            String key = ((String) obj);
            if (uri.matches(key.replace("?", "\\?").replace(".", "\\.")
                    .replace("*", ".*"))) {
                if (role.equals(pp.get(key))) {
                    authentificated = true;
                    break;
                } else {
                    authentificated = false;
                    break;
                }
            }
        }
        if (!authentificated) {
            throw new RuntimeException(new AccountException("您无权访问该页面,请以合适的身份登录后查看"));
        }

        filterChain.doFilter(request, servletResponse);
    }

    @Override
    public void destroy() {
        pp = null;
    }
}
