<%@ page import="com.wei.q.domain.PersonInfo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    PersonInfo personInfo = (PersonInfo) session.getAttribute("personInfo");
    if (personInfo != null) {
            %>
        欢迎您,${sessionScope.personInfo.account}<br/>
        您的登录IP为${sessionScope.personInfo.ip}<br/>
        登录时间为:${sessionScope.personInfo.loginDate}<br/>
        <script>setTimeout("location=location;",5000)</script>
<%
    } else {
        %>
        ${msg}
<%
    }
%>
</body>
</html>
