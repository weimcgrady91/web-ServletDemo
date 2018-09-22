<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <s:form action="upload2Action" enctype="multipart/form-data">
        <s:textfield name="title" label="文件标题"/>
        <s:file name="upload" label="选择文件"/>
        <s:submit value="commit"/>
    </s:form>
</body>
</html>
