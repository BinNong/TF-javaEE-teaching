<%--
  Created by IntelliJ IDEA.
  User: nongb
  Date: 2023/3/13
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  String name = request.getParameter("name");
  int inds = Integer.parseInt(request.getParameter("id"));
%>
<h1><%=name%>:<%=inds%></h1>
</body>
</html>
