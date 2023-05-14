<%--
  Created by IntelliJ IDEA.
  User: nongb
  Date: 2023/3/13
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  String title = request.getParameter("title");
  String content = request.getParameter("content");
%>
<h1><%=title%> and <%=content%> 乱码了吗</h1>
</body>
</html>
