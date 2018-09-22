<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.wei.q.domain.User" %>
<jsp:useBean id="user" class="com.wei.q.domain.User" scope="request"/>
<html>
<head>
    <title>Title</title>
</head>
<body>

<jsp:setProperty name="user" property="username" value="weiqun"/>
<jsp:setProperty name="user" property="age" value="18"/>
username:
<jsp:getProperty name="user" property="username"/>
<br/>
age:
<jsp:getProperty name="user" property="age"/>
<br/>
<%--<jsp:forward page="/forward.jsp"/>--%>
<jsp:include page="/jsp_include.jsp"/>
</body>
</html>
