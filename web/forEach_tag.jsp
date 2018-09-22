<%@ page import="com.wei.q.domain.PersonInfo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    List<PersonInfo> list = new ArrayList<>();
    PersonInfo p1 = new PersonInfo();
    p1.setAccount("weiqun1");
    p1.setIp("1");
    PersonInfo p2 = new PersonInfo();
    p2.setAccount("weiqun2");
    p2.setIp("2");
    list.add(p1);
    list.add(p2);
    request.setAttribute("personList",list);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach var="num" begin="2" end="100" step="2">
    ${num}
</c:forEach>

<table border="1">
<c:forEach items="${requestScope.personList}" var="person">
    <tr>
        <td>${person.account}</td>
        <td>${person.ip}</td>
    </tr>
</c:forEach>
</table>
<table>
    <tr>
        <td>Header name</td>
        <td>Header value</td>
        <td>index</td>
    </tr>
    <c:forEach var="item" items="${header}" varStatus="varstatus">
        <tr>
            <td>${item.key}</td>
            <td>${item.value}</td>
            <td>${varstatus.index}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
