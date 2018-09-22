<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/21
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    username=<s:property value="username"/>,password=<s:property value="password"/><br/>
    user1List<br/>
    <s:iterator value="user1List" var="u1">
        username:<s:property value="#u1.username"/>,password<s:property value="#u1.password"/>
    </s:iterator>
    <br/>
    user2List<br/>
    <s:iterator value="user2List" var="u1">
        username:<s:property value="#u1.username"/>,password<s:property value="#u1.password"/>
    </s:iterator>
    <br/>
    user1Map<br/>
    <s:iterator value="#request.user1Map">
        <s:property value="key"/>
        <s:property value="value.username"/>
        <s:property value="value.password"/>
    </s:iterator>
    <br/>
    user2Map<br/>
    <s:iterator value="#request.user2Map">
        <s:property value="key"/>
        <s:property value="value.username"/>
        <s:property value="value.password"/>
    </s:iterator>
    <br/>
    user1<br/>
    <s:property value="#request.user1"/>
<br/>

</body>
</html>
