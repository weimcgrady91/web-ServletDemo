<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    public String forSQL(String sql) {
        return sql.replace("'", "\\'");
    }
%>
<%
    request.setCharacterEncoding("utf-8");
    String name = request.getParameter("name");
    String englishName = request.getParameter("englishName");
    String age = request.getParameter("age");
    String birthday = request.getParameter("birthday");
    String sex = request.getParameter("sex");
    String description = request.getParameter("description");
    String action = request.getParameter("action");
    if ("add".equals(action)) {
        String sql = "insert into tb_person" + "(name,english_name,age,sex,birthday,description) values ('" + forSQL(name) + "'" +
                ",'" + forSQL(englishName) + "'" +
                ",'" + age + "'" +
                ",'" + sex + "'" +
                ",'" + birthday + "'" +
                ",'" + forSQL(description) + "')";
        Connection conn = null;
        Statement stmt = null;
        int result = 0;
        try {
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/databaseWeb?useSSL=false&serverTimezone=GMT%2B8", "root", "880516");
            stmt = conn.createStatement();
            result = stmt.executeUpdate(sql);
        } catch (SQLException e) {
            out.println("执行SQL\"" + sql + "\"时发生异常:" + e.getMessage());
            return;
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
        out.println("<html><style>body{font-size:12px; line-height: 25px;}</style></body>");
        out.println(result + "条记录被添添加到数据库中.");
        out.println("<a href='listPerson.jsp'>返回人员列表</a>");
        out.println("<br/><br/>执行的SQL语句为:<br/>" + sql);
        return;
    } else if ("del".equals(action)) {
        String[] id = request.getParameterValues("id");
        if (id == null || id.length == 0) {
            out.println("没有选中任何航");
            return;
        }
        String condition = "";
        for (int i = 0; i < id.length; i++) {
            if (i == 0) {
                condition = "" + id[i];
            } else {
                condition += "," + id[i];
            }
        }
        String sql = "delete from tb_person where id in(" + condition + ")";
        Connection conn = null;
        Statement stmt = null;
        try {
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/databaseWeb?useSSL=false&serverTimezone=GMT%2B8", "root", "880516");
            stmt = conn.createStatement();
            int result = stmt.executeUpdate(sql);
            out.println("<html><style>body{font-size:12px; line-height: 25px;}</style><body>");
            out.println(result + "条记录被删除.");
            out.println("<a href='listPerson.jsp'>返回人员列表</a>");
            out.println("<br/><br/>执行的SQL语句为:<br/>" + sql);
        } catch (SQLException e) {
            out.println("执行SQL\"" + sql + "\"时发生异常:" + e.getMessage());
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    } else if ("edit".equals(action)) {
        String id = request.getParameter("id");
        String sql = "select * from tb_person where id=" + id;
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/databaseWeb?useSSL=false&serverTimezone=GMT%2B8", "root", "880516");
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                request.setAttribute("id", rs.getString("id"));
                request.setAttribute("name", rs.getString("name"));
                request.setAttribute("englishName", rs.getString("english_name"));
                request.setAttribute("age", rs.getString("age"));
                request.setAttribute("sex", rs.getString("sex"));
                request.setAttribute("birthday", rs.getString("birthday"));
                request.setAttribute("description", rs.getString("description"));
                request.setAttribute("action", action);
                request.getRequestDispatcher("addPerson.jsp").forward(request, response);
            } else {
                out.println("没有找到id为" + id + "的记录.");
            }
        } catch (SQLException e) {
            out.println("执行SQL\"" + sql + "\"时发生异常:" + e.getMessage());
            return;
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    } else if ("save".equals(action)) {
        String id = request.getParameter("id");
        String sql = "update tb_person set name='" + forSQL(name) + "',english_name='" + forSQL(englishName) + "',age='" + age
                + "',sex='" + sex + "',birthday='" + birthday + "',description='" + forSQL(description) + "' where id=" + id + ";";
        Connection conn = null;
        Statement stmt = null;
        try {
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/databaseWeb?useSSL=false&serverTimezone=GMT%2B8", "root", "880516");
            stmt = conn.createStatement();
            int result = stmt.executeUpdate(sql);
            if (result == 0) {
                out.println("影响数目为0,修改失败.");
            } else {
                out.println(result + "条记录被修改.");
            }
            out.println("<a href='listPerson.jsp'>返回人员列表</a>");
            out.println("<br/><br/>执行的SQL语句为:<br/>" + sql);
        } catch (SQLException e) {
            out.println("执行SQL\"" + sql + "\"时发生异常:" + e.getMessage());
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
