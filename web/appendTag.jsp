<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/20 0020
  Time: 上午 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h3><font color="#0000FF">&lt;struts;append/&gt;标签</font></h3>
    <s:append var="myAppendList">
        <s:param value="%{maleList}"/>
        <s:param value="%{femaleList}"/>
    </s:append>
    <s:iterator value="%{#myAppendList}">
        <s:property/>
    </s:iterator>
</body>
</html>
