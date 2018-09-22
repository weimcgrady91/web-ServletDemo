<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<s:form action="loginForm2">
    <s:textfield name="username" key="username"/>
    <s:textfield name="password" key="password"/>

    <s:textfield name="user1List[0].username" label="user1List[0].username"/>
    <s:textfield name="user1List[0].password" label="user1List[0].password"/>

    <s:textfield name="user1List[1].username" label="user1List[1].username"/>
    <s:textfield name="user1List[1].password" label="user1List[1].password"/>



    <s:textfield name="user2List[0].username" label="user2List[0].username"/>
    <s:textfield name="user2List[0].password" label="user2List[0].password"/>

    <s:textfield name="user2List[1].username" label="user2List[1].username"/>
    <s:textfield name="user2List[1].password" label="user2List[1].password"/>


    <s:textfield name="user1Map['one'].username" label="user1Map['one'].username"/>
    <s:textfield name="user1Map['one'].password" label="user1Map['one'].password"/>

    <s:textfield name="user1Map['two'].username" label="user1Map['two'].username"/>
    <s:textfield name="user1Map['two'].password" label="user1Map['two'].password"/>


    <s:textfield name="user2Map['one'].username" label="user2Map['one'].username"/>
    <s:textfield name="user2Map['one'].password" label="user2Map['one'].password"/>

    <s:textfield name="user2Map['two'].username" label="user2Map['two'].username"/>
    <s:textfield name="user2Map['two'].password" label="user2Map['two'].password"/>

    <s:textfield name="user1" label="user1"/>
    <s:submit value="commit"/>

</s:form>
<s:fielderror/>
</body>
</html>
