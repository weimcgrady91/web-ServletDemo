<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:out value="${param.action}"/>
<c:if test="${param.action=='add'}">
    <c:out value="action add" default="default value"/>
</c:if>
<c:if test="${param.action=='edit'}">
    <c:out value="action edit" default="default value"/>
</c:if>
</body>
</html>
