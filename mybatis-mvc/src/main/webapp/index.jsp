<%--
  Created by IntelliJ IDEA.
  User: nongb
  Date: 2023/4/20
  Time: 8:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">
    <title>银行转账</title>
  </head>
  <body>
  <form action="transfer" method="post">
    转出账户：<input type="text" name="fromAct"><br>
    转入账户：<input type="text" name="toAct"><br>
    转入金额：<input type="text" name="money" value="0.0"><br>
    <input type="submit" name="点击转账">
  </form>
  </body>
</html>
