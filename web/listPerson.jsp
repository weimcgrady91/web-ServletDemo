<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.wei.q.util.DBManager" %>
<%@ page import="com.wei.q.util.Pagination" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    final int pageSize = 10;
    int pageNum = 1;
    int pageCount = 1;
    int recordCount = 0;
    try {
        pageNum = Integer.parseInt(request.getParameter("pageNum"));
    } catch (NumberFormatException e) {
        e.printStackTrace();
    }
%>
<a href="addPerson.jsp">新建人员资料</a>
<%


    Connection conn = null;
    PreparedStatement preStmt = null;
    ResultSet rs = null;
    String sql = null;
    try {
//        DriverManager.registerDriver(new com.mysql.jdbc.Driver());
//        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/databaseWeb?useSSL=false&serverTimezone=GMT%2B8", "root", "880516");
//        stmt = conn.createStatement();
//        rs = stmt.executeQuery("select * from tb_person");
        sql = "select count(*) from tb_person";
        recordCount = DBManager.getCount(sql);
        System.out.println("recordCount=" + recordCount);
        pageCount = (recordCount + pageSize - 1) / pageSize;
        int startRecord = (pageNum - 1) * pageSize;
        sql = "select * from tb_person limit ?,?";
        conn = DBManager.getConnection();
        preStmt = conn.prepareStatement(sql);
        DBManager.setParams(preStmt, startRecord, pageSize);
        rs = preStmt.executeQuery();


%>
<form action="operatePerson.jsp" method="get">
    <table bgcolor="#CCCCCC" cellspacing="1" cellpadding="5" width="100%">
        <tr bgcolor="#DDDDDD">
            <th></th>
            <th>ID</th>
            <th>姓名</th>
            <th>英文名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>生日</th>
            <th>备注</th>
            <th>记录创建时间</th>
            <th>操作</th>
        </tr>
        <%
            while (rs.next()) {
                int id = rs.getInt("id");
                int age = rs.getInt("age");
                String name = rs.getString("name");
                String english_name = rs.getString("english_name");
                String sex = rs.getString("sex");
                String description = rs.getString("description");
                Date birthday = rs.getDate("birthday");
                Timestamp createTime = rs.getTimestamp("create_time");
                out.println("<tr bgcolor=#FFFFFF>");
                out.println("<td><input type=checkbox name=id value=" + id + "></td>");
                out.println("<td>" + id + "</td>");
                out.println("<td>" + name + "</td>");
                out.println("<td>" + english_name + "</td>");
                out.println("<td>" + sex + "</td>");
                out.println("<td>" + age + "</td>");
                out.println("<td>" + birthday + "</td>");
                out.println("<td>" + description + "</td>");
                out.println("<td>" + createTime + "</td>");
                out.println("<td>");
                out.println("<a href='operatePerson.jsp?action=del&id=" + id + "' onclick='return confirm(\"确定删除该记录?\");'>删除</a>");
                out.println("<a href='operatePerson.jsp?action=edit&id=" + id + "'>修改</a>");
                out.println("</td>");
                out.println("</tr>");
            }
        %>
    </table>
    <table align="left">
        <tr>
            <td><input type="hidden" value="del" name="action"><a href="#" onclick="var array=document.getElementsByName('id');
for(var i=0;i<array.length;i++){array[i].checked=true;}">全选</a><a href="#" onclick="var array = document.getElementsByName('id');
for(var i=0;i<array.length;i++){array[i].checked=false;}">取消全选</a>
                <input type="submit" onclick="return confirm('即将删除所有选择的记录，是否删除?');" value="删除"></td>
        </tr>
    </table>
    <table align="right"><tr><td><%=Pagination.getPagination(pageNum,pageCount,recordCount,request.getRequestURI())%></td></tr></table>
    <br/><br/><br/>
    <table align="left"><tr><td>SQL:<%=sql%></td></tr></table>
</form>
<%
    } catch (SQLException e) {
        out.println("发生了异常:" + e.getMessage());
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (preStmt != null) preStmt.close();
        if (conn != null) conn.close();
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
