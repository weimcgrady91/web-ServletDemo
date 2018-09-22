<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="struts" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
    <%--<struts:head theme="ajax"/>--%>
    <struts:property value="tip"/>
</head>
<body>
    登录成功,欢迎您，<struts:property value="account"/>,session value<struts:property value="%{#session.user}"/>
    <struts:property value="tip"/>

</body>
</html>
