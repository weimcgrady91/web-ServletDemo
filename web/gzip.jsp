<%@ page import="java.net.URLConnection" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    public void test(JspWriter out, String url) throws Exception {
        URLConnection connGzip = new URL(url).openConnection();
        connGzip.addRequestProperty("Accept-Encoding", "gzip");
        int lengthGzip = connGzip.getContentLength();
        URLConnection connCommon = new URL(url).openConnection();
        int lengthCommon = connCommon.getContentLength();
        double rate = new Double(lengthGzip) / lengthCommon;
        out.println("<table border='1'>");
        out.println("<tr>");
        out.println("<td colspan=3>网址:" + url + "</td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>压缩后:" + lengthGzip + "byte</td>");
        out.println("<td>压缩前:" + lengthCommon + "byte</td>");
        out.println("<td>比率:" + NumberFormat.getPercentInstance().format(rate) + "</td>");
        out.println("</tr>");
        out.println("</table>");
    }
%>
<% String[] urls = {
        "http://localhost:8888/index.jsp", "http://localhost:8888/image/a1.jpg",
        "http://www.baidu.com"
};
for(String url: urls) {
    test(out,url);
}
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
