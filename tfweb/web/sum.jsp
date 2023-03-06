<%--
  Created by IntelliJ IDEA.
  User: nongb
  Date: 2023/3/6
  Time: 12:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
    public static final String MESSAGE = "www.example.com";
    public int counter = 0;
%>
<%!
    public int sum(int ... values) {
        int sum = 0;
        for(int number :values){
            sum += number;
        }

        return sum;
    }
%>
<%
    out.println("<h1>" + sum(1,2,3) + "</h1>" );
%>
</body>
</html>
