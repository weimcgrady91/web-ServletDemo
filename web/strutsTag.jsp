<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<s:bean var="mycomparator" name="com.wei.q.MyComparator"></s:bean>
<html>
<head>
    <title>Title</title>
</head>
<body>
    if标签<br/>
    <s:if test="age==20">
        年龄是20岁
    </s:if>
    <s:else>
        年龄未知
    </s:else>
    <br/>
    iterator标签<br/>
    <s:iterator value="names" var="name">
        <s:property value="name"/>
    </s:iterator>
    <br/>
    append标签<br/>
    <s:append var="appendResult">
        <s:param value="names"/>
        <s:param value="names2"/>
    </s:append>
    <s:iterator value="appendResult" var="name">
        <s:property value="name"/>
    </s:iterator>
    <br/>
    generator标签 分割字符串1,2,3
    <br/>
    <s:generator separator="," val="'1,2,3'" var="result">
        <s:iterator>
            <s:property/>
        </s:iterator>
    </s:generator>
    <br/>
    subset标签
    <br/>
    <s:subset source="names3" start="1" count="2">
        <s:iterator var="r1">
            <s:property value="r1"/>
        </s:iterator>
    </s:subset>
    <br/>
    sort标签<br/>
    <s:sort comparator="#mycomparator" source="{'1','334','44','5555'}" var="sortedList"/><br/>
       ${pageScope.sortedList}<br/>
    <s:iterator value="%{#attr.sortedList}">
        <s:property/>
    </s:iterator>
<br/>
    action标签<br/>
    <s:action name="loginPerson" executeResult="true"/>
    <br/>
    bean标签<br/>
    <s:bean name="com.wei.q.domain.Book" var="p">
        <s:param name="name" value="'weiqun'"/>
        <s:param name="author" value="'we-author'"/>
        <s:param name="publishedDate" value="'2018-09-09'"/>
    </s:bean>
    Book实例的name:<s:property value="#p.name"/>
    Book实例的author:<s:property value="#p.author"/>
    Book实例的publishedDate:<s:property value="#p.publishedDate"/>
<br/>
    ${requestScope.p}
<br/>
    date标签 格式化时间
    <br/>
    <s:bean var="now" name="java.util.Date"/>
    <s:date name="#now" format="yyyy-MM-dd"/>
    <br/>
    debug标签<br/>
    <s:debug/>
<br/>
    include标签 包含jsp页面或者servlet页面
    <br/>
    <s:include value="jsp_include.jsp"/>
    <br/>
    param标签
    <br/>
    push标签 将某个值放入ValueStack的栈顶<br/>
    <s:bean name="com.wei.q.domain.Book" var="topBook">
        <s:param name="name" value="'weiqun-top'"/>
        <s:param name="author" value="'we-author'"/>
        <s:param name="publishedDate" value="'2018-09-09'"/>
    </s:bean>
    <s:push value="#topBook">
        ValueStack栈顶对象的name属性:<s:property value="name"/>
        ValueStack栈顶对象的author属性:<s:property value="author"/>
    </s:push>
    set标签 将某个值放入指定范围内 例如application范围 session范围<br/>
    <s:bean name="com.wei.q.domain.Book" var="setBook">
        <s:param name="name" value="'weiqun-top'"/>
        <s:param name="author" value="'we-author'"/>
        <s:param name="publishedDate" value="'2018-09-09'"/>
    </s:bean>
    <s:set var="setBook1" scope="application" value="#setBook"/>
    application范围内的book对象name<s:property value="%{#application.setBook1}"/>
<br/>
    url标签 生成url地址
<br/>
    <s:url action="loginPerson"/>
</body>
</html>
