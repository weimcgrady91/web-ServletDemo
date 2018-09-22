<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<a href="HelloWorldServlet">Hello World Servlet</a><br/>
<a href="ReadConfigParamServlet">Read ConfigParam From Servlet</a><br>
<a href="RequestInfoServlet?param1=guest&param2=18">Request Info</a><br/>
<a href="ResponseInfoServlet">Response Info</a><br/>
<a href="">Session ,Application Info</a><br/>
<a href="jspObject.jsp">JSP 内置对象</a><br/>
<a href="jspTag.jsp">JSP 指令标签</a><br/>
<a href="jspActionTag.jsp">JSP 动作标签</a><br/>
<a href="el.jsp">EL 表达式</a><br/>
<a href="servletSample.jsp">Servlet小例子</a><br/>
<a href="">JSP自定义标签</a><br/>
<a href="jstl.jsp">JSTL</a><br/>
<a href="filterSample.jsp">Filter</a><br/>
<a href="listenerSample.jsp">Listener</a><br/>
getRealPath("aaa):<%=getServletConfig().getServletContext().getRealPath("aaa")%><br/>
ServerName:<%=request.getServerName()%><br/>
getContextPath:<%=request.getContextPath()%><br/>
getRequestURI:<%=request.getRequestURI()%><br/>
<a href="jdbc.jsp">JDBC</a><br/>
<a href="struts2.jsp">struts2</a>
</body>
</html>
