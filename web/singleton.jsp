<%@ page import="com.wei.q.domain.PersonInfo" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%
    String action = request.getParameter("action");
    String account = request.getParameter("account");
    if("login".equalsIgnoreCase(action) && account.trim().length() >0) {
        PersonInfo personInfo = new PersonInfo();
        personInfo.setAccount(account.trim().toLowerCase());
        personInfo.setIp(request.getRemoteAddr());
        personInfo.setLoginDate(new Date());
        session.setAttribute("personInfo",personInfo);
        response.sendRedirect(response.encodeRedirectURL(request.getRequestURI()));
        return;
    } else if("logout".equals(action)) {
        session.removeAttribute("personInfo");
        response.sendRedirect(response.encodeRedirectURL(request.getRequestURI()));
        return;
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
