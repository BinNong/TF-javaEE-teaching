<%--
  Created by IntelliJ IDEA.
  User: nongb
  Date: 2023/3/13
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
  public static int id=12345;
%>
<jsp:include page="prama.jsp">
    <jsp:param name="name" value="roben"/>
    <jsp:param name="id" value="<%=id%>"/>
</jsp:include>
</body>
</html>
