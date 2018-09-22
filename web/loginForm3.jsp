<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<s:form action="loginForm3.action" namespace="/" >
    <s:textfield name="name" label="name"/>
    <s:textfield name="age" label="age"/>
    <s:textfield name="birth" label="birth"/>
    <s:submit value="commit"/>
</s:form>
</body>
</html>
