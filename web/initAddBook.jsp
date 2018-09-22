<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <a href="<s:url action="initAddBook" />">添加书籍</a>
    <a href="<s:url action="listBook"/> ">书籍列表</a>
    <a href="<s:url action="clearBook"/>">清空书籍列表</a>
    <s:form action="addBook" validate="true">
        <s:label value="添加书籍"></s:label>
        <s:textfield name="book.name" label="书名"/>
        <s:textfield name="book.author" label="作者"/>
        <s:textfield name="book.publishedDate" label="出版日期"/>
        <s:submit value="添加"/>
    </s:form>
</body>
</html>
