<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="UploadServlet" method="post" enctype="multipart/form-data">
    描述:<input type="text" name="description"><br/>
    文件:<input type="file" name="file"><br/>
    <input type="submit" value="commit">

</form>
</body>
</html>
