<%--
  Created by IntelliJ IDEA.
  User: nongb
  Date: 2023/3/7
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%	// 与HTML代码的区分主要依靠此标记
  String paramMsg = request.getParameter("msg"); // msg是表单的名称
  out.println("<h1>" + paramMsg + "</h1>");
%>
</body>
</html>
