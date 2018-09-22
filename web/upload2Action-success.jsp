<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    上传成功!<br/>
    文件标题:<s:property value="#request.title"/><br/>
    文件为:<img src="<s:property value="'uploadFiles/'+uploadFileName"/>"><br/>
    <s:property value="'uploadFiles/'+uploadFileName"/>
</body>
</html>
