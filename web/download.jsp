<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.wei.q.util.DBManager" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.OutputStream" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    out.clear();
    int id = Integer.parseInt(request.getParameter("id"));
    Connection conn = null;
    PreparedStatement preStmt = null;
    ResultSet rs = null;
    try {
        conn = DBManager.getConnection();
        String sql = "select * from tb_attachment where id=?";
        preStmt = conn.prepareStatement(sql);
        preStmt.setInt(1, id);
        rs = preStmt.executeQuery();
        if (rs.next()) {
            response.reset();
            response.setContentType(rs.getString("filetype"));
            response.setContentLength(rs.getInt("size"));
            System.out.println("filetype:" + rs.getString("filetype"));
            System.out.println("size:" + rs.getInt("size"));
            InputStream ins = null;
            OutputStream ous = null;
            try {
                ins = rs.getBinaryStream("content");
                ous = response.getOutputStream();
                byte[] b = new byte[1024];
                int len = 0;
                while ((len = ins.read(b)) != -1) {
                    ous.write(b, 0, len);
                }
            } finally {
                if (ous != null) ous.close();
                if (ins != null) ins.close();
            }
        } else {
            out.println("没有找到附件:" + id);
        }
    } finally {
        if (rs != null) rs.close();
        if (preStmt != null) preStmt.close();
        if (conn != null) preStmt.close();
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
