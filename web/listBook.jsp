<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title><s:property value="title"/></title>
</head>
<body>
<table>
    <tr>
        <th>书名</th>
        <th>作者</th>
        <th>出版日期</th>
    </tr>
    <s:iterator var="book" value="#request.bookList">
        <tr>
            <td>${book.name}</td>
            <td>${book.author}</td>
            <td>${book.publishedDate}</td>
        </tr>
    </s:iterator>
</table>
<s:label value="if标签"></s:label>
<br/>
<s:if test="age==20">
    年龄是20岁
</s:if>
<s:elseif test="10">
    年龄是10岁
</s:elseif>
<s:else>
    未知年龄
</s:else>
</body>
</html>
