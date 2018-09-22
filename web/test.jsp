<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/19
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //数据库连接池
    Context initContext = new InitialContext();
    Context envContext = (Context) initContext.lookup("java:/comp/env");
    DataSource ds = (DataSource) envContext.lookup("jdbc/databaseWeb");
    Connection conn = ds.getConnection();
    Statement stmt  = conn.createStatement();
    ResultSet rs = stmt.executeQuery("select * from tb_attachment;");
    if(rs.next()){
        System.out.println("has element");
    }
    rs.close();
    stmt.close();
    conn.close();
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
