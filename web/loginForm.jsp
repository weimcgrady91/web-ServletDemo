<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:i18n name="loginForm">
<html>
<head>
    <title><s:text name="loginPage"/></title>
</head>
<body>
    <s:form action="loginPerson">
        <s:textfield name="account" key="user"/>
        <s:textfield name="password" key="pass"/>
        <s:submit key="login"/>
    </s:form>
</body>
</html>
</s:i18n>
