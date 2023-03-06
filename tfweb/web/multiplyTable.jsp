<%--
  Created by IntelliJ IDEA.
  User: nongb
  Date: 2023/3/4
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  out.println("<table border='1'>");
  for (int i = 1; i <=9; i++) {
    out.println("<tr>");
    //output row
    for (int j = 1; j <=i ; j++) {
      out.println("<td>" + i + "*" + j + "=" + (i*j) + "</td>");
    }
    out.println("</tr>");
  }
  out.println("</table>");
%>
</body>
</html>
