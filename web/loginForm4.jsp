<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/21
  Time: 23:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<s:property value="#application.tip"/>
    <s:form action="loginForm4">
        <s:textfield name="username" label="username"/>
        <s:submit value="commit"/>
    </s:form>
</body>
</html>
