<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/8/26
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    hello
    <h1>${sessionScope.isLogin.username}</h1>
<a href="${APP_PATH}/users">getUsers</a>
<a href="${APP_PATH}/register.jsp">register</a>
<a href="${APP_PATH}/login.jsp">login</a>
</body>
</html>
