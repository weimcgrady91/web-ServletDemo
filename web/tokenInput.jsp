<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/22
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
    <s:form action="tokenAction">
        <s:token/>
        <s:label value="避免重复输入"/>
        <s:textfield name="name" label="请输入姓名"/>
        <s:submit name="提交"/>
    </s:form>
</head>
<body>

</body>
</html>
