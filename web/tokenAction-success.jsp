<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/22
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    el:${sessionScope.names}<br/>
    <%--<s:iterator value="%{#session.NAMES}" var="name1">--%>
        <%--<s:property value="#name1"/>--%>
    <%--</s:iterator>--%>
    value stack:<s:property value="name"/>
    <br/>
    OGNL:<s:property value="#session.names"/>
    已输入的姓名:<s:property value="#session.names"/><br/><br/>
    <a href="tokenAction.action">&lt;&lt;重新输入</a>
<s:debug/>
</body>
</html>
