<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String action = (String) request.getAttribute("action");
    String id = (String) request.getAttribute("id");
    String name = (String) request.getAttribute("name");
    String englishName = (String) request.getAttribute("englishName");
    String age = (String) request.getAttribute("age");
    String sex = (String) request.getAttribute("sex");
    String birthday = (String) request.getAttribute("birthday");
    String description = (String) request.getAttribute("description");
    boolean isEdit = "edit".equals(action);
%>
<html>
<head>
    <title><%=isEdit ? "修改人员资料" : "新建人员资料"%>
    </title>
    <style>
        body, td {
            font-size: 12px;
        }
    </style>
    <script type="text/javascript" src="js/calendar.js"></script>
</head>
<body>
<form action="operatePerson.jsp" method="post">
    <input type="hidden" name="action" value="<%=isEdit?"save":"add"%>">
    <input type="hidden" name="id" value="<%=isEdit?id:""%>">
    <fieldset>
        <legend><%=isEdit ? "修改人员资料" : "新建人员资料"%>
        </legend>
        <table align="center">
            <tr>
                <td>姓名</td>
                <td><input type="text" name="name" value="<%=isEdit?name:""%>"></td>
            </tr>
            <tr>
                <td>英文名</td>
                <td><input type="text" name="englishName" value="<%=isEdit?englishName:""%>"></td>
            </tr>
            <tr>
                <td>性别</td>
                <td><input type="radio" name="sex" value="男"
                           id="sex_male" <%=isEdit&&"男".equals(sex)?"checked":""%>><label for="sex_male">男</label></td>
                <td><input type="radio" name="sex" value="女"
                           id="sex_female" <%=isEdit&&"女".equals(sex)?"checked":""%>><label for="sex_female">女</label>
                </td>
            </tr>
            <tr>
                <td>年龄</td>
                <td><input type="text" name="age" value="<%=isEdit?age:""%>"></td>
            </tr>
            <tr>
                <td>生日</td>
                <td><input type="text" name="birthday" onfocus="setday(birthday)" value="<%=isEdit?birthday:""%>"></td>
                <img src="image/calendar.gif" onclick="setday(birthday);"/>
            </tr>
            <tr>
                <td>描述</td>
                <td><textarea name="description"><%=isEdit ? description : ""%></textarea></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="<%=isEdit?"保存":"添加人员信息"%>"/></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
