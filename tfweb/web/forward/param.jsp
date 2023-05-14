<%--
  Created by IntelliJ IDEA.
  User: nongb
  Date: 2023/3/13
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:forward page="target.jsp">
  <jsp:param name="title" value="hello "/>
  <jsp:param name="content" value="world"/>
</jsp:forward>
</body>
</html>
