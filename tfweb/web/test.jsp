<%--
  Created by IntelliJ IDEA.
  User: nongb
  Date: 2023/3/4
  Time: 19:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%	// 与HTML代码的区分主要依靠此标记
    out.println("<h1>您好世界</h1>");	// 通过Java控制HTML代码的输出
    out.println("<script type='text/javascript'>");
    out.println("	console.log('www.yootk.com')");
    out.println("</script>");
%>
</body>
</html>
