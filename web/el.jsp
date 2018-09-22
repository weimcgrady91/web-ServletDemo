<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" class="com.wei.q.domain.User" scope="request">
    <jsp:setProperty name="user" property="username" value="weiqun"/>
    <jsp:setProperty name="user" property="age" value="18"/>
</jsp:useBean>

<html>
<head>
    <title>Title</title>
</head>
<body>
username:
<jsp:getProperty name="user" property="username"/>
<br/>
age:
<jsp:getProperty name="user" property="age"/>
<br/>
el username:${user.username} ,age=${user.age}<br/>
<%
    List<String> songs = new ArrayList<>();
    songs.add("first");
    songs.add("second");
    songs.add("third");
    request.setAttribute("songs", songs);
    Map<String,String> maps = new HashMap<>();
    maps.put("A","a");
    maps.put("B","b");
    request.setAttribute("maps",maps);
%>
el song name:${requestScope.songs[0]},${requestScope.songs[1]}<br/>
el maps: ${requestScope.maps["A"]},${requestScope.maps["B"]}<br/>
el headers: ${header.get("Accept")}<br/>
el cookie:${cookie.get("JSESSIONID").value}
</body>
</html>
