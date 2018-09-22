<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/18
  Time: 23:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <c:choose>
        <c:when test="${param.action=='edit'}">
            <c:out value="edit"/>
        </c:when>
        <c:otherwise>
            <c:out value="other action"/>
        </c:otherwise>
    </c:choose>
</body>
</html>
