<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/8/26
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("ctp",request.getContextPath());
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    hello
<a href="${ctp}/users">getUsers</a>
</body>
</html>
