<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/22
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    输入无效<br/>
    已经输入的姓名: 已输入的姓名:<s:property value="%{#session.names}"/><br/><br/>
    <a href="tokenInput.jsp">&lt;&lt;重新输入</a>
</body>
</html>
