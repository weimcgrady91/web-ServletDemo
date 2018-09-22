<%@ page import="com.wei.q.util.DBManager" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    public void init() {
        try {
            DBManager.executeUpdate("create table if not exists" +
                    " tb_attachment(id int auto_increment,filename varchar(255)," +
                    " filetype varchar(255) ,size int ,content LONGBLOB,ip varchar(255)," +
                    " date timestamp, primary key(id));");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setHeaderEncoding("UTF-8");
        List<FileItem> list = upload.parseRequest(request);
        for (FileItem fileItem : list) {
            if(!fileItem.isFormField()){
                String filename = fileItem.getName().replace("\\","/");
                filename = filename.substring(filename.lastIndexOf("/")+1);
                Connection conn = null;
                PreparedStatement preStmt = null;
                try {
                    conn = DBManager.getConnection();
                    String sql = "insert into tb_attachment (filename,filetype,size,content,ip,date)" +
                            " values(?,?,?,?,?,?)";
                    preStmt = conn.prepareStatement(sql);
                    preStmt.setString(1,filename);
                    preStmt.setString(2,fileItem.getContentType());
                    preStmt.setInt(3, (int) fileItem.getSize());
                    preStmt.setString(5,request.getRemoteAddr());
                    preStmt.setTimestamp(6,new Timestamp(System.currentTimeMillis()));
                    preStmt.setBinaryStream(4,fileItem.getInputStream(),(int)fileItem.getSize());
                    preStmt.executeUpdate();
                } finally {
                    if(preStmt!=null) preStmt.close();
                    if(conn!=null) conn.close();
                }
            }
        }
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <a href="javascript:location=location;">刷新附件列表</a>
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    try{
        conn = DBManager.getConnection();
        stmt = conn.createStatement();
        rs = stmt.executeQuery("select * from tb_attachment order by id desc");
        out.println("<table bgcolor='#CCCCCC' cellspacing='1' cellpadding='5' width='100%'>");
        out.println("<tr bgcolor='#DDDDDD'>");
        out.println("<th>ID</th>");
        out.println("<th>File Name</th>");
        out.println("<th>File Type</th>");
        out.println("<th>Size</th>");
        out.println("<th>IP</th>");
        out.println("<th>Date</th>");
        out.println("<th>Operation</th>");
        out.println("<tr>");
        while(rs.next()){
            out.println("<tr bgcolor=#FFFFFF>");
            out.println("<td>"+rs.getInt("id")+"</td>");
            out.println("<td>"+rs.getString("filename")+"</td>");
            out.println("<td>"+rs.getString("filetype")+"</td>");
            out.println("<td>"+rs.getString("size")+"</td>");
            out.println("<td>"+rs.getString("ip")+"</td>");
            out.println("<td>"+rs.getTimestamp("date")+"</td>");
            out.println("<td><a href='download.jsp?id="+rs.getInt("id")+"'>下载</a></td>");
            out.println("</td>");
        }
        out.println("</table>");
    }finally {
        if(rs!=null) rs.close();
        if(stmt!=null) stmt.close();
        if(conn!=null) conn.close();
    }
%>
<form action="${pageContext.request.requestURI}" enctype="multipart/form-data" method="post">
    <input name="file" type="file"/><input type="submit" value="开始上传">
</form>
</body>
</html>
