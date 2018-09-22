<%@ page import="java.text.DateFormat" %>
<%@ page import="com.wei.q.listener.ApplicationConstants" %>
<%@ page import="com.wei.q.domain.PersonInfo" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/18
  Time: 22:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
服务器启动时间:
<%=DateFormat.getDateTimeInstance().format(ApplicationConstants.START_DATE)%>
累计共接待过<%=ApplicationConstants.TOTAL_HISTORY_COUNT%>访客.<br/>
同时在线人数最多为<%=ApplicationConstants.MAX_ONLINE_COUNT%>人,发生在<%=DateFormat.getDateTimeInstance().format(ApplicationConstants.MAX_ONLINE_COUNT_DATE)%><br/>
目前在线总人数:<%=ApplicationConstants.SESSION_MAP.size()%>,登陆用户:<%=ApplicationConstants.CURRENT_LOGIN_COUNT%>.<br/>
<table border="1">
    <tr>
        <th>jsessionid</th>
        <th>account</th>
        <th>creationTime</th>
        <th>lastAccessedTime</th>
        <th>new</th>
        <th>activeTimes</th>
        <th>ip</th>
    </tr>
    <%
        for(String id: ApplicationConstants.SESSION_MAP.keySet()){
            HttpSession sess = ApplicationConstants.SESSION_MAP.get(id);
            PersonInfo personInfo = (PersonInfo) sess.getAttribute("personInfo");

    %>
    <tr <%=session==sess?"bgcolor=#DDDDDD":""%>>
        <td><%=id%></td>
        <td><%=personInfo==null?"&nbsp;":personInfo.getAccount()%></td>
        <td><%=DateFormat.getDateTimeInstance().format(sess.getCreationTime())%></td>
        <td><%=DateFormat.getDateTimeInstance().format(new Date(sess.getLastAccessedTime()))%></td>
        <td><%=sess.isNew()%></td>
        <td><%=sess.getAttribute("activeTimes")%></td>
        <td><%=sess.getAttribute("ip")%></td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
