<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <a href="<s:url action="result2Action"/>">查看权限控制内容</a><br/>
    <a href="tokenInput.jsp">token防止重复提交拦截器</a><br/>
    <a href="watiAction">任务过长需要loading画面</a>
</body>
</html>
