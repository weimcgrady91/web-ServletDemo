<%@ page import="com.wei.q.domain.PersonInfo" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String action = request.getParameter("action");
    if ("addSession".equals(action)) {
        PersonInfo personInfo = new PersonInfo();
        personInfo.setAccount("weiqun");
        personInfo.setIp(request.getRemoteAddr());
        personInfo.setLoginDate(new Date());
        session.setAttribute("personInfo",personInfo);
        response.sendRedirect(response.encodeRedirectURL("home.jsp"));
    } else if ("deleteSession".equals(action)) {
        session.removeAttribute("personInfo");
    } else if ("replaceSession".equals(action)) {

    }

%>
<html>
<head>
    <title>SessionListener</title>
</head>
<body>
sessionListener;
<form action="sessionListener.jsp">
    <input type="radio" name="action" value="addSession">添加session<br/>
    <input type="radio" name="action" value="deleteSession">删除session<br/>
    <input type="radio" name="action" value="replaceSession">替换session<br/>
    <input type="submit" value="commit">
</form>
</body>
</html>
