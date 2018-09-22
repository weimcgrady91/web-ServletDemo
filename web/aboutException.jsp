<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/20 0020
  Time: 下午 1:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <s:form action="createExceptionAction" method="post">
        <s:label value="模拟异常"></s:label>
        <s:textfield label="username" name="username"/>
        <s:submit value="commit"/>
    </s:form>
    请在username处输入user提交 来模拟异常。
</body>
</html>
