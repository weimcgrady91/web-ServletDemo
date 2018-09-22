<%@ page import="com.wei.q.domain.PersonInfo" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/18
  Time: 23:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <c:set var="totalCount" value="${totalCount+1}" scope="application"/>
    <c:set var="count" value="${count+1}" scope="session"/>
本网站总访问人数:${totalCount}<br/>
其中您的访问次数:${count}<br/>
<%
    request.setAttribute("person",new PersonInfo());
    request.setAttribute("map",new HashMap<>());
%>
<c:set target="${person}" property="account" value="${param.account}"/>
<c:set target="${map}" property="name" value="${param.account}"/>
<c:out value="${person.account}"/>
<c:out value="${map.name}"/>
</body>
</html>
