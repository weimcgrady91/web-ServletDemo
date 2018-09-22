
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="struts" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
    <%--<struts:head theme="ajax"/>--%>
</head>
<body>
    <struts:form action="loginPerson">
        <struts:label value="登录系统"></struts:label>
        <struts:textfield name="account" label="账号"/>
        <struts:password name="password" label="密码"/>
        <struts:submit value="登录"></struts:submit>
    </struts:form>
</body>
</html>
