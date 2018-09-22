<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
out对象:<br/>
<% out.print("out 对象输出!");%><br/>
application对象<br/>
<%= application.getInitParameter("User3")%>
</body>
</html>
